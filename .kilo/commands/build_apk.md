---
description: Membangun APK Android release proyek Flutter (split per ABI, hanya arm64) via GitHub Actions workflow, setelah pengguna memilih proyek target, lalu mengunduh dan memverifikasi berkas APK hasil serta melaporkannya.
agent: code
---

# Build APK (via GitHub Actions)

## Tujuan

Membangun APK Android `release` dari proyek Flutter yang dipilih pengguna secara manual, dengan konfigurasi tetap `--split-per-abi --target-platform android-arm64`, dengan menjalankan **GitHub Actions workflow** `build-apk.yml` (bukan build lokal), menunggu run selesai, mengunduh artefak APK hasil, lalu memverifikasi dan melaporkannya. Command ini memastikan proyek target valid (memiliki `pubspec.yaml`, folder `android/`, dan `.github/workflows/build-apk.yml`), menjalankan workflow, lalu memverifikasi berkas APK hasil dan melaporkannya.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja — command ini mencatat ke berkas sesi dan `MEMORI.md`.
3. Skill lain yang trigger-nya terpenuhi: `build-apk-github-workflow` (`.agents/skills/custom/build-apk-github-workflow/SKILL.md`) — muat melalui tool `skill` sebelum bekerja. Skill `build-runner-codegen` (`.agents/skills/custom/build-runner-codegen/SKILL.md`) **tidak** terkait karena command ini tidak menjalankan code generation.
4. Gunakan bahasa Indonesia baku pada seluruh laporan.
5. Tool bawaan diprioritaskan (`read`, `glob`, `grep`, `list`, `edit`, `write`) sesuai `.agents/rules/global/prioritas_tool_bawaan.md`; shell hanya untuk perintah `gh`/`git` dan pemeriksaan metadata berkas.
6. Jangan menggunakan terminal untuk membaca berkas sumber; gunakan tool `read`.

## Cakupan

- Workspace root tempat command dijalankan (mis. `/home/muhamadbadrudin1000/workspace`) dan seluruh proyek Flutter langsung di dalamnya (satu tingkat: `<root>/<proyek>/pubspec.yaml` + `<root>/<proyek>/android/` + `<root>/<proyek>/.github/workflows/build-apk.yml`).
- Proyek pustaka tanpa folder `android/` (mis. `share_global_saya`) **dikecualikan** dari daftar kandidat build APK dan diberi keterangan eksplisit.
- Proyek tanpa berkas `.github/workflows/build-apk.yml` **dikecualikan** dari daftar kandidat dan diberi keterangan eksplisit.
- Command ini memicu workflow GitHub Actions (memerlukan `gh` terpasang dan terautentikasi dengan scope `workflow`) dan mengunduh artefak hasil; tidak menjalankan build lokal.
- Command ini tidak mem-build iOS, web, desktop, maupun app bundle (`.aab`).
- Command ini tidak mengubah kode sumber, dependensi, konfigurasi Gradle, `pubspec.yaml`, atau berkas workflow.

## Parameter

- `$ARGUMENTS` (opsional): path proyek Flutter target, relatif terhadap workspace root atau path absolut (mis. `nama_proyek` atau `/home/muhamadbadrudin1000/workspace/nama_proyek`).
- Jika `$ARGUMENTS` kosong, tidak valid, atau tidak menunjuk proyek Flutter yang memiliki `android/` dan `.github/workflows/build-apk.yml`: tanyakan pilihan proyek kepada pengguna dengan tool `question` (opsi = seluruh folder satu tingkat di bawah workspace root yang punya `pubspec.yaml`, `android/`, **dan** `.github/workflows/build-apk.yml`); jangan menebak.

## Alur Kerja

1. **Analyze** —
   1. Verifikasi `gh` tersedia: `which gh`. Bila tidak tersedia: **STOP**.
   2. Verifikasi `gh` terautentikasi: `gh auth status`. Bila tidak terautentikasi atau scope `workflow` tidak ada: **STOP** dan laporkan cara autentikasi (`gh auth login`).
   3. Tentukan proyek target: bila `$ARGUMENTS` terisi dan valid (folder ada, ada `pubspec.yaml`, ada `android/`, ada `.github/workflows/build-apk.yml`), pakai itu; selain itu tanyakan via tool `question` dengan opsi hasil pindaian satu tingkat di bawah workspace root. Bila tidak ada satu pun kandidat yang valid: **STOP** dan laporkan.
   4. Verifikasi workflow dapat diakses di GitHub: `gh workflow view build-apk.yml` (workdir = folder proyek). Bila gagal: **STOP** dan laporkan.
