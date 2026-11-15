**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek. Informasi ini membantu pembaca PRD memahami aplikasi apa yang akan dikembangkan, platform target, dan status pengembangan saat ini.

**Aturan pengisian:**
- Nama aplikasi, deskripsi produk, platform, versi, dan status pengembangan diisi berdasarkan kondisi proyek yang sebenarnya.
- Platform dan versi target wajib dicantumkan secara eksplisit.

**Informasi:**
- Nama aplikasi: `base_coc` (submodule Flutter di repositori `workspace`, path `base_coc/`)
- Deskripsi produk: Aplikasi Flutter penyedia base/layout Clash of Clans; katalog lokal offline-first, galeri dengan filter, detail base dengan pratinjau `InteractiveViewer`, panduan singkat, aksi copy/share tautan, pelacakan progres upgrade desa (impor Data Export), dan cadangan/pemulihan data lokal satu berkas JSON.
- Platform: Android, iOS, Web, Linux, macOS, dan Windows (struktur Flutter; pengembangan utama Android)
- Versi: `1.0.0+1` (`base_coc/pubspec.yaml`; SDK Dart `^3.13.7`)
- Status pengembangan: Dalam pengembangan; fitur inti (galeri, detail, favorit, progres, cadangan) sudah berjalan; target fitur PRD ini belum diimplementasikan.

Rujukan: `base_coc/README.md` (identitas proyek, per 2026-11-15), `base_coc/pubspec.yaml`.

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menjelaskan hasil yang diharapkan dari dokumen PRD ini. Tujuan yang ditulis menjadi acuan evaluasi keberhasilan implementasi.

**Aturan pengisian:**
- Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen (fitur A56 pada `refrensi_apk.md`).
- Tujuan harus jelas dan dapat dievaluasi; di luar ruang lingkup fitur tidak dimasukkan.

**Isi:**
1. Mendefinisikan fitur "Saran base serupa pada layar detail" (item A56 `refrensi_apk.md` baris 481–487; prioritas gabungan baris 1321 — urutan 137, alasan: "Perbandingan cepat tanpa bolak-balik galeri; data lokal") agar layar detail dapat menampilkan kandidat base setara tanpa kembali ke galeri.
2. Menetapkan sumber data kandidat (katalog lokal yang sudah ada) dan kriteria kecocokan (Town Hall dan tipe sama) agar fitur berjalan sepenuhnya offline tanpa backend.
3. Menetapkan perilaku section bila tidak ada kandidat (disembunyikan) agar layar detail tidak memuat elemen kosong.
4. Menjadi acuan implementasi dan pengujian fitur di `base_coc`.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk merinci fitur-fitur yang termasuk dalam ruang lingkup PRD ini. Setiap baris mewakili satu fitur.

**Aturan pengisian:**
- Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah.
- Prioritas diisi `Must Have`, `Should Have`, atau `Could Have`.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Saran base serupa pada layar detail | Menampilkan 3–5 base dari katalog lokal dengan `townHall` dan `tipe` yang sama dengan base yang sedang dibuka (tidak termasuk base itu sendiri), di bawah area pratinjau pada `DetailBaseScreen`. | Must Have |
| Urutan kandidat berdasarkan kedekatan id | Kandidat diurutkan berdasarkan selisih numerik suffix `id` terhadap base acuan (mis. `base_012` → `base_011`, `base_013` adalah kandidat terdekat); tie-break alfabetis berdasarkan `id`. | Should Have |
| Sembunyikan section bila tidak ada kandidat | Section "Base Serupa" tidak dirender sama sekali bila katalog tidak memuat kandidat yang cocok. | Must Have |
| Navigasi ke detail base kandidat | Mengetuk kartu kandidat membuka `DetailBaseScreen` untuk base tersebut (tumpukan `Navigator` bertambah satu route). | Should Have |
| Umpan balik gambar kandidat gagal dimuat | Kartu kandidat memakai fallback ikon bila gambar pratinjau gagal/kosong, konsisten dengan pola `_PreviewErrorFallback` di layar detail. | Could Have |

