---
name: aturan-pembuatan-skill
description: Trigger: saat membuat skill baru atau memperbarui skill | Panduan pembuatan dan pembaruan SKILL.md.
---

1. Setiap skill wajib memiliki frontmatter, dan cukup hanya `name` serta `description`; `name` wajib sama dengan nama folder (Name Matching Rule).

2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.

3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik.

4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`).

5. `description` wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; wajib menjelaskan apa yang dilakukan dan kapan dipakai; serta memenuhi batasan 1–1024 karakter, non-kosong.

6. `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat. (Trigger-only description.)

7. Setiap skill wajib menyertakan contoh; utamakan contoh benar, **contoh salah wajib**.

8. Tambahkan section di akhir skill untuk sumber, misalnya dari commit, web, source SDK, atau karena pengguna minta secara eksplisit.

9. Batasan `name` — 1–64 karakter; huruf kecil/angka/strip; tidak diawali/diakhiri strip; tidak boleh strip ganda (`--`).

10. Progressive disclosure — `SKILL.md` utama di bawah 500 baris; detail pindah ke file referensi.

11. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`). Pengecualian: skill pada `.agents/skills/code/`.

12. Sumber isi skill wajib berasal dari commit yang berkaitan; bila aturan baru berasal dari permintaan eksplisit pengguna, catat sebagai sumber pada `## Sumber Evaluasi`.

13. Skill pada `.agents/skills/code/` hanya boleh diubah atau ditambah dari (a) riwayat commit, atau (b) kode yang secara eksplisit diperintahkan pengguna untuk dimasukkan.

14. Wajib tanyakan dulu kepada pengguna untuk memastikan apakah kode tersebut perlu ditambahkan/diperbarui ke skill yang relevan, atau perlu dibuat berkas skill baru.

15. Saat bertanya, sertakan path berkas skill yang dimaksud agar pengguna mengetahui target dan dapat menolak bila tidak sesuai.

16. Setiap poin dan contoh pada skill tidak boleh terlalu spesifik untuk satu repo; jadikan global. Rujukan ke repo tertentu hanya boleh sebagai sumber pada `## Sumber Evaluasi` bila aturan memang berasal dari repo tersebut.

17. Frontmatter wajib YAML valid: `name:` dan `description:` wajib sejajar pada kolom yang sama (tanpa spasi/indentasi di depan salah satunya); frontmatter yang rusak membuat Kilo gagal memuat skill (mis. error "bad indentation of a mapping entry").

## Sumber Evaluasi

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
- Aturan 13 — berasal dari poin 13 pada `prompt/skill/aturan-pembuatan-skill.md` (sinkronisasi prompt → target, sesi 21, 2026-11-18; menegaskan `.agents/rules/lainnya.md` butir 4 dengan pengecualian perintah eksplisit pengguna).
- Aturan 14 & 15 — berasal dari poin 14–15 pada `prompt/skill/aturan-pembuatan-skill.md` (sinkronisasi prompt → target, sesi 21, 2026-11-18; wajib tanya dulu + sertakan path skill saat meminta persetujuan).
- Aturan 16 — berasal dari poin 16 pada `prompt/skill/aturan-pembuatan-skill.md` (sinkronisasi prompt → target, sesi 21, 2026-11-18; skill `code/` tidak boleh memiliki berkas poin; poin 11 diberi pengecualian).
- Aturan 17 — berasal dari poin 17 pada `prompt/skill/aturan-pembuatan-skill.md` (2026-11-18; dirumuskan baku dari poin yang ditambahkan pengguna, sesi 29).
- Aturan 1 & 5 — penggabungan poin 1↔6 dan poin 5↔11 serta penomoran ulang poin/Aturan 7–19 menjadi 6–17 (2026-11-18, sesi 29, atas persetujuan pengguna).
- Aturan 18 — berasal dari insiden frontmatter rusak pada skill `code/performa-aplikasi` (`description:` berindentasi 2 spasi di commit `a7ecbf3`; diperbaiki pengguna di `9a7962b`, 2026-11-18; error Kilo "bad indentation of a mapping entry at line 3, column 14"); sinkronisasi prompt → target, sesi 34, 2026-11-18.
- Aturan 7 — diubah dari "contoh salah opsional" menjadi "**contoh salah wajib**" atas permintaan eksplisit pengguna (sesi 42, 2026-11-18 21:44 WIB).
