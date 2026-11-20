# Sesi 152

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-20
- Command: interaksi langsung (tanpa command)
- Topik: Migrasi nama kolom database ke snake_case (SQLite + Supabase)

## Checklist Awal Sesi

- [x] Baca `MEMORI.md` (tool Read, tanpa offset/limit)
- [x] Baca seluruh berkas `.agents/rules/` (6 berkas)
- [x] Muat skill `memori-check`
- [x] Buat berkas sesi `memori/sesi/sesi_152.md`

## Catch-up Sync Awal Sesi

- Tidak ada berkas `Belum Sinkron` baru (sesi 151 sudah `Sudah Sinkron`). Berkas ambigu/paralel tetap tidak disentuh.

## Catatan Sesi

- Nilai konstanta kolom Skema yang camelCase dikonversi ke snake_case (`isDeleted`→`is_deleted`, `namaDompet`→`nama_dompet`, `isPublic`→`is_public`, `jumlahPoin`→`jumlah_poin`, `userId`→`user_id`).
- Raw SQL/map literal di operasi dan onCreate diperbarui.
- Versi database dinaikkan ke 44; onUpgrade menambahkan rename kolom camelCase→snake_case.
- Berkas SQL Supabase (`tabel_supabase.sql`, `rules_supabase.sql`) disesuaikan snake_case.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| `memori/sesi/sesi_152.md` | Dibuat | Berkas sesi aktif |
| Berbagai `lib/fitur/*/model/*_model.dart` | Diubah | Nilai konstanta Skema snake_case |
| `lib/db/sqlite/oncreate_sqflite.dart` | Diubah | Kolom snake_case + index |
| `lib/db/sqlite/onupgrade_sqflite.dart` | Diubah | Rename kolom migrasi |
| `lib/db/sqlite/sqflite.dart` | Diubah | Versi DB 44 |
| `lib/data/operasi/*.dart` | Diubah | Raw SQL/map snake_case |
| `lib/sql/tabel/tabel_supabase.sql` | Diubah | Kolom snake_case |
| `test/...` | Diubah | Referensi kolom snake_case |

## Sinkronisasi ke MEMORI.md

- Migrasi snake_case bersifat implementasi, bukan fakta durable → tidak dipromosikan ke `MEMORI.md`.
- `MEMORI.md` tidak diperbarui. Status Sinkron: Sudah Sinkron.