---
name: model-state-freezed-abstract
description: "Trigger: saat membuat model atau state Freezed | Panduan model/state Freezed abstract class: serialisasi JSON (part '*.freezed.dart' + '*.g.dart'), private constructor `._()` untuk getter/method, `@Default` (literal konstan untuk String/koleksi), pengosongan field nullable via `copyWith(field: null)` sentinel codegen (tanpa bendera `clearField` manual), integrasi notifier Riverpod, serta model database (fromSqflite/toSqflite, ParserUtil, konversi UTC, larangan fallback enum diam-diam yang menandakan sukses). Termasuk larangan mengedit berkas hasil generate."
metadata:
  kategori: "custom"
  versi: "2.5.0"
  diperbarui: "Thu Nov 19 2026 03:26 WIB"
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
4. Gunakan `@Default(nilai)` untuk memberi nilai awal field; jangan menulis logika di dalam ekspresi `@Default`. Untuk `String` dan koleksi wajib memakai literal konstan sederhana (`@Default('')`, `@Default([])`, `@Default(<Tag>{})`).
5. Bila kelas membutuhkan getter atau method, deklarasikan constructor privat `const Nama._();` di dalam body kelas, lalu tulis getter/method biasa.
6. Untuk serialisasi JSON, anotasi setiap field dengan `@JsonKey(name: '...')` bila nama kolom berbeda dari nama field, dan sediakan `factory Nama.fromJson(Map<String, dynamic> json)` (dihasilkan Freezed) serta `Map<String, dynamic> toJson()`.
7. Model database wajib menyediakan factory `fromSqflite(Map<String, Object?> row)` dan method `toSqflite()` untuk konversi ke/dari SQLite.
8. Parsing nilai dari database wajib menggunakan `ParserUtil`.
9. Konversi tanggal ke UTC wajib dilakukan di `toSqflite()` (`toUtc().toIso8601String()`), dan konversi ke lokal wajib dilakukan di `fromSqflite()` (`parseDateTime(...)?.toLocal()`).
10. Field bertipe enum wajib diparse dengan `ParserUtil.safeParseEnum(TelEnum.values, ParserUtil.parseStringOrNull(row[NamaKolom.kolom]))`, dengan fallback nilai default yang valid bila tersimpan `null`/tidak dikenal, kecuali kolom boleh `null` — untuk kolom nullable cukup kembalikan `null` tanpa fallback. **Fallback DILARANG diam-diam memilih nilai yang menandakan sukses/selesai/lunas** (mis. `lunas`, `berhasil`, `selesai`); wajib memilih default konservatif (mis. `belumLunas`, `proses`) atau melempar `ArgumentError` — nilai enum tidak dikenal harus terlihat, bukan tersembunyi di balik nilai sukses.
11. Nilai enum yang dipersistenkan ke kolom `TEXT` wajib `lowerCamelCase` (`berhasilMenahan`, `timer3Menit`) dan konsisten dengan migrasi data (lihat skill `migrasi-skema-sqlite`); nilai `snake_case` lama tidak boleh muncul di enum baru.
12. Kolom yang nullable di database wajib dipetakan ke properti nullable di model (`String?`, `HasilIntervensiSos?`) dan diparse dengan `ParserUtil.parseStringOrNull` / `safeParseEnum` tanpa fallback paksa.
13. Untuk state Riverpod, kombinasikan `@freezed` pada kelas state dengan notifier `@Riverpod(keepAlive: true)`; `build()` mengembalikan instance state default.
14. Field nullable pada state Freezed yang perlu bisa dikosongkan (mis. filter Town Hall/tipe) wajib mengandalkan sentinel `copyWith` dari codegen: panggil `copyWith(field: null)` untuk menghapus nilai. Jangan membuat bendera manual `clearField`/`clearTags` pada state Freezed.
15. Jalankan `build_runner` untuk menghasilkan berkas `*.freezed.dart` dan `*.g.dart` setelah menulis/mengubah sumber. Workflow: `dart pub get` → `dart run build_runner build --delete-conflicting-outputs` → `dart format .` → `dart analyze`.
16. Verifikasi kebenaran dengan `dart format`, `dart analyze`, dan `flutter test` bila relevan.
17. Model yang belum Freezed dan memiliki pasangan `fromSqlite`/`toSqlite` (dan/atau `fromFirebase`/`toFirebase`) wajib dikonversi ke struktur Freezed (`abstract class` + `part '<model>.freezed.dart'` + `const factory X({...}) = _X;`, serta `const X._();` bila ada factory/method); manual `copyWith` WAJIB dihapus (di-generate); `id` wajib `required String` non-nullable — DILARANG auto-UUID di dalam model (UUID wajib disuplai oleh pemanggil); field bernilai default lama memakai `@Default`.
18. Seluruh parsing nilai dari database WAJIB lewat `ParserUtil`: `parseString`/`parseStringOrNull` (DILARANG cast `as String`/`as num`), `parseBool`, `parseInt`/`parseIntOrNull`, `parseDouble`; enum lewat `safeParseEnum` + `parseStringOrNull` (DILARANG `firstWhere`/`byName` langsung pada nilai DB).
19. Nilai `Timestamp` dari Firestore (atau tipe setara `cloud_firestore`) wajib dinormalisasi lewat helper private (mis. `_parseTanggal`): `value is Timestamp` → `value.toDate().toLocal()`; selain itu `ParserUtil.parseDateTime(value)?.toLocal()`. Paket bersama yang bersifat generik dan dipakai lintas proyek tidak boleh mengimpor `cloud_firestore` hanya untuk parsing tanggal. Shared util lintas proyek juga DILARANG memuat deteksi domain/Firebase (mis. duck-typing `toDate()`, pengecekan `NoSuchMethodError` untuk `Timestamp`); konversi tipe domain hanya berada di adapter model.
20. Kolom/field tanggal yang wajib non-null wajib divalidasi eksplisit; bila gagal parse, lemparkan `ArgumentError` khusus — DILARANG fallback `DateTime.now()`.
21. Nama field Firestore WAJIB sama persis dengan kolom SQLite (umumnya snake_case); TIDAK ADA konstanta khusus Firestore dengan nama berbeda — memakai konstanta Skema yang sama (lihat skill `konstanta-skema-tabel`).

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
- DILARANG fallback enum non-nullable yang diam-diam memilih nilai sukses/selesai/lunas (mis. `orElse: () => StatusPembayaranEnum.lunas`); wajib default konservatif (mis. `belumLunas`) atau melempar `ArgumentError` (Aturan 10).
- DILARANG persistenkan nilai enum `snake_case` ke kolom database.
- DILARANG membuat bendera manual `clearField`/`clearTags` pada state Freezed untuk mengosongkan field nullable; gunakan `copyWith(field: null)` dari codegen.
- DILARANG cast `as String[?]`/`as num` pada nilai dari database; pakai `ParserUtil.parseString[OrNull]`/`parseInt`/`parseDouble`.
- DILARANG fallback `DateTime.now()` saat parse tanggal wajib gagal; lemparkan `ArgumentError`.
- DILARANG nama field Firestore yang berbeda dari kolom SQLite (mis. camelCase terpisah); samakan dengan kolom SQLite.
- DILARANG auto-UUID dari dalam model; `id` wajib non-nullable dan disuplai pemanggil.
- DILARANG menambah deteksi tipe domain/Firebase (mis. duck-typing `toDate()`, `catch (NoSuchMethodError)` untuk `Timestamp`) ke shared util lintas proyek (mis. `ParserUtil` pada `share_global_saya`); konversi tipe domain hanya di adapter model (Aturan 19).

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

