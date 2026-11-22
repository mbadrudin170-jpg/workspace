---
name: aturan-riverpod
description: "Trigger: saat memakai Riverpod | Panduan pola Riverpod (notifier CRUD, notifier sinkron, ref.watch/read, ConsumerWidget/ConsumerStatefulWidget pemilihan, family, autoDispose, ProviderScope, select, AsyncValue, muatUlang, penamaan provider, akses state di AsyncNotifier via `await future` bukan `state.value`)."
metadata:
  kategori: "custom"
  versi: "1.9.0"
  diperbarui: "Sun Nov 22 2026 18:10 WIB"
---

# Aturan Riverpod

Ringkasan pola Riverpod. Detail tiap topik ada di bagian referensi di bawah.

---

# Referensi Detail (dipindahkan dari folder references)


## async-value.md

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

## class-notifier.md

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

## family-provider.md

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

## provider-scope.md

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

## ref-watch-read.md

# ref.watch / ref.read (Riverpod)

Referensi detail `ref.watch`/`ref.read` dari skill `aturan-riverpod`.

## Pola

- `ref.watch(provider)` WAJIB langsung di dalam `build()` untuk rebuild otomatis.
- `ref.read(provider)` di callback/event handler.
- Dilarang `ref.watch` di callback atau di luar `build()`.
- Helper yang dipanggil dari `build()` DILARANG memanggil `ref.watch`/`ref.read` — state hasil `ref.watch` di `build()` WAJIB diteruskan ke helper sebagai parameter.
- Helper async (mengembalikan `Future<void>`/`Future<T>`) yang dipanggil dari event handler (bukan dari `build()`) BOLEH memanggil `await ref.read(provider.future)` untuk menunggu state siap; hasilnya adalah `State` non-nullable. DILARANG `ref.read(provider)` sinkron lalu `.requireValue`/`.value` di dalam helper (berisiko state belum siap).
- Helper sync yang dipanggil dari `build()` DILARANG memanggil `ref.read(provider)` maupun `ref.read(provider.future)`; state hasil `ref.watch(provider)` di `build()` WAJIB diteruskan ke helper sebagai parameter.
- `ref.watch(provider.select((state) => state.field))` untuk optimasi rebuild minimal.

## Contoh Benar

```dart
@override
Widget build(BuildContext context) {
  final asyncPelangganAktif = ref.watch(penggunaAktifProvider);
  final asyncPelanggan = ref.watch(pelangganProvider);
  final asyncPaket = ref.watch(paketProvider);

  if (asyncPelangganAktif.isLoading || asyncPelanggan.isLoading || asyncPaket.isLoading) {
    return const Center(child: CircularProgressIndicator());
  }
  if (asyncPelangganAktif.hasError) {
    return _buildMuatGagal('Gagal memuat data: ${asyncPelangganAktif.error}',
        () => ref.refresh(penggunaAktifProvider));
  }
  return _buildBody(
    asyncPelanggan.requireValue,
    asyncPaket.requireValue,
    asyncPelangganAktif.requireValue,
  );
}

Widget _buildBody(PelangganState pelangganState, PaketState paketState, PelangganAktifState pelangganAktifAsync) {
  final semuaPelanggan = pelangganAktifAsync.listPelangganAktif;
  // rendering tanpa ref.watch/ref.read di dalam helper
  return const SizedBox.shrink();
}
```

## Contoh Salah

```dart
// DILARANG: ref.watch/ref.read di dalam helper yang dipanggil dari build()
Widget _buildBody() {
  final nilai = ref.watch(counterProvider); // DILARANG
```

## consumer-widget.md

# ConsumerWidget vs ConsumerStatefulWidget (Riverpod)

Panduan pemilihan widget konsumer Riverpod.

## Pola

- Widget yang hanya memerlukan provider reaktif (`ref.watch`) tanpa state mutable (mis. `TextEditingController`, `FocusNode`, enum lokal) WAJIB memakai `ConsumerWidget`.
- `ConsumerWidget.build` memiliki signature `Widget build(BuildContext context, WidgetRef ref)` dan `ref` diperoleh dari parameter (bukan getter).
- Helper privat yang membutuhkan `BuildContext`/state/provider WAJIB menerima parameter dari `build` (aturan 55); helper aksi (`_...` void) tetap di atas `build`, helper widget (`_build...`) di bawah `build` (aturan 52).
- Jika memerlukan state mutable, tetap pakai `ConsumerStatefulWidget` dengan `ref` getter (aturan 15).
- Pada `ConsumerWidget`, field final diakses via `this.field` (bukan `widget.field`).

## Contoh Benar

```dart
class DetailTransaksiPage extends ConsumerWidget {
  final TransaksiModel transaksi;

  const DetailTransaksiPage({super.key, required this.transaksi});

  void _bukaFormEdit(BuildContext context) {
    unawaited(
      Nav.to(
        context,
        FormTransaksiPage(transaksi: transaksi),
      ).catchError((Object e, StackTrace s) {
        L.e('Gagal membuka form edit transaksi: $e $s');
        return null;
      }),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transaksi = this.transaksi;
    final asyncDompet = ref.watch(dompetProvider);
    if (asyncDompet.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (asyncDompet.hasError) {
      return _buildError(
        context,
        'Gagal memuat: ${asyncDompet.error}',
        () => ref.refresh(dompetProvider),
      );
    }
    final dompetState = asyncDompet.requireValue;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _bukaFormEdit(context),
          ),
        ],
      ),
      body: _buildDetailRow(
        context,
        'Dompet',
        dompetState.getById(transaksi.idDompet)?.namaDompet ?? '-',
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(label),
          Flexible(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String pesan, VoidCallback onRetry) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(pesan),
            FilledButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
```

## Contoh Salah

```dart
// DILARANG: ConsumerStatefulWidget tanpa state mutable
class DetailTransaksiPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<DetailTransaksiPage> createState() => _State();
}

// DILARANG: ref sebagai parameter build() pada ConsumerState (melanggar override State.build)
class _State extends ConsumerState<DetailTransaksiPage> {
  @override
  Widget build(BuildContext context, WidgetRef ref) { ... }
}
```
