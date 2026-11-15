# Sesi 156 — Kerjakan PRD B19 (Pemeriksaan tautan kedaluwarsa)

## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: Mon Nov 16 2026 (WIB)
- Command: kerjakan_prd (parameter `prd/prd_pemeriksaan_tautan_kedaluwarsa.md`)
- Topik: Mengimplementasikan PRD `prd/prd_pemeriksaan_tautan_kedaluwarsa.md` (item B19) secara utuh: verifikasi, implementasi, status `Sudah Diimplementasikan`, penghapusan PRD dan section `refrensi_apk.md` terkait.

## Catatan Sesi
- `MEMORI.md` dibaca (header `Diperbarui: Mon Nov 16 2026 02:21 WIB (sesi 155)`). Poin relevan: `base_coc` adalah submodule Flutter; PRD B19 dibuat dan difinalkan pada sesi 155 (Dokumen `Final`, Implementasi `Belum Diimplementasikan`); `prd/` hanya memuat 1 PRD; perubahan di submodule diverifikasi dengan `dart format`, `dart analyze`, `flutter test`; berkas generate tidak diedit manual (jalankan `build_runner`); `refrensi_apk.md` item B19 sudah ditandai "PRD Final (sesi 155); belum diimplementasikan".
- Catch-up sync awal sesi: `^- Status Sinkron: Belum Sinkron$` menemukan enam berkas: `sesi_81.md` (tabrakan penomoran; ambigu), `sesi_122.md` (tindak lanjut `diskusi_11`; hanya berkas sesi), `sesi_123.md` (Mode Diskusi; hanya berkas sesi), `sesi_139.md` (pipeline L1–L7; hanya berkas sesi), `sesi_147.md` (Mode Diskusi; hanya berkas sesi), `sesi_150.md` (interaksi langsung; pemindahan command diskusi). Seluruhnya **tidak disentuh** — keputusan pengguna sebelumnya (sesi 131–132): "Biarkan apa adanya"; dilaporkan. Tidak ada beririsan dengan berkas terdampak PRD (seluruhnya `base_coc/` + `refrensi_apk.md` B19).
- Anti-bentrok antar-PRD: `prd/` hanya memuat `prd_pemeriksaan_tautan_kedaluwarsa.md`; tidak ada PRD berstatus `Sedang Diimplementasikan`/`Sudah Diimplementasikan`; tidak ada bentrok.
- Parameter awal command kosong → pengguna ditanya via tool `question`; pengguna memilih `prd_pemeriksaan_tautan_kedaluwarsa.md (Recommended)`.
- PRD dibaca penuh (152 baris). Status Dokumen `Final`, Status Implementasi `Belum Diimplementasikan`.
- Eksekusi: status PRD diubah `Sedang Diimplementasikan`; implementasi di `base_coc` (field `terakhirDiperiksa` pada `BaseLayout` dengan validasi ketat ISO 8601 + validasi `baseLink` via `validasiLinkBase`; `toJson` kondisional; build_runner dijalankan), katalog 12 entri + `terakhirDiperiksa: 2026-11-14`, migrasi SQLite 2→3 (`tautan_status` di `onCreate` + `onUpgrade`; `versiDatabase = 3`), konstanta `nama_tabel_tautan.dart`, `TautanStatusDao` (transaksi), helper murni `tautan_tinjauan.dart`, `TautanStatusNotifier` + `antreanTautanProvider` (Riverpod), badge "Tautan perlu ditinjau" + aksi "Laporkan tautan rusak" di `DetailBaseScreen`, layar `AdministrasiTautanScreen` + entri AppBar galeri, refresh via `ref.refresh` di layar administrasi.
- Verifikasi `base_coc`: `dart format` (0 changed), `dart analyze` (bersih), `flutter test` **122/122 lulus**. Perbaikan selama sesi: (1) widget test gagal karena operasi database FFI tidak tersinkron dengan `pumpAndSettle` → test widget diubah memakai fake `TautanStatusDao` deterministik; test FFI tetap berada di `tautan_status_dao_test.dart`; (2) override `antreanTautanProvider.overrideWith((ref) async => const <TautanTinjauan>[])` ditambahkan pada `detail_base_test.dart`, `panduan_base_test.dart`, `base_serupa_test.dart` agar test widget lama tidak bergantung pada inisialisasi FFI; (3) lint `unused_import` (foundation di administrasi_tautan_screen) diperbaiki; (4) tipe `Override` ditegakkan dengan `package:riverpod/misc.dart`.
- **Fakta penting (di luar kendali sesi ini):** implementasi B19 (kode produksi + test awal) **ter-commit oleh pihak luar** (bukan sesi ini) pada 2026-11-15: `db65ac2` (`feat(tautan): tambahkan fitur lapor dan tinjau tautan base rusak`, 19:45:47Z), `e0c88eb` (`a`; korektif format + `beranda_galeri_screen.dart` + test), `ce5b50b` (`a`; korektif `test/tautan_widget_test.dart`) — commit tersebut tidak diperintahkan sesi ini dan tidak diubah/di-reset. Root `HEAD` tercatat `cb375ef` (memuat `memori/sesi/sesi_156.md` versi awal — sesi paralel). Working tree menyisakan modifikasi sesi ini (belum ter-commit): `base_coc/README.md` (section "Pemeriksaan Tautan Base"), `test/base_serupa_test.dart`, `test/detail_base_test.dart`, `test/panduan_base_test.dart`, `test/tautan_widget_test.dart`.
- PRD diverifikasi terimplementasi penuh, lalu status diubah `Sedang Diimplementasikan` → `Sudah Diimplementasikan`; berkas PRD dihapus (`prd/` kini kosong); section `#### B19` (ditandai nama berkas PRD) dihapus dari `refrensi_apk.md`.
- Insiden sinkronisasi: edit berkas `MEMORI.md` pada baris entri sesi 157 sempat menghapus awalan entri sesi 157; diperbaiki segera pada sesi yang sama (entri sesi 157 dipulihkan utuh). Header `MEMORI.md` diperbarui ke `(sesi 156)` — menimpa header sesi 157 paralel (dicatat di `memori/riwayat_perubahan.md` sebagai penggantian eksplisit; konten sesi 157 dipertahankan).
- Task 10 (`detail_base_screen.dart` `.asData?.value` pada `baseSerupaProvider` — `penanganan-async-data-kosong` Aturan 7) dan Task 11 (`tautan_status_dao.dart` `TautanStatus` tanpa `toSqflite()` — `model-state-freezed-abstract` Aturan 7) di `task.md` Kelompok 5–6 **tidak dikerjakan** (di luar cakupan command `kerjakan_prd`; menunggu perintah pengguna).
- Catch-up: `sesi_81`/`sesi_122`/`sesi_123`/`sesi_139`/`sesi_147`/`sesi_150` tetap `Belum Sinkron` (keputusan pengguna sesi 131–132) — tidak disentuh; `sesi_157`/`sesi_158` sesi paralel — tidak disentuh.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_156.md` | Dibuat | Berkas sesi ini |
| `base_coc/assets/data/base_katalog.json` | Diubah | `terakhirDiperiksa: 2026-11-14` per 12 entri |
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart` | Diubah | Field `terakhirDiperiksa`; validasi `baseLink` via `validasiLinkBase`; `terakhirDiperiksa` ketat ISO 8601; `toJson` kondisional |
| `base_coc/lib/fitur/galeri_base/model/base_layout.freezed.dart` | Diubah | Regenerasi `build_runner` (bukan edit manual) |
| `base_coc/lib/fitur/galeri_base/model/nama_tabel_tautan.dart` | Dibuat | Konstanta nama tabel/kolom snake_case |
| `base_coc/lib/core/database/db_helper.dart` | Diubah | `versiDatabase` 2→3; `onCreate` + `onUpgrade` tabel `tautan_status` |
| `base_coc/lib/core/database/tautan_status_dao.dart` | Dibuat | CRUD `tautan_status` (transaksi `lapor`, `tandaiDitinjau`, `ambilSemua`) |
| `base_coc/lib/core/util/tautan_tinjauan.dart` | Dibuat | Helper murni antrean tinjauan (`ambangTinjauanHari = 180`) |
| `base_coc/lib/fitur/galeri_base/provider/tautan_status_provider.dart` | Dibuat | `TautanStatusNotifier` (`keepAlive`, pola CRUD) + `antreanTautanProvider` |
| `base_coc/lib/fitur/galeri_base/provider/tautan_status_provider.g.dart` | Dibuat | Codegen riverpod (bukan edit manual) |
| `base_coc/lib/fitur/galeri_base/screen/administrasi_tautan_screen.dart` | Dibuat | Layar administrasi tautan (empty/error/data, aksi tandai ditinjau, bagikan laporan) |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | Badge "Tautan perlu ditinjau" + aksi "Laporkan tautan rusak" |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah | AppBar action "Administrasi Tautan" (`Icons.fact_check`) |
| `base_coc/README.md` | Diubah | Section "Pemeriksaan Tautan Base" + daftar test (belum ter-commit) |
| `base_coc/test/base_layout_test.dart` | Dibuat | Test validasi `baseLink`/`terakhirDiperiksa` + katalog aset |
| `base_coc/test/tautan_tinjauan_test.dart` | Dibuat | Test helper (oranye: usia, belum diperiksa, dilaporkan, urutan) |
| `base_coc/test/tautan_status_dao_test.dart` | Dibuat | Test DAO + migrasi v2→v3 (FFI memori) |
| `base_coc/test/tautan_widget_test.dart` | Dibuat | Test widget badge/administrasi (fake DAO; delta sesi ini belum ter-commit) |
| `base_coc/test/detail_base_test.dart` | Diubah | Override `antreanTautanProvider` (belum ter-commit) |
| `base_coc/test/panduan_base_test.dart` | Diubah | Override `antreanTautanProvider` (belum ter-commit) |
| `base_coc/test/base_serupa_test.dart` | Diubah | Override `antreanTautanProvider` (belum ter-commit) |
| `prd/prd_pemeriksaan_tautan_kedaluwarsa.md` | Dihapus | Status → `Sudah Diimplementasikan`, lalu dihapus (perintah command `kerjakan_prd`) |
| `refrensi_apk.md` | Diubah | Section `#### B19` yang ditandai nama berkas PRD dihapus |
| `MEMORI.md` | Diubah | Entri sesi 156 ditambahkan; header → `(sesi 156)`; insiden pemulihan entri sesi 157 dicatat |
| `memori/riwayat_perubahan.md` | Diubah | Entri `Mon Nov 16 2026 03:02 WIB (sesi 156)` |

