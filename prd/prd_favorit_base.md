# PRD — Favorit dan Koleksi Base Tersimpan

**Status Dokumen:** Draft

**Status Implementasi:** Belum Diimplementasikan

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
- Versi: 1.0.0
- Status pengembangan: Belum Diimplementasikan (hanya PRD)

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menentukan hasil yang ingin dicapai dari dokumen PRD ini. Tujuan harus berhubungan langsung dengan kebutuhan dokumen.

**Aturan pengisian:**
- Tuliskan hasil yang diharapkan dari PRD.
- Pastikan setiap tujuan memiliki hubungan dengan kebutuhan dokumen PRD.
- Gunakan tujuan yang jelas dan dapat dievaluasi.
- Jangan memasukkan tujuan yang berada di luar ruang lingkup PRD.

**Isi:**
1. Pengguna dapat menyimpan base favorit ke dalam koleksi pribadi.
2. Pengguna dapat melihat daftar base favorit di layar terpisah.
3. Pengguna dapat menghapus base dari koleksi favorit.
4. Indikator favorit ditampilkan pada kartu base di galeri.
5. Semua data favorit disimpan secara lokal (offline-first).

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
| Simpan base ke favorit | Menandai base sebagai favorit saat pengguna menekan ikon bintang pada kartu atau layar detail | Must Have |
| Hapus base dari favorit | Menghapus base dari koleksi favorit | Must Have |
| Lihat koleksi favorit | Layar terpisah yang menampilkan semua base favorit | Must Have |
| Indikator favorit di galeri | Badge/ikon bintang pada kartu base yang sudah difavoritkan | Must Have |
| Penyimpanan lokal | Data favorit disimpan di SQLite agar dapat diakses offline | Must Have |

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

1. Pengguka membuka layar Galeri Base.
2. Penggula melihat daftar base dalam grid.
3. Penggula menekan ikon bintang pada kartu base untuk menandai sebagai favorit.
4. Sistem menyimpan id base ke tabel favorit di database SQLite lokal.
5. Kartu base ditandai sebagai favorit (badge berwarna berbeda).
6. Penggula membuka layar Koleksi Favorit untuk melihat semua base favorit.
7. Penggula dapat menghapus base dari koleksi favorit dengan menekan ikon bintang kembali.
8. Sistem menghapus data favorit dari database dan memperbarui tampilan.

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan langkah-langkah kerja yang harus diikuti dalam mengisi atau menerapkan PRD.

