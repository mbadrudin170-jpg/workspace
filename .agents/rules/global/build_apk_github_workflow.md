# Build APK via GitHub Workflow (Aturan Global)

Menetapkan standar build APK Android `release` (split per ABI, hanya `android-arm64`) melalui GitHub Actions workflow, bukan melalui `flutter build apk` lokal, agar tidak bergantung pada Android SDK di mesin pengembang dan konsisten dengan command `.kilo/commands/build_apk.md`.

## Tujuan

1. Menjadikan GitHub Actions workflow `build-apk.yml` sebagai jalur build APK release yang standar.
2. Mencegah kegagalan build akibat Android SDK tidak tersedia di mesin lokal.
3. Menyeragamkan verifikasi hasil build (path, ukuran, artefak).

## Cakupan

- Proyek Flutter dengan folder `android/` dan berkas `.github/workflows/build-apk.yml`.
- Command terkait: `.kilo/commands/build_apk.md`.
- Skill terkait: `.agents/skills/custom/bangun-apk-github-workflow/SKILL.md`.

## Aturan

1. Build APK release wajib dipicu melalui `gh workflow run build-apk.yml` (workdir = folder proyek), bukan `flutter build apk` lokal, bila mesin tidak memiliki Android SDK.
2. Sebelum memicu workflow, verifikasi `gh` terpasang dan terautentikasi dengan scope `workflow` (`gh auth status`).
3. Proyek target wajib memiliki `pubspec.yaml`, folder `android/`, dan `.github/workflows/build-apk.yml`; bila salah satu tidak ada, **STOP** dan laporkan.
4. Konfigurasi build pada workflow wajib tetap `flutter build apk --release --split-per-abi --target-platform android-arm64`.
5. Workflow wajib mengganti nama berkas hasil dari `app-arm64-v8a-release.apk` menjadi `<nama_proyek>-arm64-v8a-release.apk` sebelum mengunggah artefak.
6. Artefak wajib diunggah dengan nama `app-release-apk`.
7. Setelah run selesai (`gh run watch <RUN_ID> --exit-status`), artefak wajib diunduh dengan `gh run download <RUN_ID> --name app-release-apk --dir <proyek>/build/app/outputs/flutter-apk`.
8. Hasil wajib diverifikasi dengan tool bawaan (`glob`/`stat`) sebelum dilaporkan; path dan ukuran tidak boleh dikarang.
9. Bila workflow gagal, **STOP**, laporkan galat apa adanya, dan jangan mengunduh artefak.

## Larangan

- DILARANG menjalankan `flutter build apk` lokal sebagai jalur utama tanpa alasan eksplisit dan tanpa Android SDK tersedia.
- DILARANG mengubah flag build di luar `--release --split-per-abi --target-platform android-arm64` tanpa perintah eksplisit pengguna.
- DILARANG mengubah kode sumber, `pubspec.yaml`, konfigurasi Gradle/manifest, atau berkas workflow tanpa perintah eksplisit pengguna.
- DILARANG commit/push, termasuk direktori `build/`.
- DILARANG mengarang path atau ukuran APK tanpa verifikasi tool `glob`/`stat`.

## Sumber Evaluasi

- Skill terkait: `.agents/skills/custom/bangun-apk-github-workflow/SKILL.md`
- Command terkait: `.kilo/commands/build_apk.md`
- Berkas workflow nyata: `<proyek>/.github/workflows/build-apk.yml`
- Commit rujukan: `007b854`, `7295cda`, root `e3e40f4`
- Aturan terkait: `.agents/rules/global/prioritas_tool_bawaan.md`
