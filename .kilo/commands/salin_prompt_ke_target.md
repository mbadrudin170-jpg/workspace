description: Menyalin poin-poin dari berkas di folder prompt/ ke target masing-masing (skill, aturan, command).

# Salin Prompt ke Target

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Cek apakah semua berkas di folder `prompt/` sudah ditimpa ke masing-masing targetnya.
4. Tanyakan dahulu apakah perlu memproses semua berkas atau hanya beberapa berkas.
5. Jika sebuah berkas tidak menyertakan target, STOP dan laporkan.
6. Jika berkas berada di `prompt/commands/`, gunakan skill `aturan-pembuatan-commands`.
7. Jika berkas berada di `prompt/rules/`, gunakan skill `aturan-pembuatan-rules`.
8. Jika berkas berada di `prompt/skill/`, gunakan skill `aturan-pembuatan-skill`.
9. Sebelum menimpa target, baca sumber terlebih dahulu dan perbaiki typo, poin ambigu, atau poin yang kurang jelas agar AI tidak salah langkah.
10. Jangan menghapus poin-poin penting saat menyelaraskan.
11. Kerjakan satu folder dulu (mis. `prompt/commands/`) hingga tuntas, lalu laporan bahwa folder tersebut selesai sebelum lanjut ke folder berikutnya.
12. Tanyakan cakupan: salin file yang sedang terbuka di tab, file tertentu, atau semua file di folder `prompt/`. Jika file tab aktif bukan dari folder `prompt/`, jangan tanyakan.

# Skill Terkait
- aturan-pembuatan-commands
- aturan-pembuatan-rules
- aturan-pembuatan-skill
- memori-check