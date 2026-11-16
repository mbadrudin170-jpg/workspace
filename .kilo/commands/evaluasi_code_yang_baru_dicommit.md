---
description: Mengevaluasi kode yang baru di-commit pada repositori utama dan submodule, menganalisis perubahan untuk menemukan potensi masalah, pelanggaran aturan, atau tindak lanjut, lalu menulis hasil evaluasi ke `docs/hasil_analisa/hasil_evaluasi_perbaikan_code_commit.md` tanpa mengubah kode secara otomatis.
agent: code
---

# Evaluasi Kode yang Baru Dicommit

## Tujuan

Mengevaluasi perubahan kode yang sudah di-commit pada repositori utama dan seluruh submodule untuk menemukan potensi masalah, pelanggaran aturan, atau tindak lanjut, kemudian menulis hasil evaluasi ke `docs/hasil_analisa/hasil_evaluasi_perbaikan_code_commit.md`. Command ini **tidak** mengubah kode sumber secara otomatis.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh interaksi dan laporan.
3. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`) untuk membaca berkas; gunakan perintah Git melalui shell sesuai `.agents/rules/global/prioritas_tool_bawaan.md`.
4. Sumber kebenaran hanya commit yang sudah ada (`git log`, `git show`, `git diff`); dilarang memakai working tree, staging, atau berkas untracked.
5. Daftar submodule dibaca dari `.gitmodules` (mis. `git config --file .gitmodules --get-regexp '\.path$'`); `git submodule status` dapat gagal karena gitlink yatim di `.dart_tool/`, jangan andalkan perintah tersebut.
6. Validasi tiap path submodule dengan `git -C <path> rev-parse --git-dir`.
7. Tidak ada skill terkait yang trigger-nya terpenuhi oleh tujuan command ini; nyatakan secara eksplisit tidak ada skill terkait.

## Cakupan

- Semua repository git yang terlibat, masing-masing dengan branch aktifnya (nama branch apa pun, mis. `main`, `master`):
  - Root repository (root proyek, path `.`).
  - Satu submodule per entri path pada `.gitmodules`, divalidasi dengan `git -C <path> rev-parse --git-dir`.
- Submodule yang tidak ter-inisialisasi (path tidak ada / bukan repositori git) dicatat sebagai `Tidak dievaluasi`; jangan diabaikan dan jangan mengarang hash.
- Berkas yang boleh diubah: `docs/hasil_analisa/hasil_evaluasi_perbaikan_code_commit.md` (di root). Kode sumber, konfigurasi, dan berkas lain tidak diubah.

## Parameter

- `$ARGUMENTS` (opsional): hash commit awal/akhir, nama/path satu repo yang ingin difokuskan (mis. `base_coc`), atau rentang commit. Jika kosong, tentukan rentang otomatis berdasarkan laporan target (jika ada) atau 5 commit terakhir tiap repo.
- Jika `$ARGUMENTS` tidak valid atau rentang commit/target repositori tidak jelas: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca `docs/hasil_analisa/hasil_evaluasi_perbaikan_code_commit.md` (jika ada) untuk menentukan commit terakhir yang sudah dievaluasi.
   - Susun daftar repo: root (path `.`) + satu repo per entri `.gitmodules`; validasi tiap path dengan `git -C <path> rev-parse --git-dir`. Repo yang tidak valid dicatat `Tidak dievaluasi` pada laporan; bila root repository tidak valid, **STOP**.
   - Baca branch aktif tiap repo (`git branch --show-current`) dan catat hash `HEAD` tiap repo di awal tugas; commit baru yang muncul saat evaluasi berjalan diabaikan untuk tugas ini.
   - Per repo: jika laporan belum memuat entri untuk repo tersebut (atau file masih kosong), ambil 5 commit terakhir pada branch aktif repo tersebut sebagai data awal.
   - Per repo: commit awal = commit setelah hash tercatat pada entri repo tersebut; commit akhir = `HEAD` repo tersebut yang dicatat di awal.
2. **Plan** — baca commit tiap repo dari yang terlama ke terbaru; bila dua commit mengubah kode yang sama, gunakan commit terbaru sebagai sumber kebenaran. Evaluasi perubahan kode (seluruh berkas, bukan hanya Dart) pada rentang tersebut.
3. **Execute** — analisa perubahan kode untuk menemukan potensi masalah, pelanggaran aturan, atau tindak lanjut; tulis hasil evaluasi ke `docs/hasil_analisa/hasil_evaluasi_perbaikan_code_commit.md`. Jangan menumpuk daftar commit; cukup catat rentang dan ringkasan. Jangan mengubah kode sumber.
4. **Review** — baca ulang berkas target untuk verifikasi; laporkan hasil (lihat Format Laporan).

## Format Laporan (berkas target)

Tabel per repo:

| Repo | Branch | Rentang dievaluasi | Berkas berubah | Temuan | Tindak lanjut |
| --- | --- | --- | --- | --- | --- |
| `workspace` (root) | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<ringkasan temuan>` | `<tindakan>` |
| `base_coc` | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<ringkasan temuan>` | `<tindakan>` |
| `share_global_saya` | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<ringkasan temuan>` | `<tindakan>` |

Sertakan hash commit akhir yang dievaluasi per repo dan ringkasan temuan lintas repo. Repo yang tidak dapat diakses dicatat `Tidak dievaluasi` (jangan mengarang hash).

## Larangan

- DILARANG mengubah kode sumber, konfigurasi, atau berkas lain selain berkas target laporan.
- DILARANG memakai isi working tree/staging/untracked sebagai sumber.
- DILARANG mengubah `.gitmodules`, pointer submodule, atau isi submodule.
- DILARANG commit/push (di root maupun di submodule).
- DILARANG mengarang hash untuk repo yang tidak dapat diakses; catat `Tidak dievaluasi`.
- DILARANG melanjutkan bila rentang commit atau target repositori tidak jelas; tanyakan via tool `question`.

## Kriteria Selesai / STOP

- Selesai bila untuk setiap repo (root + seluruh submodule) evaluasi dilakukan atau ditandai `Tidak dievaluasi`, dan hasil evaluasi tertulis di `docs/hasil_analisa/hasil_evaluasi_perbaikan_code_commit.md` dengan verifikasi baca ulang OK.
- STOP bila laporan target tidak dapat ditulis, root repository git/`HEAD` tidak tersedia, argumen tidak valid, atau rentang commit/target repositori tidak jelas (laporkan kondisi tiap repo).
