---
name: parsing-nullable-int
description: "Trigger: saat membaca field integer nullable dari database | Panduan parseIntOrNull (null tetap null, tidak jadi 0) dan parseInt/parseBool dengan defaultValue untuk field non-nullable."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Parsing Field Nullable Integer dari Database Menggunakan parseIntOrNull

Field `int?` yang dibaca dari database wajib menggunakan `ParserUtil.parseIntOrNull(...)`. Nilai null harus tetap null, bukan berubah menjadi 0.

## Aturan

1. Field nullable `int?` dari database wajib di-parse menggunakan `ParserUtil.parseIntOrNull(...)`, bukan `ParserUtil.parseInt(...)` yang menggunakan nilai default 0.
2. Pertahankan null dari database di model agar aplikasi dapat membedakan kondisi "belum diatur" dengan nilai nol yang memang ditetapkan.
3. **Field non-nullable di Dart** (`int`, `bool`, dll.) gunakan `ParserUtil.parseInt(...)` atau `ParserUtil.parseBool(...)` dengan `defaultValue`, karena tipe Dart tidak bisa menampung null. Jika DB null, nilai default Dart akan digunakan.
4. **Field nullable di Dart** (`int?`, `double?`, `String?`, dll.) gunakan `ParserUtil.parseIntOrNull(...)`, `ParserUtil.parseDoubleOrNull(...)`, atau `ParserUtil.parseStringOrNull(...)` tanpa `??` default, sehingga null dari database tetap null. Catatan: `ParserUtil` TIDAK menyediakan `parseBoolOrNull`; untuk field `bool?` nullable gunakan `parseBool(..., defaultValue:)` hanya bila nilai default bisnis jelas, atau tangani null secara eksplisit.
5. Terapkan aturan ini pada seluruh field nullable yang dipetakan dalam factory model dari baris SQLite.

## Referensi API `ParserUtil` (share_global_saya)

Berkas sumber: `share_global_saya/lib/src/utils/parser_util.dart`. Kelas static-only dengan private ctor `ParserUtil._()`. Field yang tidak dikenali di-log `L.w(...)` lalu fallback ke `defaultValue`/`null`:

- `parseDateTime(dynamic value)` → `DateTime?` — `null`→`null`; `DateTime` passthrough; `int`: heuristik `< 1e12` → detik (×1000), selain itu milidetik; `String` → `DateTime.tryParse`; lainnya → `L.w` + `null`.
- `parseInt(value, {int defaultValue = 0})` → `int` — `num`→`toInt()`; `String` → `tryParse ?? defaultValue`; lainnya → `L.w` + `defaultValue`.
- `parseIntOrNull(value)` → `int?` — `num`→`toInt()`; `String` → `tryParse` (null bila gagal); lainnya → `L.w` + `null`.
- `parseDouble(value, {double defaultValue = 0.0})` → `double` — analog `parseInt`.
- `parseDoubleOrNull(value)` → `double?` — analog `parseIntOrNull`.
- `parseBool(value, {bool defaultValue = false})` → `bool` — `null`→`defaultValue`; `bool` passthrough; `int` → `value == 1`; `String` lowercased `'true'`/`'1'`; lainnya → `L.w` + `defaultValue`. **Tidak ada `parseBoolOrNull`.**
- `parseString(value, {String defaultValue = ''})` → `String` — `null`→`defaultValue`; `String` passthrough; lainnya → `toString()`.
- `parseStringOrNull(value)` → `String?` — `null`→`null`; `String` passthrough; lainnya → `toString()`.
- `safeParseEnum<T extends Enum>(List<T> values, String? value)` → `T?` — match `name` case-insensitive; gagal/tidak cocok → `L.w` + `null`.

## Larangan

- Jangan menggunakan `ParserUtil.parseInt(row[kolom])` untuk field `int?` yang null berarti belum diatur.
- Jangan mengubah null menjadi 0 tanpa keputusan dan validasi bisnis yang jelas.
- Jangan menambahkan `?? defaultValue` pada hasil `parseIntOrNull` untuk field nullable `int?`, karena akan meniadakan tujuan menjaga null tetap null.
- Jangan mengasumsikan keberadaan `parseBoolOrNull` atau varian OrNull lain yang tidak disediakan `ParserUtil`; periksa API `ParserUtil` terlebih dahulu.
- Jangan memakai `parseBool(...)` untuk field `bool?` yang null berarti "belum diatur", karena null akan berubah menjadi `defaultValue`.

## Contoh Benar

```dart
// Field nullable int? di Dart → parseIntOrNull, null tetap null
targetSmokeFreeHari: ParserUtil.parseIntOrNull(
  row[NamaKolom.targetSmokeFreeHari],
),

// Field non-nullable int di Dart → parseInt dengan defaultValue
jumlah: ParserUtil.parseInt(row[NamaKolom.jumlah], defaultValue: 1),

// Field non-nullable bool di Dart → parseBool dengan defaultValue
isSlip: ParserUtil.parseBool(row[NamaKolom.isSlip], defaultValue: false),

// Field nullable String? di Dart → parseStringOrNull, null tetap null
catatan: ParserUtil.parseStringOrNull(row[NamaKolom.catatan]),

// Field bool? nullable — TIDAK ada parseBoolOrNull; tangani eksplisit
isSlip: row[NamaKolom.isSlip] == null
    ? null
    : ParserUtil.parseBool(row[NamaKolom.isSlip], defaultValue: false),

// Field nullable enum — safeParseEnum case-insensitive, null bila tidak cocok
tipe: ParserUtil.safeParseEnum(TipeLog.values, row[NamaKolom.tipe] as String?),
```

## Contoh Salah

```dart
// SALAH: parseInt pada field nullable int? → null berubah menjadi 0
targetSmokeFreeHari: ParserUtil.parseInt(
  row[NamaKolom.targetSmokeFreeHari],
), // null berubah menjadi 0

// SALAH: ?? defaultValue pada parseIntOrNull untuk field nullable → null tidak tetap null
jumlah: ParserUtil.parseIntOrNull(row[NamaKolom.jumlah]) ?? 0,
```

## Sumber Evaluasi

- Commit: `c9f96b2debb9e678513229c5a4a68a062e3a8afc`
- File: `lib/fitur/biodata/model/biodata_model.dart`, `lib/fitur/konsumsi_rokok/model/konsumsi_rokok_model.dart`
- Berkas sumber: `share_global_saya/lib/src/utils/parser_util.dart` (commit rujukan belum diverifikasi spesifik pada sesi 24)
- Audit `parser_util.dart` vs skill (sesi 24, 2026-11-18, atas persetujuan pengguna): Aturan 4 diperbaiki (`bool?` tidak bisa dipertahankan lewat `parseBool`); section "Referensi API `ParserUtil`" ditambahkan; Larangan ditambah 2 butir; contoh ditambah; versi 1.0.4 → 1.1.0. Catatan: komentar header kode (`// lib/shared/utils/parser_util.dart`) merujuk path usang — di submodule, TIDAK diubah sesi ini.
