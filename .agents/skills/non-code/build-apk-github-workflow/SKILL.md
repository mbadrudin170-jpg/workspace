---
name: build-apk-github-workflow
description: Trigger: saat membangun APK Android release atau memperbarui proses build APK | Panduan build APK release via GitHub Actions workflow (bukan build lokal): prasyarat `gh` terautentikasi dengan scope `workflow`, proyek wajib memiliki `.github/workflows/build-apk.yml`, konfigurasi tetap `--split-per-abi --target-platform android-arm64`, pemicuan `gh workflow run`, pemantauan `gh run watch --exit-status`, pengunduhan artefak `app-release-apk`, dan verifikasi berkas `<proyek>-arm64-v8a-release.apk`. Termasuk larangan build lokal tanpa Android SDK, perubahan flag tanpa perintah pengguna, dan commit direktori `build/`.
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Mon Nov 16 2026 21:31 WIB"
---

# Build APK via GitHub Actions Workflow

Membangun APK Android `release` (split per ABI, hanya `android-arm64`) melalui GitHub Actions workflow, bukan melalui `flutter build apk` lokal, agar tidak bergantung pada Android SDK di mesin pengembang.

## Cakupan yang Di-Cover

- Berkas workflow: `<proyek>/.github/workflows/build-apk.yml`
- Perintah GitHub CLI: `gh workflow run`, `gh run list`, `gh run watch`, `gh run download`
- Artefak: `app-release-apk`
- Berkas output: `<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk`
- Command terkait: `.kilo/commands/build_apk.md`

## Aturan

1. Pastikan `gh` terpasang dan terautentikasi dengan scope `workflow` sebelum memicu build (`gh auth status`).
2. Proyek target wajib memiliki `pubspec.yaml`, folder `android/`, dan `.github/workflows/build-apk.yml`; bila salah satu tidak ada, **STOP** dan laporkan.
3. Konfigurasi build pada workflow wajib tetap `flutter build apk --release --split-per-abi --target-platform android-arm64`.
4. Workflow wajib mengganti nama berkas hasil dari `app-arm64-v8a-release.apk` menjadi `<nama_proyek>-arm64-v8a-release.apk` sebelum mengunggah artefak.
5. Artefak wajib diunggah dengan nama `app-release-apk` (path: `build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk`, retention 14 hari).
6. Pemicuan build wajib melalui `gh workflow run build-apk.yml` (workdir = folder proyek), lalu tunggu penyelesaian dengan `gh run watch <RUN_ID> --exit-status`.
7. Pengambilan `RUN_ID` wajib dari `gh run list --workflow=build-apk.yml --limit=1` setelah jeda singkat (mis. `sleep 5`) agar run baru terdaftar.
8. Bila `gh run watch` gagal (exit non-nol), **STOP**, laporkan galat workflow apa adanya, dan jangan mengunduh artefak.
9. Pengunduhan artefak wajib melalui `gh run download <RUN_ID> --name app-release-apk --dir <proyek>/build/app/outputs/flutter-apk`.
10. Setelah pengunduhan, verifikasi berkas dengan tool `glob` dan laporkan path absolut serta ukuran (`stat -c%s`).

## Larangan

- DILARANG menjalankan `flutter build apk` lokal sebagai jalur utama bila mesin tidak memiliki Android SDK; gunakan workflow GitHub.
- DILARANG mengubah flag build di luar `--release --split-per-abi --target-platform android-arm64` tanpa perintah eksplisit pengguna.
- DILARANG mengubah kode sumber, `pubspec.yaml`, konfigurasi Gradle/manifest, atau berkas workflow tanpa perintah eksplisit pengguna.
- DILARANG memindahkan, mengganti nama, mengunggah, atau menginstal APK hasil tanpa perintah eksplisit pengguna.
- DILARANG commit/push, termasuk direktori `build/`.
- DILARANG mengarang path atau ukuran APK tanpa verifikasi tool `glob`/`stat`.

## Contoh Benar

```bash
# Workdir = folder proyek target
gh workflow run build-apk.yml
sleep 5
RUN_ID=$(gh run list --workflow=build-apk.yml --limit=1 --json databaseId -q '.[0].databaseId')
gh run watch "$RUN_ID" --exit-status
gh run download "$RUN_ID" --name app-release-apk --dir build/app/outputs/flutter-apk
```

```text
# Verifikasi hasil (via tool glob)
<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk
```

## Contoh Salah

```bash
# DILARANG: build lokal pada mesin tanpa Android SDK
flutter build apk --release --split-per-abi --target-platform android-arm64
```

```text
# DILARANG: mengarang path/ukuran APK tanpa verifikasi glob/stat
APK size: 18000000 bytes
```

## Sumber Evaluasi

- Commit `007b854` (ci(build): bangun APK release arm64 dengan split-per-abi) — menetapkan flag build dan path artefak `app-arm64-v8a-release.apk`.
- Commit `7295cda` (ci(build): ganti nama artefak APK menjadi `<nama_proyek>-arm64-v8a-release.apk`) — menetapkan langkah `mv` dan path artefak upload.
- Commit root `e3e40f4` (rename berkas APK hasil build) — penyesuaian laporan/path pada command.
- Berkas workflow nyata: `<proyek>/.github/workflows/build-apk.yml`.
- Command terkait: `.kilo/commands/build_apk.md`.
- Aturan global terkait: indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`); panduan tool bawaan: `.agents/skills/non-code/penggunaan-tool-bawaan-kilo/SKILL.md` (aturan prioritas lama `prioritas_tool_bawaan.md` sudah dihapus sesi 186).
