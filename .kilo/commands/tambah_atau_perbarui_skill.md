---
description: Menambahkan skill baru atau memperbarui skill yang sudah ada di `.agents/skills/code/` atau `.agents/skills/non-code/` berdasarkan sumber yang diberikan pengguna, mengikuti pola skill yang sudah ada.
---

# Tambah atau Perbarui Skill

## Tujuan

Menambahkan skill baru atau memperbarui skill yang sudah ada di `.agents/skills/code/` atau `.agents/skills/non-code/` berdasarkan sumber yang diberikan pengguna, dengan format dan pola yang konsisten.

## Ketentuan Umum

1. Baca `AGENTS.md` dan `.agents/rules/global/aturan_skill.md`; patuhi seluruhnya.
2. Muat skill `aturan-pembuatan-skill` sebelum menulis atau mengubah `SKILL.md`.
3. Gunakan bahasa Indonesia baku dan gaya teknis ringkas.

## Cakupan

- Hanya `.agents/skills/code/`, `.agents/skills/non-code/` (dan `.agents/rules/global/kelompok_skill_wajib.md` untuk sinkronisasi indeks).

## Parameter

- `$ARGUMENTS`: sumber, topik, atau nama skill yang ingin ditambahkan/diperbarui.
- Jika `$ARGUMENTS` kosong atau tidak jelas: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — pelajari sumber yang diberikan; periksa skill custom yang sudah ada untuk menghindari duplikasi tujuan; baca commit yang relevan sebagai sumber isi.
2. **Plan** — tentukan: memperbarui skill yang ada atau membuat skill baru, nama folder kebab-case, dan versi yang dinaikkan.
3. **Execute** — tulis/perbarui `SKILL.md` dengan seluruh section wajib, frontmatter lengkap, dan segmen trigger-only; perbarui `.agents/rules/global/kelompok_skill_wajib.md`.
4. **Review** — verifikasi checklist skill (nama folder, frontmatter, section, sumber dari commit, trigger) dan pastikan indeks konsisten.
5. Bila tidak ada commit yang berkaitan dan pola tidak tersedia: **STOP** dan tanyakan cara melanjutkan; dilarang mengarang.

## Format Laporan

| Skill | Tindakan | Versi | Berkas |
| --- | --- | --- | --- |
| `<nama>` | Dibuat/Diperbarui | `1.x.x` | `<path SKILL.md>`, `.agents/rules/global/kelompok_skill_wajib.md` |

## Larangan

- DILARANG mengubah berkas di luar `.agents/skills/code/`, `.agents/skills/non-code/`, dan `.agents/rules/global/kelompok_skill_wajib.md`.
- DILARANG membuat skill duplikat atau tumpang tindih tujuan.
- DILARANG mengarang isi skill tanpa sumber/commit yang relevan.
- DILARANG mengubah kode Dart.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila skill dibuat/diperbarui sesuai aturan, indeks tersinkron, dan laporan disampaikan.
- STOP bila sumber tidak tersedia, ada duplikasi yang belum diputuskan, atau pengguna belum memilih tindakan.
