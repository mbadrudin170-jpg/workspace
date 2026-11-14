---
description: Menyinkronkan seluruh berkas yang dirujuk oleh pembaruan sesi ini (aturan, skill, command, dokumen) agar tidak ada rujukan stale.
---

# Sinkronkan Semua

## Tujuan

Menyelaraskan seluruh rujukan (path, nama berkas, isi, versi, tanggal) yang terdampak pembaruan pada sesi ini sehingga tidak ada rujukan yang usang.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku pada laporan.
3. Sumber kebenaran "pembaruan ini" adalah konteks sesi; bila konteks hilang, gunakan `git status` dan `git diff` — jangan menebak.

## Cakupan

- Aturan, skill, command, dan dokumen yang merujuk berkas yang berubah pada sesi ini.

## Parameter

- `$ARGUMENTS` (opsional): path berkas atau topik pembaruan yang menjadi fokus sinkronisasi.
- Jika cakupan/niat pembaruan tidak jelas: **STOP** dan tanyakan kepada pengguna dengan tool `question` sebelum mengubah berkas apa pun.

## Alur Kerja

1. **Analyze** — tentukan berkas yang berubah pada sesi ini (dari konteks, atau `git status`/`git diff`).
2. **Plan** — petakan rujukan yang berpotensi stale (path, nama, versi, tanggal, trigger, indeks).
3. **Execute** — perbarui hanya rujukan yang benar-benar terdampak; pertahankan isi lain.
4. **Review** — cari ulang rujukan lama untuk memastikan tidak ada yang tertinggal.

## Format Laporan

| Berkas diperiksa | Perubahan | Alasan |
| --- | --- | --- |
| `<path>` | `<ringkasan>` | `<rujukan stale yang diperbaiki>` |

## Larangan

- DILARANG mengubah kode Dart atau berkas hasil generate.
- DILARANG mengubah arsip `hasil_diskusi/` dan `docs/kilo/kilo_global.txt`.
- DILARANG menebak cakupan pembaruan bila konteks tidak jelas.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila seluruh rujukan stale yang terdampak sudah diperbarui dan laporan disampaikan.
- STOP bila cakupan pembaruan ambigu dan pengguna belum memberikan klarifikasi.
