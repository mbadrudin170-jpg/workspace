---
description: Memeriksa dan menyalin poin-poin dari berkas di folder prompt/ ke target masing-masing (skill, aturan, command) sesuai aturan pembuatan, dengan konfirmasi cakupan dan perbaikan typo/poin ambigu sebelum menimpa.
agent: code
---

# Salin Prompt ke Target

## Tujuan

Memeriksa dan menyalin poin-poin dari berkas di folder `prompt/` ke target masing-masing (skill, aturan, command) sesuai aturan pembuatan.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Gunakan bahasa Indonesia baku.
4. Gunakan tool bawaan Kilo (`read`, `edit`, `write`) untuk membaca dan menulis berkas.

## Alur Kerja

1. Cek apakah semua berkas di folder `prompt/` sudah ditimpa ke masing-masing targetnya.
2. Tanyakan dahulu apakah perlu memproses semua berkas atau hanya beberapa berkas.
3. Jika sebuah berkas tidak menyertakan target, STOP dan laporkan.
4. Jika berkas berada di `prompt/commands/`, gunakan skill `aturan-pembuatan-commands`.
5. Jika berkas berada di `prompt/rules/`, gunakan skill `aturan-pembuatan-rules`.
6. Jika berkas berada di `prompt/skill/`, gunakan skill `aturan-pembuatan-skill`.
7. Sebelum menimpa target, baca sumber terlebih dahulu dan perbaiki typo, poin ambigu, atau poin yang kurang jelas agar AI tidak salah langkah.
8. Jangan menghapus poin-poin penting saat menyelaraskan.
9. Kerjakan satu folder dulu (mis. `prompt/commands/`) hingga tuntas, lalu laporan bahwa folder tersebut selesai sebelum lanjut ke folder berikutnya.

## Larangan

- DILARANG menimpa target tanpa membaca sumber terlebih dahulu.
- DILARANG menghapus poin penting dari sumber atau target.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila seluruh berkas di folder `prompt/` (sesuai cakupan yang dipilih pengguna) telah diselaraskan ke target masing-masing.
- STOP bila sebuah berkas tidak menyertakan target; laporkan ke pengguna.