# ref.watch / ref.read (Riverpod)

Referensi detail `ref.watch`/`ref.read` dari skill `aturan-riverpod`.

## Pola

- `ref.watch(provider)` WAJIB langsung di dalam `build()` untuk rebuild otomatis.
- `ref.read(provider)` di callback/event handler.
- Dilarang `ref.watch` di callback atau di luar `build()`.
- Helper yang dipanggil dari `build()` DILARANG memanggil `ref.watch`/`ref.read` — state hasil `ref.watch` di `build()` WAJIB diteruskan ke helper sebagai parameter.
- `ref.watch(provider.select((state) => state.field))` untuk optimasi rebuild minimal.

## Contoh Benar

```dart
@override
Widget build(BuildContext context) {
  final asyncPelangganAktif = ref.watch(penggunaAktifProvider);
  final asyncPelanggan = ref.watch(pelangganProvider);
  final asyncPaket = ref.watch(paketProvider);

  if (asyncPelangganAktif.isLoading || asyncPelanggan.isLoading || asyncPaket.isLoading) {
    return const Center(child: CircularProgressIndicator());
  }
  if (asyncPelangganAktif.hasError) {
    return _buildMuatGagal('Gagal memuat data: ${asyncPelangganAktif.error}',
        () => ref.refresh(penggunaAktifProvider));
  }
  return _buildBody(
    asyncPelanggan.requireValue,
    asyncPaket.requireValue,
    asyncPelangganAktif.requireValue,
  );
}

Widget _buildBody(PelangganState pelangganState, PaketState paketState, PelangganAktifState pelangganAktifAsync) {
  final semuaPelanggan = pelangganAktifAsync.listPelangganAktif;
  // rendering tanpa ref.watch/ref.read di dalam helper
  return const SizedBox.shrink();
}
```

## Contoh Salah

```dart
// DILARANG: ref.watch/ref.read di dalam helper yang dipanggil dari build()
Widget _buildBody() {
  final nilai = ref.watch(counterProvider); // DILARANG
  return Text('$nilai');
}
```
