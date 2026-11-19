---
name: kelompok-skill-wajib
description: "Trigger: saat memperbarui kelompok skill wajib | Panduan kelompok skill wajib: path file valid, trigger jelas, tanggal diperbarui lengkap beserta jam, laporan skill yang tidak tersedia, dan penyusunan A-Z. Indeks non-code HANYA berisi skill non-code. Kelompok Skill Wajib Panduan pemeliharaan kelompok skill wajib pada indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) agar konsisten dan dapat diaudit. Aturan 1. Setiap skill pada kelompok skill wajib memiliki path file yang valid, trigger yang jelas, dan tanggal diperbarui lengkap beserta jam. 2. Jika skill tidak tersedia, laporkan; jangan mengarang. 3. Setiap skill yang diubah wajib memperbarui tanggal diperbaruinya. 4. Jika memperbarui berkas kelompok skill wajib, wajib memuat skill ini terlebih dahulu. 5. Susun daftar skill berdasarkan abjad A-Z. 6. Trigger pada setiap skill wajib ditulis detail dan spesifik agar AI dapat memuat skill yang relevan. 7. Jika ada skill baru atau pembaruan berkas skill, wajib perbarui indeks skill (`.agents/rules/kelompok_"
---

# Kelompok Skill Wajib

Panduan pemeliharaan kelompok skill wajib pada indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) agar konsisten dan dapat diaudit.

## Aturan

1. Setiap skill pada kelompok skill wajib memiliki path file yang valid, trigger yang jelas, dan tanggal diperbarui lengkap beserta jam.
2. Jika skill tidak tersedia, laporkan; jangan mengarang.
3. Setiap skill yang diubah wajib memperbarui tanggal diperbaruinya.
4. Jika memperbarui berkas kelompok skill wajib, wajib memuat skill ini terlebih dahulu.
5. Susun daftar skill berdasarkan abjad A-Z.
6. Trigger pada setiap skill wajib ditulis detail dan spesifik agar AI dapat memuat skill yang relevan.
7. Jika ada skill baru atau pembaruan berkas skill, wajib perbarui indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`).
8. **Indeks non-code (`.agents/rules/kelompok_skill_wajib_non_code.md`) HANYA berisi skill dari `.agents/skills/non-code/`. DILARANG memasukkan skill code ke indeks non-code.**

## Larangan

- DILARANG mencantumkan path file yang tidak valid atau skill yang tidak tersedia tanpa laporan.
- DILARANG menyusun daftar skill selain berdasarkan abjad A-Z.
- DILARANG mengubah berkas kelompok skill wajib tanpa memuat skill ini terlebih dahulu.
- DILARANG tidak memperbarui indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) saat ada skill baru atau pembaruan skill.
- DILARANG memasukkan skill code ke `.agents/rules/kelompok_skill_wajib_non_code.md`.
