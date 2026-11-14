**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek sebelum membaca spesifikasi fitur.

**Aturan pengisian:**
Isi setiap atribut berdasarkan kondisi proyek yang sebenarnya; jangan mengarang informasi yang belum diketahui — tulis secara eksplisit (mis. `Belum diketahui`).

**Informasi:**
- Nama aplikasi: `base_coc`
- Deskripsi produk: aplikasi Flutter penyedia base/layout Clash of Clans; katalog lokal offline, galeri terfilter, detail base dengan pratinjau dan salin tautan, pelacakan progres upgrade desa, favorit, dan tag strategi base.
- Platform: Android (utama); struktur Flutter menyiapkan Android, iOS, Web, Linux, macOS, dan Windows
- Versi: `1.0.0+1`
- Status pengembangan: Dalam pengembangan aktif. Fitur yang sudah diimplementasikan: galeri base + filter, detail base + copy tautan, pelacakan progres upgrade desa, favorit, dan tag strategi base (A6). Item A8 (panduan singkat per base) **belum diimplementasikan**; sesi ini hanya menyusun PRD dan tidak mengubah kode.

Rujukan sumber item fitur: `refrensi_apk.md` baris 93–99 (item `A8. Panduan singkat dan alasan pemilihan layout`, prioritas Sedang). Tautan referensi kompetitor pada item A8:

