---
name: kelompok-skill-wajib
description: "Trigger: saat memperbarui kelompok skill wajib | Panduan kelompok skill wajib: path file valid, trigger jelas, tanggal diperbarui lengkap beserta jam, laporan skill yang tidak tersedia, dan penyusunan A-Z."
---

# Kelompok Skill Wajib

Panduan pemeliharaan kelompok skill wajib pada `.agents/rules/kelompok_skill_wajib.md` (atau berkas indeks serupa) agar konsisten dan dapat diaudit.

## Aturan

1. Setiap skill pada kelompok skill wajib memiliki path file yang valid, trigger yang jelas, dan tanggal diperbarui lengkap beserta jam.
2. Jika skill tidak tersedia, laporkan; jangan mengarang.
3. Setiap skill yang diubah wajib memperbarui tanggal diperbaruinya.
4. Jika memperbarui berkas kelompok skill wajib, wajib memuat skill ini terlebih dahulu.
5. Susun daftar skill berdasarkan abjad A-Z.
6. Trigger pada setiap skill wajib ditulis detail dan spesifik agar AI dapat memuat skill yang relevan.
7. Jika ada skill baru atau pembaruan berkas skill, wajib perbarui berkas `.agents/rules/kelompok_skill_wajib.md`.

## Larangan

- DILARANG mencantumkan path file yang tidak valid atau skill yang tidak tersedia tanpa laporan.
- DILARANG menyusun daftar skill selain berdasarkan abjad A-Z.
- DILARANG mengubah berkas kelompok skill wajib tanpa memuat skill ini terlebih dahulu.
- DILARANG tidak memperbarui `.agents/rules/kelompok_skill_wajib.md` saat ada skill baru atau pembaruan skill.

## Sumber Evaluasi

- Berkas sumber: `prompt/skill/kelompok-skill-wajib.md` (poin 1–7).
- Permintaan eksplisit pengguna: pemeliharaan kelompok skill wajib.
