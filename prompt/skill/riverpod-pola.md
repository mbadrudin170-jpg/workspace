diperbarui : Mon Nov 16 2026 21:31 WIB
file : [riverpod-pola](../../.agents/skills/custom/riverpod-pola/SKILL.md)

1. Notifier database (CRUD): gunakan `@Riverpod(keepAlive: true)`; `build()` memanggil `_ambilSemua()`; update state setelah DB berhasil; `catch Exception` lalu `rethrow`.
2. Notifier state sinkron (non-CRUD) juga wajib codegen `@Riverpod(keepAlive: true)` dengan `build()` sinkron; larangan `StateNotifier`/`StateNotifierProvider`/`legacy.dart`.
3. State notifier sinkron wajib `@freezed`; field nullable dikosongkan lewat `copyWith(field: null)` (sentinel codegen), tanpa bendera manual.
4. `ref.watch(provider)` di `build()` untuk rebuild otomatis; `ref.read(provider)` di callback/event handler; dilarang `ref.watch` di callback/di luar `build`.
5. Gunakan `ConsumerWidget`/`ConsumerStatefulWidget` untuk akses `ref`; `Consumer` granular untuk optimasi; jangan bungkus seluruh halaman besar.
6. Family provider (`.family`) hanya untuk parameter immutable & comparable; key stabil untuk caching; family parameter mutable dilarang.
7. `autoDispose` untuk provider sementara (form, filter, pencarian) yang hanya dibutuhkan saat layar aktif.
8. `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`); `overrides` hanya untuk scope itu dan keturunannya; `ProviderScope` nested dilarang.
9. Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
10. Optimasi rebuild dengan `ref.watch(provider.select((state) => state.field))`.
11. AsyncValue di UI: tangani `isLoading` → `hasError` → `requireValue`; `asData?.value` hanya untuk akses opsional (rujuk `penanganan-async-data-kosong`).
12. Dilarang oper `WidgetRef` ke widget anak via konstruktor/field State; widget anak yang butuh `ref` wajib `Consumer(Stateful)Widget`.
13. `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.
14. Jangan memodifikasi provider di lifecycle method widget (`build`, `initState`, `dispose`, `didUpdateWidget`, `didChangeDependencies`).
15. Provider CRUD wajib di folder `notifier/` dan namanya wajib mengandung `Notifier` (mis. `BiodataNotifier`); provider read-only wajib di folder `provider/` tanpa akhiran manual (mis. `biodata`).
16. Setiap fungsi `Future` wajib dibungkus `try-catch`; setiap operasi database wajib selesai lebih dahulu, baru memperbarui state.
17. Mutasi state di luar Notifier dilarang; state hanya diubah oleh Notifier.
