**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek `base_coc` tempat fitur ini akan ditambahkan.

**Aturan pengisian:**
Isi setiap field berdasarkan kondisi proyek yang sebenarnya; jangan mengarang informasi yang belum diketahui — tulis secara eksplisit.

**Informasi:**
- Nama aplikasi: `base_coc` (Base CoC)
- Deskripsi produk: aplikasi Flutter galeri layout base Clash of Clans (TH3–TH18, BH, Clan Capital) dengan katalog lokal (aset `base_katalog.json`, 12 entri), pratinjau gambar, copy link satu ketuk, bookmark favorit, progres upgrade desa, dan cadangan/pemulihan data lokal. Tidak ada backend; seluruh data disimpan di aset bundel dan SQLite lokal.
- Platform: Android (Flutter; `kIsWeb` dijaga pada alur berbagi/cadangan)
- Versi: 1.0.0+1 (`pubspec.yaml`)
- Status pengembangan: aktif dikembangkan; katalog lokal berversi `1.0.0` (metadata `tanggalPublikasi` 2026-11-14)

## 2. Tujuan PRD

**Konteks penggunaan:**
Menetapkan rancangan fitur "pemeriksaan berkala dan penggantian tautan kedaluwarsa" agar dokumen ini menjadi dasar implementasi dan review.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; jangan memasukkan tujuan di luar ruang lingkup.

**Isi:**
- Menetapkan mekanisme lokal agar tautan base (`baseLink`) pada katalog tetap andal: format divalidasi saat katalog dimuat, setiap entri memiliki penanda `terakhirDiperiksa`, dan tautan yang diduga kedaluwarsa dapat ditinjau serta ditandai.
- Menetapkan alur "penggantian tautan" yang realistis untuk aplikasi tanpa backend: antrean tinjauan lokal + ekspor laporan teks untuk maintainer; penggantian efektif dilakukan dengan merilis katalog/aplikasi baru (aset), bukan lewat override di dalam aplikasi.
- Menetapkan batas ruang lingkup terhadap item A37 (`refrensi_apk.md` baris 329–335, "Laporan tautan base rusak dengan peninjauan ulang"). Keputusan diskusi (sesi 155): alur lapor (tombol "Laporkan tautan rusak" + penyimpanan lokal) **masuk ke B19**. Yang tersisa dari A37 — menyembunyikan base yang sering dilaporkan setelah ambang — **tidak** dibawa: B19 menandai (badge/administrasi), tidak menyembunyikan konten.
- Menyediakan dasar file terdampak, alur pengguna, dan langkah implementasi agar fitur dapat dikerjakan tanpa keputusan desain ulang.

Tujuan yang BUKAN cakupan PRD ini:
- Verifikasi otomatis tautan `https://link.clashofclans.com/...` ke server Supercell (tidak tersedia API publik; tidak dapat diuji tanpa membuka game).
- Backend/server-side link checker, moderasi konten jarak jauh, atau pembaruan katalog dari jaringan.
- Override tautan di dalam aplikasi (menimpa aset bundel via SQLite) — ditolak (dobel sumber kebenaran; keputusan diskusi sesi 155).
- Sembunyikan/penghapusan base dari galeri berdasarkan jumlah laporan — ditolak (B19 hanya menandai).

## 3. Daftar Fitur

**Konteks penggunaan:**
Mendaftar fitur-fitur yang dapat diidentifikasi terpisah beserta prioritasnya.

