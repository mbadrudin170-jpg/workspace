diperbarui : Mon Nov 16 2026 21:31 WIB
file : [build_apk](../../.kilo/commands/build_apk.md)

1. Build APK release wajib via GitHub Actions workflow (`gh workflow run build-apk.yml`), bukan `flutter build apk` lokal, bila mesin tidak memiliki Android SDK.
2. Jika ada beberapa proyek Flutter (submodule) yang dapat di-build sebagai APK, tanyakan kepada pengguna repo mana yang ingin di-build.
3. Setelah pengguna mengonfirmasi rencana, jalankan workflow, pantau dengan `gh run watch <RUN_ID> --exit-status`, unduh artefak `app-release-apk`, lalu verifikasi path dan ukuran berkas sebelum melaporkan.