Catatan: implementasi B19 (kode produksi + test awal) ter-commit oleh pihak luar: `db65ac2` (19:45:47Z), `e0c88eb` (19:47:38Z), `ce5b50b` (19:55:03Z). Perubahan pada baris tabel yang ditandai "belum ter-commit" tetap berada di working tree `base_coc` dan belum di-commit oleh sesi ini.

## Sinkronisasi ke MEMORI.md
- `MEMORI.md` diperbarui: entri `sesi 156` ditambahkan pada bagian `## Status Kerja (per 2026-11-16)` (di atas entri sesi 157); header `Diperbarui` → `Mon Nov 16 2026 03:02 WIB (sesi 156; menimpa header sesi 157 paralel — konten sesi 157 dipertahankan)`.
- Insiden: awalan entri sesi 157 sempat terhapus saat edit dan **dipulihkan utuh** pada sesi yang sama (terverifikasi: entri sesi 157 utuh pada `MEMORI.md`).
- `memori/riwayat_perubahan.md` mendapat entri `Mon Nov 16 2026 03:02 WIB (sesi 156)` (catatan implementasi, commit pihak luar, penghapusan PRD/section, insiden MEMORI).
- `refrensi_apk.md`: section `#### B19` dihapus (ditandai nama berkas PRD).
- Tidak ada promosi entri baru ke `MEMORI.md` selain entri sesi 156 (fakta implementasi = episodic, bukan pola berulang); provenance `sesi 156` dicantumkan.
