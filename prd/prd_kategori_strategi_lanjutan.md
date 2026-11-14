# PRD — Kategori Strategi Lanjutan (Tag Strategi Base)

**Status Dokumen:** Final
**Status Implementasi:** Sedang Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek. Informasi ini menjadi identitas utama PRD.

**Aturan pengisian:**
- Isi informasi berdasarkan kondisi dan identitas proyek yang sebenarnya.
- Gunakan nama yang konsisten dengan proyek.
- Tuliskan platform dan versi yang menjadi target pengembangan.
- Bedakan status dokumen dengan status implementasi.
- Jangan mengarang informasi yang belum diketahui.

**Informasi:**
- Nama aplikasi: base_coc (Clash of Clans Base Layout Gallery)
- Deskripsi produk: Aplikasi Flutter penyedia base/layout Clash of Clans untuk versi TH4–TH18 dan BH1–BH10
- Platform: Android (Flutter)
- Versi: 1.0.0+1
- Status pengembangan: Belum Diimplementasikan (sesi ini hanya menyusun PRD; fondasi parsial berupa enum `GayaBase` dan field `gaya` single-value sudah ada di kode, tanpa badge, filter, atau dukungan multi-nilai)

Sumber item fitur: `refrensi_apk.md` bagian A — Rekomendasi Fitur Baru, item **A6. Kategori strategi lanjutan (anti-3-star, anti-air, anti-ground, CWL)**, baris 77–83. Prioritas pada referensi: Sedang.

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menentukan hasil yang ingin dicapai dari dokumen PRD ini. Tujuan harus berhubungan langsung dengan kebutuhan dokumen.

**Aturan pengisian:**
- Tuliskan hasil yang diharapkan dari PRD.
- Pastikan setiap tujuan memiliki hubungan dengan kebutuhan dokumen PRD.
- Gunakan tujuan yang jelas dan dapat dievaluasi.
- Jangan memasukkan tujuan yang berada di luar ruang lingkup PRD.

**Isi:**
1. Pengguna dapat melihat label strategi (anti-3-star, anti-air, anti-ground, anti-2-star, CWL) sebagai badge pada kartu base di grid galeri.
2. Pengguna dapat memfilter galeri berdasarkan satu atau beberapa tag strategi sekaligus (multi-select, semantik OR).
3. Setiap base dapat memiliki lebih dari satu tag strategi (tag banyak-nilai), menggantikan field `gaya` single-value yang ada saat ini.
4. Data tag tersimpan di katalog JSON bundel lokal (offline-first) dan tervalidasi ketat saat pemuatan, mengikuti pola `BaseLayout.fromJson` yang berlaku.
5. Filter tag dapat dipakai bersamaan dengan filter Town Hall, tipe base, dan pencarian teks yang sudah ada, tanpa merusak perilaku filter tersebut.
6. Status fondasi parsial (`GayaBase` / field `gaya`) dibereskan menjadi satu model tag yang konsisten (rename ke `TagStrategi` + field `tags`), bukan dua field yang harus disinkronkan.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk melihat keseluruhan fitur produk dan menentukan tingkat kepentingannya.

**Aturan pengisian:**
- Setiap fitur harus memiliki nama dan deskripsi yang jelas.
- Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah.
- Hindari menggabungkan beberapa fitur berbeda dalam satu baris.
- Pastikan fitur mendukung tujuan produk dan masuk dalam ruang lingkup.
- Gunakan prioritas berdasarkan kepentingan kebutuhan produk.

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Model tag banyak-nilai | Enum `TagStrategi` (`anti3Star`, `antiAir`, `antiGround`, `anti2Star`, `cwl`) dan field `tags: List<TagStrategi>` pada `BaseLayout` (menggantikan `gaya` scalar); `fromJson`/`toJson` memvalidasi daftar tag | Must Have |
| Migrasi katalog JSON | Aset `base_katalog.json` diubah dari `gaya` (string) menjadi `tags` (array string) untuk seluruh entri | Must Have |
| Filter tag multi-select | Chip filter tag pada `FilterChipBar`; `FilterState` menyimpan `Set<TagStrategi>`; semantik pencocokan OR (base cocok bila memiliki minimal satu tag terpilih) | Must Have |
| Penerapan filter di provider | `filteredBasesProvider` menyaring base berdasarkan himpunan tag terpilih (OR), bersama filter TH/tipe/query yang sudah ada | Must Have |
| Badge tag di kartu | Kartu base menampilkan maksimal 2 badge tag strategi dengan label `Anti 3★`, `Anti Udara`, `Anti Darat`, `Anti 2★`, `CWL`; bila lebih, sisanya diringkas menjadi badge `+n` | Must Have |
| Reset filter tag | Tombol Reset pada `FilterChipBar` ikut mengosongkan tag terpilih | Should Have |

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan interaksi pengguna dengan aplikasi dari awal hingga tujuan tercapai.

