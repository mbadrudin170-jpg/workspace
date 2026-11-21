---
description: Menjalankan guardrail untuk memastikan setiap berkas *_test.dart memiliki void main().
---

# Cek File Test Tanpa main

## Tujuan

Memastikan tidak ada berkas test placeholder yang lolos sebagai `_test.dart` tanpa definisi `void main()`.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi isinya.
2. Gunakan bahasa Indonesia baku pada seluruh laporan.
3. Command ini hanya untuk proyek Flutter yang memiliki folder `test/`.

## Cakupan

- Scan `test/**/*_test.dart`
- Pastikan ada `void main(`

## Alur Kerja

1. Pastikan proyek Flutter aktif dan folder `test/` tersedia.
2. Jalankan `dart run tool/check_test_files.dart`.
3. Laporkan jumlah berkas yang diperiksa dan hasilnya.
4. Jika ada berkas tanpa `void main(`, STOP dan laporkan daftarnya.

## Larangan

- DILARANG mengubah kode `.dart`.
- DILARANG mengarang hasil tanpa menjalankan guardrail.

## Kriteria Selesai / STOP

- Selesai bila semua berkas test memiliki `void main(`.
- STOP bila proyek bukan Flutter, folder `test/` tidak ada, atau guardrail gagal dijalankan.
