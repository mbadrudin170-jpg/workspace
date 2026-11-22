# Sesi 252

Tanggal: 2026-11-22

## Status

Status Sinkron: Sudah Sinkron
Tanggal: 2026-11-22
Command: interaksi langsung (tanpa command)
Topik: Standardisasi field _tabel di semua notifier

## Catatan Sesi

- Tambahkan `final _tabel = XxxSkema.tabel;` ke notifier (pesanan, kritik_saran, versi_apk_user, kategori, sub_kategori, pelanggan, pengguna_aktif, paket).
- Ganti referensi tabel literal/Skema.tabel dengan `_tabel` sesuai pola dompet.
- Perbaiki akses `_tabel` di metode static (kritik_saran) menggunakan `KritikSaranSkema.tabel`.
- Verifikasi: `flutter analyze lib/` No issues.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| berbagai notifier | Diubah | Standardisasi _tabel |

## Sinkronisasi ke MEMORI.md

Tidak ada fakta durable baru. (sesi 252)
