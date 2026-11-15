---
description: Commit git berkas yang dipilih pengguna dari daftar file yang saat ini berubah di working tree (root dan submodule), dengan pesan Conventional Commits otomatis dan konfirmasi sebelum commit. Tanpa argumen dan tanpa membaca berkas sesi.
agent: code
---

# Commit Berkas yang Dipilih dari Working Tree

## Tujuan

Menampilkan daftar berkas yang saat ini berubah (modified/untracked/deleted) pada repository root dan seluruh submodule yang terdaftar, lalu meng-commit hanya berkas yang dipilih pengguna, secara terpisah per repository, dengan pesan commit Conventional Commits yang disusun otomatis dari konteks perubahan. Command ini **tidak** melakukan push dan **tidak** membaca berkas sesi (`memori/sesi/*.md`).

## Ketentuan Umum

1. Wajib membaca `AGENTS.md` dan mematuhi aturannya, termasuk `.agents/rules/global/alur_git_commit.md` (Conventional Commits) dan `.agents/rules/global/prioritas_tool_bawaan.md`.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja.
3. Gunakan bahasa Indonesia baku untuk seluruh laporan.
4. Jangan menggunakan terminal untuk membaca berkas; gunakan tool `read`/`glob`/`grep`. Perintah git dijalankan via `bash` sesuai izin `.kilo/kilo.jsonc`.
5. **DILARANG** membaca berkas `memori/sesi/*.md` untuk menentukan daftar berkas; daftar berkas diambil dari `git status --short` tiap repository.
6. Commit dilakukan per repository (root dan setiap submodule); jangan gabungkan perubahan root dan submodule dalam satu commit.
7. Pesan commit disusun otomatis mengikuti Conventional Commits (tipe+scope+deskripsi) berdasarkan perubahan file yang dipilih. Jika agen ragu menentukan tipe/scope, tanyakan via tool `question` sebelum commit.
8. Wajib menampilkan daftar file berubah dan meminta pengguna memilih file yang akan di-commit via tool `question` sebelum menjalankan `git commit`.
9. Wajib meminta konfirmasi akhir pengguna via tool `question` setelah usulan pesan commit disusun, sebelum menjalankan `git commit`.

## Cakupan

- Repository root (`.`).
- Submodule yang terdaftar di `.gitmodules` (mis. `base_coc`, `share_global_saya`), divalidasi dengan `git -C <path> rev-parse --git-dir`.
- Hanya file yang statusnya modified/untracked/deleted pada `git status --short`.

## Parameter

- Command ini **tidak menerima argumen**. Jika diberikan argumen apa pun, **STOP** dan laporkan bahwa command ini tidak menerima parameter.

## Alur Kerja

1. **Analyze**
   - Susun daftar repository: root (`.`) + satu repo per entri `.gitmodules` (baca dengan `git config --file .gitmodules --get-regexp '\.path$'`); validasi tiap path dengan `git -C <path> rev-parse --git-dir`. Repo yang tidak valid dicatat `Tidak dievaluasi` dan dilewati.
   - Untuk tiap repository, jalankan `git -C <repo> status --short` dan kumpulkan daftar file berubah (kolom status + path relatif repo).
   - Jika tidak ada file berubah di seluruh repository, **STOP** dan laporkan bahwa tidak ada yang perlu di-commit.
   - Tampilkan daftar file berubah per repository (path relatif repo + status git) kepada pengguna.

2. **Plan**
   - Minta pengguna memilih file yang akan di-commit via tool `question` (multiple selection), dengan opsi per file (label = path relatif repo, description = status git + nama repo). Sertakan opsi "Batal".
   - Jika pengguna memilih "Batal" atau tidak memilih file apa pun, **STOP**.
   - Kelompokkan file terpilih berdasarkan repository.
   - Susun usulan pesan commit Conventional Commits per repository berdasarkan file terpilih dan jenis perubahannya.
   - Tampilkan usulan pesan commit per repository dan minta konfirmasi pengguna via tool `question` dengan opsi: "Commit dengan pesan ini", "Ubah pesan commit", "Batal".
   - Jika pengguna memilih "Ubah pesan commit", tanyakan pesan baru via `question` (input teks) lalu ulangi konfirmasi.
   - Jika pengguna memilih "Batal", **STOP**.

3. **Execute**
   - Untuk tiap repository yang memiliki file terpilih:
     - Jalankan `git -C <repo> add -- <file1> <file2> ...` (path relatif repo) untuk file terpilih.
     - Jalankan `git -C <repo> commit -m "<pesan>"`.
   - Jangan jalankan `git push`.
   - Jika `git commit` gagal (mis. hook), **STOP**, laporkan error, dan jangan lanjut ke repository berikutnya tanpa konfirmasi.

4. **Review**
   - Untuk tiap repository yang di-commit, jalankan `git -C <repo> log -1 --oneline` dan `git -C <repo> status --short` untuk verifikasi.
   - Laporkan hash commit dan status pasca-commit per repository.

## Format Laporan

Tabel per repository:

| Repo | File yang di-commit | Pesan commit | Hash commit | Status pasca-commit |
| --- | --- | --- | --- | --- |
| `workspace` (root) | `<file1>, <file2>` | `<pesan>` | `<hash>` | Bersih / Ada sisa |
| `base_coc` | `<file1>` | `<pesan>` | `<hash>` | Bersih / Ada sisa |

Jika tidak ada file berubah: tampilkan "Tidak ada berkas yang perlu di-commit." dan selesai.

## Larangan

- DILARANG membaca berkas `memori/sesi/*.md` untuk menentukan daftar berkas.
- DILARANG commit berkas yang tidak dipilih pengguna.
- DILARANG commit berkas yang tidak memiliki perubahan nyata pada `git status`.
- DILARANG menggabungkan perubahan root dan submodule dalam satu commit.
- DILARANG melakukan `git push` atau operasi remote lain.
- DILARANG mengubah kode Dart, berkas hasil generate, atau konfigurasi Kilo.
- DILARANG melanjutkan commit repository berikutnya jika commit sebelumnya gagal tanpa konfirmasi pengguna.

## Kriteria Selesai / STOP

- Selesai bila semua repository yang memiliki file terpilih telah di-commit, hash commit dilaporkan, dan status pasca-commit terverifikasi.
- STOP bila tidak ada file berubah, pengguna membatalkan pemilihan, argumen diberikan, atau `git commit` gagal (laporkan alasan dan tindakan yang disarankan).