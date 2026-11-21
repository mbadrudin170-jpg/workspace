# ProviderScope (Riverpod)

Referensi detail `ProviderScope` dari skill `aturan-riverpod`.

## Pola

- `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`).
- `overrides` hanya untuk scope itu dan keturunannya; `ProviderScope` nested dilarang.
- Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
- `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.

## Contoh Benar

```dart
final container = ProviderContainer();
runApp(
  UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ),
);
// Saat container tidak lagi dipakai, pemanggil wajib dispose
container.dispose();

// Testing
await tester.pumpWidget(
  ProviderScope(
    overrides: [
      repoProvider.overrideWithValue(FakeRepo()),
    ],
    child: const MyApp(),
  ),
);
```

## Contoh Salah

```dart
// DILARANG: modifikasi provider di lifecycle
@override
void initState() {
  super.initState();
  ref.read(counterProvider.notifier).increment();
}
```
