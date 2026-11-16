---
description: Memastikan tugas AI sudah selesai, lalu melakukan commit terhadap seluruh berkas yang diubah pada sesi ini saja, termasuk berkas pada repo yang berbeda (submodule).
agent: code
---

# Commit Berkas Sesi Ini

## Tujuan

Memastikan tugas yang dikerjakan AI pada sesi ini telah selesai sebelum melakukan commit, lalu melakukan commit hanya terhadap berkas-berkas yang diubah pada sesi ini, mencakup setiap repositori (root maupun submodule) yang memiliki perubahan.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh interaksi dan laporan.
3. Gunakan tool bawaan (`read`, `glob`, `grep`) untuk membaca berkas; gunakan perintah Git melalui shell sesuai `.agents/skills/custom/penggunaan-tool-bawaan-kilo/SKILL.md`.
4. Tidak ada skill terkait yang trigger-nya terpenuhi oleh tujuan command ini; nyatakan secara eksplisit tidak ada skill terkait.

## Cakupan

- Berkas yang diubah (modified/added/deleted) pada sesi kerja saat ini di setiap repositori yang terlibat: repositori root maupun submodule (mis. `base_coc`, `share_global_saya`).
- Commit dilakukan per repositori: setiap repo yang memiliki perubahan mendapat commit sendiri.
- Tidak mencakup berkas yang tidak diubah, berkas hasil generate, atau berkas di luar sesi.

## Parameter

- `$ARGUMENTS`: opsional; jika diisi, dapat berupa daftar path berkas atau repo yang ingin di-commit. Jika kosong, gunakan daftar berkas yang diubah pada sesi ini dari `git status` tiap repo.
- Jika argumen ambigu atau tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Tanyakan status penyelesaian** — tanyakan kepada AI apakah tugasnya sudah selesai. Jika belum selesai: **STOP** dan jangan melakukan commit.
2. **Identifikasi repositori dan berkas** — jika tugas sudah selesai, periksa status Git pada repositori root maupun setiap submodule yang mungkin terlibat; kumpulkan seluruh berkas yang diubah pada sesi ini di masing-masing repo, tanpa menyertakan berkas lain.
3. **Commit per repo** — untuk setiap repositori yang memiliki perubahan, jalankan commit hanya terhadap berkas-berkas yang diidentifikasi pada langkah sebelumnya, dengan pesan commit yang mengikuti Conventional Commits. Walaupun repo berbeda, selama ada berkas yang diubah, lakukan commit untuk repo tersebut.
4. **Review** — verifikasi hasil commit pada tiap repo (misalnya `git status`, `git log -1`) dan pastikan tidak ada perubahan di luar cakupan yang ikut ter-commit.

## Format Laporan

- Status tugas: Selesai / Belum selesai.
- Per repositori: path repo, daftar berkas yang di-commit, hash commit, dan pesan commit.
- Hasil verifikasi (`git status` setelah commit) per repo.

## Larangan

- DILARANG melakukan commit jika tugas AI belum selesai.
- DILARANG menyertakan berkas yang tidak diubah pada sesi ini dalam commit.
- DILARANG melewatkan repo yang memiliki perubahan (termasuk submodule) tanpa commit.
- DILARANG melakukan commit/push tanpa persetujuan pengguna bila diperlukan.
- DILARANG mengarang hasil verifikasi yang tidak dijalankan.

## Kriteria Selesai / STOP

- Selesai bila tugas AI dinyatakan selesai, commit terhadap berkas sesi ini (pada tiap repo yang terlibat) berhasil, dan laporan disampaikan.
- STOP bila tugas AI belum selesai, argumen tidak valid, atau verifikasi gagal; sebutkan alasan dan tindakan yang disarankan.
