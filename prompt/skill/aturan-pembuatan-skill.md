diperbarui : Mon Nov 16 2026 07:45 WIB

file : [aturan-pembuatan-skill](../../.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md)

1. Setiap skill wajib memiliki frontmatter dengan `name` dan `description`; field `name` harus sama persis dengan nama folder (Name Matching Rule).
2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.
3. Lokasi skill wajib berada di `.agents/skills/` (atau subfolder yang diminta pengguna).
4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`).
5. Untuk `description`, wajib jelas kapan skill dibutuhkan (jangan sia-sia) dan memenuhi batasan 1–1024 karakter, non-kosong.
6. Trigger-only description — `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat.
7. Setiap skill sebaiknya menyertakan contoh; utamakan contoh benar, contoh salah opsional.
8. Tambahkan section di akhir skill untuk sumber (commit, web, source SDK, atau permintaan eksplisit pengguna).
9. Batasan `name` — 1–64 karakter; huruf kecil/angka/strip; tidak diawali/diakhiri strip; tidak boleh strip ganda (`--`).
10. Progressive disclosure — `SKILL.md` utama di bawah 500 baris; detail pindah ke file referensi.
11. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`).

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
