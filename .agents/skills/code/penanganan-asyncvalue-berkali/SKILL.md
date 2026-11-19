---
name: penanganan-asyncvalue-berkali
description: "Trigger: saat layar menangani beberapa AsyncValue | Panduan loading gabungan, error terpisah, requireValue yang aman, tipe generic konkret. Penanganan Beberapa Provider Asynchronous pada Satu Layar Ketika layar memuat lebih dari satu provider asynchronous, tangani loading gabungan dan error secara terpisah. Pertahankan tipe data konkret pada setiap `AsyncValue`. Aturan 1. Ketika layar memuat lebih dari satu provider asynchronous, tangani status `isLoading` gabungan. Tampilkan indikator loading jika salah satu provider masih loading. 2. Tangani status `hasError` untuk setiap provider secara terpisah, dengan pesan error dan tombol retry yang memanggil `ref.refresh(provider)` yang sesuai. DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`. Karena `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider), hasilnya WAJIB dipakai: untuk satu provider gunakan `() => ref.refresh(provider)` (hasil menjadi return lambda); untuk beberapa provider sekaligus gunakan list literal `"
metadata:
  kategori: "custom"
  versi: "1.1.3"
  diperbarui: "Thu Nov 19 2026 22:43 WIB"
---

# Penanganan Beberapa Provider Asynchronous pada Satu Layar

Ketika layar memuat lebih dari satu provider asynchronous, tangani loading gabungan dan error secara terpisah. Pertahankan tipe data konkret pada setiap `AsyncValue`.

## Aturan

1. Ketika layar memuat lebih dari satu provider asynchronous, tangani status `isLoading` gabungan. Tampilkan indikator loading jika salah satu provider masih loading.
2. Tangani status `hasError` untuk setiap provider secara terpisah, dengan pesan error dan tombol retry yang memanggil `ref.refresh(provider)` yang sesuai. DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`. Karena `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider), hasilnya WAJIB dipakai: untuk satu provider gunakan `() => ref.refresh(provider)` (hasil menjadi return lambda); untuk beberapa provider sekaligus gunakan list literal `() => [ref.refresh(p1), ref.refresh(p2), ...]` agar setiap hasil terpakai. Jangan panggil `ref.refresh(...)` sebagai statement/blok yang mengabaikan hasilnya (memicu `unused_result`) dan jangan gunakan `// ignore: unused_result`.
3. Panggil `requireValue` pada setiap provider hanya setelah status loading dan error ditangani.
4. Kondisi data tidak lengkap (misalnya biodata null) tetap ditangani sebagai tampilan tersendiri dengan informasi dan call-to-action.
5. Saat menerima atau meneruskan nilai asynchronous ke parameter method/helper, gunakan tipe generic konkret sesuai state provider, misalnya `AsyncValue<ImpianState>`, bukan `AsyncValue<dynamic>`.
6. Pertahankan tipe konkret setiap provider secara terpisah agar akses properti state tetap diperiksa oleh analyzer.

## Larangan

- Jangan memanggil `requireValue` pada provider yang masih loading atau error.
- Jangan menggabungkan penanganan error beberapa provider menjadi satu blok yang tidak jelas provider mana yang gagal.
- Jangan menggunakan `AsyncValue<dynamic>` jika tipe state provider sudah diketahui.

## Contoh Benar

```dart
final biodataAsync = ref.watch(biodataProvider);
final impianAsync = ref.watch(impianProvider);

if (biodataAsync.isLoading || impianAsync.isLoading) {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
if (biodataAsync.hasError) {
  return _ErrorRetry(onRetry: () => ref.refresh(biodataProvider));
}
if (impianAsync.hasError) {
  return _ErrorRetry(onRetry: () => ref.refresh(impianProvider));
}

final biodata = biodataAsync.requireValue;
final impianState = impianAsync.requireValue;
```

Parameter helper yang menerima state asynchronous juga harus tetap bertipe spesifik:

```dart
Widget _buildCardRingkasanImpian(
  BiodataModel biodata,
  AsyncValue<ImpianState> impianAsync,
) {
  // ...
}
```

## Contoh Salah

```dart
Widget _buildCardRingkasanImpian(
  BiodataModel biodata,
  AsyncValue<dynamic> impianAsync,
) {
  // ...
}
```
