---
name: model-state-freezed-abstract
description: "Trigger: saat membuat model atau state Freezed | Panduan model/state Freezed abstract class: serialisasi JSON (part '*.freezed.dart' + '*.g.dart'), private constructor `._()` untuk getter/method, `@Default`, integrasi notifier Riverpod, serta model database (fromSqflite/toSqflite, ParserUtil, konversi UTC). Termasuk larangan mengedit berkas hasil generate."
metadata:
  kategori: "custom"
  versi: "2.0.0"
  diperbarui: "Sat Nov 14 2026 20:46:43 WIB"
  sumber-terakhir: "gabungan: commit b70ffda33ce6473e6309af8acd0c64b48c2d0404, acf4bb6dddc17ca633d551b2e9f5f62f39020d78, 804b307506389b678f09e7c2cb7bfb8f2aa94112 (state); commit 3b67d3095dacc4e5c7ea78d7eb251809e3e9d981, a15acd9603fe5d1251afa4acc3817e7e9c1607b1, a5beae01b86a4d9753963380818bc437c2b4741a, 2462af81050e12b2933717f457a33a5b05d3719f (model DB); SDK resmi package:freezed (contoh model JSON)"
---

# Membuat Model dan State dengan Freezed

Membuat model dan state immutable dengan paket Freezed (`freezed` 4.0.2, `freezed_annotation` 3.1.0) menggunakan `abstract class` beranotasi `@freezed`, beserta serialisasi JSON, integrasi notifier Riverpod, dan pola model database (SQLite). Freezed menghasilkan `copyWith`, `==`/`hashCode`, `toString`, serta (bila diperlukan) `fromJson`/`toJson` secara otomatis melalui `build_runner`.

## Cakupan yang Di-Cover

- Package: `freezed_annotation` (`package:freezed_annotation/freezed_annotation.dart`), `freezed` (dev/build), `riverpod_annotation` (`package:riverpod_annotation/riverpod_annotation.dart`)
- Class: kelas `abstract class` (atau `sealed class`) beranotasi `@freezed`, `_$Nama` (mixin hasil generate), `_Nama` (implementasi privat hasil generate)
- Properti: `@Default(...)` untuk nilai awal field, `part '*.freezed.dart'`, `part '*.g.dart'`
- Method: `copyWith`, `==`, `hashCode`, `toString`, `fromJson`, `toJson`, `fromSqflite`, `toSqflite` (dihasilkan/ditulis sesuai pola)
- Version: `freezed` `4.0.2`, `freezed_annotation` `3.1.0`

## Aturan