**Aturan pengisian:**
- Mulai dari kondisi awal pengguna.
- Jelaskan setiap langkah secara berurutan.
- Sebutkan tindakan pengguna dan respons aplikasi.
- Sertakan percabangan atau kondisi alternatif jika tersedia.
- Jelaskan kondisi akhir yang diharapkan.
- Pastikan alur sesuai dengan persyaratan fitur.
- Jangan memasukkan proses yang tidak didukung oleh kebutuhan produk.

**Isi:**

1. Pengguna membuka layar Galeri Base (`BerandaGaleriScreen`).
2. Sistem memuat katalog dari aset JSON bundel lokal; entri dengan `tags` tidak valid menggagalkan pemuatan katalog dengan `KatalogGagalException` (perilaku yang sudah berlaku).
3. Pengguna melihat grid kartu base; setiap kartu menampilkan badge Town Hall, badge Builder Hall (bila ada), label tipe, dan maksimal 2 badge tag strategi (sisa tag diringkas `+n`).
4. Pengguna menekan satu atau beberapa chip tag strategi pada `FilterChipBar` (mis. `Anti 3★` dan `CWL`).
5. Sistem memperbarui `FilterState.tags` (multi-select toggle) dan menyaring daftar: base tampil bila memiliki **minimal satu** tag terpilih (OR), dikombinasikan dengan filter Town Hall, tipe base, dan query teks yang aktif (query teks ikut mencocokkan label tag, mis. mengetik "udara" menemukan base bertag `Anti Udara`).
6. Pengguna menekan chip tag yang sudah aktif untuk menonaktifkannya; daftar kembali melebar.
7. Pengguna menekan tombol `Reset`; seluruh filter termasuk tag dikosongkan dan galeri menampilkan seluruh base.
8. Bila tidak ada base yang cocok dengan kombinasi filter, galeri menampilkan empty state yang sudah berlaku (tidak ada data yang cocok).

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan langkah-langkah kerja yang harus diikuti dalam mengisi atau menerapkan PRD.

**Aturan pengisian:**
- Buat langkah-langkah yang spesifik dan dapat diikuti.
- Gunakan numbered list untuk mempertahankan urutan.
- Setiap langkah harus tidak ambigu dan dapat dikerjakan.
- Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Tidak ada dependensi baru; seluruh perubahan memakai paket yang sudah ada di `pubspec.yaml`.
2. Ubah `base_coc/lib/fitur/galeri_base/model/base_layout.dart`: hapus enum `GayaBase` dan field `gaya`/`GayaBase?`; tambahkan `enum TagStrategi { anti3Star, antiAir, antiGround, anti2Star, cwl }`; `BaseLayout` menerima `tags` (`List<TagStrategi>`, default `const []`); `fromJson` mem-parsing field `tags` **opsional** berupa array string (setiap nilai harus dikenali `TagStrategi.values`, selain itu lempar `KatalogGagalException`; field `tags` yang bukan array juga menggagalkan pemuatan; field `tags` yang tidak ada dianggap daftar kosong); `toJson` menulis `tags` sebagai array `name`; `toString` mengikuti `toJson` otomatis.
3. Ubah `base_coc/assets/data/base_katalog.json`: ganti field `gaya` pada seluruh 12 entri menjadi `tags` array (mis. `"gaya": "anti3Star"` → `"tags": ["anti3Star"]`); pastikan setiap nilai tag valid terhadap enum baru.
4. Ubah `base_coc/lib/fitur/galeri_base/model/filter_state.dart`: tambahkan `final Set<TagStrategi> tags` pada `FilterState` (default `const {}`), `copyWith` dengan parameter `tags` + flag `clearTags`, `hasFilter` ikut memperhitungkan `tags.isNotEmpty`, serta `==`/`hashCode` memperhitungkan `tags`.
5. Ubah `base_coc/lib/fitur/galeri_base/provider/filter_provider.dart`: `FilterNotifier` mendapat method `toggleTag(TagStrategi tag)` (menambah/menghapus tag dari set) dan `clearTags()`; `reset()` mengosongkan `tags` juga.
6. Ubah `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart`: pada `filteredBasesProvider`, base lolos bila `filter.tags.isEmpty` atau `base.tags.any(filter.tags.contains)` (OR); perkuat juga cakupan query teks agar ikut mencocokkan label ramah pengguna dari tag base (mis. ketik "udara" cocok dengan tag `antiAir`), di luar pencocokan id/tipe/townHall yang sudah ada; pertahankan filter TH/tipe yang sudah ada.
7. Ubah `base_coc/lib/fitur/galeri_base/widget/filter_chip_bar.dart`: tambahkan chip tag strategi multi-select (`FilterChip`, `selected: filter.tags.contains(tag)`, `onSelected` memanggil `notifier.toggleTag(tag)`), dengan label ramah pengguna (`Anti 3★`, `Anti Udara`, `Anti Darat`, `Anti 2★`, `CWL`); Reset hanya tampil bila `filter.hasFilter`.
8. Ubah `base_coc/lib/fitur/galeri_base/widget/grid_base.dart`: pada bagian badge kartu, tampilkan maksimal 2 badge tag (gunakan komponen `_Badge` yang ada) dan satu badge ringkas `+n` bila `base.tags.length > 2`.
9. Tambahkan/ubah test: perbarui `base_coc/test/` (bila ada test katalog/model yang menyentuh `gaya`) dan tambahkan test parsing `tags` (array valid, nilai tidak dikenali menggagalkan) serta test filter OR pada `filteredBasesProvider`.
10. Jangan mengubah `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` — di luar cakupan A6 (keputusan diskusi: tag hanya ditampilkan di kartu grid galeri).
11. Tandai item A6 pada `refrensi_apk.md` sebagai sudah dibuatkan PRD (hanya penanda status PRD; isi lain tidak diubah).
12. Verifikasi: `dart format`, `dart analyze`, `flutter test` pada `base_coc`.

