---
description: Commit git berkas yang dipilih pengguna, dibatasi pada berkas yang tercatat di tabel `## Berkas Terdampak` berkas sesi aktif (root dan submodule), dengan pesan Conventional Commits otomatis dan konfirmasi sebelum commit.
agent: code
---

# Commit Berkas Sesi Aktif

## Tujuan

Menampilkan daftar berkas yang **tercatat pada tabel `## Berkas Terdampak` berkas sesi aktif** (`memori/sesi/sesi_N.md` dengan `N` tertinggi) dan **masih memiliki perubahan yang belum di-commit** (`git status --short`) pada repository root dan seluruh submodule yang terdaftar, lalu meng-commit hanya berkas yang dipilih pengguna, secara terpisah per repository, dengan pesan commit Conventional Commits yang disusun otomatis dari konteks perubahan. Command ini **tidak** melakukan push dan **tidak** menampilkan berkas dari sesi lain yang kebetulan masih berubah di working tree.

## Ketentuan Umum

1. Wajib membaca `AGENTS.md` dan mematuhi aturannya, termasuk `.agents/rules/global/alur_git_commit.md` (Conventional Commits) dan `.agents/rules/global/prioritas_tool_bawaan.md`.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja.
3. Gunakan bahasa Indonesia baku untuk seluruh laporan.
4. Jangan menggunakan terminal untuk membaca berkas; gunakan tool `read`/`glob`/`grep`. Perintah git dijalankan via `bash` sesuai izin `.kilo/kilo.jsonc`.
5. AI menilai sendiri apakah tugas pada sesi aktif sudah selesai berdasarkan catatan sesi dan perubahan yang ada; bila belum selesai atau ragu, **STOP** dan laporkan bahwa commit ditunda sampai tugas selesai. **DILARANG** menanyakan status penyelesaian tugas kepada pengguna.
6. **Wajib** membaca berkas sesi aktif (`memori/sesi/sesi_N.md` dengan `N` tertinggi) dan mengambil daftar berkas dari tabel `## Berkas Terdampak` (kolom `Lokasi File`) sebagai sumber kebenaran daftar kandidat. Berkas yang tidak tercatat di tabel tersebut **tidak** ditawarkan, meskipun masih berubah di `git status` (mis. sisa perubahan dari sesi lain).
6. Commit dilakukan per repository (root dan setiap submodule); jangan gabungkan perubahan root dan submodule dalam satu commit.
7. Pesan commit disusun otomatis mengikuti Conventional Commits (tipe+scope+deskripsi) berdasarkan perubahan file yang dipilih. Jika agen ragu menentukan tipe/scope, tanyakan via tool `question` sebelum commit.
8. AI menentukan berkas yang akan di-commit secara otomatis dari irisan tabel sesi aktif dan `git status --short`; **DILARANG** menanyakan pilihan berkas kepada pengguna. Pesan commit disusun otomatis dan commit dijalankan tanpa konfirmasi pengguna.

## Cakupan

- Berkas sesi aktif: `memori/sesi/sesi_N.md` dengan `N` tertinggi (ditentukan via `glob` pada `memori/sesi/sesi_*.md`, lalu pilih nomor terbesar).
- Repository root (`.`).
- Submodule yang terdaftar di `.gitmodules` (mis. `base_coc`, `share_global_saya`), divalidasi dengan `git -C <path> rev-parse --git-dir`.
- Hanya file yang **tercatat di tabel `## Berkas Terdampak` sesi aktif** DAN statusnya modified/untracked/deleted pada `git status --short`.

## Parameter

- Command ini **tidak menerima argumen**. Jika diberikan argumen apa pun, **STOP** dan laporkan bahwa command ini tidak menerima parameter.

## Alur Kerja

