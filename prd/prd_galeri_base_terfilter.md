**Status Dokumen:** Final
**Status Implementasi:** Sudah Diimplementasikan

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

- Nama aplikasi: base_coc
- Deskripsi produk: aplikasi penyedia base/layout Clash of Clans (fan app) berbasis Flutter, saat ini masih aplikasi counter bawaan `flutter create`.
- Platform: Android (mobile)
- Versi: 1.0.0+1 (pubspec.yaml)
- Status pengembangan: Belum ada fitur produk; `lib/main.dart` masih counter bawaan.

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menentukan hasil yang ingin dicapai dari dokumen PRD ini. Tujuan harus berhubungan langsung dengan kebutuhan dokumen.

**Aturan pengisian:**

- Tuliskan hasil yang diharapkan dari PRD.
- Pastikan setiap tujuan memiliki hubungan dengan kebutuhan dokumen PRD.
- Gunakan tujuan yang jelas dan dapat dievaluasi.
- Jangan memasukkan tujuan yang berada di luar ruang lingkup PRD.

**Isi:**
Mendefinisikan fitur "Galeri base terfilter per Town Hall dan tipe base" (item A1 pada `refrensi_apk.md` baris 53-59) agar pengguna dapat menemukan base yang sesuai level Town Hall/Builder Hall dan strategi (war, farming, trophy, hybrid, CWL, ring/box/island) tanpa menelusuri ratusan gambar. Fitur ini menjadi fondasi seluruh pengalaman aplikasi; tanpa katalog terstruktur fitur lain (copy base, preview, favorit) tidak berguna.

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
| ----- | --------- | ----------- |
| Galeri base terfilter per Town Hall dan tipe base | Katalog base yang dikelompokkan berdasarkan Town Hall, Builder Hall, dan tujuan pertahanan (war, farming, trophy, hybrid, CWL, ring/box/island). Filter sebagai chip horizontal di atas grid. MVP dibatasi pada TH dan tipe base agar data awal tidak terlalu besar. | Must Have |
| Struktur data base | Model `TownHallLevel`, `BuilderHallLevel`, `TipeBase`, `GayaBase` untuk tiap base. | Must Have |
| Tampilan grid dua kolom | `GridView` dua kolom dengan thumbnail, badge TH/BH, label tipe. | Must Have |
| State kosong/memuat/gagal | `EmptyStateView` dengan saran ubah filter, indikator loading, tombol coba lagi. | Should Have |

Isi fitur (dari `refrensi_apk.md` baris 53-59):

- Temuan: Seluruh kompetitor utama menyediakan katalog base yang dikelompokkan berdasarkan Town Hall, Builder Hall, dan tujuan pertahanan (war, farming, trophy, hybrid, CWL).
- Tujuan fitur: memungkinkan pengguna menemukan base yang sesuai level dan strategi tanpa menelusuri ratusan gambar.
- Referensi: [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020), [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net), [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts).
- Saran: gunakan struktur data `TownHallLevel`, `BuilderHallLevel`, `TipeBase`, dan `GayaBase`; tampilkan filter sebagai chip horizontal di atas grid. Untuk MVP, batasi pada TH dan tipe base agar data awal tidak terlalu besar.
- Prioritas: Tinggi.

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
1. Pengguna membuka aplikasi; beranda menampilkan kartu kategori Town Hall/Builder Hall dan tujuan base.
2. Pengguna memilih level Town Hall (mis. TH12) dan tipe base (war/farming/trophy/hybrid).
3. Aplikasi menampilkan grid dua kolom berisi thumbnail base dengan badge level dan tipe.
4. Pengguna mengetuk salah satu kartu untuk membuka layar detail (di luar cakupan PRD ini, lihat PRD terpisah).
5. Jika tidak ada base untuk level/tipe yang dipilih, tampil `EmptyStateView` dengan saran ubah filter.
6. Jika katalog gagal dimuat, tampil tombol "Coba lagi".

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan langkah-langkah kerja yang harus diikuti dalam mengisi atau menerapkan PRD.

**Aturan pengisian:**

