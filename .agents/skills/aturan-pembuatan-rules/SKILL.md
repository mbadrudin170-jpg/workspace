---
name: aturan-pembuatan-rules
description: Gunakan ini saat membuat atau memperbarui aturan (rules) Kilo | Panduan pembuatan aturan global/portabel: aturan wajib bersifat global, izin deny dan pembatasan platform ditulis generik, berkas rules tidak didaftarkan di instructions, AGENTS.md wajib memuat perintah membaca seluruh berkas .agents/rules/, berkas aturan khusus kode hanya boleh diubah berdasarkan commit dan kode yang eksplisit ditambahkan pengguna, dan setiap aturan pada berkas khusus kode wajib menyertakan skill terkaitnya. Aturan Pembuatan Rules Panduan pembuatan aturan (rules) Kilo yang bersifat global dan portabel lintas repo. Cakupan yang Di-Cover - Pembuatan dan pembaruan berkas rules (`.md`) untuk Kilo. - Jalur baca rules: berkas `AGENTS.md` (terdaftar di `instructions`); berkas rules **tidak** didaftarkan satu per satu di `instructions`. - Portabilitas: aturan tidak boleh terikat pada repo/proyek tertentu. Aturan 1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat dig
---

# Aturan Pembuatan Rules

Panduan pembuatan aturan (rules) Kilo yang bersifat global dan portabel lintas repo.

## Cakupan yang Di-Cover

- Pembuatan dan pembaruan berkas rules (`.md`) untuk Kilo.
- Jalur baca rules: berkas `AGENTS.md` (terdaftar di `instructions`); berkas rules **tidak** didaftarkan satu per satu di `instructions`.
- Portabilitas: aturan tidak boleh terikat pada repo/proyek tertentu.

## Aturan

1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat digunakan di semua repo.
2. Izin `deny` dan pembatasan platform harus ditulis secara generik (tanpa menyebut path repo tertentu) agar portabel.
3. Yang terdaftar pada `instructions` hanya berkas `AGENTS.md`; berkas rules (`.agents/rules/`) **tidak** didaftarkan satu per satu di `instructions`.
4. Berkas `AGENTS.md` wajib menyertakan perintah membaca seluruh berkas di folder `.agents/rules/` dan mematuhi seluruh aturan yang ada di sana (sebelum pemuatan apa pun via `instructions`).
5. Setiap rules hanya memuat informasi/panduan ringkas; detail teknis wajib ditambahkan ke skill yang sudah ada, atau dibuatkan skill baru bila belum ada yang relevan.
6. Berkas aturan khusus kode (contoh: `.agents/rules/code.md`) hanya boleh diubah berdasarkan commit dan kode yang secara eksplisit ditambahkan pengguna.
7. Setiap aturan pada berkas aturan khusus kode wajib menyertakan skill terkaitnya; dilarang menambahkan aturan baru tanpa skill terkait.

## Larangan

- DILARANG menulis aturan yang terikat pada path/nama repo tertentu (kecuali sebagai contoh/rujukan).
- DILARANG menulis izin `deny` dengan path absolut repo tertentu.
- DILARANG mendaftarkan berkas rules satu per satu di `instructions`; jalur baca rules adalah `AGENTS.md`.
- DILARANG membuat/memperbarui `AGENTS.md` tanpa perintah wajib membaca seluruh berkas di `.agents/rules/` dan mematuhi isinya.
- DILARANG mengubah berkas aturan khusus kode (contoh: `.agents/rules/code.md`) tanpa dasar commit dan kode yang secara eksplisit ditambahkan pengguna.
- DILARANG menambahkan aturan pada berkas aturan khusus kode tanpa menyertakan skill terkaitnya.

## Contoh Benar

```markdown
# Aturan Global

- Gunakan tool bawaan Kilo (`read`, `grep`, `glob`) sebelum shell.
- Izin `deny` pada `.kilo/kilo.jsonc` bersifat mutlak.

# AGENTS.md

1. Baca secara eksplisit (tool Read) seluruh berkas di `.agents/rules/` sebelum bekerja; sesi tidak dilanjutkan bila belum dibaca (fatal bagi kode). Jangan hanya mengandalkan pemuatan via `instructions`.
```

```jsonc
// .kilo/kilo.jsonc
{
  "instructions": ["AGENTS.md"]
}
```

## Contoh Salah

```markdown
# Aturan

- DILARANG membaca /home/user/proyek-x/secrets.txt
- Path repo /home/user/proyek-x wajib ...

// DILARANG: terikat pada repo tertentu
```
