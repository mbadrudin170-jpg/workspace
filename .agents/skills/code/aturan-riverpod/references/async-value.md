# AsyncValue (Riverpod)

Referensi detail penanganan `AsyncValue` dari skill `aturan-riverpod`.

## Pola

- Di dalam `build()`, `AsyncValue` wajib ditangani `isLoading` → `hasError` → `requireValue`.
- `asData?.value`/`valueOrNull` hanya untuk akses opsional (bukan konten utama) dengan penanganan kegagalan eksplisit.
- Pemakaian `.when` pada `AsyncValue` DILARANG.

## Contoh Benar

```dart
final async = ref.watch(provider);
if (async.isLoading) return const LoadingView();
if (async.hasError) return ErrorView(error: async.error);
final data = async.requireValue;
return DataView(data: data);
```

## Contoh Salah

```dart
// DILARANG: .when pada AsyncValue
return ref.watch(provider).when(
  loading: () => const LoadingView(),
  error: (e, s) => ErrorView(error: e),
  data: (d) => DataView(data: d),
);
```
