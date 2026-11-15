---
name: validasi-json-katalog-ketat
description: "Trigger: saat memuat atau memvalidasi data JSON katalog lokal | Panduan validasi ketat katalog JSON: field enum lewat `values.firstWhere(..., orElse: () => throw ...)`, array bertipe string dicek per elemen, objek bersarang dicek `is! Map<String, dynamic>` lalu didelegasikan ke `fromJson` bersarang, exception khusus per domain dengan pesan memuat `id` entri dan nama field, string kosong dianggap `null`, `toJson` kondisional (field `null` tidak ditulis), getter `hasIsi` minimal satu field terisi. Hindari cast langsung, `byName` tanpa konteks, dan fallback diam-diam. Sumber pola: commit `base_coc` `71a69f0` dan `149fe81`."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 19:03 WIB"
---

# Validasi Ketat JSON Katalog

Katalog JSON lokal (aset bundel) adalah data yang dikirim bersama aplikasi; satu entri cacat tidak boleh dimuat diam-diam. Validasi wajib gagal total dengan exception khusus per domain, dan seluruh pesan error wajib memuat `id` entri serta nama field agar katalog cacat mudah ditemukan.

## Cakupan yang Di-Cover

- Package: `dart:core` (`firstWhere`, `orElse`), `package:freezed_annotation` (model `@freezed` dengan `fromJson` custom)
- Class: exception khusus per domain (mis. `KatalogGagalException implements Exception` dengan field `pesan`)
- File terkait: `katalog_exception.dart`, `base_layout.dart`, `panduan_base.dart` (pola dari `base_coc`)
- Model: field enum, field array (`List<String>`), field objek bersarang, field opsional string, `toJson` kondisional

## Aturan

1. JSON katalog yang tidak valid wajib menggagalkan pemuatan katalog secara keseluruhan lewat exception khusus per domain (mis. `KatalogGagalException`), bukan dilewati, diganti nilai default, atau di-fallback diam-diam.
2. Field enum wajib diparse dengan `TelEnum.values.firstWhere((e) => e.name == nilai, orElse: () => throw KatalogGagalException(...))` — bukan `switch` manual, bukan `byName` telanjang, bukan `safeParseEnum` dengan fallback default (katalog ≠ database; nilai tak dikenal = katalog cacat).
3. Field array wajib dicek `is! List` → throw; setiap elemen wajib dicek tipenya (mis. `is! String` → throw); nilai tak dikenali → throw dengan pesan memuat nilai salah dan `id` entri.
4. Field objek bersarang wajib dicek `is! Map<String, dynamic>` → throw; delegasikan isinya ke `fromJson` milik model bersarang (validasi berlapis, bukan parse inline).
5. Field string opsional yang kosong dianggap `null` (`nilai.isEmpty ? null : nilai`); field opsional `null` tidak ditulis saat serialisasi (`toJson` kondisional: `if (kekuatan != null) 'kekuatan': kekuatan`).
6. Objek yang seluruh fieldnya opsional wajib menyediakan getter `hasIsi` (`true` bila minimal satu field terisi) agar pemanggil bisa menyembunyikan section kosong.
7. Pesan exception wajib memuat `id` entri dan nama field (mis. `'Field "tags" pada id "$id" harus berupa array.'`) agar sumber cacat langsung teridentifikasi.
8. `fromJson` custom pada model `@freezed` boleh dipakai selama aturan 1–7 dipatuhi; berkas hasil generate tidak diedit manual (lihat skill `model-state-freezed-abstract`).
9. Nilai boolean/angka/array `null` pada field opsional dianggap "tidak ada" (bukan error); eksplisit dibedakan dari tipe yang salah (error).

## Steps

1. Definisikan exception khusus domain (class `implements Exception`, field `pesan`, `toString()` yang jelas) sebelum menulis model.
2. Tulis `fromJson` per model: cek tipe tiap field sebelum dipakai; kumpulkan nilai lewat fungsi pembaca lokal (mis. `String? baca(String kunci)`).
3. Pastikan setiap cabang invalid melempar exception khusus dengan pesan memuat `id` entri dan nama field.
4. Tulis `toJson` kondisional (hanya field terisi) dan getter `hasIsi` bila seluruh field opsional.
5. Tambahkan test: field absen → nilai default/kosong; tipe salah → `throwsA(isA<KatalogGagalException>())`; nilai tak dikenal → `throwsA(isA<KatalogGagalException>())`; `toJson` objek kosong → `{}` bila relevan.
6. Jalankan `dart format`, `dart analyze`, dan `flutter test`.

## Larangan

- DILARANG cast langsung seperti `json['tags'] as List`/`as String?` tanpa cek tipe dan tanpa pesan error memuat `id`.
- DILARANG `enum.values.byName`/`firstWhere` tanpa `orElse` yang melempar exception khusus.
- DILARANG fallback diam-diam (`?? []`, `?? const {}`, `?? ''`) untuk nilai katalog yang cacat; gagal total lebih aman daripada menampilkan base salah.
- DILARANG melewati elemen array yang tidak dikenali tanpa melempar error (kecuali ada aturan eksplisit dengan `id` yang dicatat).
- DILARANG pesan exception tanpa `id` entri atau nama field.
- DILARANG memvalidasi ulang data katalog di lapisan widget/layar; validasi terjadi satu kali di model.
- DILARANG memakai `ParserUtil.safeParseEnum` dengan fallback default untuk katalog (itu pola database, bukan katalog).

