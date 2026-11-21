---
name: penanganan-error-unawaited
description: "Trigger: saat memanggil Future tanpa await (unawaited) | Panduan wajib catchError dengan logging L.e pada Future yang dilepas; jangan biarkan unhandled. Penanganan Error pada Future yang Dilepas (unawaited) Future yang dilepas dengan `unawaited()` wajib memiliki penanganan error via `catchError()` yang mencatat error melalui logger proyek. Aturan 1. Future yang dilepas dengan `unawaited()` dan berpotensi gagal wajib memiliki penanganan error melalui `catchError(...)` atau `try/catch` yang mencatat error melalui logger proyek (`L.e`). 2. Jangan melepas `unawaited(...)` tanpa penanganan error hanya untuk menghilangkan peringatan analyzer. 3. Jangan mengandalkan keberhasilan implisit pada Future yang dilepas. 4. `unawaited(...)` pada pemanggilan method yang di dalamnya terdapat dialog (`showOkCancelAlertDialog`) atau `setState` DI LUAR blok `try` tetap wajib `.catchError(...)` di titik pemanggilan — exception dari dialog (mis. kegagalan platform channel) tidak tertangkap `try` internal method tersebut dan menjad"
metadata:
  kategori: "custom"
  versi: "1.1.2"
  diperbarui: "Thu Nov 19 2026 02:38 WIB"
---

# Penanganan Error pada Future yang Dilepas (unawaited)

Future yang dilepas dengan `unawaited()` wajib memiliki penanganan error via `catchError()` yang mencatat error melalui logger proyek.

## Aturan

1. Future yang dilepas dengan `unawaited()` dan berpotensi gagal wajib memiliki penanganan error melalui `catchError(...)` atau `try/catch` yang mencatat error melalui logger proyek (`L.e`).
2. Jangan melepas `unawaited(...)` tanpa penanganan error hanya untuk menghilangkan peringatan analyzer.
3. Jangan mengandalkan keberhasilan implisit pada Future yang dilepas.
4. `unawaited(...)` pada pemanggilan method yang di dalamnya terdapat dialog (`showOkCancelAlertDialog`) atau `setState` DI LUAR blok `try` tetap wajib `.catchError(...)` di titik pemanggilan — exception dari dialog (mis. kegagalan platform channel) tidak tertangkap `try` internal method tersebut dan menjadi error async tidak tertangani. Lebih baik: pindahkan dialog/`setState` ke dalam `try` pada method tersebut, ATAU bungkus pemanggilan dengan `.catchError(...)` yang mencatat `L.e` dan `return null`.

## Larangan

- Jangan memanggil `unawaited(Nav.to(...))`, `unawaited(EasyLoading.show(...))`, atau sejenisnya tanpa `.catchError(...)`/`try/catch`.
- Jangan mengabaikan error pada Future yang dilepas.

## Contoh Benar

```dart
unawaited(
  Nav.to(context, const HalamanLain()).catchError((Object e, StackTrace s) {
    L.e('Gagal navigasi: $e $s');
    return null;
  }),
);
```

## Contoh Salah

```dart
unawaited(Nav.to(context, const HalamanLain()));
```