**Aturan pengisian:**
Satu baris satu fitur; prioritas `Must Have` / `Should Have` / `Could Have`; setiap fitur wajib mendukung tujuan PRD dan ruang lingkup di atas.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Validasi format tautan saat memuat katalog | `BaseLayout.fromJson` menolak `baseLink` yang gagal `validasiLinkBase` (http/https, host tidak kosong) — bukan hanya `is! String`/kosong seperti saat ini; katalog gagal total dengan `KatalogGagalException` yang memuat `id` entri dan nama field | Must Have |
| Field `terakhirDiperiksa` per entri katalog | `base_katalog.json` dan `BaseLayout` mendukung field opsional `terakhirDiperiksa` (string tanggal ISO 8601, mis. `2026-11-14`); divalidasi ketat (format tanggal wajib dikenali; kosong/absent = belum pernah diperiksa); `toJson` kondisional | Must Have |
| Helper "perlu ditinjau" otomatis | Helper murni (mis. `tautan_tinjauan.dart`) menghitung antrean tinjauan tanpa jaringan: entri `terakhirDiperiksa` absen atau lebih dari **180 hari** yang lalu (konstanta `ambangTinjauanHari = 180`), plus entri dengan laporan lokal; mengembalikan daftar beralasan (`usia`, `belumDiperiksa`, `dilaporkan`) | Must Have |
| Penanda visual di layar detail | Badge kecil "Tautan perlu ditinjau" pada `DetailBaseScreen` bila entri termasuk antrean tinjauan (tidak memblokir aksi Copy Base); warna dari `ColorScheme` | Should Have |
| Alur lapor satu ketuk | Tombol/aksi "Laporkan tautan rusak" pada `DetailBaseScreen`; menulis/meningkatkan baris `tautan_status` (`jumlah_laporan` +1, `terakhir_dilaporkan` = waktu lokal); snackbar konfirmasi | Should Have |
| Antrean tinjauan tautan lokal (SQLite) | Tabel `tautan_status` (migrasi versi DB 2 → 3): `id_base` PK, `jumlah_laporan INTEGER NOT NULL DEFAULT 0`, `terakhir_dilaporkan TEXT`, `diperbarui TEXT NOT NULL`; konstanta nama tabel/kolom di `nama_tabel_tautan.dart`; diakses lewat `TautanStatusDao` | Should Have |
| Layar "Administrasi Tautan" dari AppBar Galeri | Layar baru (mis. `administrasi_tautan_screen.dart`), diakses dari `AppBar` beranda galeri (konsisten dengan Koleksi Favorit/Cadangan); menampilkan gabungan entri usia/belum diperiksa dan entri dilaporkan (diurutkan: laporan terbanyak, lalu `terakhirDiperiksa` tertua); aksi "Tandai sudah ditinjau" (menghapus baris `tautan_status`; untuk entri usia/belum diperiksa status bersih hanya lewat katalog baru dengan `terakhirDiperiksa` segar) dan aksi "Bagikan laporan" | Should Have |
| Ekspor laporan tinjauan (teks) | Pada layar administrasi, tombol "Bagikan laporan" menghasilkan teks ringkas (`id`, `baseLink`, alasan, jumlah laporan) lewat `share_plus` (pola cadangan) untuk dikirim ke maintainer | Could Have |
| Penanda prioritas laporan | Entri dengan `jumlah_laporan >= 3` ditandai menonjol (mis. ikon/label "Sering dilaporkan") pada administrasi; tidak menyembunyikan base dari galeri | Could Have |

## 4. Alur Pengguna

**Konteks penggunaan:**
Menjelaskan kondisi awal pengguna, langkah berurutan, dan kondisi akhir yang diharapkan.

**Aturan pengisian:**
Mulai dari kondisi awal; sertakan percabangan bila ada; jangan memasukkan proses yang tidak didukung kebutuhan.

**Isi:**

Alur 1 — Memuat katalog dengan validasi tautan (tanpa interaksi pengguna):
1. Aplikasi membuka `base_katalog.json` dari `rootBundle` (alur `KatalogService.bacaKatalog` yang sudah ada).
2. Setiap `BaseLayout.fromJson` memvalidasi `baseLink` dengan aturan `validasiLinkBase` (http/https, host tidak kosong) dan memvalidasi `terakhirDiperiksa` bila ada (string tanggal yang dapat diparse; kosong = null).
3. Bila ada entri invalid → `KatalogGagalException` (pesan memuat `id` dan field) → layar galeri menampilkan `_TampilanGagal` (sudah ada) dengan opsi "Coba lagi".
4. Bila valid → katalog dimuat; helper `perluDitinjau` menghitung antrean (tanpa jaringan, tanpa blocking UI).

Alur 2 — Pengguna melihat penanda tautan perlu ditinjau:
1. Pengguna membuka detail base (dari galeri/favorit/base serupa).
2. Bila entri termasuk antrean tinjauan, muncul badge kecil "Tautan perlu ditinjau" di dekat `SelectableText(baseLink)` (tidak menyembunyikan tautan, tidak memblokir Copy Base).
3. Kondisi akhir: pengguna tetap dapat menyalin tautan; kejujuran status ditampilkan.

Alur 3 — Pengguna melaporkan tautan rusak:
1. Pengguna menekan aksi "Laporkan tautan rusak" pada layar detail.
2. Aplikasi menulis status `perlu_ditinjau` (via `tautan_status`: `jumlah_laporan` +1, `terakhir_dilaporkan` = waktu lokal) dalam SQLite.
3. Umpan balik berupa snackbar ("Terima kasih, laporan tersimpan."). Kegagalan penulisan ditangani dengan `catchError` + `L.e`/`debugPrint` dan snackbar gagal (tidak crash).
4. Bila `jumlah_laporan` mencapai 3 atau lebih, entri ditandai "Sering dilaporkan" pada layar administrasi; base tetap tampil di galeri.

