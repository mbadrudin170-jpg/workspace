---
name: aturan-pembuatan-skill
description: Trigger: saat membuat skill baru atau memperbarui skill | Panduan pembuatan dan pembaruan SKILL.md.
---

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
13. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`). Pengecualian: skill pada `.agents/skills/code/` (lihat Aturan 18).
14. Sumber isi skill wajib berasal dari commit yang berkaitan; bila aturan baru berasal dari permintaan eksplisit pengguna, catat sebagai sumber pada `## Sumber Evaluasi`.
15. Skill pada `.agents/skills/code/` hanya boleh diubah atau ditambah dari (a) riwayat commit, atau (b) kode yang secara eksplisit diperintahkan pengguna untuk dimasukkan.
16. Wajib tanyakan dulu kepada pengguna untuk memastikan apakah kode tersebut perlu ditambahkan/diperbarui ke skill yang relevan, atau perlu dibuat berkas skill baru.
17. Saat bertanya, sertakan path berkas skill yang dimaksud agar pengguna mengetahui target dan dapat menolak bila tidak sesuai.
18. Skill pada `.agents/skills/code/` tidak boleh memiliki berkas poin di `prompt/skill/`.

## Sumber Evaluasi

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
- Aturan 15 — berasal dari poin 15 pada `prompt/skill/aturan-pembuatan-skill.md` (sinkronisasi prompt → target, sesi 21, 2026-11-18; menegaskan `.agents/rules/lainnya.md` butir 4 dengan pengecualian perintah eksplisit pengguna).
- Aturan 16 & 17 — berasal dari poin 16–17 pada `prompt/skill/aturan-pembuatan-skill.md` (sinkronisasi prompt → target, sesi 21, 2026-11-18; wajib tanya dulu + sertakan path skill saat meminta persetujuan).
- Aturan 18 — berasal dari poin 18 pada `prompt/skill/aturan-pembuatan-skill.md` (sinkronisasi prompt → target, sesi 21, 2026-11-18; skill `code/` tidak boleh memiliki berkas poin; poin 13 diberi pengecualian).
