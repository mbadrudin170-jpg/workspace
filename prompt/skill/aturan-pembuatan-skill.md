diperbarui : Tue Nov 17 2026 20:58 WIB
file : [aturan-pembuatan-skill](../../.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md)

1. Setiap skill wajib memiliki frontmatter, dan cukup hanya nama serta description saja; untuk nama, wajib sama seperti nama folder-nya.
2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.
3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik.
4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`).
5. Untuk `description`, wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; serta memenuhi batasan 1–1024 karakter, non-kosong.
6. Name matching — field `name` harus sama persis dengan nama folder (Name Matching Rule).
7. Trigger-only description — `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat.
8. Setiap skill sebaiknya menyertakan contoh; utamakan contoh benar, contoh salah opsional.
9. Tambahkan section di akhir skill untuk sumber, misalnya dari commit, web, source SDK, atau karena pengguna minta secara eksplisit.
10. Batasan `name` — 1–64 karakter; huruf kecil/angka/strip; tidak diawali/diakhiri strip; tidak boleh strip ganda (`--`).
11. Batasan `description` — 1–1024 karakter, non-kosong; jelaskan apa yang dilakukan dan kapan dipakai.
12. Progressive disclosure — `SKILL.md` utama di bawah 500 baris; detail pindah ke file referensi.
13. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`).
14. Sumber isi skill wajib berasal dari commit yang berkaitan; bila aturan baru berasal dari permintaan eksplisit pengguna, catat sebagai sumber pada `## Sumber Evaluasi`.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com