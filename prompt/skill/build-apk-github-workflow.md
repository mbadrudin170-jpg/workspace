diperbarui : Thu Nov 19 2026 23:35 WIB
file : [build-apk-github-workflow](../../.agents/skills/non-code/build-apk-github-workflow/SKILL.md)

1. Sebelum build, periksa `gh` terpasang dan terautentikasi dengan scope `workflow`.
2. Proyek target wajib memiliki `pubspec.yaml`, folder `android/`, dan `.github/workflows/build-apk.yml`; jika tidak ada, STOP dan laporkan.
3. Validasi isi workflow: konfigurasi build tetap `--release --split-per-abi --target-platform android-arm64`, rename artefak `app-arm64-v8a-release.apk` → `<nama_proyek>-arm64-v8a-release.apk`, dan artefak diunggah dengan nama `app-release-apk`.
4. Build APK release wajib via GitHub Actions workflow (`gh workflow run build-apk.yml`), bukan `flutter build apk` lokal, bila mesin tidak memiliki Android SDK.
5. Pemicuan dan pemantauan: jalankan `gh workflow run build-apk.yml` (workdir = folder proyek), ambil `RUN_ID` dari `gh run list`, lalu `gh run watch <RUN_ID> --exit-status`.
6. Jika workflow gagal, STOP, laporkan galat apa adanya, dan jangan unduh artefak.
7. Unduh artefak dengan `gh run download <RUN_ID> --name app-release-apk --dir <proyek>/build/app/outputs/flutter-apk`.
8. Verifikasi berkas hasil dengan `glob`/`stat`, lalu laporkan path absolut dan ukuran (byte) tanpa mengarang.
9. Dilarang mengubah flag build, kode, konfigurasi, atau berkas workflow tanpa perintah eksplisit pengguna; dilarang commit/push termasuk direktori `build/`.

10. Bila terdapat lebih dari satu proyek Flutter (submodule) yang dapat di-build, tanyakan repo target kepada pengguna sebelum menjalankan workflow.

11. Sebelum memicu workflow, periksa kompatibilitas versi Java (runner default) dengan Gradle yang dipakai; peringatkan bila tidak kompatibel.

12. Saat memeriksa prasyarat berkas (mis. `.github/workflows/build-apk.yml`), verifikasi path secara langsung (tool `read`/`glob` absolut) selain mengandalkan glob relatif; jangan menyimpulkan berkas tidak ada tanpa verifikasi langsung, terutama pada folder hidden (`.github`, `.kilo`, `.agents`).

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

- Sumber: `.agents/skills/non-code/build-apk-github-workflow/SKILL.md`, `.kilo/commands/build_apk.md` (aturan lama `build_apk_github_workflow.md` sudah dihapus).
