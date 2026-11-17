**Status Dokumen:** Final
**Status Implementasi:** Sedang Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Bagian ini mengidentifikasi produk dan memberikan gambaran umum proyek agar PRD selaras dengan kondisi nyata.

**Aturan pengisian:**
Isi berdasarkan kondisi proyek yang sebenarnya; gunakan nama konsisten dengan proyek; cantumkan platform dan versi target.

**Informasi:**

- Nama aplikasi: base_coc (penyedia base/layout Clash of Clans)
- Deskripsi produk: Aplikasi mobile Flutter (Android/iOS) untuk menelusuri, memfilter, dan menyalin base Clash of Clans; katalog lokal offline-first dengan favorit, penghitung interaksi (salin/buka), sortir terbaru/terpopuler, dan pemeriksaan tautan kedaluwarsa.
- Platform: Android (target utama), iOS (sekunder)
- Versi: mengikuti versi aplikasi saat ini (pubspec.yaml base_coc)
- Status pengembangan: fitur galeri base, filter, favorit, penghitung interaksi (`statistik_base`), sortir terbaru/terpopuler (C38), dan pemeriksaan tautan (B19) sudah berjalan; PRD ini menangani indikator popularitas dan kurasi manual "Pilihan" pada kartu katalog yang belum ada.

## 2. Tujuan PRD

**Konteks penggunaan:**
Bagian ini menyatakan hasil yang diharapkan dari PRD agar ruang lingkup jelas dan dapat dievaluasi.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; gunakan tujuan jelas dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.

**Isi:**

- Menyediakan indikator popularitas pada kartu katalog base: badge "Sering disalin" (berdasarkan penghitung lokal `jumlah_salin`) dan label kurasi manual "Pilihan" (berdasarkan field katalog) agar pengguna dapat memilih base berkualitas tanpa membuka detail.
- Melengkapi A36 (`Indikator popularitas base lokal`) pada bagian yang belum diimplementasikan, tanpa mengubah penghitung dan sortir yang sudah berjalan (C38).
- Menjaga konsistensi validasi katalog ketat (skill `validasi-json-katalog-ketat`) dan prinsip offline-first.

## 3. Daftar Fitur

**Konteks penggunaan:**
Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah; prioritas Must/Should/Could Have.

**Aturan pengisian:**
Jangan menggabungkan beberapa fitur dalam satu baris; setiap fitur wajib mendukung tujuan produk dan masuk ruang lingkup.

**Isi:**

| Fitur                                      | Deskripsi                                                                                                                                                                                                                                                         | Prioritas   |
| ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| Field kurasi manual "Pilihan" pada katalog | Tambah field opsional `pilihanEditor` (boolean) pada model `BaseLayout` dan data `base_katalog.json`; entri yang ditandai `true` menampilkan label "Pilihan" pada kartu katalog. Validasi ketat: jika field ada, wajib boolean; jika tidak ada, dianggap `false`. | Should Have |
| Badge "Sering disalin" pada kartu katalog  | Tampilkan badge kecil pada kartu bila `jumlah_salin` base melewati ambang tertentu (mis. >= 5), memakai data `StatistikNotifier` yang sudah ada. Ambang dapat disesuaikan.                                                                                        | Should Have |
| Maksimal satu badge pada kartu             | Jaga kartu tetap ringkas: tampilkan paling banyak satu badge indikator (prioritas "Pilihan" di atas "Sering disalin") agar tidak menutupi thumbnail.                                                                                                              | Could Have  |

## 4. Alur Pengguna

**Konteks penggunaan:**
Mulai dari kondisi awal pengguna; jelaskan langkah berurutan; sebutkan tindakan pengguna dan respons aplikasi; sertakan percabangan; jelaskan kondisi akhir.

**Aturan pengisian:**
Alur sesuai persyaratan fitur; jangan memasukkan proses yang tidak didukung kebutuhan produk.

**Isi:**

1. Pengguna membuka beranda galeri; grid kartu base ditampilkan seperti biasa.
2. Untuk setiap kartu, aplikasi menentukan badge yang ditampilkan:
   - Jika base memiliki `pilihanEditor == true`, tampilkan badge "Pilihan" (warna `colorScheme.primary`).
   - Jika tidak, dan `jumlah_salin` base >= ambang (mis. 5), tampilkan badge "Sering disalin".
   - Jika tidak ada yang memenuhi, tidak tampilkan badge indikator.
