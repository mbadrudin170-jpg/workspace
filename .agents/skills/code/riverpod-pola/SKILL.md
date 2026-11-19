---
name: riverpod-pola
description: "Trigger: saat memakai Riverpod | Panduan pola Riverpod (notifier CRUD dengan `@Riverpod(keepAlive: true)`, notifier sinkron codegen + `@freezed`, `ref.watch` di build / `ref.read` di callback, `Consumer(Stateful)Widget`, family immutable, `autoDispose`, `ProviderScope` di root, `select` untuk rebuild minimal, penanganan `AsyncValue` tanpa `.when` (wajib `isLoading` → `hasError` → `requireValue`), signature `ConsumerState.build(BuildContext)` (`ref` via getter), folder `notifier/` vs `provider/`, try-catch pada `Future`, `await ref.watch(provider.future)` untuk provider Future, akses `.future` provider via `ref.read`/`ref.watch` (bukan langsung pada objek provider), reload `AsyncValue.data` + `catch`/`rethrow` via method `muatUlang()`, dan penamaan provider codegen tanpa akhiran `Notifier`)."
metadata:
  kategori: "custom"
  versi: "1.6.0"
  diperbarui: "Thu Nov 19 2026 03:00 WIB"
---

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
11. Di dalam `build()`, `AsyncValue` wajib ditangani `isLoading` → `hasError` → `requireValue`. `asData?.value`/`valueOrNull` hanya untuk akses opsional (bukan konten utama) dengan penanganan kegagalan eksplisit; dilarang untuk konten utama atau menelan error secara senyap (rujuk `penanganan-async-data-kosong`). Pemakaian `.when` pada `AsyncValue` DILARANG — gunakan urutan `isLoading` → `hasError` → `requireValue` seperti contoh berikut.
    Contoh:
    ```dart
    final async = ref.watch(provider);
    if (async.isLoading) return const LoadingView();
    if (async.hasError) return ErrorView(error: async.error);
    final data = async.requireValue;
    return DataView(data: data);
    ```
    Contoh salah:
    ```dart
    // DILARANG: .when pada AsyncValue
    return ref.watch(provider).when(
      loading: () => const LoadingView(),
      error: (e, s) => ErrorView(error: e),
      data: (d) => DataView(data: d),
    );
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

16. Setiap fungsi `Future` wajib dibungkus `try-catch`; setiap operasi database wajib selesai lebih dahulu, baru memperbarui state; `rethrow` wajib dilakukan agar error diteruskan ke pemanggil/UI (jangan menangkap error tanpa `rethrow` atau `throw`).
    Contoh:
    ```dart
    Future<void> simpan(Item item) async {
      try {
        await db.insert(item); // DB selesai lebih dahulu
        state = [...state, item];
      } catch (e, s) {
        L.e('Gagal simpan item: $e\n$s');
        rethrow; // wajib: error diteruskan ke pemanggil/UI
      }
    }
    ```
17. Mutasi state di luar Notifier dilarang; state hanya diubah oleh Notifier.
18. Di dalam provider/notifier, untuk me-_watch_ provider yang bertipe `Future`, gunakan `await ref.watch(provider.future)`.
    Contoh:
    ```dart
    @riverpod
    Future<Profil> profil(Ref ref) async {
      final user = await ref.watch(userProvider.future); // tunggu Future selesai
      return Profil.fromUser(user);
    }
    ```
19. Method reload (mis. `muatUlang()`) pada notifier wajib: `state = AsyncValue.data(await _ambilSemua());` lalu `catch (e, s)` dengan logging `L.e(...)` dan **wajib `rethrow;`** agar UI/provider yang memanggil mengetahui terjadi error — jangan gunakan `setState`, jangan gunakan `AsyncValue.loading()` atau `AsyncValue.guard`, dan jangan menangkap error tanpa `rethrow`.
    Contoh:
    ```dart
    Future<void> muatUlang() async {
      try {
        state = AsyncValue.data(await _ambilSemua());
      } catch (e, s) {
        L.e('Gagal memuat ulang pelanggan aktif: $e\n$s');
        rethrow;
      }
    }
    ```
20. Nama provider hasil codegen = nama class tanpa akhiran `Notifier` dalam camelCase (mis. `PenggunaAktifNotifier` → `penggunaAktifProvider`); jangan membuat provider manual yang menduplikasi provider codegen.
21. Saat konversi `StatefulWidget` → `ConsumerStatefulWidget`, `ConsumerState.build` WAJIB satu parameter `BuildContext` (`ref` diakses lewat getter `ref`); `WidgetRef` sebagai parameter `build()` DILARANG karena melanggar override `State.build` (error validasi).
    Contoh benar:

    ```dart
    @override
    Widget build(BuildContext context) {
      final nilai = ref.watch(counterProvider); // ref via getter
      return Text('$nilai');
    }
    ```

    Contoh salah:

    ```dart
    // DILARANG: WidgetRef sebagai parameter build()
    @override
    Widget build(BuildContext context, WidgetRef ref) => ...;
    ```

22. Akses state provider yang bertipe `Future`/`AsyncNotifier` dari UI atau method non-build WAJIB melalui `ref`: gunakan `await ref.read(provider.future)` di callback/event handler, atau `await ref.watch(provider.future)` di dalam provider lain. DILARANG memanggil `.future` langsung pada objek provider (mis. `await paketProvider.future` atau `await (paketProvider.future)`) karena menghasilkan `Refreshable<Future<T>>`, bukan `Future<T>` — method/field state (mis. `getById`) tidak ditemukan dan analyzer melaporkan `undefined_method` pada `Refreshable<Future<...>>`. Paritas dengan Aturan 4 (`ref.read` di callback) dan Aturan 18 (`ref.watch` di provider).
    Contoh benar:
    ```dart
    // Di callback/event handler (UI)
    final paketState = await ref.read(paketProvider.future);
    final paket = paketState.getById(idPaket);

    // Di dalam provider lain
    final user = await ref.watch(userProvider.future);
    ```
    Contoh salah:
    ```dart
    // DILARANG: .future langsung pada objek provider
    final paketState = await paketProvider.future;        // Refreshable<Future<PaketState>>
    final paketState = await (paketProvider.future);      // idem
    // Akibat: paketState bertipe Refreshable<Future<PaketState>>,
    // method getById (milik PaketState) tidak ditemukan.
    ```

## Contoh Benar (lengkap)

Notifier codegen dengan state Freezed dan method reload (proyek `admin_wifi`, commit `f9568a1`):

```dart
@Riverpod(keepAlive: true)
class PenggunaAktifNotifier extends _$PenggunaAktifNotifier {
  final PelangganAktifOperasi _operasi = PelangganAktifOperasi();

