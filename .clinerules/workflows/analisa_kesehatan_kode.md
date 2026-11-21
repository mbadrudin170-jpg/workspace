---
description: Menganalisis commit Dart terbaru pada repositori root dan seluruh submodul terhadap kesesuaian SDK/Flutter dan skill proyek, lalu memperbarui `task.md` serta `catatan.md` bila ditemukan ketidaksesuaian.
agent: code
---

# Analisa Kesehatan Kode

## Tujuan

Menilai kesehatan kode pada commit Dart terbaru — pada repositori root dan pada setiap submodul yang terdaftar di `.gitmodules` (mis. `base_coc`, `share_global_saya`) — terhadap kesesuaian dengan paket/SDK Flutter yang terpasang dan dengan skill proyek, lalu mencatat temuan ke `task.md`.

## Ketentuan Umum

1. Wajib membaca `AGENTS.md`, `catatan.md`, dan `task.md` lebih dahulu.
2. Muat skill `format-task-md` (`.agents/skills/custom/format-task-md/SKILL.md`) melalui tool `skill` sebelum menulis `task.md`.
3. Untuk paket/SDK: baca versi pada `pubspec.yaml` pada repositori yang sedang dievaluasi (repositori root tidak memiliki `pubspec.yaml`; setiap submodul memilikinya masing-masing), lalu verifikasi ke pub.dev/dokumentasi resmi sebagai sumber kebenaran.
4. Gunakan bahasa Indonesia baku.
5. Daftar submodul dibaca dari `.gitmodules` (mis. `git config --file .gitmodules --get-regexp '\.path$'`), bukan dari `git submodule status`/`git submodule foreach` tanpa path — keduanya gagal bila ada gitlink tanpa entri `.gitmodules` (mis. `.dart_tool/skills/repos/...` pada proyek ini). Bila perlu status terperinci, gunakan `git submodule status -- <path1> <path2> ...` dengan path eksplisit, atau `git -C <path> ...`.
6. Kode Dart yang sebenarnya berada di dalam submodul; commit root hanya memuat pointer (gitlink). Evaluasi commit Dart karena itu dilakukan di dalam masing-masing repositori submodul, bukan hanya di root.

## Cakupan

- Commit Dart pada branch aktif repositori root dan pada branch aktif setiap submodul terdaftar (nama branch apa pun, mis. `main`, `master`, `develop`); tidak dikhususkan ke `master`.
- Pointer submodul pada commit root (gitlink) hanya dicatat sebagai informasi (mis. selisih pointer root vs `HEAD` submodul); bukan temuan kode. Berkas Dart yang belum ter-commit di working tree submodul berada di luar cakupan (command hanya mengevaluasi commit).
- Berkas yang boleh diubah hanya `catatan.md` dan `task.md`.

## Parameter

- `$ARGUMENTS` (opsional): hash awal atau path berkas yang ingin difokuskan. Path yang berada di dalam submodul memfokuskan evaluasi pada submodul tersebut; hash berlaku untuk repositori tempat hash ditemukan (root atau submodul).
- Jika `$ARGUMENTS` tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — tentukan branch aktif root (`git branch --show-current`) dan catat pada laporan; baca bagian `# Evaluasi kesehatan code dari commit` pada `catatan.md` untuk mengetahui commit terakhir yang dievaluasi per repositori (root dan tiap submodul); bila belum ada untuk suatu repositori, ambil 5 commit terakhir pada branch aktif repositori tersebut (fallback). Untuk setiap submodul pada `.gitmodules`:
   - Pastikan path terdaftar di `.gitmodules`, direktori ada, dan merupakan repositori git (mis. `git -C <path> rev-parse --is-inside-work-tree`).
   - Tentukan branch aktif submodul (`git -C <path> branch --show-current`); bila detached HEAD, gunakan `HEAD` apa adanya dan catat pada laporan.
   - Bandingkan pointer root (mis. `git ls-tree HEAD <path>`) dengan `HEAD` submodul (`git -C <path> rev-parse HEAD`); bila berbeda, catat sebagai informasi pada laporan.
2. **Plan** — tentukan daftar commit yang akan dievaluasi per repositori (setelah commit terakhir tercatat hingga `HEAD` pada repositori tersebut); abort commit baru yang muncul saat evaluasi berjalan; baca dari yang terlama ke terbaru. Bila bagian `# Evaluasi kesehatan code dari commit` pada `catatan.md` hanya memuat catatan root (format lama), pertahankan catatan root apa adanya dan tambahkan entri per submodul; jangan menghapus atau menimpa catatan lama.
3. **Execute** — periksa hanya perubahan kode Dart (di root dan di setiap submodul, mis. `git -C <path> log ... -- '*.dart'`); bandingkan dengan SDK/Flutter dan skill; catat setiap ketidaksesuaian ke `task.md` sesuai skill `format-task-md`. Submodul yang tidak ter-inisialisasi, direktori tidak ada, atau bukan repositori git: catat `Tidak dievaluasi (<alasan>)` pada laporan dan lanjutkan repositori lain; jangan dianggap lolos.
4. **Review** — perbarui `catatan.md` bagian `# Evaluasi kesehatan code dari commit` dengan commit terakhir yang dievaluasi per repositori (root dan tiap submodul); setiap repositori WAJIB memiliki entri sendiri yang memuat branch aktif, commit terakhir yang dievaluasi (atau `Belum pernah dievaluasi` bila belum ada), dan tanggal evaluasi — jangan hanya mencatat root. Pertahankan entri lama apa adanya (jangan menimpa); tambahkan entri baru per repositori. Pastikan tidak ada berkas lain yang berubah (termasuk di dalam submodul).

## Format Laporan

| Repositori             | Commit   | Berkas     | Ketidaksesuaian | Aturan/Skill | Status                  |
| ---------------------- | -------- | ---------- | --------------- | ------------ | ----------------------- |
| `<path root/submodul>` | `<hash>` | `<berkas>` | `<masalah>`     | `<rujukan>`  | Masuk `task.md` / Tidak |

Sertakan hash commit terakhir yang dicatat per repositori; setiap entri `catatan.md` memuat nama repo/path, branch, commit terakhir yang dievaluasi (atau `Belum pernah dievaluasi`), tanggal evaluasi, dan catatan pointer submodul yang berbeda, bila ada.

## Larangan

- DILARANG mengubah berkas selain `catatan.md` dan `task.md`.
- DILARANG mengubah kode Dart — termasuk di dalam submodul.
- DILARANG mengubah pointer/gitlink submodul, berkas `.gitmodules`, atau isi working tree submodul (termasuk menjalankan `git submodule update` yang mengubah isi submodul).
- DILARANG memeriksa commit non-Dart (termasuk commit pointer/gitlink di root dan commit kosong) sebagai temuan kode.
- DILARANG menyimpulkan kesesuaian tanpa memverifikasi versi SDK/paket.
- DILARANG menganggap submodul yang tidak dapat dievaluasi sebagai lolos.
- DILARANG commit/push — baik di root maupun di submodul.

## Kriteria Selesai / STOP

- Selesai bila seluruh commit dalam rentang dievaluasi di root dan di semua submodul yang dapat diakses, `task.md` diperbarui bila perlu, dan `catatan.md` mencatat commit terakhir per repositori.
- STOP bila berkas wajib tidak ditemukan atau repositori git/`HEAD` root tidak tersedia.
