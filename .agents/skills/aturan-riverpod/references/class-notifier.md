# Class Notifier (Riverpod)

Referensi detail pola Notifier Riverpod (CRUD database) yang diserap dari skill `notifier-crud-database`.

## Pola

- `@Riverpod(keepAlive: true)` pada class Notifier.
- `build()` memanggil `_ambilSemua()` (ambil semua data DB → model).
- CRUD: log awal → `await future` → operasi DB → `state = AsyncValue.data(...)` → log sukses → `on Exception catch (e, s)` + `L.e` + `rethrow`.
- Akses DB via `SqfliteOp`; batch via `op.batch(...)`.
- Update parsial kolom via `op.ubah(... where: 'id = ?', whereArgs: [...])` + `copyWith`.
- Konflik insert: `ConflictAlgorithm.abort` (default); `replace` hanya untuk upsert disengaja.
- Setelah `await future` di dalam method CRUD, jangan akses provider lain yang bisa memicu rebuild tidak perlu; state diperbarui murni dari `dataLama` + model baru.

## Larangan

- Jangan update `state` sebelum DB selesai (kecuali optimistic update).
- Jangan menelan exception; wajib `rethrow`.
- Jangan buat instance DB baru di notifier.
- Jangan persistenkan `id` yang tidak di-generate (mis. dari input pengguna) tanpa keputusan eksplisit.

## Contoh Benar

```dart
@Riverpod(keepAlive: true)
class DiaryCravingNotifier extends _$DiaryCravingNotifier {
  @override
  Future<DiaryCravingState> build() async {
    return _ambilSemua();
  }

  Future<DiaryCravingState> _ambilSemua() async {
    final op = const SqfliteOp();
    final rows = await op.ambilSemua(NamaTabel.diaryCraving);
    return DiaryCravingState(
      listCraving: rows.map((r) => DiaryCravingModel.fromSqflite(r)).toList(),
      jumlahCraving: rows.length,
    );
  }

  Future<void> tambah(DiaryCravingModel craving) async {
    L.i('craving.id=${craving.id}');
    try {
      final dataLama = await future;
      final op = const SqfliteOp();
      await op.tambah(NamaTabel.diaryCraving, craving.toSqflite(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      state = AsyncValue.data(
        DiaryCravingState(
          listCraving: [craving, ...dataLama.listCraving],
          jumlahCraving: dataLama.jumlahCraving + 1,
        ),
      );
      L.s('Diary craving berhasil disimpan');
    } on Exception catch (e, s) {
      L.e('Gagal menyimpan diary craving: $e $s');
      rethrow;
    }
  }
}
```

## Contoh Salah

```dart
// Memperbarui state sebelum operasi database selesai.
state = AsyncValue.data(DiaryCravingState(listCraving: [craving, ...list]));
await op.tambah(NamaTabel.diaryCraving, craving.toSqflite()); // jika gagal, state sudah berubah
```