- Buat langkah-langkah yang spesifik dan dapat diikuti.
- Gunakan numbered list untuk mempertahankan urutan.
- Setiap langkah harus tidak ambigu dan dapat dikerjakan.
- Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Buat model data base (`TownHallLevel`, `BuilderHallLevel`, `TipeBase`, `GayaBase`) dan kelas `BaseLayout`.
2. Siapkan katalog lokal sebagai aset JSON (`assets/data/base_katalog.json`) dan gambar thumbnail.
3. Tambahkan entri aset pada `pubspec.yaml`.
4. Buat provider/notifier untuk memuat dan memfilter katalog (Riverpod).
5. Buat layar beranda dengan kartu kategori dan grid dua kolom.
6. Tambahkan chip filter horizontal dan bottom sheet pilihan lengkap.
7. Implementasikan state kosong/memuat/gagal.
8. Perbarui `main.dart` untuk routing ke layar beranda.
9. Tambahkan test widget untuk grid dan filter.

Contoh kode singkat implementasi (ilustrasi, bukan final):

```dart
// Model dasar
enum TownHallLevel { th4, th5, th6, th7, th8, th9, th10, th11, th12, th13, th14, th15, th16, th17, th18 }

enum TipeBase { war, farming, trophy, hybrid, cwl, ring, box, island }

class BaseLayout {
  final String id;
  final TownHallLevel townHall;
  final TipeBase tipe;
  final String thumbnailPath;
  final String baseLink;
  const BaseLayout({required this.id, required this.townHall, required this.tipe, required this.thumbnailPath, required this.baseLink});
}
```

```dart
// Filter chip horizontal di atas grid
FilterChip(
  label: Text(tipe.name),
  selected: filterTipe == tipe,
  onSelected: (v) => ref.read(filterProvider.notifier).setTipe(v ? tipe : null),
)
```

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi file proyek yang berkaitan dengan implementasi kebutuhan produk. Bagian ini menjadi gambaran awal cakupan perubahan kode.

**Aturan pengisian:**

- Periksa struktur proyek sebelum menentukan file terdampak.
- Cantumkan lokasi file secara spesifik berdasarkan struktur proyek sebenarnya.
- Tandai apakah file perlu dibuat, diubah, atau dihapus.
- Jelaskan alasan dan tujuan perubahan setiap file.
- Cantumkan hanya file yang memiliki hubungan dengan kebutuhan fitur.
- Jangan mengarang lokasi, nama, atau keberadaan file.
- Jika file belum dapat ditentukan, tandai sebagai belum diketahui dan jangan menebak.
- Perbarui daftar setelah analisis teknis atau implementasi apabila ditemukan file terdampak tambahan.

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ------------------------- | ------------------- |
| base_coc/lib/main.dart | Diubah | Ganti aplikasi counter bawaan menjadi MaterialApp dengan routing ke layar beranda galeri base. |
| base_coc/pubspec.yaml | Diubah | Tambah dependensi Riverpod (jika dipakai) dan entri aset katalog/gambar. |
| base_coc/assets/data/base_katalog.json | Dibuat | Data katalog base lokal untuk mode offline. |
| base_coc/lib/fitur/galeri_base/model/filter_state.dart | Dibuat | State filter (townHall, tipe, query) untuk filter chip. |
| base_coc/lib/fitur/galeri_base/model/base_layout.dart | Dibuat | Model data base dan enum level/tipe. |
| base_coc/lib/fitur/galeri_base/provider/filter_provider.dart | Dibuat | State filter Town Hall dan tipe base. |
| base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart | Dibuat | Layar beranda dengan kartu kategori dan grid. |
| base_coc/lib/fitur/galeri_base/widget/grid_base.dart | Dibuat | GridView dua kolom dengan badge. |
| base_coc/test/widget_test.dart | Diubah | Ganti test counter bawaan dengan test grid/filter. |

Referensi sumber: `refrensi_apk.md` baris 53-59 (item A1). Link APK rujukan: https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020, https://play.google.com/store/apps/details?id=com.cocbase.net, https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts.
