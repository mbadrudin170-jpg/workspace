# Sesi 249

Tanggal: 2026-11-22

## Status

Status Sinkron: Sudah Sinkron
Tanggal: 2026-11-22
Command: interaksi langsung (tanpa command)
Topik: Hapus fungsi ubah dari OperasiSqlite, migrasi ke perbarui

## Catatan Sesi

- Hapus metode `ubah` dari `OperasiSqlite`.
- Perbarui seluruh pemanggil `operasiSqlite.ubah(...)` menjadi `operasiSqlite.perbarui(...)` (termasuk varian dengan `where`/`whereArgs`).
- Perbarui signature `perbarui` agar mendukung `id` posisional serta `where`/`whereArgs`.
- Hapus field tidak terpakai (`_tabel` di PesananNotifier).
- Perbaiki regresi `pelangganDiarsipkan` yang hilang.
- Verifikasi: `flutter analyze lib/` No issues.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| `admin_wifi/lib/db/sqlite/operasi_sqlite.dart` | Diubah | Hapus ubah, perluas perbarui |
| `admin_wifi/lib/fitur/pesanan/notifier/pesanan_notifier.dart` | Diubah | Hapus _tabel, ubah→perbarui |
| `admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart` | Diubah | ubah→perbarui |
| `admin_wifi/lib/fitur/paket/notifier/paket_notifier.dart` | Diubah | ubah→perbarui |
| `admin_wifi/lib/fitur/versi_apk_user/notifier/versi_apk_user_notifier.dart` | Diubah | ubah→perbarui |
| `admin_wifi/lib/fitur/kategori/notifier/kategori_notifier.dart` | Diubah | ubah→perbarui |
| `admin_wifi/lib/fitur/kategori/notifier/sub_kategori_notifier.dart` | Diubah | ubah→perbarui |
| `admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart` | Diubah | ubah→perbarui |

## Sinkronisasi ke MEMORI.md

Tidak ada fakta durable baru. (sesi 249)
