---
name: pola-ux
description: "Trigger: saat menerapkan pola UX Flutter (termasuk dialog konfirmasi ya/tidak dengan showOkCancelAlertDialog) | Indeks: empty-state-daftar, validasi-form-sebelum-penyimpanan, penanganan-async. Indeks Pola UX Standar Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap pola UX, termasuk dialog konfirmasi ya/tidak yang wajib memakai showOkCancelAlertDialog dari adaptive_dialog (OkCancelResult), bukan showDialog + AlertDialog manual. Jangan menduplikasi isi skill spesifik di sini. Semua pola UX yang tercantum di bawah ini sudah terimplementasi di proyek Flutter dan dapat digunakan sebagai referensi untuk pola serupa di proyek lain. Cakupan yang Di-Cover - Package: `package:flutter` (class `Form`, `GlobalKey`, `SafeArea`, `Padding`, `FAB`, `Icon`, `Text`, `FilledButton`, `Scaffold`, `ShowDialog`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`, `ConsumerState`), `package:shared_preferences` (class `SharedPreferences`), `package:adaptive_dialog` (class `showOkCancelAlertDialog`, `OkCancelResult`) - Class: `Form`, `GlobalKey<FormState>`, `AsyncValue`, `SharedPreferences`, `AppToast`, `L` (logging), `Nav` (navigasi) - Properti: `isLoading`, `hasError`,"
---

# Indeks Pola UX Standar

Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap pola UX. Jangan menduplikasi isi skill spesifik di sini. Semua pola UX yang tercantum di bawah ini sudah terimplementasi di proyek Flutter dan dapat digunakan sebagai referensi untuk pola serupa di proyek lain.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `Form`, `GlobalKey`, `SafeArea`, `Padding`, `FAB`, `Icon`, `Text`, `FilledButton`, `Scaffold`, `ShowDialog`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`, `ConsumerState`), `package:shared_preferences` (class `SharedPreferences`), `package:adaptive_dialog` (class `showOkCancelAlertDialog`, `OkCancelResult`)
- Class: `Form`, `GlobalKey<FormState>`, `AsyncValue`, `SharedPreferences`, `AppToast`, `L` (logging), `Nav` (navigasi)
- Properti: `isLoading`, `hasError`, `requireValue`, `asData?.value`, `isDestructiveAction`, `onRetry`
- Method: `Form.of()`, `GlobalKey.currentState?.validate()`, `ref.watch()`, `ref.refresh()`, `AsyncValue.requireValue()`, `SharedPreferences.setBool()`, `AppToast.sukses()`, `unawaited()`

## Aturan

1. Selalu minta konfirmasi dengan penjelasan konsekuensi sebelum aksi destruktif (hapus, export, reset).
2. Empty state wajib informatif dan memakai komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`): ikon + judul + deskripsi + CTA opsional (`OutlinedButton`, bukan FAB wajib), sudah dibungkus `SafeArea` + padding - lihat `empty-state-daftar`.
3. Navigasi non-blocking wajib menggunakan `unawaited(Nav.to(...).catchError(...))`.
4. Akses data async opsional wajib menggunakan `asData?.value ?? fallback`, bukan `requireValue`.
5. Logging konsisten: log variabel UI dengan `L.i`/`L.w` per aturan logging.
6. Toast perayaan hanya sekali: `AppToast.sukses` + `SharedPreferences` penandaan + `unawaited()`.
7. Validasi form wajib menggunakan `Form` + `GlobalKey<FormState>` + `validate()` dengan validator aturan bisnis, bukan `?? 0` masking.
8. Multiple provider: loading gabungan, error terpisah per provider, `requireValue` terakhir setelah aman.
9. Early return pattern: setiap kondisi (loading, error, empty, incomplete) → early return.
10. Data tidak lengkap → tampilan terpisah + CTA, bukan menampilkan data parsial.
11. Notifikasi sementara (sukses/gagal/peringatan/info) WAJIB memakai `AppToast.sukses/gagal/warning/info` dari `share_global_saya` (import via `core_shared.dart`); DILARANG `ScaffoldMessenger.of(context).showSnackBar` manual.
12. Impor utilitas shared lintas fitur WAJIB memakai barrel `core_shared.dart` (`package:share_global_saya/core_shared.dart`) yang mengekspor `L`, `Nav`, `AppToast`, `ParserUtil`, `FormatTanggal` (dihide bila tidak dipakai), `SharedPrefService`; DILARANG impor individu (`l.dart`, `navigator_helper.dart`, `toast_widget.dart`, `parser_util.dart`, `shared_pref_service.dart`).
13. Loading operasi simpan/hapus WAJIB memakai `EasyLoading.show`/`EasyLoading.dismiss` dari `flutter_easyloading` dengan `maskType: EasyLoadingMaskType.black` agar kunci seluruh input; DILARANG `CircularProgressIndicator` manual di dalam tombol atau `showDialog`; `unawaited(EasyLoading.show(...).catchError(...))` di awal, `unawaited(EasyLoading.dismiss().catchError(...))` di `finally`; tombol simpan tidak perlu state `_isLoading`/`_isSaving` - button label statis.

