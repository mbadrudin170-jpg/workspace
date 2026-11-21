# Class Notifier (Riverpod)

Referensi detail pola Notifier Riverpod (CRUD database) yang diserap dari skill `notifier-crud-database`.

## Pola

- `@Riverpod(keepAlive: true)` pada class Notifier.
- `build()` memanggil `_ambilSemua()` (ambil semua data DB → model).
- CRUD: log awal → `await future` → operasi DB → `state = AsyncValue.data(...)` → log sukses → `on Exception catch (e, s)` + `L.e` + `rethrow`.
- Akses DB via `SqfliteOp`; batch via `op.batch(...)`.
- Update parsial kolom via `op.ubah(... where: 'id = ?', whereArgs: [...])` + `copyWith`.
- Konflik insert: `ConflictAlgorithm.abort` (default); `replace` hanya untuk upsert disengaja.

## Larangan

- Jangan update `state` sebelum DB selesai (kecuali optimistic update).
- Jangan menelan exception; wajib `rethrow`.
- Jangan buat instance DB baru di notifier.
