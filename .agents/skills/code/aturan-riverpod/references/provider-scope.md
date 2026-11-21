# ProviderScope (Riverpod)

Referensi detail `ProviderScope` dari skill `aturan-riverpod`.

## Pola

- `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`).
- `overrides` hanya untuk scope itu dan keturunannya; `ProviderScope` nested dilarang.
- Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
- `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.

## Larangan

- Dilarang `ProviderScope` nested.
- Dilarang modifikasi provider di lifecycle method widget.
