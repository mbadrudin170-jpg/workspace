---
description: Mencatat kegagalan AI terkait rules/skill/command ke keluhan.md secara ringkas setelah menanyakan gejala, akar masalah, dan tindak lanjut.
agent: code
---

# Catat Keluhan

## Tujuan

Mencatat kegagalan AI terkait rules, skill, atau command ke `keluhan.md` secara ringkas, setelah menanyakan gejala, akar masalah, dan tindak lanjut.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca secara eksplisit seluruh berkas di `.agents/rules/global/` sebelum bekerja.
3. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang diinjeksikan.
4. Muat skill `memori-check` melalui tool `skill` sebelum bekerja.
5. Gunakan bahasa Indonesia baku.
6. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`, `edit`, `write`) untuk membaca/menulis berkas.
7. Jangan mengubah kode sumber, konfigurasi, atau berkas lain di luar cakupan.

## Cakupan

- Berkas `keluhan.md` di root proyek.
- Berkas rules/skill/command yang terkait dengan kegagalan (bila perlu dibaca untuk verifikasi).

## Parameter

- `$ARGUMENTS` (opsional): ringkasan singkat kegagalan yang ingin dicatat.

## Alur Kerja

1. **Analyze** — jika `$ARGUMENTS` kosong, tanyakan gejala, aturan/skill/command yang terlewat/tidak dibaca/tidak sesuai, dan bukti kejadian. Sertakan path file aturan, rules, dan command yang dilanggar (mis. `AGENTS.md`, `.agents/rules/global/*.md`, `.kilo/commands/*.md`, `.agents/skills/custom/*/SKILL.md`) agar bisa diperbaiki di antara ketiga kategori itu.
2. **Plan** — tanyakan akar masalah (kenapa AI tidak mematuhi) sebelum mencatat.
3. **Execute** — tambahkan entri ringkas ke `keluhan.md` dengan format:
   - Gejala: <apa yang terjadi>
   - Terkait: <rule/skill/command>
   - Tindak lanjut: <perbaikan yang akan dilakukan>
4. **Review** — baca ulang `keluhan.md` untuk memastikan entri tercatat.

## Format Laporan

- Entri yang ditambahkan.
- Berkas yang diubah.

## Larangan

- DILARANG mengubah kode sumber sebagai bagian pencatatan keluhan.
- DILARANG mengarang gejala atau akar masalah.
- DILARANG commit/push tanpa perintah eksplisit pengguna.

## Kriteria Selesai / STOP

- Selesai bila entri ringkas tercatat di `keluhan.md` dan diverifikasi.
- STOP bila informasi tidak cukup atau pengguna membatalkan; sebutkan alasan.