**Aturan pengisian:**
- Buat langkah-langkah yang spesifik dan dapat diikuti.
- Gunakan numbered list untuk mempertahankan urutan.
- Setiap langkah harus tidak ambigu dan dapat dikerjakan.
- Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Tambah dependensi `shared_preferences` atau gunakan `sqflite` yang sudah ada di `pubspec.yaml`.
2. Buat tabel `favorit_base` di `db_helper.dart` (onCreate) dengan kolom `id_base TEXT PRIMARY KEY`.
3. Buat file `base_coc/lib/fitur/galeri_base/provider/favorit_provider.dart` untuk mengelola state favorit dengan Riverpod.
4. Buat file `base_coc/lib/fitur/galeri_base/service/favorit_service.dart` untuk CRUD favorit ke database.
5. Ubah `base_coc/lib/fitur/galeri_base/model/base_layout.dart` untuk menambah getter `isFavorit` (runtime, tidak disimpan di JSON).
6. Ubah `base_coc/lib/fitur/galeri_base/widget/grid_base.dart` untuk menambah ikon bintang pada kartu base.
7. Ubah `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` untuk menambah provider favorit dan navigasi ke layar koleksi favorit.
8. Buat layar `base_coc/lib/fitur/galeri_base/screen/koleksi_favorit_screen.dart` untuk menampilkan daftar favorit.
9. Ubah `base_coc/lib/app.dart` untuk menambahkan route ke layar koleksi favorit.
10. Tambah test untuk `favorit_service` dan `favorit_provider`.

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
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart` | Diubah | Tambah getter `isFavorit` (runtime, tidak dari JSON) |
| `base_coc/lib/core/database/db_helper.dart` | Diubah | Tambah tabel `favorit_base` pada `onCreate` |
| `base_coc/lib/fitur/galeri_base/provider/favorit_provider.dart` | Dibuat | Riverpod provider untuk state favorit |
| `base_coc/lib/fitur/galeri_base/service/favorit_service.dart` | Dibuat | Layanan CRUD favorit ke SQLite |
| `base_coc/lib/fitur/galeri_base/widget/grid_base.dart` | Diubah | Tambah ikon bintang pada kartu base |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah | Tambah integrasi provider favorit dan navigasi |
| `base_coc/lib/fitur/galeri_base/screen/koleksi_favorit_screen.dart` | Dibuat | Layar koleksi base favorit |
| `base_coc/lib/app.dart` | Diubah | Tambah route ke layar koleksi favorit |
| `base_coc/test/favorit_service_test.dart` | Dibuat | Unit test untuk layanan favorit |
| `base_coc/pubspec.yaml` | Diubah | Pastikan `sqflite` tersedia (sudah ada) |

## 7. Referensi Refrensi APK

Path file: `refrensi_apk.md`

Baris: 77–83 (section A5 — Favorit dan koleksi base tersimpan)

Isi bagian A5:

> A5. Favorit dan koleksi base tersimpan — Pengguna dapat menyimpan base favorit dan mengaksesnya kembali melalui koleksi pribadi.
> Prioritas: Sedang
> Referensi: Map Layout Links Base for COC, Base Drop, Maps For COC Base Layouts 2026 (semua memiliki fitur simpan/favorit)
> Status PRD: Sudah dibuatkan PRD (`prd/prd_favorit_base.md`)

## 8. Pemeriksaan Implementasi

**Temuan pemeriksaan (aturan 6):**
- `base_layout.dart` — Belum punya field `favorit`/`isFavorit`. Field yang ada: `id`, `townHall`, `tipe`, `thumbnailPath`, `baseLink`, `detailImagePath`, `builderHall`, `gaya`. A3 sebelumnya menambah `detailImagePath`; A5 akan menambah `isFavorit` sebagai getter runtime, bukan field JSON.
- `katalog_provider.dart` — Belum ada provider/state untuk favorit.
- `db_helper.dart` — Sudah ada tabel `akun_desa` dan `progres`; belum ada tabel `favorit_base`.
- `grid_base.dart` — Belum ada ikon/indikator favorit pada kartu.
- `beranda_galeri_screen.dart` — Belum ada navigasi ke layar koleksi favorit.
- `detail_base_screen.dart` — Belum ada tombol favorit (dihindari untuk menghindari overlap dengan PRD A3).
- `pubspec.yaml` — Sudah ada `sqflite`; tidak perlu dependensi baru.

**Kesimpulan:** Fondasi fitur favorit belum diimplementasikan. Semua komponen perlu dibuat dari nol.

## 9. Catatan Overlap File Terdampak

PRD A3 (`prd/prd_preview_base_zoom.md`) mengubah file-file berikut:
- `detail_base_screen.dart`
- `base_layout.dart`
- `katalog_service.dart`
- `pubspec.yaml`
- `assets/images/bases/`
- `assets/data/base_katalog.json`
- `test/detail_base_test.dart`

File-file yang sama dengan A5:
- `base_layout.dart` — A3 tambah `detailImagePath`; A5 tambah `isFavorit` getter (tidak menambah field JSON)
- `pubspec.yaml` — A3 menambah aset; A5 tidak menambah dependensi baru (sqflite sudah ada)

Untuk menghindari overlap yang signifikan, A5 **tidak menyentuh** `detail_base_screen.dart` (tombol favorit hanya di galeri, bukan di detail).

---
