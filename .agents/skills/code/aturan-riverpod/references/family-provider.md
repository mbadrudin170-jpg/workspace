# Family Provider (Riverpod)

Referensi detail pola family provider dari skill `aturan-riverpod`.

## Pola

- Family provider (`.family`) hanya untuk parameter immutable dan comparable; key stabil untuk caching; family parameter mutable dilarang.
- Family Notifier (class-based) dengan parameter immutable (mis. `build(int impianId)`).
- Pakai: `ref.watch(detailTransaksiNotifierProvider(impianId))`.

## Contoh Benar

```dart
@riverpod
Future<User> user(Ref ref, int id) => fetchUser(id);

final u = ref.watch(userProvider(42));

@Riverpod(keepAlive: true)
class DetailTransaksiNotifier extends _$DetailTransaksiNotifier {
  @override
  Future<List<Transaksi>> build(int impianId) async {
    return _repository.ambilByImpian(impianId);
  }
}
// Pakai: ref.watch(detailTransaksiNotifierProvider(impianId))
```

## Contoh Salah

```dart
// DILARANG: argumen mutable (identitas/== tidak stabil untuk cache)
final ids = <int>[1, 2, 3];
ref.watch(itemsProvider(ids));
```
