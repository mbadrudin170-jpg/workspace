---
description: Commit git seluruh berkas yang memiliki perubahan yang belum di-commit pada repository root dan seluruh submodule yang terdaftar, secara terpisah per repository, dengan pesan Conventional Commits otomatis. Command ini tidak melakukan push.
agent: code
---

# Commit Berkas Sesi Saat ini

## Tujuan

## Ketentuan Umum

1. Wajib membaca `AGENTS.md` dan mematuhi aturannya, termasuk `.agents/rules/global/alur_git_commit.md` (Conventional Commits) dan `.agents/rules/global/prioritas_tool_bawaan.md`.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja.
3. Gunakan bahasa Indonesia baku untuk seluruh laporan.
4. Jangan menggunakan terminal untuk membaca berkas; gunakan tool `read`/`glob`/`grep`. Perintah git dijalankan via `bash` sesuai izin `.kilo/kilo.jsonc`.
5. Commit dilakukan per repository (root dan setiap submodule); jangan gabungkan perubahan root dan submodule dalam satu commit.
6. Pesan commit disusun otomatis mengikuti Conventional Commits (tipe+scope+deskripsi) berdasarkan perubahan file yang dipilih. Jika agen ragu menentukan tipe/scope, tanyakan via tool `question` sebelum commit.
7. AI menentukan berkas yang akan di-commit secara otomatis dari `git status --short`; **DILARANG** menanyakan pilihan berkas kepada pengguna. Pesan commit disusun otomatis dan commit dijalankan tanpa konfirmasi pengguna.

## Cakupan

- Repository root (`.`).
- Submodule yang terdaftar di `.gitmodules` (mis. `base_coc`, `share_global_saya`), divalidasi dengan `git -C <path> rev-parse --git-dir`.
- Semua file dengan status modified/untracked/deleted pada `git status --short` di tiap repository.

## Parameter

- Command ini **tidak menerima argumen**. Jika diberikan argumen apa pun, **STOP** dan laporkan bahwa command ini tidak menerima parameter.

## Alur Kerja

0. **Penilaian Penyelesaian Tugas (oleh AI, tanpa tanya pengguna)**
   - AI menilai sendiri apakah tugas pada sesi aktif sudah selesai berdasarkan catatan sesi aktif dan perubahan yang ada.
   - Bila belum selesai atau ragu, **STOP**, laporkan bahwa commit ditunda sampai tugas selesai, dan jangan menjalankan git. Selesai.
   - Bila dinilai sudah selesai, lanjut ke tahap Analyze.

1. **Analyze**
   - Susun daftar repository: root (`.`) + satu repo per entri `.gitmodules` (baca dengan `git config --file .gitmodules --get-regexp '\.path$'`); validasi tiap path dengan `git -C <path> rev-parse --git-dir`. Repo yang tidak valid dicatat `Tidak dievaluasi` dan dilewati.
   - Untuk tiap repository, jalankan `git -C <repo> status --short`. Kumpulkan seluruh file berubah (modified/untracked/deleted).
   - Jika tidak ada file berubah di seluruh repository, **STOP** dan laporkan bahwa tidak ada berkas yang perlu di-commit.
   - Tampilkan daftar file berubah per repository (path relatif repo + status git) kepada pengguna, beserta nama berkas sesi aktif (jika ada) sebagai konteks.

2. **Plan**
   - Kelompokkan berkas terpilih berdasarkan repository.
   - Susun pesan commit Conventional Commits per repository berdasarkan berkas terpilih dan jenis perubahannya.
   - Tampilkan daftar berkas dan usulan pesan commit per repository sebagai informasi, lalu lanjutkan ke Execute tanpa konfirmasi pengguna.
   - Jika tidak ada file berubah, **STOP** (lihat Analyze).

3. **Execute**
   - Untuk tiap repository yang memiliki file terpilih:
     - Jalankan `git -C <repo> add -A` (atau `git -C <repo> add -- <file1> ...`) untuk seluruh file terpilih.
     - Jalankan `git -C <repo> commit -m "<pesan>"`.
   - Jangan jalankan `git push`.
   - Jika `git commit` gagal (mis. hook), **STOP**, laporkan error, dan jangan lanjut ke repository berikutnya tanpa konfirmasi.

4. **Review**
   - Untuk tiap repository yang di-commit, jalankan `git -C <repo> log -1 --oneline` dan `git -C <repo> status --short` untuk verifikasi.
   - Laporkan hash commit dan status pasca-commit per repository.

## Format Laporan

Tabel per repository:

| Repo               | File yang di-commit | Pesan commit | Hash commit | Status pasca-commit |
| ------------------ | ------------------- | ------------ | ----------- | ------------------- |
| `workspace` (root) | `<file1>, <file2>`  | `<pesan>`    | `<hash>`    | Bersih / Ada sisa   |
| `base_coc`         | `<file1>`           | `<pesan>`    | `<hash>`    | Bersih / Ada sisa   |

Jika tidak ada file berubah: tampilkan "Tidak ada berkas yang perlu di-commit." dan selesai.

## Larangan

- DILARANG commit berkas yang tidak memiliki perubahan nyata pada `git status`.
- DILARANG menanyakan pilihan berkas atau pesan commit kepada pengguna; AI menentukan dan menjalankan commit otomatis.
- DILARANG menggabungkan perubahan root dan submodule dalam satu commit.
- DILARANG melakukan `git push` atau operasi remote lain.
- DILARANG mengubah kode Dart, berkas hasil generate, atau konfigurasi Kilo.
- DILARANG menanyakan status penyelesaian tugas kepada pengguna; penilaian dilakukan oleh AI.

## Kriteria Selesai / STOP

- Selesai bila semua repository yang memiliki berkas terpilih telah di-commit, hash commit dilaporkan, dan status pasca-commit terverifikasi.
- STOP bila tidak ada file berubah, AI menilai tugas belum selesai/ragu, argumen diberikan, atau `git commit` gagal (laporkan alasan dan tindakan yang disarankan).