Alur 4 — Maintainer meninjau dan mengganti tautan:
1. Maintainer membuka AppBar Galeri → ikon "Administrasi Tautan" → layar administrasi.
2. Daftar menampilkan: `id`, `baseLink`, alasan (`usia`/`belumDiperiksa`/`dilaporkan`), jumlah laporan, dan usia sejak `terakhirDiperiksa`.
3. Maintainer menekan "Bagikan laporan" untuk mengirim ringkasan via share sheet, atau langsung memperbarui `base_katalog.json` (ganti tautan, perbarui `terakhirDiperiksa`, bump `metadata.versi`) dan merilis katalog/aplikasi baru.
4. Setelah rilis katalog baru, entri segar (`terakhirDiperiksa` baru) otomatis bersih dari sisi usia; entri yang pernah dilaporkan dibersihkan di layar administrasi lewat aksi "Tandai sudah ditinjau" (menghapus baris `tautan_status`).
5. Kondisi akhir: antrean tinjauan mengecil; tautan copy kembali andal.

## 5. Steps

**Konteks penggunaan:**
Daftar langkah implementasi yang spesifik dan dapat diikuti berurutan.

**Aturan pengisian:**
Numbered list; setiap langkah tidak ambigu; jangan memasukkan langkah yang tidak relevan.

**Isi:**
1. Verifikasi kondisi proyek (`base_coc`): `dart analyze` bersih, `flutter test` lulus (basis sebelum perubahan).
2. Tambahkan field `terakhirDiperiksa` (opsional) pada `BaseLayout` (freezed): field `String? terakhirDiperiksa`; `fromJson` validasi ketat (string tanggal yang dapat di-parse `DateTime.tryParse`; kosong = null); `toJson` kondisional; jalankan `build_runner`.
3. Perluas validasi `baseLink` di `BaseLayout.fromJson`: tolak bila `validasiLinkBase(link)` bernilai `false` (impor dari `core/util/validasi_link_base.dart`); pesan exception memuat `id` entri dan field `baseLink`.
4. Perbarui `assets/data/base_katalog.json`: tambahkan `terakhirDiperiksa` pada 12 entri (nilai awal tanggal publikasi katalog `2026-11-14`); checksum tetap placeholder (dicatat, bukan diperbaiki di PRD ini).
5. Buat helper murni `lib/core/util/tautan_tinjauan.dart`: fungsi `hitungPerluDitinjau(List<BaseLayout>, {required DateTime sekarang, int ambangHari = 180})` yang menggabungkan flag usia/belum diperiksa (dari katalog) dengan baris `tautan_status` (SQLite, lewat DAO); tulis unit test.
6. Tambahkan tabel `tautan_status` ke SQLite: migrasi `SqfliteOpener.versiDatabase` 2 → 3; `onCreate` + `onUpgrade` (`CREATE TABLE tautan_status (id_base TEXT PRIMARY KEY, jumlah_laporan INTEGER NOT NULL DEFAULT 0, terakhir_dilaporkan TEXT, diperbarui TEXT NOT NULL)`); konstanta nama tabel/kolom di `nama_tabel_tautan.dart` (snake_case; skill `penamaan-konstanta-snake-case`); `TautanStatusDao` mengikuti pola `favorit_dao.dart` + test.
7. Integrasikan alur lapor: aksi "Laporkan tautan rusak" pada `DetailBaseScreen` menulis via DAO (`jumlah_laporan` +1); snackbar konfirmasi/gagal; `unawaited` dengan `catchError` + logging.
8. Tambahkan badge "Tautan perlu ditinjau" di `DetailBaseScreen` (warna `ColorScheme`, tidak memblokir aksi).
9. Buat `AdministrasiTautanScreen` (di `fitur/galeri_base/screen/`), entri dari `AppBar` beranda galeri: daftar antrean (gabungan usia + laporan), aksi "Tandai sudah ditinjau" (untuk entri dilaporkan: hapus baris DAO; untuk entri usia/belum diperiksa: tampilkan catatan bahwa pembersihan mengikuti rilis katalog baru), aksi "Bagikan laporan" (teks via `share_plus`), penanda "Sering dilaporkan" untuk `jumlah_laporan >= 3`. State bersama via Riverpod (Notifier; skill `riverpod-pola`), tanpa `setState` murni.
10. Refresh provider setelah perubahan data (`ref.invalidate`/`ref.refresh`).
11. Verifikasi: `dart format`, `dart analyze`/`flutter analyze`, `flutter test` (termasuk test katalog invalid → `KatalogGagalException`, helper tinjauan, DAO, widget badge/administrasi).
12. Perbarui `base_coc/README.md` (section fitur + daftar test) dan `refrensi_apk.md` item B19 → tandai "PRD sudah dibuat (sesi 155); belum diimplementasikan" (sudah dilakukan saat PRD ini dibuat).