Sumber: `refrensi_apk.md` baris 481–487 (item A56). Referensi kompetitor: [Maps Base For Clash of Clans](https://play.google.com/store/apps/details?id=hamidsoft.mapsbaseforcoc) (catatan rilis: "New base screen: big zoomable image, one-tap copy and similar bases") dan [CoC Base Layout Hub](https://play.google.com/store/apps/details?id=com.aarzee.utili.cocbases); keduanya diverifikasi via Google Play pada 2026-11-16. Fitur "similar bases" terkonfirmasi pada catatan rilis Maps Base For Clash of Clans.

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menggambarkan langkah-langkah pengguna dalam berinteraksi dengan fitur secara berurutan, termasuk percabangan kondisi.

**Aturan pengisian:**
- Dimulai dari kondisi awal; jelaskan tindakan pengguna dan respons aplikasi.
- Sertakan kondisi akhir dan percabangan bila ada.

**Isi:**

Kondisi awal: pengguna berada di galeri `base_coc` dan membuka satu base (layar `DetailBaseScreen`).

1. `DetailBaseScreen` menampilkan metadata (Town Hall, tipe), panduan (bila ada), pratinjau gambar (`InteractiveViewer`), dan tautan base seperti biasa.
2. Di bagian bawah tubuh (setelah area tautan `SelectableText`), muncul section "Base Serupa" berupa judul dan daftar kartu horizontal kandidat base (3–5 kartu) dengan kriteria `townHall` dan `tipe` sama dengan base yang dibuka, tidak termasuk base itu sendiri.
3. Pengguna mengetuk salah satu kartu kandidat.
4. Aplikasi membuka `DetailBaseScreen` untuk base kandidat tersebut (route baru ditumpuk; tombol kembali kembali ke base sebelumnya).
5. Kondisi akhir: pengguna membandingkan beberapa layout setara tanpa kembali ke galeri.

Percabangan / kondisi alternatif:
- Katalog belum selesai dimuat (`katalogProvider` masih memuat): section "Base Serupa" tidak dirender (tidak ada indikator loading terpisah; layar detail tetap berfungsi normal).
- Katalog gagal dimuat (`KatalogGagalException`): section "Base Serupa" tidak dirender; sisa layar detail tetap ditampilkan.
- Tidak ada kandidat yang cocok (mis. base satu-satunya untuk kombinasi `townHall` + `tipe`): section "Base Serupa" tidak dirender sepenuhnya.
- Jumlah kandidat kurang dari 3: tampilkan seluruh kandidat yang ada (1 atau 2 kartu), bukan memaksa 3.
- Base acuan memiliki `townHall`/`tipe` yang sama dengan kandidat tetapi `builderHall` berbeda: tetap dianggap kandidat (kriteria hanya `townHall` + `tipe`, sesuai saran A56).

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menjabarkan langkah-langkah implementasi yang spesifik dan dapat diikuti.

**Aturan pengisian:**
- Langkah ditulis sebagai numbered list, tidak ambigu, dan dapat dikerjakan.
- Langkah tidak relevan/redundan tidak dimasukkan.

**Isi:**

1. Tambahkan fungsi murni `cariBaseSerupa(List<BaseLayout> katalog, BaseLayout acuan, {int maksimal = 5})` di berkas baru `base_coc/lib/fitur/detail_base/service/base_serupa_service.dart`:
   - Filter `b.townHall == acuan.townHall && b.tipe == acuan.tipe && b.id != acuan.id`.
   - Urutkan berdasarkan selisih numerik suffix `id` (parse bagian setelah `_` terakhir sebagai `int`; bila gagal parse, perlakukan sebagai alfabetis) terhadap suffix `id` acuan; tie-break alfabetis `id`.
   - Kembalikan maksimal `maksimal` item; kembalikan list kosong bila tidak ada kandidat.
2. Tambahkan provider turunan di berkas baru `base_coc/lib/fitur/detail_base/provider/base_serupa_provider.dart`:

   ```dart
   final baseSerupaProvider =
       Provider.family<AsyncValue<List<BaseLayout>>, BaseLayout>((ref, acuan) {
         final katalog = ref.watch(katalogProvider);
         return katalog.whenData(
           (bases) => cariBaseSerupa(bases, acuan),
         );
   });
   ```

   Catatan: provider memakai pola manual (`Provider.family`) mengikuti gaya `filteredBasesProvider` yang sudah ada di `katalog_provider.dart`, bukan codegen family, agar konsisten dengan provider turunan katalog yang sudah berjalan.
3. Buat widget `BaseSerupaView` (`StatelessWidget` murni, memakai `Consumer` atau menerima data via parameter) di berkas baru `base_coc/lib/fitur/detail_base/widget/base_serupa_view.dart`:
   - Judul section "Base Serupa" (`textTheme.titleMedium`) + daftar horizontal (`ListView.separated` `scrollDirection: Axis.horizontal` atau `SingleChildScrollView` + `Row`) kartu kandidat.
   - Kartu kandidat: gambar pratinjau kecil (asset `previewImagePath`, fallback ikon `Icons.shield`/`Icons.broken_image` bila kosong/gagal), label Town Hall (`labelTownHall`), dan label tipe; tap kartu memanggil callback `onTap(base)`.
   - Widget tidak mengambil tanggung jawab padding tepi layar; aman tema (`ColorScheme`); `Column`/`Row` memakai `spacing` bila tersedia.
4. Ubah `DetailBaseScreen` (`base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart`):
   - Konversi menjadi `ConsumerStatefulWidget`/`ConsumerState` (atau bungkus section dengan `Consumer`) agar dapat `watch(baseSerupaProvider(widget.base))`.
   - Render `BaseSerupaView` di dalam `SingleChildScrollView` setelah `SelectableText` tautan; render hanya bila ada kandidat; tap kartu → `Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => DetailBaseScreen(base: kandidat)))`.
5. Tangani `AsyncValue` kandidat: `isLoading`/`hasError`/kosong → section tidak dirender (tanpa indikator loading/error khusus; layar detail tetap utuh).
6. Tambahkan pengujian di berkas baru `base_coc/test/base_serupa_test.dart`:
   - Unit test helper `cariBaseSerupa`: filter TH+tipe, pengecualian base acuan, urutan kedekatan `id`, tie-break, batas maksimal, list kosong.
   - Widget test section: tidak dirender saat kandidat kosong; menampilkan kartu sesuai data; tap kartu memicu navigasi.
7. Perbarui `base_coc/README.md`: tambahkan subbagian fitur "Saran Base Serupa" di bawah "Detail Base dan Salin Tautan" dan perbarui daftar test bila disebutkan.
8. Verifikasi: `dart format`, `flutter analyze`, `flutter test` di submodule `base_coc`.
9. Tandai item A56 pada `refrensi_apk.md` sebagai sudah dibuatkan PRD (penanda di baris 481) setelah PRD final disepakati.

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk merinci berkas-berkas yang akan dibuat/diubah/dihapus saat implementasi, beserta alasannya. Daftar ini menjadi rujukan anti-bentrok antar sesi/PRD.

**Aturan pengisian:**
- Lokasi file spesifik sesuai struktur proyek sebenarnya; tandai `Dibuat` / `Diubah` / `Dihapus`.
- Hanya file yang terkait fitur; bila belum dapat ditentukan, tulis eksplisit.
- Daftar diperbarui setelah analisis teknis/implementasi bila ditemukan file tambahan.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
|-------------|------------------|---------------------|
| `base_coc/lib/fitur/detail_base/service/base_serupa_service.dart` | Dibuat | Fungsi murni `cariBaseSerupa` (filter TH+tipe, kedekatan id, batas 5 kandidat). |
| `base_coc/lib/fitur/detail_base/provider/base_serupa_provider.dart` | Dibuat | `baseSerupaProvider` (`Provider.family`, `AsyncValue<List<BaseLayout>>`) turunan `katalogProvider`. |
| `base_coc/lib/fitur/detail_base/widget/base_serupa_view.dart` | Dibuat | Widget section "Base Serupa" (judul + daftar kartu horizontal; fallback gambar; aman tema). |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | Konversi ke `ConsumerStatefulWidget` (atau bungkus section dengan `Consumer`); render `BaseSerupaView`; navigasi tap kartu. |
| `base_coc/test/base_serupa_test.dart` | Dibuat | Unit test helper + widget test section. |
| `base_coc/README.md` | Diubah | Dokumentasi subbagian fitur "Saran Base Serupa"; perbarui daftar test bila disebutkan. |
| `refrensi_apk.md` | Diubah | Penanda pada item A56 (baris 481): "PRD sudah dibuat (`prd/prd_saran_base_serupa.md`, sesi 149); belum diimplementasikan". |

Catatan tumpang tindih: `prd/` saat PRD ini dibuat kosong (PRD terakhir A46/A8 sudah diimplementasikan dan dihapus berkasnya), sehingga tidak ada tumpang tindih file terdampak dengan PRD lain. Berkas terdampak seluruhnya berada di submodule `base_coc` (ditambah penanda `refrensi_apk.md` dan berkas PRD ini). Fitur serumpun yang belum ada dan di luar cakupan: A36 (indikator popularitas "jumlah salin" lokal) dan A53 (kalkulator rampasan) — kriteria pengurutan "jumlah salin lokal" dari catatan A56 ditunda sampai A36/A53 tersedia; A36/A53 bila nanti dibuat PRD akan menyentuh `base_serupa_provider.dart` (pengurutan) dan harus memperbarui PRD ini secara aditif.

Belum diketahui / belum dibahas:
- Posisi section: diputuskan paling bawah tubuh, setelah `SelectableText` tautan (2026-11-16, sesi 149).
- Bentuk visual: diputuskan daftar horizontal ringkas (pratinjau kecil + badge TH + badge tipe) (2026-11-16, sesi 149).
- Pengurutan: mengikuti draft — kedekatan suffix `id` numerik, tie-break alfabetis (diputuskan 2026-11-16, sesi 149).
- Seluruh `thumbnailPath`/`detailImagePath` pada `base_katalog.json` saat ini bernilai `""`, sehingga kartu kandidat akan menampilkan fallback ikon sampai aset gambar tersedia.