1. Model dan state yang dibuat dengan Freezed wajib menggunakan `abstract class` (atau `sealed class`) beranotasi `@freezed`, bukan `class` biasa.
2. Tambahkan `part '<nama>.freezed.dart';` di berkas sumber. Bila memakai JSON, tambahkan juga `part '<nama>.g.dart';`.
3. Gunakan `const factory` untuk setiap varian/konstruktor. Untuk satu varian, cukup satu `const factory` dengan nama sama seperti kelas.
4. Gunakan `@Default(nilai)` untuk memberi nilai awal field; jangan menulis logika di dalam ekspresi `@Default`.
5. Bila kelas membutuhkan getter atau method, deklarasikan constructor privat `const Nama._();` di dalam body kelas, lalu tulis getter/method biasa.
6. Untuk serialisasi JSON, anotasi setiap field dengan `@JsonKey(name: '...')` bila nama kolom berbeda dari nama field, dan sediakan `factory Nama.fromJson(Map<String, dynamic> json)` (dihasilkan Freezed) serta `Map<String, dynamic> toJson()`.
7. Model database wajib menyediakan factory `fromSqflite(Map<String, Object?> row)` dan method `toSqflite()` untuk konversi ke/dari SQLite.
8. Parsing nilai dari database wajib menggunakan `ParserUtil`.
9. Konversi tanggal ke UTC wajib dilakukan di `toSqflite()` (`toUtc().toIso8601String()`), dan konversi ke lokal wajib dilakukan di `fromSqflite()` (`parseDateTime(...)?.toLocal()`).
10. Field bertipe enum wajib diparse dengan `ParserUtil.safeParseEnum(TelEnum.values, ParserUtil.parseStringOrNull(row[NamaKolom.kolom]))`, dengan fallback nilai default yang valid bila tersimpan `null`/tidak dikenal (mis. `JenisIntervensiSos.napas478`), kecuali kolom boleh `null` — untuk kolom nullable cukup kembalikan `null` tanpa fallback.
11. Nilai enum yang dipersistenkan ke kolom `TEXT` wajib `lowerCamelCase` (`berhasilMenahan`, `timer3Menit`) dan konsisten dengan migrasi data (lihat skill `migrasi-skema-sqlite`); nilai `snake_case` lama tidak boleh muncul di enum baru.
12. Kolom yang nullable di database wajib dipetakan ke properti nullable di model (`String?`, `HasilIntervensiSos?`) dan diparse dengan `ParserUtil.parseStringOrNull` / `safeParseEnum` tanpa fallback paksa.
13. Untuk state Riverpod, kombinasikan `@freezed` pada kelas state dengan notifier `@Riverpod(keepAlive: true)`; `build()` mengembalikan instance state default.
14. Jalankan `build_runner` untuk menghasilkan berkas `*.freezed.dart` dan `*.g.dart` setelah menulis/mengubah sumber. Workflow: `dart pub get` → `dart run build_runner build --delete-conflicting-outputs` → `dart format .` → `dart analyze`.
15. Verifikasi kebenaran dengan `dart format`, `dart analyze`, dan `flutter test` bila relevan.

## Steps

1. Tambahkan dependensi `freezed_annotation` (dependencies) dan `freezed` + `build_runner` (dev_dependencies) di `pubspec.yaml`.
2. Buat berkas sumber model/state dengan anotasi `@freezed`, `part '*.freezed.dart'` (dan `*.g.dart` bila JSON).
3. Tulis `abstract class` dengan `const factory` dan `@Default`; tambahkan `const Nama._();` bila ada getter/method.
4. Untuk model database, sediakan `fromSqflite`/`toSqflite` (dengan `ParserUtil` dan konversi UTC) dan/atau `fromJson`/`toJson` untuk JSON.
5. Jalankan `dart run build_runner build --delete-conflicting-outputs` untuk menghasilkan berkas generate.
6. Jalankan `dart format .` dan `dart analyze`; perbaiki temuan.
7. Jangan edit berkas `*.freezed.dart` / `*.g.dart` secara manual; ubah sumber lalu jalankan ulang `build_runner`.

## Larangan

- DILARANG menulis model/state sebagai `class` biasa tanpa anotasi `@freezed` bila ingin memakai fitur Freezed.
- DILARANG mengedit berkas hasil generate (`*.freezed.dart`, `*.g.dart`) secara manual.
- DILARANG menulis logika di dalam `@Default(...)`.
- DILARANG menambahkan `part '*.g.dart'` tanpa membuat field yang memerlukan serialisasi JSON (atau tanpa `json_serializable`).
- DILARANG menjalankan `build_runner` tanpa `--delete-conflicting-outputs` bila ada berkas generate lama yang bentrok.
- DILARANG melakukan parsing `dynamic` dari database secara langsung tanpa `ParserUtil`.
- DILARANG menyimpan waktu lokal seolah-olah UTC.
- DILARANG memparse enum dari database dengan cast/string matching langsung tanpa `ParserUtil.safeParseEnum`.
- DILARANG persistenkan nilai enum `snake_case` ke kolom database.

## Contoh Benar

State Freezed dengan getter, `@Default`, private constructor, dan notifier Riverpod (pola dari commit repo):