## 6. File-File Terdampak

**Konteks penggunaan:**
Daftar file yang diperkirakan dibuat/diubah, diverifikasi terhadap struktur `base_coc` yang sebenarnya (bukan tebakan).

**Aturan pengisian:**
Lokasi spesifik; tandai `Dibuat` / `Diubah` / `Dihapus`; bila belum dapat ditentukan, tulis `Belum diketahui`.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
|-------------|------------------|---------------------|
| `base_coc/assets/data/base_katalog.json` | Diubah | Tambah `terakhirDiperiksa` per entri (nilai awal 2026-11-14) |
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart` | Diubah | Field `terakhirDiperiksa`; validasi `baseLink` via `validasiLinkBase`; `toJson` kondisional |
| `base_coc/lib/fitur/galeri_base/model/base_layout.freezed.dart` | Diubah (dihasilkan `build_runner`) | Regenerasi; tidak diedit manual |
| `base_coc/lib/core/util/validasi_link_base.dart` | Diubah (kemungkinan) | Dipakai ulang dari `BaseLayout.fromJson`; mungkin ditambah varian pesan error dengan konteks `id` |
| `base_coc/lib/core/util/tautan_tinjauan.dart` | Dibuat | Helper murni perhitungan antrean tinjauan + alasan; unit test |
| `base_coc/lib/core/database/db_helper.dart` | Diubah | `versiDatabase` 2 → 3; `onCreate` + `onUpgrade` tabel `tautan_status` |
| `base_coc/lib/fitur/galeri_base/model/nama_tabel_tautan.dart` | Dibuat | Konstanta nama tabel/kolom snake_case |
| `base_coc/lib/core/database/tautan_status_dao.dart` | Dibuat | CRUD status laporan (`jumlah_laporan` +1, tandai ditinjau = hapus baris); mengikuti pola `favorit_dao.dart` |
| `base_coc/lib/fitur/galeri_base/provider/tautan_status_provider.dart` (atau `notifier/`) | Dibuat | Provider/Notifier Riverpod untuk antrean tinjauan (pola mengikuti `riverpod-pola`) |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | Badge "Tautan perlu ditinjau" + aksi "Laporkan tautan rusak" dekat `SelectableText(baseLink)` |
| `base_coc/lib/fitur/galeri_base/screen/administrasi_tautan_screen.dart` | Dibuat | Layar administrasi: daftar antrean, "Tandai sudah ditinjau", "Bagikan laporan", penanda "Sering dilaporkan" |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah | AppBar action "Administrasi Tautan" (ikon, mis. `Icons.fact_check`/`Icons.link`) |
| `base_coc/test/tautan_tinjauan_test.dart` | Dibuat | Unit test helper |
| `base_coc/test/tautan_status_dao_test.dart` | Dibuat | Test DAO (ffi memory + direktori sementara, pola `cadangan_service_test.dart`) |
| `base_coc/test/detail_base_test.dart` / `panduan_base_test.dart` | Diubah (kemungkinan) | `ProviderScope`/override bila provider baru diperlukan di widget test |
| `base_coc/test/base_layout_test.dart` (atau `katalog_test.dart`) | Diubah/Dibuat | Test validasi `baseLink` invalid dan `terakhirDiperiksa` |
| `base_coc/README.md` | Diubah | Section fitur + daftar test |
| `refrensi_apk.md` | Diubah | Penanda "PRD sudah dibuat" pada item B19 (sudah diterapkan sesi 155) |

Bukti tidak bertumpang tindih dengan PRD lain: `prd/` kosong (0 berkas) per 2026-11-16; item A37 belum memiliki PRD — alur lapornya dilebur ke B19 atas keputusan diskusi sesi 155, bukan berkas terpisah; tidak ada berkas `prd/*.md` lain yang menyentuh tautan/katalog.

Rujukan sumber item: `refrensi_apk.md` baris 673–680 (`#### B19`), baris 60 (Temuan 31), baris 1309 (prioritas gabungan No. 133), baris 1372 (F. Verifikasi dan Keterbatasan), sumber No. 61 dan 65 (baris 1465 dan 1469), baris 1163 dan 1167 (katalog batch 8). Catatan kejujuran klaim: kedua referensi menyatakan pembaruan/pemeriksaan berkala tautan, tetapi klaim tersebut tidak dapat diuji tanpa aplikasi — `refrensi_apk.md` baris 1372 menegaskan B19 hanya arahan optimasi, bukan bukti fitur berjalan.