2. **Plan** — tampilkan rencana kepada pengguna: proyek target, workflow yang akan dipicu (`gh workflow run build-apk.yml`), perkiraan berkas output (`<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk`), dan pengunduhan artefak `app-release-apk`. Minta konfirmasi pengguna sebelum melanjutkan; tanpa konfirmasi, **STOP**.
3. **Execute** — jalankan dengan tool bash (working directory = folder proyek):
   - `gh workflow run build-apk.yml`
   - `sleep 5`
   - `gh run list --workflow=build-apk.yml --limit=1 --json databaseId -q '.[0].databaseId'` (ambil `RUN_ID`)
   - `gh run watch <RUN_ID> --exit-status`
   - Bila watch gagal (exit non-nol): **STOP**, laporkan galat workflow apa adanya; jangan mengunduh artefak.
   - `gh run download <RUN_ID> --name app-release-apk --dir <proyek>/build/app/outputs/flutter-apk`
   - Jangan menambah parameter/flag lain tanpa perintah eksplisit pengguna.
4. **Review** —
   1. Verifikasi berkas APK hasil ada di `<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk` (via tool `glob`).
   2. Laporkan path berkas dan ukurannya (via shell `stat -c%s <berkas>` atau setara).
   3. Bila workflow gagal, run tidak ditemukan, atau berkas APK tidak ditemukan: **STOP**, laporkan galat apa adanya; jangan mencoba memperbaiki kode atau konfigurasi proyek/workflow.
5. Catat hasil ke berkas sesi aktif dan perbarui `MEMORI.md` sesuai skill `memori-check`.

## Format Laporan

| Tahap | Objek | Status | Hasil |
| --- | --- | --- | --- |
| 1 | `gh` pada PATH | Tersedia / Tidak | Lolos / STOP |
| 2 | Autentikasi `gh` (scope `workflow`) | Terautentikasi / Tidak | Lolos / STOP |
| 3 | Proyek target | `<path>` | Valid / STOP |
| 4 | Workflow `build-apk.yml` (GitHub) | Dapat diakses / Tidak | Lolos / STOP |
| 5 | Konfirmasi pengguna | Disetujui / Ditolak | Lanjut / STOP |
| 6 | `gh workflow run build-apk.yml` + `gh run watch` | Berhasil / Gagal | `<ringkasan galat bila gagal>` |
| 7 | `<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk` | Ada / Tidak | `<ukuran byte>` |

Sertakan path absolut APK hasil dan perintah persis yang dijalankan. Jangan mengarang path atau ukuran berkas.

## Larangan

- DILARANG menambah atau mengubah parameter workflow di luar yang sudah didefinisikan pada `.github/workflows/build-apk.yml` tanpa perintah eksplisit pengguna.
- DILARANG mem-build flavor, `.aab`, atau platform lain tanpa perintah eksplisit pengguna.
- DILARANG mengubah kode sumber, `pubspec.yaml`, konfigurasi Gradle/manifest, atau berkas workflow.
- DILARANG memindahkan, mengganti nama, mengunggah, atau menginstal APK hasil tanpa perintah eksplisit pengguna.
- DILARANG commit/push, termasuk direktori `build/`.
- DILARANG mengarang path atau ukuran APK tanpa verifikasi tool `glob`/`stat`.

## Kriteria Selesai / STOP

- Selesai bila workflow run berhasil, artefak APK `*-arm64-v8a-release.apk` terverifikasi ada, dan laporan (path + ukuran) disampaikan.
- STOP bila `gh` tidak tersedia/terautentikasi, tidak ada proyek kandidat yang valid, workflow tidak dapat diakses, pengguna menolak rencana, workflow gagal, run tidak ditemukan, atau APK hasil tidak ditemukan; sebutkan alasan dan tindakan yang disarankan, jangan memperbaiki sendiri.
