---
name: penanganan-async
description: "Trigger: saat layar menangani state async, data kosong, atau beberapa AsyncValue | Panduan isLoading, hasError, requireValue, empty state, data tidak lengkap, early return, mounted check, cache provider, loading gabungan, error terpisah, tipe generic konkret, satu method helper error. Penanganan State Asynchronous dan Data Kosong pada Layar (satu atau beberapa provider)."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 22 2026 13:45 WIB"
---

# Penanganan State Asynchronous dan Data Kosong pada Layar

Panduan penanganan satu atau beberapa provider asynchronous: loading, error, requireValue, empty state, data tidak lengkap, early return, mounted check, cache provider.

## A. Satu Provider Asynchronous

### Aturan

1. Layar yang memuat data asynchronous wajib menangani status `isLoading` terlebih dahulu (tampilkan indikator loading).
2. Setelah itu, tangani status `hasError` (tampilkan pesan error dan tombol retry yang memanggil `ref.refresh(provider)`). DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`. Karena `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider), hasilnya WAJIB dipakai: satu provider → `() => ref.refresh(provider)`; beberapa provider sekaligus → list literal `() => [ref.refresh(p1), ref.refresh(p2), ...]`. Jangan panggil `ref.refresh(...)` sebagai statement yang mengabaikan hasil (memicu `unused_result`) dan jangan gunakan `// ignore: unused_result`.
3. Setelah data tersedia (`requireValue`), tangani kondisi data kosong (empty state) dan kondisi data tidak lengkap (mis. biodata null, tanggal berhenti null) sebagai tampilan tersendiri dengan informasi dan call-to-action.
4. Gunakan early return (guard clause) untuk setiap kondisi tersebut agar alur build tetap linear dan mudah dibaca.
5. Gunakan `const SizedBox.shrink()` untuk widget kondisional yang disembunyikan.
6. Setelah `await`/operasi asynchronous, periksa `mounted` sebelum mengakses `context` atau memanggil `setState`.
7. Pengambilan data dari provider yang berfungsi sebagai cache wajib menangani tiga status (`isLoading`, `hasError`, `data`) secara eksplisit. Cakupan cache provider meliputi: (a) provider sinkron turunan `Provider<AsyncValue<T>>` yang menurunkan `AsyncValue` dari provider sumber (mis. `filteredBasesProvider`, `baseSerupaProvider`); (b) `FutureProvider`/`AsyncNotifier` dengan `keepAlive: true`. Pada **konten utama** layar, setiap kasus gagal (`hasError`) wajib menampilkan pesan error dan aksi retry (`ref.refresh(provider)`). Pada **bagian opsional** yang disembunyikan secara sadar saat gagal (mis. ikon favorit, section rekomendasi), minimal wajib logging (`L.w`/`L.e`) di titik konsumsi.

### Larangan

- Jangan memanggil `requireValue` sebelum memastikan `isLoading` dan `hasError` sudah ditangani.
- Jangan menampilkan layar kosong tanpa informasi atau CTA ketika data kosong.
- Jangan menggabungkan penanganan loading, error, dan data kosong dalam satu blok yang sulit dibaca.
- DILARANG menelan kegagalan cache provider secara senyap: `.asData?.value`/`valueOrNull` tanpa pesan error, tanpa retry, dan tanpa logging. Khusus konten utama layar, `.asData?.value`/`valueOrNull` DILARANG sama sekali.

## B. Beberapa Provider Asynchronous

### Aturan

1. Ketika layar memuat lebih dari satu provider asynchronous, tangani status `isLoading` gabungan. Tampilkan indikator loading jika salah satu provider masih loading.
2. Tangani status `hasError` untuk setiap provider secara terpisah, dengan pesan error dan tombol retry yang memanggil `ref.refresh(provider)` yang sesuai. DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`. Karena `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider), hasilnya WAJIB dipakai: untuk satu provider gunakan `() => ref.refresh(provider)` (hasil menjadi return lambda); untuk beberapa provider sekaligus gunakan list literal `() => [ref.refresh(p1), ref.refresh(p2), ...]` agar setiap hasil terpakai. Jangan panggil `ref.refresh(...)` sebagai statement/blok yang mengabaikan hasilnya (memicu `unused_result`) dan jangan gunakan `// ignore: unused_result`.
3. Panggil `requireValue` pada setiap provider hanya setelah status loading dan error ditangani.
4. Kondisi data tidak lengkap (misalnya biodata null) tetap ditangani sebagai tampilan tersendiri dengan informasi dan call-to-action.
5. Saat menerima atau meneruskan nilai asynchronous ke parameter method/helper, gunakan tipe generic konkret sesuai state provider, misalnya `AsyncValue<ImpianState>`, bukan `AsyncValue<dynamic>`.
6. Pertahankan tipe konkret setiap provider secara terpisah agar akses properti state tetap diperiksa oleh analyzer.

### Larangan

- Jangan memanggil `requireValue` pada provider yang masih loading atau error.
- Jangan menggabungkan penanganan error beberapa provider menjadi satu blok yang tidak jelas provider mana yang gagal.
- Jangan menggunakan `AsyncValue<dynamic>` jika tipe state provider sudah diketahui.

## Contoh Benar

```dart
final dataAsync = ref.watch(provider);

if (dataAsync.isLoading) {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
if (dataAsync.hasError) {
  return Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const Text('Gagal memuat data'), OutlinedButton(onPressed: () => ref.refresh(provider), child: const Text('Coba lagi'))])));
}

final state = dataAsync.requireValue;
if (state.list.isEmpty) {
  return Scaffold(
    body: EmptyStateView(
      ikon: CupertinoIcons.book,
      judul: 'Belum ada data',
      deskripsi: 'Tekan tombol + untuk menambah data pertama.',
      ctaLabel: 'Tambah',
      onCta: () => unawaited(
        Nav.to(context, const FormPage()).catchError((Object e, StackTrace s) {
          L.e('Gagal navigasi: $e $s');
          return null;
        }),
      ),
    ),
  );
}
return Scaffold(body: _Daftar(state.list));
```

Beberapa provider:

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
final state = dataAsync.requireValue;
return Scaffold(body: ListView(...));
```

```dart
// DILARANG: kegagalan cache provider ditelan senyap; konten utama memakai asData tanpa penanganan
final bases = ref.watch(filteredBasesProvider).asData?.value ?? [];
return GridBase(bases: bases, ...);
```

```dart
Widget _buildCardRingkasanImpian(
  BiodataModel biodata,
  AsyncValue<dynamic> impianAsync,
) {
  // ...
}
## Rujukan

- Rujuk juga skill `penanganan-data-null` (indeks penanganan data null).
```
