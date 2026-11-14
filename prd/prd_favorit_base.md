# PRD — Favorit dan Koleksi Base Tersimpan

**Status Dokumen:** Final

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
1. Pengguna dapat menandai base sebagai favorit dari grid galeri.
2. Pengguna dapat membuka layar Koleksi Favorit dari ikon di `AppBar` galeri.
3. Pengguna dapat menghapus base dari koleksi favorit (toggle bintang).
4. Indikator favorit ditampilkan pada kartu base di galeri.
5. Layar Koleksi Favorit menampilkan empty state eksplisit saat belum ada favorit.
6. Semua data favorit disimpan secara lokal di SQLite (offline-first), tanpa dependensi baru.

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
| Simpan base ke favorit | Menandai base sebagai favorit saat pengguna menekan ikon bintang pada kartu di grid galeri | Must Have |
| Hapus base dari favorit | Menghapus base dari koleksi favorit (toggle bintang pada kartu) | Must Have |
| Lihat koleksi favorit | Layar terpisah yang menampilkan semua base favorit, dibuka dari ikon di `AppBar` galeri | Must Have |
| Indikator favorit di galeri | Ikon bintang terisi/kosong pada kartu base | Must Have |
| Empty state koleksi favorit | State kosong eksplisit (ikon + teks + tombol kembali ke galeri) saat belum ada favorit | Must Have |
| Penyimpanan lokal SQLite | Tabel `favorit_base` di `base_coc.db`, offline-first, tanpa dependensi baru | Must Have |

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

1. Pengguna membuka layar Galeri Base.
2. Pengguna melihat daftar base dalam grid dua kolom.
3. Pengguna menekan ikon bintang pada kartu base untuk menandai sebagai favorit.
4. Sistem menyimpan `id_base` ke tabel `favorit_base` di database SQLite lokal.
5. Kartu base menampilkan ikon bintang terisi.
6. Pengguna menekan ikon bintang pada kartu yang sudah difavoritkan untuk menghapus dari favorit.
7. Sistem menghapus baris dari tabel `favorit_base` dan memperbarui tampilan.
8. Pengguna menekan ikon favorit di `AppBar` galeri untuk membuka layar Koleksi Favorit.
9. Sistem menampilkan daftar base favorit (terbaru di atas) hasil gabungan `favorit_base` dengan katalog base.
10. Jika belum ada favorit, layar menampilkan empty state (ikon + teks “Belum ada base favorit” + tombol kembali ke galeri).
11. Pengguna dapat menghapus base dari favorit melalui ikon bintang di kartu pada layar Koleksi Favorit.

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan langkah-langkah kerja yang harus diikuti dalam mengisi atau menerapkan PRD.

**Aturan pengisian:**
- Buat langkah-langkah yang spesifik dan dapat diikuti.
- Gunakan numbered list untuk mempertahankan urutan.
- Setiap langkah harus tidak ambigu dan dapat dikerjakan.
- Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Tidak perlu dependensi baru; `sqflite` dan `sqflite_common_ffi` sudah tersedia di `pubspec.yaml`.
2. Ubah `base_coc/lib/core/database/db_helper.dart`: tambahkan `static const int _versiDatabase = 2;` dengan komentar versi (mis. `// Versi 2: tabel favorit_base`), gunakan `_versiDatabase` sebagai argumen `version` pada `openDatabase`, buat tabel `favorit_base` (`id_base TEXT PRIMARY KEY, dibuat TEXT NOT NULL`) di `onCreate`, dan tambahkan cabang `if (oldVersion < 2)` di `onUpgrade` yang membuat tabel yang sama (sesuai skill `migrasi-skema-sqlite`: `onCreate` mencerminkan skema terkini, `onUpgrade` menangani pengguna lama).
3. Buat `base_coc/lib/core/database/favorit_dao.dart` mengikuti pola `progres_dao.dart`: konstruktor menerima `Database`, method `ambilSemua()` (urutan `dibuat` terbaru di atas), `tambah(idBase)`, `hapus(idBase)`, `apakahFavorit(idBase)` (atau set `id_base`), dan `hapusSemua()` bila diperlukan pengujian.
4. Buat `base_coc/lib/fitur/galeri_base/provider/favorit_provider.dart` dengan `@Riverpod(keepAlive: true)` (sesuai skill `notifier-crud-database`): `build()` memuat seluruh `id_base` dari database; method `toggle(String idBase)` yang menambah/menghapus baris lalu memperbarui state setelah DB berhasil; tangkap `Exception`, catat dengan logger, lalu `rethrow`.
5. Jangan mengubah `base_coc/lib/fitur/galeri_base/model/base_layout.dart`; status favorit dibaca dari `favoritProvider` (set `id_base`), bukan dari model.
6. Ubah `base_coc/lib/fitur/galeri_base/widget/grid_base.dart`: tambah parameter `Set<String> favoritIds` (atau `bool Function(BaseLayout) isFavorit`) dan callback `onFavoritToggle`; tampilkan `IconButton` bintang (terisi bila `id_base` ada di set, kosong bila tidak) di kanan atas kartu.
7. Ubah `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart`: tambah `IconButton` favorit di `AppBar` yang mem-push `KoleksiFavoritScreen` via `MaterialPageRoute`, watch `favoritProvider`, teruskan set id favorit dan callback toggle ke `GridBase`.
8. Buat `base_coc/lib/fitur/galeri_base/screen/koleksi_favorit_screen.dart`: tampilkan daftar base favorit hasil gabungan `favoritProvider` dengan `katalogProvider` (urut terbaru di atas), gunakan `GridBase` atau daftar serupa; tampilkan empty state eksplisit (ikon + teks “Belum ada base favorit” + tombol kembali ke galeri) saat kosong.
9. Jangan mengubah `base_coc/lib/app.dart` dan `detail_base_screen.dart`; navigasi memakai `MaterialPageRoute` langsung (konsisten dengan `DetailBaseScreen`) dan tombol favorit hanya di galeri.
10. Tambah test: `base_coc/test/favorit_dao_test.dart` (CRUD + urutan terbaru) dan `base_coc/test/favorit_provider_test.dart` (toggle menambah/menghapus state); verifikasi `PRAGMA table_info(favorit_base)` untuk skema instalasi baru dan hasil chain `onUpgrade` sebelum fitur dinyatakan selesai (skill `migrasi-skema-sqlite` aturan 13).

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
| `base_coc/lib/core/database/db_helper.dart` | Diubah | Tambah `_versiDatabase = 2`, tabel `favorit_base` di `onCreate` dan cabang `onUpgrade` (migrasi skema) |
| `base_coc/lib/core/database/favorit_dao.dart` | Dibuat | DAO CRUD favorit mengikuti pola `progres_dao.dart` |
| `base_coc/lib/fitur/galeri_base/provider/favorit_provider.dart` | Dibuat | Notifier keepAlive untuk state id favorit (toggle, muat awal) |
| `base_coc/lib/fitur/galeri_base/screen/koleksi_favorit_screen.dart` | Dibuat | Layar koleksi base favorit + empty state |
| `base_coc/lib/fitur/galeri_base/widget/grid_base.dart` | Diubah | Tambah ikon bintang (toggle favorit) pada kartu base |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah | `IconButton` favorit di `AppBar`, watch provider, teruskan ke `GridBase` |
| `base_coc/test/favorit_dao_test.dart` | Dibuat | Unit test DAO favorit |
| `base_coc/test/favorit_provider_test.dart` | Dibuat | Unit test provider favorit |