State filter Freezed dengan `@Default` koleksi dan pengosongan field nullable via codegen (pola dari commit `cacca30`/`c0ed41e` di `base_coc`):

```dart
@freezed
abstract class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    TownHallLevel? townHall,
    TipeBase? tipe,
    @Default('') String query,
    @Default(<TagStrategi>{}) Set<TagStrategi> tags,
  }) = _FilterState;

  bool get hasFilter =>
      townHall != null || tipe != null || query.isNotEmpty || tags.isNotEmpty;
}

// Menghapus filter Town Hall: field nullable di-clear lewat copyWith codegen.
state = state.copyWith(townHall: null);
// Menghapus seluruh tag: assign koleksi kosong, bukan bendera manual.
state = state.copyWith(tags: const <TagStrategi>{});
```

State Freezed dua field — list + counter sederhana (pola dari proyek `admin_wifi`, commit `f9568a1`):

```dart
@freezed
abstract class PelangganAktifState with _$PelangganAktifState {
  const PelangganAktifState._();

  const factory PelangganAktifState({
    @Default([]) List<PelangganAktifModel> listPelangganAktif,
    @Default(0) int jumlahPelangganAktif,
  }) = _PelangganAktifState;
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

Model database non-Freezed `StatistikDao` dengan `fromSqflite`/`toSqflite`, `ParserUtil`, konstanta kolom snake_case, dan transaksi (pola dari commit `5265490` di `base_coc`):

```dart
import 'package:sqflite/sqflite.dart';

