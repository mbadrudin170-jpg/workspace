---
name: riverpod-pola
description: "Trigger: saat memakai Riverpod | Panduan pola Riverpod (notifier CRUD dengan `@Riverpod(keepAlive: true)`, notifier sinkron codegen + `@freezed`, `ref.watch` di build / `ref.read` di callback, `Consumer(Stateful)Widget`, family immutable, `autoDispose`, `ProviderScope` di root, `select` untuk rebuild minimal, penanganan `AsyncValue`, folder `notifier/` vs `provider/`, dan try-catch pada `Future`)."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Mon Nov 16 2026 21:31 WIB"
---

# Riverpod Pola

Panduan pola Riverpod untuk aplikasi Flutter: notifier CRUD, state notifier sinkron, pembagian `notifier/` vs `provider/`, akses `ref` yang aman, optimasi rebuild, dan penanganan `AsyncValue`.

## Aturan

1. Notifier database (CRUD): gunakan `@Riverpod(keepAlive: true)`; `build()` memanggil `_ambilSemua()`; update state setelah DB berhasil; `catch Exception` lalu `rethrow`.
2. Notifier state sinkron (non-CRUD) juga wajib codegen `@Riverpod(keepAlive: true)` dengan `build()` sinkron; `StateNotifier`/`StateNotifierProvider`/`legacy.dart` dilarang.
3. State notifier sinkron wajib `@freezed`; field nullable dikosongkan lewat `copyWith(field: null)` (sentinel codegen), tanpa bendera manual.
4. `ref.watch(provider)` di `build()` untuk rebuild otomatis; `ref.read(provider)` di callback/event handler; `ref.watch` di callback/di luar `build` dilarang.
5. Gunakan `ConsumerWidget`/`ConsumerStatefulWidget` untuk akses `ref`; `Consumer` granular untuk optimasi; jangan bungkus seluruh halaman besar.
6. Family provider (`.family`) hanya untuk parameter immutable & comparable; key stabil untuk caching; family dengan parameter mutable dilarang.
7. `autoDispose` untuk provider sementara (form, filter, pencarian) yang hanya dibutuhkan saat layar aktif.
8. `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`); `overrides` hanya berlaku untuk scope itu dan keturunannya; nested `ProviderScope` dilarang kecuali kebutuhan nyata dan dipahami konsekuensinya.
9. Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
10. Optimasi rebuild dengan `ref.watch(provider.select((state) => state.field))`.
11. AsyncValue di UI: tangani `isLoading` → `hasError` → `requireValue`; `asData?.value` hanya untuk akses opsional (lihat skill `penanganan-async-data-kosong`).
12. Dilarang oper `WidgetRef` ke widget anak via konstruktor/field State; widget anak yang butuh `ref` wajib `Consumer(Stateful)Widget`.
13. `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.
14. Jangan modifikasi provider di lifecycle method widget (`build`, `initState`, `dispose`, `didUpdateWidget`, `didChangeDependencies`).
15. Provider CRUD wajib disimpan di folder `notifier/` dan namanya wajib mengandung `Notifier` (mis. `BiodataNotifier`); provider read-only wajib disimpan di folder `provider/` dengan nama tanpa akhiran manual (mis. `biodata` → `biodataProvider`).
16. Setiap fungsi `Future` wajib dibungkus `try-catch`; setiap operasi database wajib selesai lebih dahulu, baru state diperbarui.
17. Mutasi state di luar Notifier dilarang; state hanya diubah oleh Notifier.

## Contoh Benar

```dart
@Riverpod(keepAlive: true)
class BiodataNotifier extends _$BiodataNotifier {
  @override
  Future<BiodataModel?> build() => _ambilSemua();

  Future<BiodataModel?> _ambilSemua() async {
    try {
      // ambil dari database
      return null;
    } on Exception {
      rethrow;
    }
  }
}
```

```dart
final biodataAsync = ref.watch(biodataProvider);

// callback/event handler
onPressed: () => ref.read(biodataProvider.notifier).simpan(model),
```

```dart
// select untuk rebuild minimal
final nama = ref.watch(biodataProvider.select((v) => v.valueOrNull?.nama));
```

## Contoh Salah

```dart
// DILARANG: ref.watch di callback/event handler
onPressed: () => ref.watch(biodataProvider);
```

```dart
// DILARANG: StateNotifier/legacy.dart untuk state baru
class BiodataNotifier extends StateNotifier<AsyncValue<BiodataModel?>> { /* ... */ }
```

## Sumber Evaluasi

- Berkas sumber: `prompt/skill/riverpod-pola.md`.
- Dokumen resmi Riverpod: `riverpod.dev` dan contoh paket `flutter_riverpod` / `riverpod_generator`.