File yang sengaja **tidak** diubah: `base_layout.dart` (model tetap murni), `app.dart` (navigasi `MaterialPageRoute`), `detail_base_screen.dart` (tombol favorit hanya di galeri), `pubspec.yaml` (tidak ada dependensi baru).

## 7. Referensi Refrensi APK

Path file: `refrensi_apk.md`

Baris: 77–83 (section A5 — Favorit dan koleksi base tersimpan)

Isi bagian A5:

> A5. Favorit dan koleksi base tersimpan — Pengguna dapat menyimpan base favorit dan mengaksesnya kembali melalui koleksi pribadi.
> Prioritas: Sedang
> Referensi: Map Layout Links Base for COC, Base Drop, Maps For COC Base Layouts 2026 (semua memiliki fitur simpan/favorit)
> Status PRD: Sudah dibuatkan PRD (`prd/prd_favorit_base.md`, baris 77–83 refrensi_apk.md).

## 8. Pemeriksaan Implementasi

**Temuan pemeriksaan (per 2026-11-15, terhadap `base_coc`):**
- `base_layout.dart` — Belum ada field/getter favorit; sudah punya `detailImagePath` dan `previewImagePath` (A3 sudah diimplementasikan). PRD ini tidak mengubah model.
- `katalog_provider.dart` — Belum ada state/provider favorit.
- `db_helper.dart` — Skema versi 1 (`akun_desa`, `progres` + indeks); belum ada tabel `favorit_base`; `onUpgrade` masih kosong; belum ada konstanta `_versiDatabase`.
- `progres_dao.dart` — Pola DAO yang bisa diikuti untuk `favorit_dao.dart` (konstruktor `Database`, transaksi atomik bila perlu).
- `grid_base.dart` — Belum ada ikon bintang pada kartu base.
- `beranda_galeri_screen.dart` — Belum ada ikon favorit di `AppBar` dan belum ada navigasi ke layar koleksi favorit.
- `app.dart` — `home: BerandaGaleriScreen()`, tanpa named routes; layar detail dipush via `MaterialPageRoute`.
- `detail_base_screen.dart` — Sudah punya preview + pinch-to-zoom (A3); belum ada dan tidak akan ditambah tombol favorit (PRD ini hanya di galeri).
- `pubspec.yaml` — Sudah ada `sqflite` dan `sqflite_common_ffi`; tidak perlu dependensi baru.

**Kesimpulan:** Fondasi fitur favorit belum diimplementasikan. Semua komponen perlu dibuat dari nol.

## 9. Catatan Overlap File Terdampak

PRD A3 (`prd/prd_preview_base_zoom.md`) sudah diimplementasikan dan berkas PRD-nya telah dihapus; kode A3 (`detailImagePath`, `previewImagePath`, `InteractiveViewer`, reset zoom) sudah ada di `base_coc`. Karena itu tidak ada overlap aktif dengan PRD lain di `prd/` (saat PRD ini disusun hanya ada `prd_favorit_base.md`).

Pemisahan yang disepakati:
- `detail_base_screen.dart` **tidak** disentuh (tombol favorit hanya di galeri).
- `base_layout.dart` **tidak** diubah (status favorit dari provider, bukan model).
- `app.dart` **tidak** diubah (navigasi `MaterialPageRoute`).
- `db_helper.dart` adalah satu-satunya berkas bersama yang disentuh; perubahan dilakukan lewat migrasi skema versi 2 (skill `migrasi-skema-sqlite`), bukan edit ad-hoc di `onCreate` saja.