import 'package:base_coc/core/util/parser_util.dart';
import 'package:base_coc/fitur/galeri_base/model/nama_tabel_statistik.dart';

class StatistikBase {
  const StatistikBase({
    required this.idBase,
    required this.jumlahSalin,
    required this.jumlahDibuka,
    required this.diperbarui,
  });

  final String idBase;
  final int jumlahSalin;
  final int jumlahDibuka;
  final String diperbarui;

  factory StatistikBase.fromSqflite(Map<String, Object?> row) {
    return StatistikBase(
      idBase: ParserUtil.parseStringOrNull(row[NamaKolomStatistik.idBase]) ?? '',
      jumlahSalin: ParserUtil.parseInt(
        row[NamaKolomStatistik.jumlahSalin],
        defaultValue: 0,
      ),
      jumlahDibuka: ParserUtil.parseInt(
        row[NamaKolomStatistik.jumlahDibuka],
        defaultValue: 0,
      ),
      diperbarui:
          ParserUtil.parseStringOrNull(row[NamaKolomStatistik.diperbarui]) ??
          '',
    );
  }

  Map<String, Object?> toSqflite() {
    return <String, Object?>{
      NamaKolomStatistik.idBase: idBase,
      NamaKolomStatistik.jumlahSalin: jumlahSalin,
      NamaKolomStatistik.jumlahDibuka: jumlahDibuka,
      NamaKolomStatistik.diperbarui: diperbarui,
    };
  }
}
```

Model Freezed dengan field enum baru (`SortirMode`) dan `@Default` koleksi (pola dari commit `5265490` di `base_coc`):

```dart
@freezed
abstract class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    TownHallLevel? townHall,
    TipeBase? tipe,
    @Default(SortirMode.terbaru) SortirMode sortir,
    @Default('') String query,
    @Default(<TagStrategi>{}) Set<TagStrategi> tags,
  }) = _FilterState;

  /// Status sortir tidak dihitung sebagai filter.
  bool get hasFilter =>
      townHall != null || tipe != null || query.isNotEmpty || tags.isNotEmpty;
}
```

Model database `TautanStatus` dengan `toSqflite()` ditambahkan setelah `fromSqflite` (pola dari commit `45ae356` di `base_coc`):

```dart
Map<String, Object?> toSqflite() {
  return <String, Object?>{
    NamaKolomTautan.idBase: idBase,
    NamaKolomTautan.jumlahLaporan: jumlahLaporan,
    NamaKolomTautan.terakhirDilaporkan: terakhirDilaporkan,
    NamaKolomTautan.diperbarui: diperbarui,
  };
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
- File state (sesi 35, commit `f9568a1`): `admin_wifi/lib/fitur/state/pelanggan_aktif_state.dart`, `admin_wifi/lib/fitur/state/pelanggan_aktif_state.freezed.dart`, `admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart` (pola notifier codegen + state Freezed)
- File model DB (commit): `lib/fitur/diary_craving/model/diary_craving_model.dart`, `lib/fitur/diary_craving/state/diary_craving_state.dart`, `lib/fitur/sos_craving/model/sos_intervensi_model.dart`, `lib/fitur/rencana_darurat/model/rencana_darurat_model.dart` (proyek `berhenti_merokok`)
- File model JSON (SDK resmi package:freezed): contoh `produk.freezed.dart` / `produk.g.dart` (dokumentasi resmi Freezed, bukan dari commit repo)
- Kelas terkait: `LogDebugState`, `_LogDebugState`, `_$LogDebugState`, `LogDebugNotifier`, `_$LogDebugNotifier`, `DiaryCravingModel`, `SosIntervensiModel`, `RencanaDaruratModel`, `PelangganAktifState`
- Dependensi (commit): `share_global_saya/pubspec.yaml` (`freezed_annotation ^3.1.0`, `freezed ^4.0.2`, `build_runner ^2.16.2`, `riverpod_generator ^4.0.9`)
- Commit rujukan (state): `b70ffda33ce6473e6309af8acd0c64b48c2d0404`, `acf4bb6dddc17ca633d551b2e9f5f62f39020d78`, `804b307506389b678f09e7c2cb7bfb8f2aa94112`, `cacca30b128aadb43e839d31eb1e944a10101b61` (konversi `FilterState` ke `@freezed`; penghapusan bendera manual `clearTownHall`/`clearTipe`/`clearTags`; pengosongan field nullable via `copyWith(field: null)`), `c0ed41e4ff2bd8a1e4cc169630b9301f15f9e17c` (`ProgresDesaState` `@freezed`; `@Default(<AkunDesa>[])`), `f9568a11173bab474012db81f7c6d066e80f15c5` (`PelangganAktifState`, proyek `admin_wifi`)
- File filter (commit `cacca30`): `base_coc/lib/fitur/galeri_base/model/filter_state.dart`, `base_coc/lib/fitur/galeri_base/provider/filter_provider.dart`
- Commit rujukan (model DB): `3b67d3095dacc4e5c7ea78d7eb251809e3e9d981`, `a15acd9603fe5d1251afa4acc3817e7e9c1607b1`, `a5beae01b86a4d9753963380818bc437c2b4741a`, `2462af81050e12b2933717f457a33a5b05d3719f`, `52654906d276c2bab6110fe01dea9452a11773b5` (`StatistikDao` dengan `fromSqflite`/`toSqflite`, `ParserUtil`, konstanta `NamaKolomStatistik`; `FilterState` dengan `SortirMode` dan `@Default`), `45ae356d29dd0bbed8b52567eff5615dc379ddec` (`TautanStatus.toSqflite()`)
- Berkas sumber (sesi 47, 2026-11-19; di luar alur commit-history atas persetujuan eksplisit pengguna): `share_global_saya/lib/src/utils/parser_util.dart` — percobaan menambah duck-typing `toDate()` untuk mendeteksi `Timestamp` di shared util, lalu dihapus (identik HEAD) atas instruksi pengguna "hapus lagi saja" (sesi induk "kode", tercatat di MEMORI.md). Skill diperbarui: Larangan baru + penegasan Aturan 19; versi 2.3.0 → 2.4.0.
- Commit `ea08f25` (admin_wifi, 2026-11-18): seluruh model DB non-Freezed dikonversi ke Freezed (`abstract class` + `const factory`, manual `copyWith` dihapus, `id` `required String` disuplai pemanggil, auto-UUID model dihapus); parsing seluruh model didelegasikan ke `ParserUtil` (`parseString`/`parseStringOrNull`/`parseBool`/`parseInt`/`parseIntOrNull`/`parseDouble`/`safeParseEnum`); adapter `_parseTanggal` untuk `Timestamp`; tanggal wajib melempar `ArgumentError`; field Firestore disamakan snake_case dengan kolom SQLite; tulis UTC / baca lokal; test diperbarui (`id` eksplisit).
- Permintaan eksplisit pengguna (2026-11-18, sesi 45): "nama kolom samakan saja setiap db" dan "ubah semua model yang mempunyai from dan to agar seperti ini" (sehingga kaidah 17–21 di atas).
- Sesi 48 (2026-11-19; di luar alur commit-history atas persetujuan eksplisit pengguna): Aturan 10 diperketat + Larangan baru + perluasan trigger — fallback enum non-nullable DILARANG diam-diam memilih nilai sukses/selesai/lunas (mis. `orElse: () => StatusPembayaranEnum.lunas` pada `admin_wifi/lib/fitur/pelanggan_aktif/model/pelanggan_aktif_model.dart`, dari hasil konversi sesi 45); temuan dari evaluasi transkrip `ses_e0ff43aabffeZAT9lQX9Ao60Av`. Aturan terkait: `.agents/rules/code.md` #23.