Contoh potongan kode (inti perubahan model):

```dart
/// Tag strategi pertahanan lanjutan untuk base.
enum TagStrategi { anti3Star, antiAir, antiGround, anti2Star, cwl }

class BaseLayout {
  const BaseLayout({
    // ...
    this.tags = const <TagStrategi>[],
  });

  final List<TagStrategi> tags;

  factory BaseLayout.fromJson(Map<String, dynamic> json) {
    final tagsRaw = json['tags'];
    final tags = <TagStrategi>[];
    if (tagsRaw != null) {
      if (tagsRaw is! List) {
        throw KatalogGagalException('Field "tags" pada id "$id" harus berupa array.');
      }
      for (final t in tagsRaw) {
        if (t is! String) {
          throw KatalogGagalException('Nilai tag pada id "$id" tidak valid.');
        }
        tags.add(
          TagStrategi.values.firstWhere(
            (e) => e.name == t,
            orElse: () => throw KatalogGagalException(
              'Nilai tag "$t" pada id "$id" tidak dikenali.',
            ),
          ),
        );
      }
    }
    // ...
  }
}
```

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mendata file yang akan dibuat atau diubah saat PRD ini diimplementasikan.

**Aturan pengisian:**
- Periksa struktur proyek sebelum menentukan file terdampak.
- Cantumkan lokasi file spesifik sesuai struktur proyek sebenarnya.
- Tandai status perubahan (`Dibuat` / `Diubah` / `Dihapus`).
- Jelaskan alasan dan tujuan perubahan.
- Hanya cantumkan file yang terkait kebutuhan fitur.
- Jika belum dapat ditentukan, tandai sebagai belum diketahui.

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ---------------- | ------------------- |
| `prd/prd_kategori_strategi_lanjutan.md` | Dibuat | Dokumen PRD fitur A6 ini. |
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart` | Diubah | Hapus `GayaBase`/`gaya`; tambah `TagStrategi` dan field `tags`; `fromJson`/`toJson` mem-parsing array tag dengan validasi ketat. |
| `base_coc/assets/data/base_katalog.json` | Diubah | Ganti `gaya` (string) menjadi `tags` (array) pada seluruh 12 entri. |
| `base_coc/lib/fitur/galeri_base/model/filter_state.dart` | Diubah | Tambah `tags` (`Set<TagStrategi>`), `copyWith`/`hasFilter`/`==`/`hashCode`. |
| `base_coc/lib/fitur/galeri_base/provider/filter_provider.dart` | Diubah | `toggleTag`, `clearTags`; `reset()` mengosongkan tag. |
| `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart` | Diubah | Filter OR berdasarkan himpunan tag terpilih di `filteredBasesProvider`. |
| `base_coc/lib/fitur/galeri_base/widget/filter_chip_bar.dart` | Diubah | Chip tag multi-select + label ramah pengguna; Reset ikut mengosongkan tag. |
| `base_coc/lib/fitur/galeri_base/widget/grid_base.dart` | Diubah | Badge tag maks 2 + `+n` pada kartu. |
| `base_coc/test/` (berkas test katalog/model yang relevan) | Diubah/Dibuat | Test parsing `tags` dan test filter OR; nama berkas test persis ditentukan saat implementasi (belum diketahui — tidak ada test yang saat ini menyentuh `gaya`). |
| `refrensi_apk.md` | Diubah | Tandai item A6 (baris 77–83) sebagai sudah dibuatkan PRD. |

Catatan tumpang tindih: `prd/` kosong per 2026-11-15 (seluruh PRD sebelumnya selesai diimplementasikan dan dihapus), sehingga tidak ada PRD lain yang menyentuh file-file di atas; item A6 juga tidak bertumpang tindih dengan item A3/A4/A5 yang sudah selesai. Tidak ada overlap dengan PRD lain yang perlu dihindari.

Referensi fitur (dicek 2026-11-15, seluruh tautan hidup):
- [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop) — "Smart Filters — Filter by Town Hall level, base type, and layout style", kategori anti-meta (Anti Root Rider, Anti Electro Dragon, ..., Anti Air & Anti Ground).
- [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts) — filter TH/BH/category/style; kategori "Anti-3-star, Anti-ground, Anti-air".
- [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020) — koleksi maps dengan filter Town Hall/tipe (tidak merinci tag strategi).
