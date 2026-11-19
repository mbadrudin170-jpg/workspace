# Sesi 84

Status: Sudah Sinkron

## Status Sinkron

Status Sinkron: Sudah Sinkron
Tanggal: 2026-11-19
Command: interaksi langsung (tanpa command)
Topik: Mengubah pengguna_aktif_notifier untuk menggunakan OperasiSqlite.

## Catatan Sesi

- Pengguna meminta notifier `pengguna_aktif_notifier.dart` agar menggunakan `operasi_sqlite.dart`.
- Perubahan:
  - import `db/operasi_sqlite.dart`.
  - `_ambilSemua()` kini membaca via `operasiSqliteProvider` (`ambil` tabel `pelanggan_aktif` dengan `isDeleted = 0`) lalu mapping `PelangganAktifModel.fromSqlite`.
  - `tambahBatch()` kini memakai `operasiSqliteProvider.tambahBatch`.
- Metode lain (tambah/ubah/hapus/arsip) tetap menggunakan `PelangganAktifOperasi` karena logika domain (notifikasi, UTC, arsip).
- Verifikasi: `dart analyze` No issues found; `dart format` 0 changed.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart | Diubah | _ambilSemua dan tambahBatch memakai OperasiSqlite. |
| memori/sesi/sesi_84.md | Dibuat | Berkas sesi baru. |

## Sinkronisasi ke MEMORI.md

Tidak ada perubahan MEMORI.md yang diperlukan.