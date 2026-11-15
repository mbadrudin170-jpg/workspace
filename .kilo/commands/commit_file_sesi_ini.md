---
description: Memastikan tugas AI sudah selesai, lalu melakukan commit terhadap seluruh berkas yang diubah pada sesi ini saja.
agent: code
---

# Commit Berkas Sesi Ini

## Tujuan

Memastikan tugas yang dikerjakan AI pada sesi ini telah selesai sebelum melakukan commit, dan melakukan commit hanya terhadap berkas-berkas yang diubah pada sesi ini (tidak termasuk berkas lain).

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh interaksi dan laporan.
3. Gunakan tool bawaan (`read`, `glob`, `grep`) untuk membaca berkas; gunakan perintah Git melalui shell sesuai `.agents/rules/global/prioritas_tool_bawaan.md`.
4. Tidak ada skill terkait yang trigger-nya terpenuhi oleh tujuan command ini; nyatakan secara eksplisit tidak ada skill terkait.

## Cakupan

- Berkas yang diubah (modified/added/deleted) pada sesi kerja saat ini, sebagaimana tercatat pada `git status`.
- Tidak mencakup berkas yang tidak diubah, berkas hasil generate, atau berkas di luar sesi.

## Parameter

- `$ARGUMENTS`: opsional; jika diisi, dapat berupa daftar path berkas yang ingin di-commit. Jika kosong, gunakan daftar berkas yang diubah pada sesi ini dari `git status`.
- Jika argumen ambigu atau tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Tanyakan status penyelesaian** — tanyakan kepada AI apakah tugasnya sudah selesai. Jika belum selesai: **STOP** dan jangan melakukan commit.
2. **Identifikasi berkas** — jika tugas sudah selesai, identifikasi seluruh berkas yang diubah pada sesi ini (misalnya melalui `git status --short`), tanpa menyertakan berkas lain.
3. **Commit** — jalankan commit hanya terhadap berkas-berkas yang diidentifikasi pada langkah sebelumnya, dengan pesan commit yang mengikuti Conventional Commits.
4. **Review** — verifikasi hasil commit (misalnya `git status`, `git log -1`) dan pastikan tidak ada perubahan di luar cakupan yang ikut ter-commit.

## Format Laporan

- Status tugas: Selesai / Belum selesai.
- Daftar berkas yang di-commit (path).
- Hash commit dan pesan commit.
- Hasil verifikasi (`git status` setelah commit).

## Larangan

- DILARANG melakukan commit jika tugas AI belum selesai.
- DILARANG menyertakan berkas yang tidak diubah pada sesi ini dalam commit.
- DILARANG melakukan commit/push tanpa persetujuan pengguna bila diperlukan.
- DILARANG mengarang hasil verifikasi yang tidak dijalankan.

## Kriteria Selesai / STOP

- Selesai bila tugas AI dinyatakan selesai, commit terhadap berkas sesi ini berhasil, dan laporan disampaikan.
- STOP bila tugas AI belum selesai, argumen tidak valid, atau verifikasi gagal; sebutkan alasan dan tindakan yang disarankan.
