# Sesi 176

Diperbarui: 2026-11-20

## Status

Status Sinkron: Belum Sinkron
Tanggal: 2026-11-20
Command: interaksi langsung (tanpa command)
Topik: Build APK release `admin_wifi` via GitHub Actions workflow dan verifikasi artefak.

## Catatan Sesi

- Hanya satu proyek Flutter dengan `lib/main.dart`: `admin_wifi`. `share_global_saya` adalah paket library tanpa `main.dart`, tidak perlu tanya pilihan repo.
- Root bukan proyek Flutter; build dilakukan di submodule `admin_wifi`.
- `gh` terautentikasi dengan scope `workflow` (setelah `gh auth login`).
- Workflow `build-apk.yml` di `admin_wifi/.github/workflows/` diubah melalui 4 commit:
  1. Checkout `share_global_saya` di workspace + symlink ke path dependency.
  2. Buat `.env` dummy sebelum `flutter analyze`.
  3. Hapus konfigurasi Firebase/google-services (pengguna tidak pakai Firebase).
  4. Sesuaikan nama file APK output Flutter 3.47 (`app-arm64-v8a-dev-release.apk`).
- Run terakhir (44803688312) **BERHASIL** dalam 8m20s.
- Artefak diunduh: `/tmp/apk/admin_wifi-dev-arm64-v8a-release.apk`, 25,999,362 bytes (~26.0 MB).

## Berkas Terdampak

| Lokasi File                                 | Status Perubahan | Deskripsi                                |
| ------------------------------------------- | ---------------- | ---------------------------------------- |
| admin_wifi/.github/workflows/build-apk.yml  | Diubah           | 4 perbaikan CI                           |
| admin_wifi/android/settings.gradle.kts      | Diubah           | Hapus plugin google-services             |
| admin_wifi/android/app/build.gradle.kts     | Diubah           | Hapus plugin google-services             |
| admin_wifi/android/app/google-services.json | Dihapus          | Berkas rahasia Firebase, tidak digunakan |

## Sinkronisasi ke MEMORI.md

Build APK release `admin_wifi` via GitHub Actions workflow (sesi 176).
