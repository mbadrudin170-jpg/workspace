# AsyncValue (Riverpod)

Referensi detail penanganan `AsyncValue` dari skill `aturan-riverpod`.

## Pola

- Di dalam `build()`, `AsyncValue` wajib ditangani `isLoading` → `hasError` → `requireValue`.
- `asData?.value`/`valueOrNull` hanya untuk akses opsional (bukan konten utama) dengan penanganan kegagalan eksplisit.
- Pemakaian `.when` pada `AsyncValue` DILARANG.

## Larangan

- Dilarang konten utama atau menelan error secara senyap via `asData?.value`/`valueOrNull`.
- Dilarang `.when`.
