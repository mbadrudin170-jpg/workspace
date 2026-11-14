---
description: Menjalankan `flutter analyze` pada folder `lib` dan `test` proyek Flutter, lalu melaporkan jumlah temuan per linter rule tanpa mengubah kode.
agent: code
---

# Cek Linter

## Tujuan

Mengecek hasil linter pada folder `lib` dan `test` lalu melaporkan jumlah temuan per linter rule. Command ini bersifat read-only terhadap kode.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku pada seluruh laporan.
3. Command ini hanya untuk folder `lib` dan `test` proyek Flutter.

## Cakupan

- `flutter analyze lib`
- `flutter analyze test`

## Parameter

- `$ARGUMENTS` (opsional): folder atau berkas tertentu yang ingin dianalisis.
- Jika `$ARGUMENTS` kosong: periksa `lib` dan `test` sesuai cakupan default.

## Alur Kerja

1. **Analyze** — pastikan proyek Flutter aktif dan folder target tersedia.
2. **Plan** — tentukan target analisis (`lib`, `test`, atau path dari argumen).
3. **Execute** — jalankan `flutter analyze` pada setiap target dan kumpulkan keluarannya.
4. **Review** — hitung jumlah temuan per linter rule dan pastikan tidak ada kode yang berubah.
5. Bila perintah analyze gagal dijalankan: **STOP** dan laporkan galatnya.

## Format Laporan

| Target | Linter rule | Jumlah temuan |
| --- | --- | --- |
| `lib` | `<rule>` | `<jumlah>` |
| `test` | `<rule>` | `<jumlah>` |

Sertakan total temuan dan konfirmasi bahwa kode `.dart` tidak diubah.

## Larangan

- DILARANG mengubah kode `.dart`, konfigurasi linter, atau berkas lain.
- DILARANG merombak kode secara besar-besaran atau memperbaiki temuan pada command ini.
- DILARANG mengarang jumlah temuan tanpa menjalankan analyze.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila hasil analyze kedua target dilaporkan beserta jumlah per rule.
- STOP bila proyek bukan Flutter, folder target tidak ada, atau analyze gagal dijalankan.