  @override
  Future<PelangganAktifState> build() async {
    Log.info('Memuat daftar pelanggan aktif dari database');
    return _ambilSemua();
  }

  Future<void> muatUlang() async {
    try {
      state = AsyncValue.data(await _ambilSemua());
    } catch (e, s) {
      L.e('Gagal memuat ulang pelanggan aktif: $e\n$s');
      rethrow;
    }
  }

  Future<PelangganAktifState> _ambilSemua() async {
    final daftar = await _operasi.ambilSemuaPelangganAktif();
    return PelangganAktifState(
      listPelangganAktif: daftar,
      jumlahPelangganAktif: daftar.length,
    );
  }
}
// Akses dari UI: `ref.watch(penggunaAktifProvider)`; reload lewat
// `ref.read(penggunaAktifProvider.notifier).muatUlang();`.
```

## Sumber Evaluasi

- File: `admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart` (proyek `admin_wifi`, sesi 35)
- File state: `admin_wifi/lib/fitur/state/pelanggan_aktif_state.dart`
- Commit rujukan: `f9568a11173bab474012db81f7c6d066e80f15c5` — Notifier codegen + `PelangganAktifState` (proyek `admin_wifi`)
- Aturan terkait: `.agents/rules/code.md` (reload `AsyncValue.guard` & codegen provider; lazy IndexedStack)
- Provenance (sesi 56, 2026-11-19; alur commit-based): commit `6864dea` (proyek `admin_wifi`, "m", 2026-11-18 23:24 UTC) — perbaikan `lib/fitur/pelanggan_aktif/screens/form_pelanggan_aktif.dart` `_petakanModeEdit()`: `await (paketProvider.future)` → `await ref.read(paketProvider.future)` (error `getById` tidak ditemukan pada `Refreshable<Future<PaketState>>`). Aturan 22 baru ditambahkan berdasarkan temuan ini.
