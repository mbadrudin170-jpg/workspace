---
name: build-runner-codegen
description: "Gunakan ini saat menjalankan atau memperbaiki proses code generation build_runner (Freezed, Riverpod, mock, JSON) | Panduan eksekusi build_runner: direktori paket, perintah build/watch, larangan edit berkas hasil generate, penanganan konflik output, dan pembatasan keluaran dengan --build-filter. Aturan: jalankan dari direktori proyek/paket yang memiliki pubspec.yaml; setelah ubah sumber codegen atau pull yang mengubah hasil generate, jalankan dart run build_runner build; gunakan watch saat pengembangan dan build untuk sekali jalan; ubah hanya berkas sumber, *.g.dart, *.freezed.dart, *.mocks.dart dilarang diedit manual; jika output bentrok, hapus berkas hasil generate bentrok/terkait lalu jalankan ulang tanpa filter; jalankan pada paket terdampak; dengan --build-filter gunakan glob berkas hasil generate valid, bukan path berkas sumber; dilarang --build-filter saat ada berkas hasil generate terlacak git di luar filter karena dianggap conflicting dan dihapus; --delete-conflicting-outputs sudah dihapus dan diabaikan"
---

# Skill: build-runner-codegen

Panduan ringkas menjalankan `build_runner` untuk code generation pada proyek/paket Dart atau Flutter.

## Cakupan yang Di-Cover

- Eksekusi `dart run build_runner build` dan mode `watch`.
- Pemicu umum: Freezed, anotasi Riverpod (`@riverpod`/`@Riverpod`), `@GenerateMocks`, `@JsonSerializable`, atau pull yang mengubah berkas hasil generate.
- Larangan mengubah berkas hasil generate (`*.g.dart`, `*.freezed.dart`, `*.mocks.dart`).
- Penanganan output bentrok dan pembatasan keluaran dengan `--build-filter`.

## Aturan

1. Jalankan perintah dari direktori proyek/paket yang memiliki `pubspec.yaml` (mis. `cd <direktori-proyek>`).
2. Setelah ubah/menambah sumber codegen atau setelah pull yang mengubah berkas hasil generate, jalankan `dart run build_runner build`.
3. Gunakan `watch` hanya saat pengembangan; gunakan `build` untuk sekali jalan.
4. Ubah hanya berkas sumber; `*.g.dart`, `*.freezed.dart`, `*.mocks.dart` DILARANG diedit manual.
5. Jika output bentrok, hapus berkas hasil generate yang bentrok/terkait lalu jalankan ulang tanpa filter.
6. Jalankan `build_runner` pada paket terdampak; bila perlu membatasi keluaran, gunakan `--build-filter` dengan glob berkas hasil generate yang valid (bukan argumen path berkas sumber).
7. DILARANG menjalankan `build_runner` dengan `--build-filter` saat ada berkas hasil generate terlacak git yang TIDAK masuk filter - berkas di luar filter dianggap "conflicting" dan DIHAPUS oleh build_runner. Insiden 2026-11-18: dengan `--build-filter` hanya untuk 11 berkas `lib/model/*.freezed.dart`, berkas `pelanggan_aktif_state.freezed.dart`, `pengguna_aktif_notifier.g.dart`, dan 8 berkas `*_test.mocks.dart` (semuanya terlacak git) ikut terhapus dan harus dipulihkan dari HEAD dengan `git checkout --`. `--build-filter` hanya boleh untuk output baru/lokal yang tidak menyentuh berkas terlacak; setelah build dengan filter, wajib verifikasi `git status` dan pulihkan penghapusan tak diinginkan via `git checkout -- <berkas>`.
8. Opsi `--delete-conflicting-outputs` sudah DIHAPUS dan diabaikan pada build_runner versi terkini (warning: "These options have been removed and were ignored").

## Contoh Benar

```bash
cd <direktori-proyek>
dart run build_runner build
```

```bash
# Membatasi keluaran ke berkas hasil generate tertentu (hanya untuk output
# baru/lokal yang TIDAK menyentuh berkas generated terlacak git; setelahnya
# wajib verifikasi `git status`)
dart run build_runner build \
  --build-filter="lib/kopi.g.dart" \
  --build-filter="lib/kopi.freezed.dart"
```

## Contoh Salah

```bash
# DILARANG: menjalankan di luar direktori paket (tanpa pubspec.yaml)
dart run build_runner build --delete-conflicting-outputs
```

```bash
# DILARANG: menunjuk berkas sumber sebagai argumen atau perintah tidak valid
dart run build_runner /lib/kopi.dart
```

```dart
// DILARANG: mengedit berkas hasil generate secara manual
// *.g.dart, *.freezed.dart, *.mocks.dart
```

```bash
# DILARANG: --build-filter saat ada berkas generated terlacak git di luar filter
# (berkas di luar filter dianggap "conflicting" dan DIHAPUS)
dart run build_runner build --build-filter="lib/model/kopi_model.freezed.dart"
```
