---
description: Menganalisis commit terbaru pada repositori root dan submodule untuk menentukan skill/aturan yang perlu ditambah atau diperbarui, lalu menulis hasil analisa ke `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` tanpa mengubah skill secara otomatis.
agent: code
---

# Evaluasi Skill dari Commit

## Tujuan

Mengevaluasi perubahan kode Dart yang sudah di-commit pada repositori root dan seluruh submodule untuk menentukan skill/aturan yang perlu ditambah atau diperbarui, kemudian menulis hasil analisa ke `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md`. Command ini **tidak** mengubah skill secara otomatis.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh interaksi dan laporan.
3. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`) untuk membaca berkas; gunakan perintah Git melalui shell sesuai `.agents/skills/non-code/penggunaan-tool-bawaan-kilo/SKILL.md`.
4. Sumber kebenaran hanya commit yang sudah ada (`git log`, `git show`, `git diff`); dilarang memakai working tree, staging, atau berkas untracked.
5. Daftar submodule dibaca dari `.gitmodules` (mis. `git config --file .gitmodules --get-regexp '\.path$'`); `git submodule status` dapat gagal karena gitlink yatim di `.dart_tool/`, jangan andalkan perintah tersebut.
6. Validasi tiap path submodule dengan `git -C <path> rev-parse --git-dir`.
7. Muat skill `aturan-pembuatan-skill` (`.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`) melalui tool `skill` sebelum menentukan skill/aturan.

## Cakupan

- Semua repository git yang terlibat, masing-masing dengan branch aktifnya (nama branch apa pun, mis. `main`, `master`):
  - Root repository (root proyek, path `.`).
  - Satu submodule per entri path pada `.gitmodules`, divalidasi dengan `git -C <path> rev-parse --git-dir`.
- Submodule yang tidak ter-inisialisasi (path tidak ada / bukan repositori git) dicatat sebagai `Tidak dievaluasi`; jangan diabaikan dan jangan mengarang hash.
- Evaluasi hanya perubahan kode Dart (bukan seluruh berkas `.md`). Perubahan di dalam submodule dievaluasi di repo submodule masing-masing, bukan di root.
- Berkas yang boleh diubah: `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` (di root). Skill custom, kode Dart, dan berkas lain tidak diubah.

## Parameter

- `$ARGUMENTS` (opsional): hash commit awal, topik skill yang ingin difokuskan, atau nama/path satu repo yang ingin difokuskan (mis. `base_coc`). Jika kosong, evaluasi seluruh repository (root + semua submodule).
- Jika `$ARGUMENTS` tidak valid atau rentang commit/target repositori tidak jelas: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` (jika ada) untuk menentukan commit terakhir yang sudah dievaluasi.
   - Susun daftar repo: root (path `.`) + satu repo per entri `.gitmodules`; validasi tiap path dengan `git -C <path> rev-parse --git-dir`. Repo yang tidak valid dicatat `Tidak dievaluasi` pada laporan; bila root repository tidak valid, **STOP**.
   - Baca branch aktif tiap repo (`git branch --show-current`) dan catat hash `HEAD` tiap repo di awal tugas; commit baru yang muncul saat evaluasi berjalan diabaikan untuk tugas ini.
   - Per repo: jika laporan belum memuat entri untuk repo tersebut (atau file masih kosong), ambil 5 commit terakhir pada branch aktif repo tersebut sebagai data awal.
   - Per repo: commit awal = commit setelah hash tercatat pada entri repo tersebut; commit akhir = `HEAD` repo tersebut yang dicatat di awal.
2. **Plan** — baca commit tiap repo dari yang terlama ke terbaru; bila dua commit mengubah kode yang sama, gunakan commit terbaru sebagai sumber kebenaran. Evaluasi hanya perubahan kode Dart. Untuk commit yang menyentuh `task.md` (di repo mana pun), baca diff bagian task berstatus `batal` yang dihapus beserta bagian `prompt` untuk memahami alasannya, lalu sesuaikan analisa skill terkait.
3. **Execute** — tentukan skill/aturan yang perlu ditambah atau diperbarui berdasarkan analisa; tulis hasil analisa ke `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md`. Bila berkas hasil sudah memuat entri untuk kode/pola yang sama, perbarui entri tersebut; jangan menambah entri baru. Perbarui penanda commit terakhir yang dievaluasi pada file laporan; jangan menumpuk daftar commit. Jangan mengubah skill secara otomatis.
4. **Review** — baca ulang berkas target untuk verifikasi; laporkan hasil (lihat Format Laporan).

## Format Laporan (berkas target)

Tabel per repo:

| Repo | Branch | Rentang dievaluasi | Berkas Dart | Pola/skill yang disarankan | Commit sumber | Catatan |
| --- | --- | --- | --- | --- | --- | --- |
| `workspace` (root) | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<skill/aturan>` | `<hash>` | `<catatan>` |
| `base_coc` | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<skill/aturan>` | `<hash>` | `<catatan>` |
| `share_global_saya` | `<branch>` | `<hash awal>`..`<hash akhir>` | `<berkas>` | `<skill/aturan>` | `<hash>` | `<catatan>` |

Sertakan hash commit akhir yang dievaluasi per repo dan daftar skill/aturan yang disarankan; setiap pola/temuan wajib mencantumkan hash commit sumber (dan subjek singkat), jangan mengarang hash. Susun hasil analisa berdasarkan prioritas tertinggi. Repo yang tidak dapat diakses dicatat `Tidak dievaluasi`.

## Larangan

- DILARANG mengubah skill custom, kode Dart, atau berkas lain selain berkas target laporan.
- DILARANG memakai isi working tree/staging/untracked sebagai sumber.
- DILARANG mengubah `.gitmodules`, pointer submodule, atau isi submodule.
- DILARANG commit/push (di root maupun di submodule).
- DILARANG mengarang hash untuk repo yang tidak dapat diakses; catat `Tidak dievaluasi`.
- DILARANG menambah entri baru bila laporan sudah memuat entri untuk kode/pola yang sama; perbarui entri yang ada.
- DILARANG melanjutkan bila rentang commit atau target repositori tidak jelas; tanyakan via tool `question`.

## Kriteria Selesai / STOP

- Selesai bila untuk setiap repo (root + seluruh submodule) evaluasi dilakukan atau ditandai `Tidak dievaluasi`, hasil analisa tertulis di `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md`, dan penanda commit terakhir yang dievaluasi diperbarui dengan verifikasi baca ulang OK.
- STOP bila laporan target tidak dapat ditulis, root repository git/`HEAD` tidak tersedia, argumen tidak valid, atau rentang commit/target repositori tidak jelas (laporkan kondisi tiap repo).