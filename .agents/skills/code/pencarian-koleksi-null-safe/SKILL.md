---
name: pencarian-koleksi-null-safe
description: "Trigger: saat mencari atau mengurutkan elemen dalam koleksi (List/Iterable) | Panduan koleksi: pencarian wajib `firstWhereOrNull` dan pengurutan wajib `.sorted`/`.sortedBy`/`.sortedByDescending` dari `package:collection/collection.dart`; larangan `cast<T?>().firstWhere(..., orElse: ...)` dan `..sort(...)` in-place."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Thu Nov 19 2026 08:15 WIB"
---

# Pencarian Koleksi Null-Safe

Saat mencari elemen dalam koleksi (`List`/`Iterable`) dengan predikat yang mungkin tidak ditemukan, wajib memakai `firstWhereOrNull` dari `package:collection/collection.dart`.

## Aturan

1. Pencarian elemen dalam koleksi dengan predikat yang mungkin tidak ditemukan wajib memakai `firstWhereOrNull` dari `package:collection/collection.dart`.
2. Import `package:collection/collection.dart` wajib ditambahkan bila belum ada (urutan alfabetis sesuai skill `import-ordering`).
3. Hasil `firstWhereOrNull` bertipe nullable (`T?`); tangani `null` secara eksplisit (mis. `??` atau `if (result == null)`).
4. Pola `cast<T?>().firstWhere(..., orElse: () => null)` DILARANG karena verbose dan rentan salah tipe.
5. Pola `firstWhere(..., orElse: () => null)` tanpa `cast` juga DILARANG; gunakan `firstWhereOrNull`.

## Pengurutan Koleksi

6. Pengurutan elemen koleksi (`List`/`Iterable`) wajib memakai extension `.sorted(...)`, `.sortedBy(...)`, atau `.sortedByDescending(...)` dari `package:collection/collection.dart`, bukan `..sort(...)` pada list yang dimutasi (cascade).
7. `.sorted(...)` mengembalikan `List<T>` baru (immutable-friendly); jangan memutasi list sumber secara langsung untuk pengurutan.
8. Gunakan `.sortedBy((e) => e.field)` bila kunci pengurutan sederhana; gunakan `.sorted((a, b) => ...)` bila perlu pembanding kustom.
9. Import `package:collection/collection.dart` wajib ditambahkan bila belum ada (urutan alfabetis sesuai skill `import-ordering`).

## Larangan

- Jangan memakai `_list..sort((a, b) => ...)` atau `list.sort(...)` untuk pengurutan yang menghasilkan list baru; gunakan `.sorted(...)`.
- Jangan memutasi list sumber secara langsung untuk pengurutan; gunakan `.sorted(...)`.

- Jangan memakai `_list.cast<T?>().firstWhere((e) => e?.id == id, orElse: () => null)`.
- Jangan memakai `_list.firstWhere((e) => e.id == id, orElse: () => null)` untuk koleksi yang mungkin tidak berisi elemen cocok.
- Jangan memakai operator `!` untuk memaksa hasil pencarian non-null apabila hasilnya dapat bernilai `null`.

## Contoh Benar

```dart
import 'package:collection/collection.dart';

final kategori = state.listKategori.firstWhereOrNull(
  (k) => k.id == id,
);
if (kategori == null) {
  // tangani tidak ditemukan
}

// Pengurutan dengan .sorted (package:collection)
final terbaru = state.listTransaksi
    .where((t) => t.idPelanggan == idPelanggan)
    .sorted((a, b) => b.tanggal.compareTo(a.tanggal));

## Contoh Salah

```dart
final kategori = state.listKategori
    .cast<KategoriModel?>()
    .firstWhere(
      (k) => k?.id == id,
      orElse: () => null,
    );
```

```dart
// Salah: mutasi in-place dengan ..sort
final terbaru = (state.listTransaksi
        .where((t) => t.idPelanggan == idPelanggan)
        .toList()
      ..sort((a, b) => b.tanggal.compareTo(a.tanggal)));
