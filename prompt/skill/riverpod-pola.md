diperbarui : Tue Nov 17 2026 18:25 WIB
file : [riverpod-pola](../../.agents/skills/code/riverpod-pola/SKILL.md)

1. Notifier database (CRUD): gunakan `@Riverpod(keepAlive: true)`; `build()` memanggil `_ambilSemua()`; update state setelah DB berhasil; `catch Exception` lalu `rethrow`.
2. Notifier state sinkron (non-CRUD) wajib codegen `@Riverpod(keepAlive: true)` dengan `build()` sinkron; larangan `StateNotifier`/`StateNotifierProvider`/`legacy.dart`.
   Contoh:
   ```dart
   @Riverpod(keepAlive: true)
   class TemaNotifier extends _$TemaNotifier {
     @override
     TemaState build() => const TemaState(); // sinkron

     void ubahMode(ThemeMode mode) {
       state = state.copyWith(mode: mode);
     }
   }
   // Dilarang: StateNotifier/StateNotifierProvider/legacy.dart
   ```
3. State notifier sinkron wajib `@freezed`; field nullable dikosongkan lewat `copyWith(field: null)` (sentinel codegen), tanpa bendera manual.
4. `ref.watch(provider)` di `build()` untuk rebuild otomatis; `ref.read(provider)` di callback/event handler; dilarang `ref.watch` di callback atau di luar `build()`.
   Contoh:
   ```dart
   @override
   Widget build(BuildContext context, WidgetRef ref) {
     final nilai = ref.watch(counterProvider); // rebuild otomatis
     return ElevatedButton(
       onPressed: () => ref.read(counterProvider.notifier).increment(), // callback
       child: Text('$nilai'),
     );
   }
   // Dilarang: ref.watch di callback atau di luar build()
   ```
5. Gunakan `ConsumerWidget`/`ConsumerStatefulWidget` untuk akses `ref`; `Consumer` granular untuk optimasi; jangan bungkus seluruh halaman besar.
6. Family provider (`.family`) hanya untuk parameter immutable dan comparable; key stabil untuk caching; family parameter mutable dilarang.
    Contoh:
    ```dart
    // Benar: parameter immutable & comparable (key stabil)
    @riverpod
    Future<User> user(Ref ref, int id) => fetchUser(id);
    final u = ref.watch(userProvider(42));

    // Salah: parameter mutable (identitas/== tidak stabil untuk cache)
    final ids = <int>[1, 2, 3];
    ref.watch(itemsProvider(ids)); // DILARANG: argumen mutable

    // --- Tambahan: Family Notifier (class-based) ---
    // Benar: family notifier dengan parameter immutable
    @Riverpod(keepAlive: true)
    class DetailTransaksiNotifier extends _$DetailTransaksiNotifier {
      @override
      Future<List<Transaksi>> build(int impianId) async {
        return _repository.ambilByImpian(impianId);
      }

      Future<void> tambah(Transaksi t) async {
        try {
          await _repository.tambah(t);
          state = AsyncValue.data([...state.requireValue, t]);
        } catch (e) {
          state = AsyncValue.error(e, StackTrace.current);
        }
      }
    }
    // Pakai: ref.watch(detailTransaksiNotifierProvider(impianId))
    ```
7. `autoDispose` untuk provider sementara (form, filter, pencarian) yang hanya dibutuhkan saat layar aktif.
8. `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`); `overrides` hanya untuk scope itu dan keturunannya; `ProviderScope` nested dilarang.
9. Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
   Contoh:
   ```dart
   await tester.pumpWidget(
     ProviderScope(
       overrides: [
         repoProvider.overrideWithValue(FakeRepo()),
       ],
       child: const MyApp(),
     ),
   );
   ```
10. Optimasi rebuild dengan `ref.watch(provider.select((state) => state.field))`.
    Contoh:
    ```dart
    final nama = ref.watch(userProvider.select((s) => s.nama));
    ```
11. Di dalam `build()`, `AsyncValue` wajib ditangani `isLoading` → `hasError` → `requireValue`. `asData?.value`/`valueOrNull` hanya untuk akses opsional (bukan konten utama) dengan penanganan kegagalan eksplisit; dilarang untuk konten utama atau menelan error secara senyap (rujuk `penanganan-async-data-kosong`).
    Contoh:
    ```dart
    final async = ref.watch(provider);
    if (async.isLoading) return const LoadingView();
    if (async.hasError) return ErrorView(error: async.error);
    final data = async.requireValue;
    return DataView(data: data);
    ```
12. Dilarang mengoper `WidgetRef` ke widget anak via konstruktor/field `State`; widget anak yang butuh `ref` wajib `Consumer(Stateful)Widget`.
    Contoh:
    ```dart
    // Salah: mengoper WidgetRef ke widget anak
    class AnakWidget extends StatelessWidget {
      final WidgetRef ref;
      const AnakWidget({super.key, required this.ref});

      @override
      Widget build(BuildContext context) {
        final nilai = ref.watch(counterProvider);
        return Text('$nilai');
      }
    }

    // Benar: widget anak akses ref sendiri
    class AnakWidget extends ConsumerWidget {
      const AnakWidget({super.key});

      @override
      Widget build(BuildContext context, WidgetRef ref) {
        final nilai = ref.watch(counterProvider);
        return Text('$nilai');
      }
    }
    ```
13. `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.
    Contoh:
    ```dart
    final container = ProviderContainer();
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );

    // Saat container tidak lagi dipakai (mis. teardown/test), pemanggil wajib dispose
    container.dispose();
    ```
14. Jangan memodifikasi provider di lifecycle method widget (`build`, `initState`, `dispose`, `didUpdateWidget`, `didChangeDependencies`).
    Contoh:
    ```dart
    // Salah: modifikasi provider di lifecycle
    @override
    void initState() {
      super.initState();
      ref.read(counterProvider.notifier).increment();
    }

    // Benar: picu dari interaksi pengguna/callback
    ElevatedButton(
      onPressed: () => ref.read(counterProvider.notifier).increment(),
      child: const Text('Tambah'),
    );
    ```
15. Provider CRUD wajib di folder `notifier/` dan namanya wajib mengandung `Notifier` (mis. `BiodataNotifier`); provider read-only wajib di folder `provider/` tanpa akhiran `Notifier` (mis. `biodata`).
    Contoh:
    ```dart
    // CRUD -> lib/fitur/.../notifier/biodata_notifier.dart
    @riverpod
    class BiodataNotifier extends _$BiodataNotifier { /* ... */ }

    // Read-only -> lib/fitur/.../provider/biodata_provider.dart
    @riverpod
    Future<Biodata> biodata(BiodataRef ref) async { /* ... */ }
    ```
16. Setiap fungsi `Future` wajib dibungkus `try-catch`; setiap operasi database wajib selesai lebih dahulu, baru memperbarui state.
    Contoh:
    ```dart
    Future<void> simpan(Item item) async {
      try {
        await db.insert(item); // DB selesai lebih dahulu
        state = [...state, item];
      } catch (e) {
        rethrow; // atau tangani sesuai kebutuhan
      }
    }
    ```
17. Mutasi state di luar Notifier dilarang; state hanya diubah oleh Notifier.
18. Di dalam provider/notifier, untuk me-*watch* provider yang bertipe `Future`, gunakan `await ref.watch(provider.future)`.
    Contoh:
    ```dart
    @riverpod
    Future<Profil> profil(Ref ref) async {
      final user = await ref.watch(userProvider.future); // tunggu Future selesai
      return Profil.fromUser(user);
    }
    ```