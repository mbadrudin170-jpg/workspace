# ref.watch / ref.read (Riverpod)

Referensi detail `ref.watch`/`ref.read` dari skill `aturan-riverpod`.

## Pola

- `ref.watch(provider)` WAJIB langsung di dalam `build()` untuk rebuild otomatis.
- `ref.read(provider)` di callback/event handler.
- Dilarang `ref.watch` di callback atau di luar `build()`.
- Helper yang dipanggil dari `build()` DILARANG memanggil `ref.watch`/`ref.read` — state hasil `ref.watch` di `build()` WAJIB diteruskan ke helper sebagai parameter.
- `ref.watch(provider.select((state) => state.field))` untuk optimasi rebuild minimal.

## Larangan

- Dilarang `ref.watch` di callback/helper.
- Dilarang mengoper `WidgetRef` ke widget anak via konstruktor/field `State`.