## Larangan

- DILARANG menyimpan data tanpa validasi form (lihat `validasi-form-sebelum-penyimpanan`).
- DILARANG `requireValue` pada data opsional/async tanpa cek loading/error (lihat `penanganan-async`, `penanganan-error-unawaited`).
- DILARANG toast perayaan tanpa penandaan `SharedPreferences` (lihat `visualisasi-progres-impian`).
- DILARANG empty state tanpa ikon, judul, deskripsi, CTA (lihat `empty-state-daftar`).
- DILARANG konfirmasi destruktif tanpa `isDestructiveAction: true` dan penjelasan konsekuensi (lihat `ekspor-pemulihan-cadangan`).
- DILARANG dialog konfirmasi ya/tidak memakai `showDialog` + `AlertDialog` manual; wajib `showOkCancelAlertDialog` dari `adaptive_dialog` dengan hasil `OkCancelResult`.
- DILARANG notifikasi sementara memakai `ScaffoldMessenger.of(context).showSnackBar` manual; wajib `AppToast`.
- DILARANG impor individu utilitas shared (`l.dart`, `navigator_helper.dart`, `toast_widget.dart`, `parser_util.dart`, `shared_pref_service.dart`); wajib `core_shared.dart`.
- DILARANG loading operasi simpan/hapus memakai `CircularProgressIndicator` manual di dalam tombol atau `showDialog`; wajib `EasyLoading.show`/`dismiss` dengan `maskType: EasyLoadingMaskType.black`.

## Contoh Benar

```dart
// Konfirmasi ya/tidak dengan showOkCancelAlertDialog (adaptive_dialog)
final konfirmasi = await showOkCancelAlertDialog(
  context: context,
  title: 'Hapus Data?',
  message: 'Tindakan ini tidak dapat dibatalkan.',
  okLabel: 'Hapus',
  cancelLabel: 'Batal',
  isDestructiveAction: true,
);
if (konfirmasi != OkCancelResult.ok) return;
// lanjutkan aksi setelah konfirmasi OK

// Validasi form sebelum simpan
final formKey = GlobalKey<FormState>();
if (formKey.currentState?.validate() ?? false) {
  formKey.currentState!.save();
  await simpanData();
}

// Akses data async opsional
final nilai = asyncValue.asData?.value ?? fallbackNilai;

// Navigasi aman dengan catchError
unawaited(Nav.to('/dashboard').catchError((e) => L.e('Navigasi gagal: $e')));

// Early return pattern
if (state.isLoading) return const _LoadingView();
if (state.hasError) return _ErrorRetry(onRetry: () => ref.refresh(provider));
if (state.value?.isEmpty ?? true) return const _EmptyState();
return _TampilkanData(state.requireValue);
```

## Contoh Salah

```dart
// DILARANG: Simpan tanpa validasi form
await simpanData(); // Tidak ada Form + validate()

// DILARANG: requireValue pada data opsional tanpa cek
final nilai = asyncValue.requireValue; // SALAH! Bisa throw jika loading/error

// DILARANG: Navigasi tanpa catchError
unawaited(Nav.to('/dashboard')); // SALAH! Tidak ada error handling

// DILARANG: Toast perayaan tanpa penandaan SharedPreferences
AppToast.sukses('Berhasil!'); // SALAH! Tidak ada penandaan, bisa muncul berulang

// DILARANG: Dialog konfirmasi manual dengan showDialog + AlertDialog
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Konfirmasi'),
    content: const Text('Yakin hapus?'),
    actions: [
      TextButton(onPressed: () => Nav.pop(context), child: const Text('Batal')),
      TextButton(onPressed: () { Nav.pop(context); hapusData(); }, child: const Text('Hapus')),
    ],
  ),
);
```
