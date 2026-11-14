---
description: Menganalisis commit Dart terbaru terhadap kesesuaian SDK/Flutter dan skill proyek, lalu memperbarui `task.md` serta `catatan.md` bila ditemukan ketidaksesuaian.
agent: code
---

# Analisa Kesehatan Kode

## Tujuan

Menilai kesehatan kode pada commit Dart terbaru: kesesuaian dengan paket/SDK Flutter yang terpasang dan dengan skill proyek, lalu mencatat temuan ke `task.md`.

## Ketentuan Umum

1. Wajib membaca `AGENTS.md`, `catatan.md`, dan `task.md` lebih dahulu.
2. Muat skill `format-task-md` (`.agents/skills/custom/format-task-md/SKILL.md`) melalui tool `skill` sebelum menulis `task.md`.
3. Untuk paket/SDK: baca versi pada `pubspec.yaml`, lalu verifikasi ke pub.dev/dokumentasi resmi sebagai sumber kebenaran.
4. Gunakan bahasa Indonesia baku.

## Cakupan

- Commit Dart pada branch aktif repository (nama branch apa pun, mis. `main`, `master`, `develop`); tidak dikhususkan ke `master`.
- Berkas yang boleh diubah hanya `catatan.md` dan `task.md`.

## Parameter

- `$ARGUMENTS` (opsional): hash awal atau path berkas yang ingin difokuskan.
- Jika `$ARGUMENTS` tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — tentukan branch aktif repository (mis. `git branch --show-current`) dan catat pada laporan; baca bagian `# Evaluasi kesehatan code dari commit` pada `catatan.md` untuk mengetahui commit terakhir yang dievaluasi; bila belum ada, ambil 5 commit terakhir pada branch aktif.
2. **Plan** — tentukan daftar commit yang akan dievaluasi (setelah commit terakhir tercatat hingga `HEAD` pada branch aktif); abort commit baru yang muncul saat evaluasi berjalan; baca dari yang terlama ke terbaru.
3. **Execute** — periksa hanya perubahan kode Dart; bandingkan dengan SDK/Flutter dan skill; catat setiap ketidaksesuaian ke `task.md` sesuai skill `format-task-md`.
4. **Review** — perbarui `catatan.md` bagian `# Evaluasi kesehatan code dari commit` dengan commit terakhir yang dievaluasi; pastikan tidak ada berkas lain yang berubah.

## Format Laporan

| Commit | Berkas | Ketidaksesuaian | Aturan/Skill | Status |
| --- | --- | --- | --- | --- |
| `<hash>` | `<berkas>` | `<masalah>` | `<rujukan>` | Masuk `task.md` / Tidak |

Sertakan hash commit terakhir yang dicatat.

## Larangan

- DILARANG mengubah berkas selain `catatan.md` dan `task.md`.
- DILARANG memeriksa commit non-Dart sebagai temuan kode.
- DILARANG menyimpulkan kesesuaian tanpa memverifikasi versi SDK/paket.
- DILARANG mengubah kode Dart.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila seluruh commit dalam rentang dievaluasi, `task.md` diperbarui bila perlu, dan `catatan.md` mencatat commit terakhir.
- STOP bila berkas wajib tidak ditemukan atau repositori git/`HEAD` tidak tersedia.
