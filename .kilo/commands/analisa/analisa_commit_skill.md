---
description: Menganalisis commit terbaru di setiap repository (root dan seluruh submodule) setelah commit terakhir yang tercatat pada `catatan.md`, lalu memperbarui atau menambahkan skill custom yang relevan dan memperbarui catatan evaluasi per repo.
agent: code
---

# Analisa Commit ke Skill

## Tujuan

Menentukan pola kode dari riwayat commit yang diinginkan pengguna, lalu memperbarui atau menambahkan skill custom agar pola tersebut dapat dipakai ulang pada proyek Flutter lain. Pengecekan dilakukan untuk **setiap repository git** yang terlibat — repositori root dan seluruh submodule — dan hasilnya dicatat **per repo** di `catatan.md`.

## Ketentuan Umum

1. Wajib membaca `AGENTS.md` dan `catatan.md` sebelum bekerja.
2. Muat skill `aturan-pembuatan-skill` (`.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`) melalui tool `skill` sebelum menulis skill.
3. Sumber kebenaran hanya commit yang sudah ada (`git log`, `git show`, `git diff`); dilarang memakai working tree/staging/untracked.
4. Daftar submodule dibaca dari `.gitmodules` (mis. `git config --file .gitmodules --get-regexp '\.path$'`); `git submodule status` dapat gagal karena gitlink yatim di `.dart_tool/`, jangan andalkan perintah tersebut.

## Cakupan

- Semua repository git yang terlibat, masing-masing dengan branch aktifnya (nama branch apa pun, mis. `main`, `master`); tidak dikhususkan ke `master`:
  - Root repository (root proyek, path `.`).
  - Satu submodule per entri path pada `.gitmodules` (saat ini: `base_coc`, `share_global_saya`), divalidasi dengan `git -C <path> rev-parse --git-dir`.
- Submodule yang tidak ter-inisialisasi (path tidak ada / bukan repositori git) dicatat sebagai `Tidak dievaluasi`; jangan diabaikan dan jangan mengarang hash.
- Berkas yang boleh diubah: folder `.agents/skills/custom/` (di root) dan `catatan.md`.

## Parameter

- `$ARGUMENTS` (opsional): hash commit awal, topik skill yang ingin difokuskan, atau nama/path satu repo yang ingin difokuskan (mis. `base_coc`). Jika kosong, evaluasi seluruh repository (root + semua submodule).
- Jika `$ARGUMENTS` tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca `catatan.md` dan cari bagian `# Evaluasi Skill dari commit` untuk menentukan commit terakhir yang sudah dievaluasi.
   - Susun daftar repo: root (path `.`) + satu repo per entri `.gitmodules`; validasi tiap path dengan `git -C <path> rev-parse --git-dir`. Repo yang tidak valid dicatat `Tidak dievaluasi` pada laporan dan `catatan.md`; bila root repository tidak valid, **STOP**.
   - Baca branch aktif tiap repo (`git branch --show-current`) dan catat hash `HEAD` tiap repo di awal tugas; commit baru yang muncul saat evaluasi berjalan diabaikan untuk tugas ini.
   - Per repo: jika bagian `# Evaluasi Skill dari commit` belum memuat entri untuk repo tersebut (atau `catatan.md` masih kosong), ambil 5 commit terakhir pada branch aktif repo tersebut sebagai data awal.
   - Per repo: commit awal = commit setelah hash tercatat pada entri repo tersebut; commit akhir = `HEAD` repo tersebut yang dicatat di awal.
2. **Plan** — baca commit tiap repo dari yang terlama ke terbaru; bila dua commit mengubah kode yang sama, gunakan commit terbaru sebagai sumber kebenaran. Evaluasi hanya perubahan kode Dart (bukan seluruh berkas `.md`). Perubahan di dalam submodule dievaluasi di repo submodule masing-masing, bukan di root.
3. **Execute** — untuk commit yang menyentuh `task.md` (di repo mana pun), baca diff bagian task berstatus `batal` yang dihapus beserta bagian `prompt` untuk memahami alasannya, lalu sesuaikan skill terkait.
4. **Review** — perbarui/tambahkan skill custom sesuai skill `aturan-pembuatan-skill`, lalu perbarui `catatan.md` bagian `# Evaluasi Skill dari commit` dengan catatan **per repo** (satu entri per repo): nama repo/path, branch, commit terakhir yang dievaluasi per repo, tanggal evaluasi, dan ringkasan hasil (mis. skill yang diperbarui, atau `tidak ada commit baru`). Jika bagian belum ada, buat. Pertahankan catatan lama yang sudah ada; jangan menimpa entri root lama — tambah/perbarui entri per repo. Hanya commit terakhir yang dievaluasi per repo yang dicatat (bukan seluruh commit).

## Format Laporan

Tabel per repo:

| Repo | Branch | Rentang dievaluasi | Berkas Dart | Pola/skill yang diperbarui | Catatan |
| --- | --- | --- | --- | --- | --- |
| `workspace` (root) | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<skill>` | `<catatan>` |
| `base_coc` | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<skill>` | `<catatan>` |
| `share_global_saya` | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<skill>` | `<catatan>` |

Sertakan hash commit akhir yang dicatat per repo dan daftar skill yang berubah.

Format entri per repo di `catatan.md` (bagian `# Evaluasi Skill dari commit`), satu baris per repo:

```text
- `workspace` (root) — branch `<branch>` — commit terakhir dievaluasi: `<hash>` — tanggal evaluasi: <YYYY-MM-DD> — ringkasan: <hasil singkat / tidak ada commit baru>
- `base_coc` — branch `<branch>` — commit terakhir dievaluasi: `<hash>` — tanggal evaluasi: <YYYY-MM-DD> — ringkasan: <hasil singkat / tidak ada commit baru>
- `share_global_saya` — branch `<branch>` — commit terakhir dievaluasi: `<hash>` — tanggal evaluasi: <YYYY-MM-DD> — ringkasan: <hasil singkat / tidak ada commit baru>
```

## Larangan

- DILARANG mencatat seluruh commit yang dievaluasi pada `catatan.md`; catat commit terakhir saja per repo.
- DILARANG mengubah berkas selain folder skill custom (di root) dan `catatan.md`.
- DILARANG memakai isi working tree/staging/untracked sebagai sumber.
- DILARANG mengubah kode Dart.
- DILARANG mengubah `.gitmodules`, pointer submodule, atau isi submodule.
- DILARANG commit/push (di root maupun di submodule).
- DILARANG mengarang hash untuk repo yang tidak dapat diakses; catat `Tidak dievaluasi`.

## Kriteria Selesai / STOP

- Selesai bila untuk setiap repo (root + seluruh submodule) evaluasi dilakukan atau ditandai `Tidak dievaluasi`, skill relevan diperbarui, dan `catatan.md` mencatat commit terakhir yang dievaluasi per repo.
- STOP bila `catatan.md` tidak ditemukan, atau root repository git/`HEAD` tidak tersedia, atau tidak ada commit yang dapat dievaluasi pada seluruh repo (laporkan kondisi tiap repo).
