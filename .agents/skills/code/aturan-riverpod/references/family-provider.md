# Family Provider (Riverpod)

Referensi detail pola family provider dari skill `aturan-riverpod`.

## Pola

- Family provider (`.family`) hanya untuk parameter immutable dan comparable; key stabil untuk caching; family parameter mutable dilarang.
- Family Notifier (class-based) dengan parameter immutable (mis. `build(int impianId)`).
- Pakai: `ref.watch(detailTransaksiNotifierProvider(impianId))`.

## Larangan

- Dilarang argumen mutable (mis. `List<int>`) karena identitas/`==` tidak stabil untuk cache.
