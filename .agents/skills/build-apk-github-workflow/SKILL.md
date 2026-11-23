---
name: build-apk-github-workflow
description: Gunakan ini saat membangun APK Android release atau memperbarui proses build APK | Panduan build APK release via GitHub Actions workflow (bukan build lokal): prasyarat `gh` terautentikasi dengan scope `workflow`, proyek wajib memiliki `.github/workflows/build-apk.yml`, konfigurasi tetap `--split-per-abi --target-platform android-arm64`, pemicuan `gh workflow run`, pemantauan `gh run watch --exit-status`, pengunduhan artefak `app-release-apk`, dan verifikasi berkas `<proyek>-arm64-v8a-release.apk`. Termasuk larangan build lokal tanpa Android SDK, perubahan flag tanpa perintah pengguna, dan commit direktori `build/`. Build APK via GitHub Actions Workflow Membangun APK Android `release` (split per ABI, hanya `android-arm64`) melalui GitHub Actions workflow, bukan melalui `flutter build apk` lokal, agar tidak bergantung pada Android SDK di mesin pengembang. Cakupan yang Di-Cover - Berkas workflow: `<proyek>/.github/workflows/build-apk.yml` - Perintah GitHub CLI: `gh workflow run`, `gh run list`, `gh run watch`, `gh
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
10. Setelah pengunduhan, pindahkan (bukan salin) APK ke folder `apk/` di root proyek (mis. `mv`/`install`) agar berkas lama tidak tersisa, lalu verifikasi berkas dengan tool `glob` dan laporkan path absolut serta ukuran (`stat -c%s`).
11. Bila terdapat lebih dari satu proyek Flutter (submodule) yang dapat di-build, tanyakan repo target kepada pengguna sebelum menjalankan workflow.
12. Sebelum memicu workflow, periksa kompatibilitas versi Java (runner default) dengan Gradle yang dipakai (gradle-wrapper.properties / workflow); peringatkan bila tidak kompatibel.
13. Saat memeriksa prasyarat berkas (mis. `.github/workflows/build-apk.yml`), verifikasi path secara langsung (tool `read`/`glob` absolut) selain mengandalkan glob relatif; jangan menyimpulkan berkas tidak ada tanpa verifikasi langsung, terutama pada folder hidden (`.github`, `.kilo`, `.agents`).

## Masalah Umum dan Solusi

- **`androidx.core:core` memerlukan `compileSdk` 37**: naikkan `compileSdk` di `android/app/build.gradle.kts` ke `37` (dependensi membutuhkan API 37); `flutter.compileSdkVersion` (36) tidak cukup.
- **AGP/Kotlin/Gradle tidak kompatibel**: gunakan AGP 9.1.0 + Kotlin 2.4.0 + Gradle 9.3.1, atau AGP 8.13.0 + Gradle 8.14.3 + Kotlin 2.3.20 sesuai kebutuhan; periksa `gradle-wrapper.properties` dan `settings.gradle.kts`.
- **`kotlinOptions` deprecated**: migrasikan ke `kotlin { compilerOptions { jvmTarget.set(...) } }`.
- **Java version mismatch**: set `sourceCompatibility`/`targetCompatibility` ke `JavaVersion.VERSION_17` dan `jvmTarget` ke `JVM_17`.
- **AGP 9.x new DSL**: tambahkan `android.newDsl=false` dan `android.builtInKotlin=false` di `gradle.properties` agar DSL lama tetap berjalan.
- **`flutter_local_notifications` butuh desugaring**: aktifkan `isCoreLibraryDesugaringEnabled = true` dan tambahkan `coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")`.
- **`.gitignore`**: tambahkan `/apk/` dan `/build/` agar artefak hasil build tidak ter-track dan tidak menyebabkan push gagal.
- **APK tidak muncul di IDE**: folder `build/` diabaikan oleh `.gitignore`; gunakan terminal (`ls`/`stat`) untuk verifikasi, jangan ubah `.gitignore` hanya untuk menampilkan.

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
