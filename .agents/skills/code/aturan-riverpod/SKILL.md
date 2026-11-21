---
name: aturan-riverpod
description: "Trigger: saat memakai Riverpod | Panduan pola Riverpod (notifier CRUD, notifier sinkron, ref.watch/read, ConsumerWidget, family, autoDispose, ProviderScope, select, AsyncValue, muatUlang, penamaan provider). Detail tiap topik di references/."
metadata:
  kategori: "custom"
  versi: "1.8.0"
  diperbarui: "Sat Nov 21 2026 08:32 WIB"
---

# Aturan Riverpod

Ringkasan pola Riverpod. Detail tiap topik ada di `references/`.

## Referensi

- `references/class-notifier.md` — Notifier CRUD database: `@Riverpod(keepAlive: true)`, `build()`→`_ambilSemua()`, CRUD update state setelah DB, `catch Exception`+`rethrow`, `SqfliteOp`, batch, update parsial, konflik insert, larangan.
- `references/family-provider.md` — Family provider: param immutable/comparable, cache key stabil, Family Notifier class-based, larangan argumen mutable.
- `references/async-value.md` — Penanganan `AsyncValue`: `isLoading`→`hasError`→`requireValue`, `asData?.value` opsional, larangan `.when`.
- `references/provider-scope.md` — `ProviderScope` di root, overrides, testing, `UncontrolledProviderScope`, larangan nested/modifikasi lifecycle.
- `references/ref-watch-read.md` — `ref.watch` di `build()`, `ref.read` di callback, helper menerima state via param, `select`, larangan `WidgetRef` ke anak.
