# Sesi 116 — Diskusi Fitur Baru (PRD)

## Status

- Status Sinkron: Sudah Sinkron
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
- Keputusan diskusi (semua opsi Recommended via `question`):
  - Format berkas: JSON tunggal (manifest berversi + baris seluruh tabel), tanpa dependensi baru selain file picker/path provider.
  - Mekanisme: ekspor via `share_plus` (sudah ada); impor via `file_picker` baru (v13.3.3, diverifikasi pub.dev 2026-11-15).
  - Entry point: AppBar Galeri (`IconButton` setelah favorit) → `CadanganScreen` baru (`lib/fitur/cadangan/screen/`).
  - Preferensi: segmen `preferensi` kosong di manifest (base_coc belum memakai SharedPreferences).
  - Penamaan: `base_coc_cadangan_<yyyyMMdd_HHmm>.json`.
  - Restore: hanya mode "Ganti seluruh data" (mode "Gabung" tetap item A47).
  - Cadangan pengaman otomatis sebelum restore: `<applicationDocumentsDirectory>/base_coc_safety_backup.json` via `path_provider` (2.1.6), 1 berkas ditimpa, dihapus setelah restore sukses.
- Dependensi yang akan ditambah (belum diimplementasikan): `file_picker: ^13.3.3`, `path_provider: ^2.1.6`.
- PRD disusun: `prd/prd_cadangan_pemulihan_lokal.md` (Status Dokumen `Draft`, Status Implementasi `Belum Diimplementasikan`); `refrensi_apk.md` item A46 ditandai "PRD sudah dibuat (…, sesi 116); belum diimplementasikan".
- Tahap berikutnya: Review — diskusi dengan pengguna hingga PRD dinyatakan Final.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_116.md` | Dibuat | Berkas sesi ini |
| `prd/prd_cadangan_pemulihan_lokal.md` | Dibuat | PRD item A46; Status Dokumen `Final`, Status Implementasi `Belum Diimplementasikan` |
| `refrensi_apk.md` | Diubah | Item A46 ditandai "PRD sudah dibuat (…, sesi 116); belum diimplementasikan" |
| `MEMORI.md` | Diubah | Header `Diperbarui` → sesi 116; entri Status Kerja sesi 116 ditambahkan |
| `memori/riwayat_perubahan.md` | Diubah | Entri sesi 116 ditambahkan |

## Sinkronisasi ke MEMORI.md

- `MEMORI.md`: header `Diperbarui` → sesi 116; entri Status Kerja sesi 116 ditambahkan (PRD A46 `Final`, `Belum Diimplementasikan`; keputusan diskusi JSON tunggal + share_plus/file_picker + path_provider safety backup + transaksi atomik; `prd/` kini 2 PRD).
- `memori/riwayat_perubahan.md`: entri sesi 116 ditambahkan.
- Catch-up: `sesi_81.md` (ambigu), `sesi_114.md` dan `sesi_115.md` (sesi paralel aktif) tetap `Belum Sinkron` — tidak disentuh, dilaporkan ke pengguna.
- Verifikasi `git status -- memori/sesi/` dijalankan; catatan: `sesi_114.md`/`sesi_115.md` adalah sesi paralel aktif yang sedang mengubah working tree.
