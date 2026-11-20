---
description: Menjalankan gerbang verifikasi terpadu: format, analyze, guardrail file test, dan flutter test.
---

# Verifikasi Terpadu

## Tujuan

Menjalankan satu gerbang verifikasi sebelum perubahan dinyatakan selesai.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi isinya.
2. Gunakan bahasa Indonesia baku pada seluruh laporan.
3. Command ini hanya untuk proyek Flutter.

## Cakupan

- `dart format --output=none --set-exit-if-changed .`
- `flutter analyze`
- `dart run tool/check_test_files.dart`
- `flutter test`

## Alur Kerja

1. Pastikan proyek Flutter aktif.
2. Jalankan format check.
3. Jalankan analyze.
4. Jalankan guardrail file test.
5. Jalankan seluruh test.
6. Laporkan hasil akhir dan hentikan pada kegagalan pertama.

## Larangan

- DILARANG mengubah kode untuk "memperbaiki" temuan pada command ini.
- DILARANG mengarang hasil tanpa menjalankan perintah.

## Kriteria Selesai / STOP

- Selesai bila seluruh langkah berhasil.
- STOP bila salah satu langkah gagal.