3. Pengguna mengetuk kartu untuk membuka detail base; perilaku tidak berubah.
4. Saat pengguna menyalin tautan base (aksi salin sukses), `StatistikNotifier.catatSalin` dipanggil seperti biasa; badge "Sering disalin" dapat muncul pada kunjungan berikutnya setelah data statistik dimuat ulang.
5. Kondisi akhir: kartu katalog menampilkan indikator kualitas yang membantu pemilihan tanpa membuka detail, sementara penghitung dan sortir terpopuler tetap berfungsi.

## 5. Steps

**Konteks penggunaan:**
Langkah spesifik dan dapat diikuti; numbered list; tidak ambigu.

**Aturan pengisian:**
Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Tambahkan field opsional `pilihanEditor` (`bool`, default `false`) pada `BaseLayout` (Freezed) dan parse/validasi ketat di `BaseLayout.fromJson` (jika ada, wajib boolean; string kosong/null dianggap `false`).
2. Tambahkan field `pilihanEditor` pada `toJson()` (tulis hanya jika `true`, konsisten dengan `validasi-json-katalog-ketat`).
3. Tambahkan field `pilihanEditor` pada entri katalog yang dikurasi di `base_katalog.json` (hanya entri yang dikehendaki; entri lain tidak perlu menulis field).
4. Perbarui `katalog_service.dart` agar field dibaca melalui `BaseLayout.fromJson` (tanpa perubahan parsing khusus; validasi tetap di model).
5. Perbarui `grid_base.dart`: terima parameter opsional `statistik` (Map<String, StatistikBase>) dan `ambangSeringDisalin` (int, default 5); tampilkan badge indikator dengan prioritas "Pilihan" lalu "Sering disalin"; maksimal satu badge.
6. Perbarui pemanggil `GridBase` (mis. `beranda_galeri_screen.dart`) untuk meneruskan `statistik` dari `StatistikNotifier` (gunakan `asData?.value` dengan penanganan error sesuai skill `penanganan-async-data-kosong` Aturan 7; jika gagal, sembunyikan badge "Sering disalin" dan catat log).
7. Tambahkan/ubah test widget untuk memverifikasi badge muncul sesuai kondisi (pilihanEditor true; jumlahSalin >= ambang; tidak ada badge bila keduanya tidak memenuhi).
8. Jalankan `dart format`, `dart analyze`, dan `flutter test` pada `base_coc`.

## 6. File-File Terdampak

**Konteks penggunaan:**
Cantumkan lokasi file spesifik sesuai struktur proyek; tandai Dibuat/Diubah/Dihapus; jelaskan alasan; jika belum dapat ditentukan, tandai belum diketahui.

**Aturan pengisian:**
Hanya file yang terkait kebutuhan fitur; perbarui setelah analisis teknis bila ditemukan tambahan.

**Isi:**

| Lokasi File                                                        | Status Perubahan   | Deskripsi Perubahan                                                                                                                            |
| ------------------------------------------------------------------ | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart`            | Diubah             | Tambah field opsional `pilihanEditor` (default false) pada Freezed model; parsing/validasi ketat di `fromJson`; tulis kondisional di `toJson`. |
| `base_coc/assets/data/base_katalog.json`                           | Diubah             | Tambah field `pilihanEditor: true` pada entri yang dikurasi secara manual (opsional per entri).                                                |
| `base_coc/lib/fitur/galeri_base/service/katalog_service.dart`      | Diubah             | Pastikan parsing field baru berjalan melalui `BaseLayout.fromJson` tanpa perubahan khusus.                                                     |
| `base_coc/lib/fitur/galeri_base/widget/grid_base.dart`             | Diubah             | Tambah parameter `statistik` dan `ambangSeringDisalin`; tampilkan badge "Pilihan"/"Sering disalin" (maksimal satu) pada kartu.                 |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah             | Teruskan data `StatistikNotifier` ke `GridBase` dengan penanganan error eksplisit.                                                             |
| `base_coc/test/grid_base_test.dart` (jika ada/akan dibuat)         | Dibuat/Diubah      | Test widget badge sesuai kondisi.                                                                                                              |
| `base_coc/lib/fitur/galeri_base/model/base_layout.freezed.dart`    | Diubah (generated) | Hasil `build_runner` setelah perubahan Freezed model; jangan diedit manual.                                                                    |
