diperbarui : Mon Nov 16 2026 07:45 WIB

file : [aturan-pembuatan-commands](../../.agents/skills/custom/aturan-pembuatan-commands/SKILL.md)

1. Setiap `command` wajib menyertakan `description` yang ringkas, jelas, dan tidak menyesatkan AI.
2. Setiap `command` wajib memerintahkan AI untuk membaca terlebih dahulu `instructions` yang terdaftar di `.kilo/kilo.jsonc`, dan mematuhi aturan yang ada di dalamnya.
3. Wajib menggunakan bahasa Indonesia.
4. Untuk nama berkas, wajib menggunakan bahasa Indonesia, kecuali istilah bahasa Inggris yang sudah umum (mis. `command`, `description`).
5. Setiap `command` wajib menyertakan skill terkait yang dibutuhkan AI jika skill tersebut tersedia (cek `.agents/rules/global/SKILLS_INDEX.md` atau available skill).
6. Disimpan di `.kilo/commands/` (atau subfolder satu tingkat, mis. `mode/`, `prd/`).

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/workflows