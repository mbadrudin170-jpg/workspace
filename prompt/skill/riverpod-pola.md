diperbarui : Mon Nov 16 2026 13:48 WIB
file : [riverpod-pola](../../.agents/skills/custom/riverpod-pola/SKILL.md)

1. Notifier database (CRUD): gunakan `@Riverpod(keepAlive: true)`; `build()` memanggil `_ambilSemua()`; update state setelah DB berhasil; catch `Exception` lalu `rethrow`.
2. Notifier state sinkron (non-CRUD) juga wajib codegen `@Riverpod(keepAlive: true)` dengan `build()` sinkron; larangan `StateNotifier`/`StateNotifierProvider`/`legacy.dart`.
3. State notifier sinkron wajib `@freezed`; field nullable dikosongkan lewat `copyWith(field: null)` (sentinel codegen), tanpa bendera manual.
4. `ref.watch(provider)` di `build()` untuk rebuild otomatis; `ref.read(provider)` di callback/event handler; dilarang `ref.watch` di callback.
5. Gunakan `ConsumerWidget`/`ConsumerStatefulWidget` untuk akses `ref`; `Consumer` granular untuk optimasi; jangan bungkus seluruh halaman besar.
6. Family provider (`.family`) hanya untuk parameter immutable & comparable; key stabil untuk caching.
7. `autoDispose` untuk provider sementara (form, filter, pencarian) yang hanya dibutuhkan saat layar aktif.
8. Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
9. Optimasi rebuild dengan `ref.watch(provider.select((state) => state.field))`.
10. AsyncValue di UI: tangani `isLoading` → `hasError` → `requireValue`; `asData?.value` hanya untuk akses opsional (lihat `penanganan-async-data-kosong`).
11. Dilarang oper `WidgetRef` ke widget anak via konstruktor/field State; widget anak yang butuh `ref` wajib `ConsumerStatefulWidget`.
12. Larangan: `ref.watch` di luar `build`; mutate state di luar Notifier; `ProviderScope` nested; family parameter mutable; `StateNotifier`/`legacy.dart` untuk state baru.
13. `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`); `containerOf` dengan `listen` sesuai kebutuhan; `overrides` hanya untuk scope tersebut dan keturunannya.
14. `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.
15. Vsync: jangan memodifikasi provider di lifecycle method widget (`build`, `initState`, `dispose`, `didUpdateWidget`, `didChangeDependencies`).

16. ProviderScope wajib di root widget tree: `runApp(ProviderScope(child: MyApp()));` (overrides hanya untuk scope dan keturunannya).

17. UncontrolledProviderScope: expose `ProviderContainer` tanpa mengelola siklus hidupnya; dispose adalah tanggung jawab pemanggil.

18. Provider yang memiliki fungsi CRUD wajib disimpan di folder `notifier/` dan namanya wajib mengandung `Notifier` (mis. `BiodataNotifier`).

19. Provider yang hanya mengambil nilai wajib disimpan di folder `provider/`; namanya cukup tanpa akhiran `Provider` (build runner menambahkannya otomatis, mis. `biodata` → `biodataProvider`).

## Contoh

```dart
// Notifier CRUD (codegen)
@Riverpod(keepAlive: true)
class BiodataNotifier extends _$BiodataNotifier {
  @override
  Future<BiodataModel?> build() => _ambilSemua();

  Future<BiodataModel?> _ambilSemua() async { ... }

  Future<void> simpan(BiodataModel model) async {
    await SqfliteOp.sisipkan(...);
    state = AsyncValue.data(await _ambilSemua());
  }
}

// ref.watch di build, ref.read di callback
final biodataAsync = ref.watch(biodataProvider);
onPressed: () async => await ref.read(biodataProvider.notifier).simpan(model);

// Family
@riverpod
Future<ImpianModel?> impianDetail(Ref ref, String impianId) async { ... }
ref.watch(impianDetailProvider(impianId));

// autoDispose
@Riverpod(autoDispose: true)
class FormCravingController extends _$FormCravingController {
  @override
  FormCravingState build() => const FormCravingState();
}

// select
final nama = ref.watch(biodataProvider.select((v) => v.valueOrNull?.nama));

// AsyncValue
if (async.isLoading) return LoadingView();
if (async.hasError) return ErrorRetry(onRetry: () => ref.refresh(provider));
final data = async.requireValue;

// gunakan ini di dalam provider future yang ingin selalu memantau data terbaru:
final future = await ref.watch(provider.future);
```