0. **Penilaian Penyelesaian Tugas (oleh AI, tanpa tanya pengguna)**
   - AI menilai sendiri apakah tugas pada sesi aktif sudah selesai berdasarkan catatan sesi aktif dan perubahan yang ada.
   - Bila belum selesai atau ragu, **STOP**, laporkan bahwa commit ditunda sampai tugas selesai, dan jangan membaca berkas sesi atau menjalankan git. Selesai.
   - Bila dinilai sudah selesai, lanjut ke tahap Analyze.

1. **Analyze**
   - Tentukan berkas sesi aktif: `glob` `memori/sesi/sesi_*.md`, pilih nomor tertinggi `N`, baca berkasnya dengan `read`. Jika folder/berkas tidak ada atau tabel `## Berkas Terdampak` tidak ditemukan/kosong: **STOP** dan laporkan.
   - Susun daftar repository: root (`.`) + satu repo per entri `.gitmodules` (baca dengan `git config --file .gitmodules --get-regexp '\.path$'`); validasi tiap path dengan `git -C <path> rev-parse --git-dir`. Repo yang tidak valid dicatat `Tidak dievaluasi` dan dilewati.
   - Parse tabel `## Berkas Terdampak` sesi aktif → daftar path (kolom `Lokasi File`), abaikan baris yang bukan path berkas (mis. `MEMORI.md` tetap dimasukkan bila tercatat).
   - Untuk tiap repository, jalankan `git -C <repo> status --short` dan **iriskan** dengan daftar path sesi aktif (normalisasi: path berawalan `<submodule>/` milik submodule tersebut; path lain milik root). Hanya file yang ada di kedua daftar yang ditawarkan.
   - Jika tidak ada file berubah (irisan kosong) di seluruh repository, **STOP** dan laporkan bahwa tidak ada berkas sesi aktif yang perlu di-commit (sisa perubahan dari sesi lain tidak ditampilkan).
   - Tampilkan daftar file berubah per repository (path relatif repo + status git) kepada pengguna, beserta nama berkas sesi aktif yang menjadi acuan.

2. **Plan**
   - AI menentukan berkas yang akan di-commit secara otomatis dari irisan tabel sesi aktif dan `git status --short` (seluruh berkas yang berubah dan tercatat), tanpa menanyakan pilihan kepada pengguna.
   - Kelompokkan berkas terpilih berdasarkan repository.
   - Susun pesan commit Conventional Commits per repository berdasarkan berkas terpilih dan jenis perubahannya.
   - Tampilkan daftar berkas dan usulan pesan commit per repository sebagai informasi, lalu lanjutkan ke Execute tanpa konfirmasi pengguna.
   - Jika irisan kosong, **STOP** (lihat Analyze).

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

Jika tidak ada file berubah (irisan kosong): tampilkan "Tidak ada berkas sesi aktif yang perlu di-commit (berkas dari sesi lain tidak ditampilkan)." dan selesai.

## Larangan

- DILARANG commit berkas yang tidak tercatat di tabel `## Berkas Terdampak` berkas sesi aktif.
- DILARANG commit berkas yang tidak memiliki perubahan nyata pada `git status`.
- DILARANG menanyakan pilihan berkas atau pesan commit kepada pengguna; AI menentukan dan menjalankan commit otomatis.
- DILARANG menggabungkan perubahan root dan submodule dalam satu commit.
- DILARANG melakukan `git push` atau operasi remote lain.
- DILARANG mengubah kode Dart, berkas hasil generate, atau konfigurasi Kilo.
- DILARANG menanyakan status penyelesaian tugas kepada pengguna; penilaian dilakukan oleh AI.

## Kriteria Selesai / STOP

- Selesai bila semua repository yang memiliki berkas terpilih telah di-commit, hash commit dilaporkan, dan status pasca-commit terverifikasi.
- STOP bila tidak ada file berubah (irisan kosong), berkas sesi aktif tidak ditemukan/tabel kosong, AI menilai tugas belum selesai/ragu, argumen diberikan, atau `git commit` gagal (laporkan alasan dan tindakan yang disarankan).

(End of file - total 108 lines)
