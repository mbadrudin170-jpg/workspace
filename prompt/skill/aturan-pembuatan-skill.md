diperbarui : Wed Nov 18 2026 05:55 WIB
file : [aturan-pembuatan-skill](../../.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md)

1. Setiap skill wajib memiliki frontmatter, dan cukup hanya `name` serta `description`; `name` wajib sama dengan nama folder (Name Matching Rule).
2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.
3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik.
4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`).
5. `description` wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; wajib menjelaskan apa yang dilakukan dan kapan dipakai; serta memenuhi batasan 1–1024 karakter, non-kosong.
6. `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat. (Trigger-only description.)
7. Setiap skill sebaiknya menyertakan contoh; utamakan contoh benar, contoh salah opsional.
8. Tambahkan section di akhir skill untuk sumber, misalnya dari commit, web, source SDK, atau karena pengguna minta secara eksplisit.
9. Batasan `name` — 1–64 karakter; huruf kecil/angka/strip; tidak diawali/diakhiri strip; tidak boleh strip ganda (`--`).
10. Progressive disclosure — `SKILL.md` utama di bawah 500 baris; detail pindah ke file referensi.
11. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`). Pengecualian: skill pada `.agents/skills/code/` (lihat poin 16).
12. Sumber isi skill wajib berasal dari commit yang berkaitan; bila aturan baru berasal dari permintaan eksplisit pengguna, catat sebagai sumber pada `## Sumber Evaluasi`.
13. Skill pada `.agents/skills/code/` hanya boleh diubah atau ditambah dari (a) riwayat commit, atau (b) kode yang secara eksplisit diperintahkan pengguna untuk dimasukkan.
14. Wajib tanyakan dulu kepada pengguna untuk memastikan apakah kode tersebut perlu ditambahkan/diperbarui ke skill yang relevan, atau perlu dibuat berkas skill baru.
15. Saat bertanya, sertakan path berkas skill yang dimaksud agar pengguna mengetahui target dan dapat menolak bila tidak sesuai.
16. Skill pada `.agents/skills/code/` tidak boleh memiliki berkas poin di `prompt/skill/`.
17. Setiap poin dan contoh pada skill tidak boleh terlalu spesifik untuk satu repo; jadikan global. Rujukan ke repo tertentu hanya boleh sebagai sumber pada `## Sumber Evaluasi` bila aturan memang berasal dari repo tersebut.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
