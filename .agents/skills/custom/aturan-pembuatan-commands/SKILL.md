---
name: aturan-pembuatan-commands
description: "Trigger: saat membuat atau memperbarui command Kilo | Panduan pembuatan dan pembaruan command Kilo."
---

1. Setiap `command` wajib menyertakan `description` yang ringkas, jelas, dan tidak menyesatkan AI.
2. Setiap `command` wajib memerintahkan AI untuk membaca terlebih dahulu `instructions` yang terdaftar di `.kilo/kilo.jsonc`, dan mematuhi aturan yang ada di dalamnya.
3. Setiap `command` harus singkat, namun jangan sampai membuat AI salah langkah.
4. Wajib menggunakan bahasa Indonesia.
5. Untuk nama berkas, wajib menggunakan bahasa Indonesia, kecuali istilah bahasa Inggris yang sudah umum (mis. `command`, `description`).
6. Setiap `command` wajib menyertakan skill terkait yang dibutuhkan AI jika skill tersebut tersedia (cek `.agents/rules/global/SKILLS_INDEX.md` atau available skill).
7. Disimpan di `.kilo/commands/` (atau subfolder satu tingkat, mis. `mode/`, `prd/`).
