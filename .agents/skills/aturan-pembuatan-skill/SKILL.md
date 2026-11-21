---
name: aturan-pembuatan-skill
description: Trigger: saat membuat skill baru atau memperbarui skill | Panduan pembuatan dan pembaruan SKILL.md. 1. Setiap skill wajib memiliki frontmatter, dan cukup hanya `name` serta `description`; `name` wajib sama dengan nama folder (Name Matching Rule). 2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`. 3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik. 4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`). 5. `description` wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; wajib menjelaskan apa yang dilakukan dan kapan dipakai; serta memenuhi batasan 1–1024 karakter, non-kosong. 6. `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpang
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sat Nov 21 2026 17:03 WIB"
---

1. Setiap skill wajib memiliki frontmatter, dan cukup hanya `name` serta `description`; `name` wajib sama dengan nama folder (Name Matching Rule).

2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.

3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik.

4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`).

5. `description` wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; wajib menjelaskan apa yang dilakukan dan kapan dipakai; batasan 1–1024 karakter adalah batas maksimum, bukan target; utamakan description ringkas, spesifik, dan pemicu penggunaan yang jelas; non-kosong.

6. `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat. (Trigger-only description.)

7. Setiap skill wajib menyertakan contoh; utamakan contoh benar, **contoh salah wajib**.

8. DILARANG menyertakan section `## Sumber Evaluasi` pada skill; skill hanya memuat aturan/panduan, bukan riwayat sumber.

9. Batasan `name` — 1–64 karakter; huruf kecil/angka/strip; tidak diawali/diakhiri strip; tidak boleh strip ganda (`--`).

10. Progressive disclosure — `SKILL.md` utama di bawah 500 baris; detail pindah ke file referensi di folder `references/`.

11. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`). Pengecualian: skill pada `.agents/skills/code/`.

12. Sumber isi skill wajib berasal dari commit yang berkaitan; bila aturan baru berasal dari permintaan eksplisit pengguna, catat provenansinya pada berkas sesi, bukan pada skill.

13. Skill pada `.agents/skills/code/` hanya boleh diubah atau ditambah dari (a) riwayat commit, atau (b) kode yang secara eksplisit diperintahkan pengguna untuk dimasukkan.

14. Wajib tanyakan dulu kepada pengguna untuk memastikan apakah kode tersebut perlu ditambahkan/diperbarui ke skill yang relevan, atau perlu dibuat berkas skill baru.

15. Saat bertanya, sertakan path berkas skill yang dimaksud agar pengguna mengetahui target dan dapat menolak bila tidak sesuai.

16. Setiap poin dan contoh pada skill tidak boleh terlalu spesifik untuk satu repo; jadikan global. Rujukan ke repo tertentu hanya boleh sebagai catatan provenance pada berkas sesi bila aturan memang berasal dari repo tersebut.

17. Frontmatter wajib YAML valid: `name:` dan `description:` wajib sejajar pada kolom yang sama (tanpa spasi/indentasi di depan salah satunya); frontmatter yang rusak membuat Kilo gagal memuat skill (mis. error "bad indentation of a mapping entry").

18. Untuk `description`, utamakan ringkas, spesifik, dan pemicu penggunaan yang jelas; batasan 1024 karakter adalah batas maksimum, bukan target; tidak wajib memenuhi hingga 1024 karakter.

19. Setiap skill wajib memiliki folder `references/` di dalam folder skill untuk berkas detail dan referensi (progressive disclosure), meskipun folder masih kosong.

20. File-file di folder `references/` berisi detail tentang masing-masing file referensi. SKILL.md utama hanya untuk aturan/panduan; detailnya dipindahkan ke file di `references/`. Jika folder `references/` kosong, tidak masalah — ini progressive disclosure. Catatan: catatan penulis prompt (catatan "hanya untuk penulis prompt", bukan untuk skill) TIDAK dimasukkan ke skill atau target.

21. File-file di folder `references/` wajib memiliki contoh kode jika skill tersebut berkaitan dengan kode (mis. skill Flutter/Dart/SQLite/Riverpod); contoh kode wajib benar dan dapat dikompilasi.

22. **Setiap kali menambah atau memperbarui skill, wajib sinkronkan berkas-berkas yang merujuk ke skill tersebut:** indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), command yang memuat skill terkait (`.kilo/commands/**/*.md` bagian `# Skill Terkait`), dan berkas poin `prompt/skill/<nama-skill>.md`. Verifikasi konsistensi sebelum menyelesaikan.
