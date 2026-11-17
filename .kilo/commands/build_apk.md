description: Build APK release via GitHub Actions workflow dan verifikasi artefak.

# Build APK

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Build APK release wajib via GitHub Actions workflow (`gh workflow run build-apk.yml`), bukan `flutter build apk` lokal, bila mesin tidak memiliki Android SDK.
4. Jika ada beberapa proyek Flutter (submodule) yang dapat di-build sebagai APK, tanyakan kepada pengguna repo mana yang ingin di-build.
5. Setelah pengguna mengonfirmasi rencana, jalankan workflow, pantau dengan `gh run watch <RUN_ID> --exit-status`, unduh artefak `app-release-apk`, lalu verifikasi path dan ukuran berkas sebelum melaporkan.

# Skill Terkait

- build-apk-github-workflow
- memori-check
