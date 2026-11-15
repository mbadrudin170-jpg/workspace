# Sesi 156 — Kerjakan PRD B19 (Pemeriksaan tautan kedaluwarsa)

## Status
- Status Sinkron: Belum Sinkron
- Tanggal: Mon Nov 16 2026 (WIB)
- Command: kerjakan_prd (parameter `prd/prd_pemeriksaan_tautan_kedaluwarsa.md`)
- Topik: Mengimplementasikan PRD `prd/prd_pemeriksaan_tautan_kedaluwarsa.md` (item B19) secara utuh: verifikasi, implementasi, status `Sudah Diimplementasikan`, penghapusan PRD dan section `refrensi_apk.md` terkait.

## Catatan Sesi
- `MEMORI.md` dibaca (header `Diperbarui: Mon Nov 16 2026 02:21 WIB (sesi 155)`). Poin relevan: `base_coc` adalah submodule Flutter; PRD B19 dibuat dan difinalkan pada sesi 155 (Dokumen `Final`, Implementasi `Belum Diimplementasikan`); `prd/` hanya memuat 1 PRD; perubahan di submodule diverifikasi dengan `dart format`, `dart analyze`, `flutter test`; berkas generate tidak diedit manual (jalankan `build_runner`); `refrensi_apk.md` item B19 sudah ditandai "PRD Final (sesi 155); belum diimplementasikan".
- Catch-up sync awal sesi: `^- Status Sinkron: Belum Sinkron$` menemukan enam berkas: `sesi_81.md` (tabrakan penomoran; ambigu), `sesi_122.md` (tindak lanjut `diskusi_11`; hanya berkas sesi), `sesi_123.md` (Mode Diskusi; hanya berkas sesi), `sesi_139.md` (pipeline L1–L7; hanya berkas sesi), `sesi_147.md` (Mode Diskusi; hanya berkas sesi), `sesi_150.md` (interaksi langsung; pemindahan command diskusi). Seluruhnya **tidak disentuh** — keputusan pengguna sebelumnya (sesi 131–132): "Biarkan apa adanya"; dilaporkan. Tidak ada beririsan dengan berkas terdampak PRD (seluruhnya `base_coc/` + `refrensi_apk.md` B19).
- Anti-bentrok antar-PRD: `prd/` hanya memuat `prd_pemeriksaan_tautan_kedaluwarsa.md`; tidak ada PRD berstatus `Sedang Diimplementasikan`/`Sudah Diimplementasikan`; tidak ada bentrok.
- Parameter awal command kosong → pengguna ditanya via tool `question`; pengguna memilih `prd_pemeriksaan_tautan_kedaluwarsa.md (Recommended)`.
- PRD dibaca penuh (152 baris). Status Dokumen `Final`, Status Implementasi `Belum Diimplementasikan`. File-File Terdampak disalin di bawah (tabel `## Berkas Terdampak`).
- Rencana eksekusi (sesuai Steps PRD): (1) verifikasi basis `base_coc` (`dart analyze`, `flutter test`); (2) field `terakhirDiperiksa` di `BaseLayout` + build_runner; (3) validasi `baseLink` via `validasiLinkBase` di `fromJson`; (4) `base_katalog.json` + `terakhirDiperiksa: 2026-11-14` per entri; (5) helper `tautan_tinjauan.dart`; (6) migrasi DB 2 → 3 + `nama_tabel_tautan.dart` + `TautanStatusDao`; (7) aksi "Laporkan tautan rusak" di `DetailBaseScreen`; (8) badge "Tautan perlu ditinjau"; (9) `AdministrasiTautanScreen` + entri AppBar galeri; (10) refresh provider; (11) verifikasi + test; (12) `README.md` `base_coc` + status PRD.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_156.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md
Belum disinkronkan
