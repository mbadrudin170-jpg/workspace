diperbarui : Mon Nov 16 2026 12:05 WIB
file : [build-apk-github-workflow](../../.agents/skills/custom/build-apk-github-workflow/SKILL.md)

1. Sebelum build, periksa `gh` terpasang dan terautentikasi dengan scope `workflow`.
2. Proyek target wajib memiliki `pubspec.yaml`, folder `android/`, dan `.github/workflows/build-apk.yml`; jika tidak ada, STOP dan laporkan.
3. Validasi isi workflow: konfigurasi build tetap `--release --split-per-abi --target-platform android-arm64`, rename artefak `app-arm64-v8a-release.apk` → `<nama_proyek>-arm64-v8a-release.apk`, dan artefak diunggah dengan nama `app-release-apk`.
4. Build APK release wajib via GitHub Actions workflow (`gh workflow run build-apk.yml`), bukan `flutter build apk` lokal, bila mesin tidak memiliki Android SDK.
5. Pemicuan dan pemantauan: jalankan `gh workflow run build-apk.yml` (workdir = folder proyek), ambil `RUN_ID` dari `gh run list`, lalu `gh run watch <RUN_ID> --exit-status`.
6. Jika workflow gagal, STOP, laporkan galat apa adanya, dan jangan unduh artefak.
7. Unduh artefak dengan `gh run download <RUN_ID> --name app-release-apk --dir <proyek>/build/app/outputs/flutter-apk`.
8. Verifikasi berkas hasil dengan `glob`/`stat`, lalu laporkan path absolut dan ukuran (byte) tanpa mengarang.
9. Dilarang mengubah flag build, kode, konfigurasi, atau berkas workflow tanpa perintah eksplisit pengguna; dilarang commit/push termasuk direktori `build/`.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

- Sumber: `.agents/skills/custom/build-apk-github-workflow/SKILL.md`, `.kilo/commands/build_apk.md`, `.agents/rules/global/build_apk_github_workflow.md`.
