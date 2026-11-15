# Sesi 116 — Diskusi Fitur Baru (PRD)

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: Sun Nov 15 2026 18:33 WIB (sesi 116)
- Topik: Menjalankan command `diskusi_fitur_baru` (parameter kosong) — membuat PRD untuk satu item fitur yang belum memiliki PRD dari `refrensi_apk.md`, melalui diskusi hingga PRD dinyatakan Final.

## Catatan Sesi

- `MEMORI.md` telah dibaca (header: sesi 114). Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron` pada `memori/sesi/` menemukan:
  - `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu; sudah dilaporkan berkali-kali sejak sesi 87) — **tidak disentuh**, dilaporkan lagi ke pengguna.
  - `sesi_114.md` (Mode Diskusi, dibuat 2026-11-15 18:25 WIB) dan `sesi_115.md` (Kerjakan Task, dibuat 18:31 WIB) — sesi paralel yang tampak aktif; **tidak disentuh**, dilaporkan ke pengguna.
  - Tidak ada berkas `Belum Sinkron` lain.
- Pemindaian item fitur di `refrensi_apk.md`: item `A1`–`A8` dan `A16` sudah memiliki/menempuh PRD (A1–A7 diimplementasikan dan section-nya dihapus; A8 `prd/prd_panduan_singkat_base.md` masih ada di `prd/`). Item `A9`–`A50` (dan `A16` sudah dikerjakan) belum memiliki PRD.
- Parameter command kosong → pengguna memilih item **A46. Cadangan dan pemulihan lokal satu berkas** (prioritas Tinggi) via tool `question`.
- Analisis A46:
  - Item `A46` di `refrensi_apk.md` baris 399–405; referensi `[Clash Command (GitHub)](https://github.com/AmruthLP12/clash-command)` — tautan diverifikasi 2026-11-15 (halaman repo terbaca: "Complete Application Backup & Restore: Portable `.clashcommandbackup` archive containing versioned manifest, SQLite database, and user preferences. Pre-restore validation, automatic safety backup creation before destructive restore, atomic transactions").
  - **Belum diimplementasikan** di `base_coc`: tidak ada berkas/fitur `backup`/`cadang`/`restore`/`pulih` (grep `.dart` kosong); tidak ada dependensi `file_picker`/`archive`/`path_provider`/`shared_preferences` di `pubspec.yaml`; fitur impor Data Export yang ada (`ImporDataExportScreen`) memakai tempel teks, bukan berkas.
  - Data yang perlu dicadangkan: SQLite `base_coc.db` (tabel `akun_desa`, `progres`, `favorit_base`; versi DB 2, lihat `db_helper.dart`). Katalog `assets/data/base_katalog.json` adalah aset bundel (tidak perlu dicadangkan). Belum ada SharedPreferences di proyek.
  - PRD aktif satu-satunya (`prd_panduan_singkat_base.md`, item A8) menyentuh `detail_base_screen.dart`, `base_katalog.json`, `panduan_base*.dart` — **tidak tumpang tindih** dengan file cadangan yang dirancang.
- Keputusan desain yang perlu diklarifikasi ke pengguna sebelum menyusun PRD: format berkas cadangan, mekanisme ekspor/impor berkas, cakupan preferensi, dan entry point layar.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_116.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan
