---
name: build-runner-codegen
description: "Trigger: saat menjalankan atau memperbaiki proses code generation build_runner (Freezed, Riverpod, mock, JSON) | Panduan eksekusi build_runner: direktori paket, perintah build/watch, larangan edit berkas hasil generate, penanganan konflik output, dan pembatasan keluaran dengan --build-filter."
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
2. Setelah ubah/menambah sumber codegen atau setelah pull yang mengubah berkas hasil generate, jalankan `dart run build_runner build --delete-conflicting-outputs`.
3. Gunakan `watch --delete-conflicting-outputs` hanya saat pengembangan; gunakan `build` untuk sekali jalan.
4. Ubah hanya berkas sumber; `*.g.dart`, `*.freezed.dart`, `*.mocks.dart` DILARANG diedit manual.
5. Jika output bentrok, hapus berkas hasil generate yang bentrok/terkait lalu jalankan ulang dengan `--delete-conflicting-outputs`.
6. Jalankan `build_runner` pada paket terdampak; bila perlu membatasi keluaran, gunakan `--build-filter` dengan glob berkas hasil generate yang valid (bukan argumen path berkas sumber).

## Contoh Benar

```bash
cd <direktori-proyek>
dart run build_runner build --delete-conflicting-outputs
```

```bash
# Membatasi keluaran ke berkas hasil generate tertentu
dart run build_runner build --delete-conflicting-outputs \
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

## Sumber Evaluasi

- Sumber poin: `prompt/skill/build-runner-codegen.md` (diselaraskan sesi 224, 2026-11-17).
- Rujukan paket: `build_runner` (Dart) — perintah build/watch dan opsi `--build-filter`.
- Skill terkait: `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`, `.agents/skills/custom/aturan-folder-prompt/SKILL.md`.
