---
description: Membangun APK Android release proyek Flutter (split per ABI, hanya arm64) setelah pengguna memilih proyek target, lalu memverifikasi berkas APK hasil dan melaporkan lokasinya.
agent: code
---

# Build APK

## Tujuan

Membangun APK Android `release` dari proyek Flutter yang dipilih pengguna secara manual, dengan konfigurasi tetap: `--split-per-abi --target-platform android-arm64`. Command ini memastikan proyek target valid (memiliki `pubspec.yaml` dan folder `android/`), menjalankan proses build, lalu memverifikasi berkas APK hasil dan melaporkannya.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja — command ini mencatat ke berkas sesi dan `MEMORI.md`.
3. Skill lain yang trigger-nya terpenuhi: tidak ada — tidak ada skill khusus build APK di `SKILLS_INDEX.md`. Skill `build-runner-codegen` (`.agents/skills/custom/build-runner-codegen/SKILL.md`) **tidak** terkait karena command ini tidak menjalankan code generation.
4. Gunakan bahasa Indonesia baku pada seluruh laporan.
5. Tool bawaan diprioritaskan (`read`, `glob`, `grep`, `list`, `edit`, `write`) sesuai `.agents/rules/global/prioritas_tool_bawaan.md`; shell hanya untuk perintah `flutter`/`dart` dan pemeriksaan metadata berkas.
6. Jangan menggunakan terminal untuk membaca berkas sumber; gunakan tool `read`.

## Cakupan

- Workspace root tempat command dijalankan (mis. `/home/muhamadbadrudin1000/workspace`) dan seluruh proyek Flutter langsung di dalamnya (satu tingkat: `<root>/<proyek>/pubspec.yaml` + `<root>/<proyek>/android/`).
- Proyek pustaka tanpa folder `android/` (mis. `share_global_saya`) **dikecualikan** dari daftar kandidat build APK dan diberi keterangan eksplisit.
- Command ini tidak mem-build iOS, web, desktop, maupun app bundle (`.aab`).
- Command ini tidak mengubah kode sumber, dependensi, konfigurasi Gradle, atau `pubspec.yaml`.

## Parameter

- `$ARGUMENTS` (opsional): path proyek Flutter target, relatif terhadap workspace root atau path absolut (mis. `base_coc` atau `/home/muhamadbadrudin1000/workspace/base_coc`).
- Jika `$ARGUMENTS` kosong, tidak valid, atau tidak menunjuk proyek Flutter yang memiliki `android/`: tanyakan pilihan proyek kepada pengguna dengan tool `question` (opsi = seluruh folder satu tingkat di bawah workspace root yang punya `pubspec.yaml` **dan** `android/`); jangan menebak.

## Alur Kerja

1. **Analyze** —
   1. Verifikasi `flutter` tersedia: `which flutter`. Bila tidak tersedia: **STOP**.
   2. Tentukan proyek target: bila `$ARGUMENTS` terisi dan valid (folder ada, ada `pubspec.yaml`, ada `android/`), pakai itu; selain itu tanyakan via tool `question` dengan opsi hasil pindaian satu tingkat di bawah workspace root. Bila tidak ada satu pun kandidat yang valid: **STOP** dan laporkan.
2. **Plan** — tampilkan rencana kepada pengguna: proyek target, perintah yang akan dijalankan (`flutter build apk --release --split-per-abi --target-platform android-arm64` dengan working directory = folder proyek), dan perkiraan berkas output (`<proyek>/build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`). Minta konfirmasi pengguna sebelum melanjutkan; tanpa konfirmasi, **STOP**.
3. **Execute** — jalankan build dengan tool bash (working directory = folder proyek):
   - `flutter build apk --release --split-per-abi --target-platform android-arm64`
   - Jangan menambah flag lain (mis. `--obfuscate`, `--split-debug-info`, `--flavor`) tanpa perintah eksplisit pengguna.
4. **Review** —
   1. Verifikasi berkas APK hasil ada di `<proyek>/build/app/outputs/flutter-apk/app-arm64-v8a-release.apk` (via tool `glob`).
   2. Laporkan path berkas dan ukurannya (via shell `stat -c%s <berkas>` atau setara).
   3. Bila build gagal atau berkas APK tidak ditemukan: **STOP**, laporkan galat apa adanya; jangan mencoba memperbaiki kode atau konfigurasi proyek.
5. Catat hasil ke berkas sesi aktif dan perbarui `MEMORI.md` sesuai skill `memori-check`.

## Format Laporan

| Tahap | Objek | Status | Hasil |
| --- | --- | --- | --- |
| 1 | `flutter` pada PATH | Tersedia / Tidak | Lolos / STOP |
| 2 | Proyek target | `<path>` | Valid / STOP |
| 3 | Konfirmasi pengguna | Disetujui / Ditolak | Lanjut / STOP |
| 4 | `flutter build apk --release --split-per-abi --target-platform android-arm64` | Berhasil / Gagal | `<ringkasan galat bila gagal>` |
| 5 | `<proyek>/build/app/outputs/flutter-apk/app-arm64-v8a-release.apk` | Ada / Tidak | `<ukuran byte>` |

Sertakan path absolut APK hasil dan perintah persis yang dijalankan. Jangan mengarang path atau ukuran berkas.

## Larangan

- DILARANG menambah atau mengubah flag build di luar `--release --split-per-abi --target-platform android-arm64` tanpa perintah eksplisit pengguna.
- DILARANG mem-build flavor, `.aab`, atau platform lain tanpa perintah eksplisit pengguna.
- DILARANG mengubah kode sumber, `pubspec.yaml`, konfigurasi Gradle/manifest, atau berkas lain di proyek target.
- DILARANG memindahkan, mengganti nama, mengunggah, atau menginstal APK hasil tanpa perintah eksplisit pengguna.
- DILARANG commit/push, termasuk direktori `build/`.
- DILARANG mengarang path atau ukuran APK tanpa verifikasi tool `glob`/`stat`.

## Kriteria Selesai / STOP

- Selesai bila APK `app-arm64-v8a-release.apk` terverifikasi ada dan laporan (path + ukuran) disampaikan.
- STOP bila `flutter` tidak tersedia, tidak ada proyek kandidat yang valid, pengguna menolak rencana, build gagal, atau APK hasil tidak ditemukan; sebutkan alasan dan tindakan yang disarankan, jangan memperbaiki sendiri.