- [clashOFbase](https://play.google.com/store/apps/details?id=com.namaari.clashofbase) — menyediakan video strategi dan sumber daya komunitas (diverifikasi 2026-11-14: halaman Play Store terbaca).
- [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts) — menambahkan tips penempatan trap dan penyesuaian base setelah scouting (diverifikasi 2026-11-14: halaman Play Store terbaca).

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menyatakan hasil yang diharapkan dari dokumen ini dan membatasi ruang lingkup.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.

**Isi:**
1. Menyediakan catatan panduan singkat per base (kekuatan, kelemahan, saran penempatan trap) yang disimpan bersama data base di katalog lokal (`assets/data/base_katalog.json` dan model `BaseLayout`).
2. Menampilkan panduan tersebut pada layar detail base sehingga pengguna memahami alasan pemilihan layout sebelum menyalin tautan.
3. Menjaga prinsip offline-first dan tanpa login: panduan adalah data statis yang dibundel sebagai aset; tidak ada panggilan jaringan, backend, atau akun.
4. Menetapkan cakupan MVP tanpa video: video strategi ditunda karena membutuhkan hosting dan moderasi (per item A8 `refrensi_apk.md` baris 98 dan item A15 untuk referensi video).

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk merinci fitur yang harus ada agar tujuan PRD tercapai.

**Aturan pengisian:**
Satu baris mewakili satu fitur yang dapat diidentifikasi terpisah; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Model `PanduanBase` | Class data dengan tiga field string opsional: `kekuatan`, `kelemahan`, `saranTrap`; di-parse dari JSON secara ketat (bukan string → `KatalogGagalException`; absen/null → field `null`). | Must Have |
| Field opsional `panduan` pada `BaseLayout` | `BaseLayout` menambah field `final PanduanBase? panduan`; `fromJson` mem-parse `panduan` bila ada (harus objek; field non-string → exception), `toJson` menulis `panduan` hanya bila tersedia. | Must Have |
| Data panduan di katalog JSON | `assets/data/base_katalog.json` menambah `panduan` opsional per entri base (minimal seluruh 12 entri contoh terisi agar fitur terlihat saat demo). | Should Have |
| Section "Panduan" pada layar detail | `DetailBaseScreen` menampilkan section "Panduan" (judul + ikon) berisi tiga sub-bagian (Kekuatan / Kelemahan / Saran Trap); section disembunyikan sepenuhnya bila `base.panduan == null`. | Must Have |
| Test parsing dan tampilan | Unit test `BaseLayout.fromJson` untuk `panduan` (valid, absen, tipe salah) dan widget test section Panduan (tampil/sembunyi). | Should Have |

Di luar ruang lingkup (eksplisit): video strategi, rating/komentar komunitas, dan pengisian panduan oleh pengguna (butuh backend/moderasi); penanda trap visual pada preview (item C10, menunggu data trap akurat).

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan interaksi pengguna dari kondisi awal hingga kondisi akhir.

**Aturan pengisian:**
Mulai dari kondisi awal, jelaskan langkah secara berurutan, sebutkan tindakan pengguna dan respons aplikasi, sertakan percabangan bila ada.

**Isi:**
1. Pengguna membuka aplikasi dan melihat galeri base (kondisi awal, fitur yang sudah ada).
2. Pengguna memilih satu base; aplikasi membuka `DetailBaseScreen`.
3. Pengguna membaca section "Panduan" (ditempatkan di bawah metadata ID/TH/tipe, sebelum area preview — keputusan diskusi sesi 95) bila base tersebut memilikinya:
   - Sub-bagian **Kekuatan**: mengapa base ini kuat (mis. "Inti ring memaksa pasukan darat memutar").
   - Sub-bagian **Kelemahan**: celah yang perlu diketahui (mis. "Lemah terhadap serangan udara terkonsentrasi").
   - Sub-bagian **Saran Trap**: rekomendasi trap/penyesuaian (mis. "Pindahkan giant bomb ke jalur hog rider setelah scouting").
4. Pengguna menekan tombol "Copy Base" (alur salin yang sudah ada) atau kembali ke galeri.

Percabangan:
- Base **tanpa** data `panduan`: section "Panduan" tidak dirender sama sekali (bukan placeholder kosong); sisa alur detail berjalan seperti biasa.
- Field `panduan` ada tetapi bukan objek, atau field di dalamnya bukan string: katalog gagal dimuat dan aplikasi menampilkan layar gagal katalog yang sudah ada (`KatalogGagalException` ditangani `katalog_provider`/`katalog_service`), sesuai pola validasi ketat `BaseLayout.fromJson`.

Kondisi akhir yang diharapkan: pengguna memahami alasan pemilihan layout tanpa meninggalkan aplikasi, lalu menyalin tautan dengan keyakinan lebih tinggi.

## 5. Steps

**Konteks penggunaan:**
Digunakan sebagai panduan kerja langkah demi langkah bagi implementor.

**Aturan pengisian:**
Gunakan numbered list; setiap langkah spesifik, tidak ambigu, dan dapat dikerjakan.

**Isi:**
1. Buat `base_coc/lib/fitur/galeri_base/model/panduan_base.dart`: class `PanduanBase` dengan `const PanduanBase({this.kekuatan, this.kelemahan, this.saranTrap})`; semua field `final String?`; factory `PanduanBase.fromJson(Map<String, dynamic> json)` ketat (nilai non-string non-null → `KatalogGagalException`); method `toJson()` menulis hanya field non-null; getter `bool get hasIsi => kekuatan != null || kelemahan != null || saranTrap != null`.
2. Ubah `base_coc/lib/fitur/galeri_base/model/base_layout.dart`: tambah `import` untuk `panduan_base.dart`; tambah field `final PanduanBase? panduan;` pada konstruktor (opsional) dan class; pada `fromJson`, bila `json['panduan'] != null`: harus `Map<String, dynamic>` (bukan List/string) → selain itu `KatalogGagalException`; panggil `PanduanBase.fromJson`; pada `toJson`, tulis `'panduan': panduan?.toJson()` (nilai `null` boleh ditulis atau dilewati — putuskan saat implementasi; JSON katalog tidak wajib memuat `panduan`).
3. Ubah `base_coc/assets/data/base_katalog.json`: isi `panduan` pada **seluruh 12 entri** contoh (keputusan diskusi sesi 95), mis.:
   ```json
   {"id": "base_001", "townHall": "th12", "tipe": "war", "thumbnailPath": "", "detailImagePath": "", "baseLink": "https://link.clashofclans.com/?action=OpenLayout&id=TH12_WAR_001", "builderHall": "bh9", "tags": ["anti3Star"], "panduan": {"kekuatan": "Inti ring memaksa pasukan darat memutar; hero tetap aman di air sweeper.", "kelemahan": "Lemah terhadap queen walk dari sisi barat.", "saranTrap": "Setelah scouting, pindahkan giant bomb ke jalur hog rider utama."}}
   ```
4. Buat widget `base_coc/lib/fitur/detail_base/widget/panduan_base_view.dart`: `StatelessWidget` yang menerima `PanduanBase panduan` dan merender tiga blok label+isi (`Kekuatan`, `Kelemahan`, `Saran Trap`); blok dengan field `null` tidak dirender; bila seluruhnya `null`, render `SizedBox.shrink()`.
5. Ubah `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart`: impor `panduan_base_view.dart`; sisipkan section "Panduan" **di bawah metadata** (setelah `Text` tipe, sebelum area preview — keputusan diskusi sesi 95); tampilkan hanya bila `widget.base.panduan != null && widget.base.panduan!.hasIsi`; tombol "Copy Base" tetap menetap di `bottomNavigationBar` dan tidak bergeser.
6. Tambahkan test: `base_coc/test/panduan_base_test.dart` (parsing valid/absen/tipe salah) dan perluas widget test detail bila tersedia; jalankan `dart format`, `flutter analyze`, `flutter test`.
7. Perbarui `base_coc/README.md` (bagian "Fitur yang Tersedia") bila implementasi selesai; PRD tidak mengubah kode.

Contoh potongan kode model (rancangan, bukan hasil generate):

```dart
class PanduanBase {
  const PanduanBase({this.kekuatan, this.kelemahan, this.saranTrap});

  final String? kekuatan;
  final String? kelemahan;
  final String? saranTrap;

  bool get hasIsi =>
      kekuatan != null || kelemahan != null || saranTrap != null;

  factory PanduanBase.fromJson(Map<String, dynamic> json) {
    String? baca(String kunci) {
      final v = json[kunci];
      if (v == null) return null;
      if (v is! String) {
        throw KatalogGagalException('Field "panduan.$kunci" tidak valid.');
      }
      return v.isEmpty ? null : v;
    }

    return PanduanBase(
      kekuatan: baca('kekuatan'),
      kelemahan: baca('kelemahan'),
      saranTrap: baca('saranTrap'),
    );
  }

  Map<String, dynamic> toJson() => {
        if (kekuatan != null) 'kekuatan': kekuatan,
        if (kelemahan != null) 'kelemahan': kelemahan,
        if (saranTrap != null) 'saranTrap': saranTrap,
      };
}
```

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mendaftar berkas yang akan dibuat/diubah beserta alasannya.

**Aturan pengisian:**
Periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi spesifik; tandai `Dibuat`/`Diubah`; jangan mengarang lokasi.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ---------------- | ------------------- |
| `base_coc/lib/fitur/galeri_base/model/panduan_base.dart` | Dibuat | Model `PanduanBase` (opsional `kekuatan`/`kelemahan`/`saranTrap`) + parsing ketat + `toJson`. |
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart` | Diubah | Tambah field `panduan` opsional + parsing/serialisasi (mengikuti pola `tags`/`builderHall` yang sudah ada di berkas). |
| `base_coc/assets/data/base_katalog.json` | Diubah | Tambah `panduan` opsional per entri (minimal 12 entri contoh terisi). |
| `base_coc/lib/fitur/detail_base/widget/panduan_base_view.dart` | Dibuat | Widget section Panduan (tiga blok label+isi; sembunyi bila kosong). Keputusan diskusi sesi 95: widget terpisah, tidak digabung ke layar detail. |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | Render section "Panduan" hanya bila `base.panduan` tersedia dan `hasIsi`; tidak mengubah alur salin. |
| `base_coc/test/panduan_base_test.dart` | Dibuat | Unit test parsing `PanduanBase` (valid/absen/tipe salah) + `BaseLayout.fromJson` dengan `panduan`. |
| `base_coc/README.md` | Diubah | Dokumentasi fitur (setelah implementasi, bukan pada sesi PRD). |

Tidak ada tumpang tindih dengan PRD lain: folder `prd/` kosong per 2026-11-14 (PRD A3/A4/A5/A6 sudah dihapus setelah diimplementasikan; sesi ini tidak mengaktifkan PRD lain). File yang sama (`base_layout.dart`, `detail_base_screen.dart`, `base_katalog.json`) disentuh oleh pekerjaan A3/A4/A5/A6 sebelumnya, tetapi tidak ada PRD aktif yang mengklaimnya; perubahan A8 bersifat aditif (field opsional) dan tidak mengubah kontrak lama.

Integrasi dengan fitur yang sudah ada: data mengalir melalui `KatalogService` → `katalog_provider` → `BerandaGaleriScreen` → `DetailBaseScreen` tanpa perubahan provider/filter (panduan bukan filter; tidak menyentuh `FilterState`/`FilterProvider`/`favorit_provider`).

**Status implementasi:** `Belum Diimplementasikan` — sesi ini hanya menyusun PRD dan tidak mengubah kode Dart satu pun.