```dart
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_debug_notifier.freezed.dart';
part 'log_debug_notifier.g.dart';

@freezed
abstract class LogDebugState with _$LogDebugState {
  const LogDebugState._();

  const factory LogDebugState({
    @Default([]) List<LogDebugModel> listLogDebug,
  }) = _LogDebugState;

  List<LogDebugModel> getListError() {
    return listLogDebug.where((log) => log.tipeLog == TipeLog.error).toList();
  }
}

@Riverpod(keepAlive: true)
class LogDebugNotifier extends _$LogDebugNotifier {
  @override
  Future<LogDebugState> build() async {
    return const LogDebugState();
  }
}
```

Model Freezed dengan serialisasi JSON (pola SDK resmi package:freezed):

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'produk.freezed.dart';
part 'produk.g.dart';

@freezed
abstract class Produk with _$Produk {
  const factory Produk({
    required String id,
    required String nama,
    @Default(0) int harga,
  }) = _Produk;

  factory Produk.fromJson(Map<String, dynamic> json) => _$ProdukFromJson(json);
}
```

Model database Freezed dengan `fromSqflite`/`toSqflite`, `ParserUtil`, dan konversi UTC (pola dari commit repo):

```dart
@freezed
abstract class DiaryCravingModel with _$DiaryCravingModel {
  const DiaryCravingModel._();
  const factory DiaryCravingModel({...}) = _DiaryCravingModel;

  factory DiaryCravingModel.fromSqflite(Map<String, Object?> row) {...}
  Map<String, Object?> toSqflite() {...}
}
```

## Contoh Salah

```dart
// DILARANG: kelas biasa tanpa anotasi @freezed, freezed tidak berlaku
class Produk {
  final String id;
  Produk({required this.id});
}
```

```dart
// DILARANG: logika di dalam @Default
const factory Produk({
  @Default(1 + 1) int harga, // salah: @Default harus nilai konstan sederhana
}) = _Produk;
```

```dart
@freezed
class DiaryCravingModel with _$DiaryCravingModel { ... } // salah: class biasa, bukan abstract
```

```dart
// DILARANG: mengedit berkas hasil generate secara manual
// lib/produk.freezed.dart (GENERATED CODE - DO NOT MODIFY BY HAND)
```

## Sumber Evaluasi

- File state (commit): `share_global_saya/lib/log_debug/log_debug_notifier.dart`, `share_global_saya/lib/log_debug/log_debug_notifier.freezed.dart`, `share_global_saya/lib/log_debug/log_debug_notifier.g.dart`
- File model DB (commit): `lib/fitur/diary_craving/model/diary_craving_model.dart`, `lib/fitur/diary_craving/state/diary_craving_state.dart`, `lib/fitur/sos_craving/model/sos_intervensi_model.dart`, `lib/fitur/rencana_darurat/model/rencana_darurat_model.dart` (proyek `berhenti_merokok`)
- File model JSON (SDK resmi package:freezed): contoh `produk.freezed.dart` / `produk.g.dart` (dokumentasi resmi Freezed, bukan dari commit repo)
- Kelas terkait: `LogDebugState`, `_LogDebugState`, `_$LogDebugState`, `LogDebugNotifier`, `_$LogDebugNotifier`, `DiaryCravingModel`, `SosIntervensiModel`, `RencanaDaruratModel`
- Dependensi (commit): `share_global_saya/pubspec.yaml` (`freezed_annotation ^3.1.0`, `freezed ^4.0.2`, `build_runner ^2.16.2`, `riverpod_generator ^4.0.9`)
- Commit rujukan (state): `b70ffda33ce6473e6309af8acd0c64b48c2d0404`, `acf4bb6dddc17ca633d551b2e9f5f62f39020d78`, `804b307506389b678f09e7c2cb7bfb8f2aa94112`
- Commit rujukan (model DB): `3b67d3095dacc4e5c7ea78d7eb251809e3e9d981`, `a15acd9603fe5d1251afa4acc3817e7e9c1607b1`, `a5beae01b86a4d9753963380818bc437c2b4741a`, `2462af81050e12b2933717f457a33a5b05d3719f`