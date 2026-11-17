---
description: Memeriksa dan menyalin poin-poin dari berkas di folder `prompt/` ke target masing-masing (skill, aturan, command) sesuai aturan pembuatan, dengan konfirmasi cakupan dan perbaikan typo/poin ambigu sebelum menimpa.
agent: code
---

1. Cek apakah semua berkas di folder `prompt/` sudah ditimpa ke masing-masing targetnya.
2. Tanyakan dahulu apakah perlu memproses semua berkas atau hanya beberapa berkas.
3. Jika sebuah berkas tidak menyertakan target, STOP dan laporkan.
4. Jika berkas berada di `prompt/commands/`, gunakan skill `aturan-pembuatan-commands`.
5. Jika berkas berada di `prompt/rules/`, gunakan skill `aturan-pembuatan-rules`.
6. Jika berkas berada di `prompt/skill/`, gunakan skill `aturan-pembuatan-skill`.
7. Sebelum menimpa target, baca sumber terlebih dahulu dan perbaiki typo, poin ambigu, atau poin yang kurang jelas agar AI tidak salah langkah.
8. Jangan menghapus poin-poin penting saat menyelaraskan.
9. Kerjakan satu folder dulu (mis. `prompt/commands/`) hingga tuntas, lalu laporan bahwa folder tersebut selesai sebelum lanjut ke folder berikutnya.