## Contoh Benar

Model bersarang `PanduanBase` (opsional, string kosong = `null`, validasi ketat):

```dart
/// Panduan singkat per base: kekuatan, kelemahan, dan saran penempatan trap.
@freezed
abstract class PanduanBase with _$PanduanBase {
  const PanduanBase._();

  const factory PanduanBase({
    String? kekuatan,
    String? kelemahan,
    String? saranTrap,
  }) = _PanduanBase;

  factory PanduanBase.fromJson(Map<String, dynamic> json) {
    String? baca(String kunci) {
      final nilai = json[kunci];
      if (nilai == null) {
        return null;
      }
      if (nilai is! String) {
        throw KatalogGagalException('Field "panduan.$kunci" tidak valid.');
      }
      return nilai.isEmpty ? null : nilai;
    }

    return PanduanBase(
      kekuatan: baca('kekuatan'),
      kelemahan: baca('kelemahan'),
      saranTrap: baca('saranTrap'),
    );
  }

  bool get hasIsi => kekuatan != null || kelemahan != null || saranTrap != null;

  Map<String, dynamic> toJson() {
    return {
      if (kekuatan != null) 'kekuatan': kekuatan,
      if (kelemahan != null) 'kelemahan': kelemahan,
      if (saranTrap != null) 'saranTrap': saranTrap,
    };
  }
}
```

Enum tunggal dari JSON dengan `firstWhere`/`orElse` (di dalam `BaseLayout.fromJson`):

```dart
final tagsRaw = json['tags'];
final tags = <TagStrategi>[];
if (tagsRaw != null) {
  if (tagsRaw is! List) {
    throw KatalogGagalException(
      'Field "tags" pada id "$id" harus berupa array.',
    );
  }
  for (final t in tagsRaw) {
    if (t is! String) {
      throw KatalogGagalException('Nilai tag pada id "$id" tidak valid.');
    }
    tags.add(
      TagStrategi.values.firstWhere(
        (e) => e.name == t,
        orElse: () => throw KatalogGagalException(
          'Nilai tag "$t" pada id "$id" tidak dikenali.',
        ),
      ),
    );
  }
}
```

Objek bersarang pada model induk (validasi tipe dulu, lalu delegasi):

```dart
PanduanBase? panduan;
final panduanRaw = json['panduan'];
if (panduanRaw != null) {
  if (panduanRaw is! Map<String, dynamic>) {
    throw KatalogGagalException(
      'Field "panduan" pada id "$id" harus berupa objek.',
    );
  }
  panduan = PanduanBase.fromJson(panduanRaw);
}
```

## Contoh Salah

```dart
// DILARANG: cast langsung; exception tanpa konteks id; fallback diam-diam
final tags = (json['tags'] as List?)?.cast<String>()
    .map(TagStrategi.values.byName) // byName tanpa orElse → ArgumentError telanjang
    .toList() ?? const []; // katalog cacat dianggap "tidak ada tag"

// DILARANG: safeParseEnum dengan fallback default untuk katalog
final tag = ParserUtil.safeParseEnum(TagStrategi.values, t) ?? TagStrategi.cwl;

// DILARANG: field non-string lolos diam-diam ke UI
final kekuatan = json['kekuatan']?.toString(); // int 42 → "42"
```

```dart
// DILARANG: pesan exception tanpa id entri / nama field
throw KatalogGagalException('tags tidak valid');

// DILARANG: validasi ulang di widget (dua sumber kebenaran)
if (base.tags.isNotEmpty) { /* parsing ulang string di UI */ }
```

## Sumber Evaluasi

- Commit rujukan: `71a69f0fb9cc9fd993865a8726e333144152fdc2` (validasi array `tags`, `firstWhere` + `orElse` throw `KatalogGagalException`, pesan memuat `id`), `149fe8186b10311336d9a913cb1be59a3ffb2359` (model bersarang `PanduanBase`, `toJson` kondisional, `hasIsi`, validasi `is! Map<String, dynamic>` pada `BaseLayout.fromJson`)
- File: `base_coc/lib/fitur/galeri_base/model/base_layout.dart`, `base_coc/lib/fitur/galeri_base/model/panduan_base.dart`, `base_coc/lib/fitur/galeri_base/model/katalog_exception.dart`
- Klasifikasi: exception khusus (`KatalogGagalException implements Exception`, field `pesan`); deteksi lewat type check — lihat skill `exception-khusus-deteksi-error`
- Batas cakupan: parsing `dynamic` dari database SQLite (fallback default valid) memakai `ParserUtil` — lihat skill `model-state-freezed-abstract` dan `parsing-nullable-int`; jangan mencampuradukkan pola katalog dengan pola database
