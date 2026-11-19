---
name: pencarian-koleksi-null-safe
description: "Trigger: saat mencari elemen dalam koleksi (List/Iterable) dengan predikat yang mungkin tidak ditemukan | Panduan pencarian koleksi null-safe: wajib `firstWhereOrNull` dari `package:collection/collection.dart` alih-alih `firstWhere(..., orElse: () => null)` yang digabung dengan `cast<T?>()`; pola cast+firstWhere rentan salah tipe dan verbose."
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

## Larangan

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
```

## Contoh Salah

```dart
final kategori = state.listKategori
    .cast<KategoriModel?>()
    .firstWhere(
      (k) => k?.id == id,
      orElse: () => null,
    );
```

## Sumber Evaluasi

- Transkrip sesi `ses_e0f09a7f5ffeYhZ7Bm6b1qJJK6` (sesi 56): pengguna meminta ganti `cast<KategoriModel?>().firstWhere(..., orElse: () => null)` menjadi `firstWhereOrNull` pada `form_transaksi.dart`.
- Kode akhir: `admin_wifi/lib/fitur/transaksi/screens/detail_transaksi.dart` (pemakaian `firstWhereOrNull` via `package:collection/collection.dart`).
- Aturan baru dibuat di luar alur commit-history atas persetujuan eksplisit pengguna (sesi 59).
