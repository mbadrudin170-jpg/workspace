---
name: penanganan-async-data-kosong
description: "Trigger: saat layar menangani state async atau data kosong | Panduan isLoading, hasError, requireValue, empty state, data tidak lengkap, early return, mounted check, penanganan wajib cache provider (provider sinkron turunan dan keepAlive)."
metadata:
  kategori: "custom"
  versi: "1.3.1"
  diperbarui: "Thu Nov 19 2026 22:27 WIB"
---

# Penanganan State Asynchronous dan Data Kosong pada Layar

Layar async wajib handle isLoading → hasError → requireValue → empty state → data tidak lengkap, early return, mounted check.

## Aturan

1. Layar yang memuat data asynchronous wajib menangani status `isLoading` terlebih dahulu (tampilkan indikator loading).
2. Setelah itu, tangani status `hasError` (tampilkan pesan error dan tombol retry yang memanggil `ref.refresh(provider)`). DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`.
3. Setelah data tersedia (`requireValue`), tangani kondisi data kosong (empty state) dan kondisi data tidak lengkap (mis. biodata null, tanggal berhenti null) sebagai tampilan tersendiri dengan informasi dan call-to-action.
4. Gunakan early return (guard clause) untuk setiap kondisi tersebut agar alur build tetap linear dan mudah dibaca.
5. Gunakan `const SizedBox.shrink()` untuk widget kondisional yang disembunyikan.
6. Setelah `await`/operasi asynchronous, periksa `mounted` sebelum mengakses `context` atau memanggil `setState`.
7. Pengambilan data dari provider yang berfungsi sebagai cache wajib menangani tiga status (`isLoading`, `hasError`, `data`) secara eksplisit. Cakupan cache provider meliputi: (a) provider sinkron turunan `Provider<AsyncValue<T>>` yang menurunkan `AsyncValue` dari provider sumber (mis. `filteredBasesProvider`, `baseSerupaProvider`); (b) `FutureProvider`/`AsyncNotifier` dengan `keepAlive: true`. Pada **konten utama** layar, setiap kasus gagal (`hasError`) wajib menampilkan pesan error dan aksi retry (`ref.refresh(provider)`). Pada **bagian opsional** yang disembunyikan secara sadar saat gagal (mis. ikon favorit, section rekomendasi), minimal wajib logging (`L.w`/`L.e`) di titik konsumsi.

## Larangan

- Jangan memanggil `requireValue` sebelum memastikan `isLoading` dan `hasError` sudah ditangani.
- Jangan menampilkan layar kosong tanpa informasi atau CTA ketika data kosong.
- Jangan menggabungkan penanganan loading, error, dan data kosong dalam satu blok yang sulit dibaca.
- DILARANG menelan kegagalan cache provider secara senyap: `.asData?.value`/`valueOrNull` tanpa pesan error, tanpa retry, dan tanpa logging. Khusus konten utama layar, `.asData?.value`/`valueOrNull` DILARANG sama sekali.

## Contoh Benar

```dart
final dataAsync = ref.watch(provider);

if (dataAsync.isLoading) {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
if (dataAsync.hasError) {
  return Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const Text('Gagal memuat data'), OutlinedButton(onPressed: () => ref.refresh(provider), child: const Text('Coba lagi'))])));
}

final state = dataAsync.requireValue;
if (state.list.isEmpty) {
  return Scaffold(
    body: EmptyStateView(
      ikon: CupertinoIcons.book,
      judul: 'Belum ada data',
      deskripsi: 'Tekan tombol + untuk menambah data pertama.',
      ctaLabel: 'Tambah',
      onCta: () => unawaited(
        Nav.to(context, const FormPage()).catchError((Object e, StackTrace s) {
          L.e('Gagal navigasi: $e $s');
          return null;
        }),
      ),
    ),
  );
}
return Scaffold(body: _Daftar(state.list));
```

Konten utama yang mengambil data dari cache provider turunan:

```dart
final basesAsync = ref.watch(filteredBasesProvider);

if (basesAsync.isLoading) {
  return const Center(child: CircularProgressIndicator());
}
if (basesAsync.hasError) {
  return _TampilanGagal(onCobaLagi: () => ref.refresh(katalogProvider));
}
final bases = basesAsync.requireValue;
```

Bagian opsional yang disembunyikan secara sadar saat gagal (wajib log):

```dart
final serupaAsync = ref.watch(baseSerupaProvider(widget.base));
if (serupaAsync.hasError) {
  L.w('Gagal memuat base serupa: ${serupaAsync.error}');
}
final serupa = serupaAsync.asData?.value ?? const <BaseLayout>[];
```

Bagian opsional tanpa logger `L` (pakai `debugPrint`, pola dari commit `45ae356` di `base_coc`):

```dart
final serupaAsync = ref.watch(baseSerupaProvider(widget.base));
if (serupaAsync.hasError) {
  debugPrint(
    'DetailBaseScreen: gagal memuat base serupa: ${serupaAsync.error}',
  );
}
final kandidatSerupa = serupaAsync.asData?.value ?? const <BaseLayout>[];
```

## Contoh Salah

```dart
final state = dataAsync.requireValue;
return Scaffold(body: ListView(...));
```

```dart
// DILARANG: kegagalan cache provider ditelan senyap; konten utama memakai asData tanpa penanganan
final bases = ref.watch(filteredBasesProvider).asData?.value ?? [];
return GridBase(bases: bases, ...);
```

## Sumber Evaluasi

- Commit: `3b67d3095dacc4e5c7ea78d7eb251809e3e9d981`, `02aa6b29b0669a4f5bf21651b09b43552f65d6f8`, `65abc0104fc8eec90cde9906c52d3f65cba13ba3` (`EmptyStateView` sebagai empty state bersama)
- File: `lib/fitur/diary_craving/screens/diary_craving_screen.dart`, `lib/fitur/pemulihan_kesehatan/screens/pemulihan_kesehatan_screen.dart`, `lib/fitur/dashboard/screens/dashboard_screen.dart`
- Commit `base_coc` `b8fbdbb`, `71a69f0`, `6272b61` (pola cache provider sinkron turunan: `katalog_provider.dart` — `filteredBasesProvider` via `.whenData(...)`; `base_serupa_provider.dart` — `baseSerupaProvider`)
- Diskusi/sesi 153 (2026-11-16): aturan cache provider — konten utama wajib pesan error + retry; section opsional minimal `L.w`/`L.e` (keputusan pengguna via tool `question`)
- Commit `base_coc` `45ae356d29dd0bbed8b52567eff5615dc379ddec` (`detail_base_screen.dart`: `serupaAsync.hasError` → `debugPrint` + `asData?.value ?? const <BaseLayout>[]`; section disembunyikan bila kosong, tidak `requireValue`)
- Sesi 54 (2026-11-19): perintah eksplisit pengguna "harusnya refresh bukan invalidate" — retry pada `hasError` wajib `ref.refresh(provider)`, bukan `ref.invalidate(provider)` (di luar alur commit-history atas persetujuan pengguna).
