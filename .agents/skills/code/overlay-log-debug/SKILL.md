---
name: overlay-log-debug
description: "Trigger: saat menyusun root aplikasi Flutter (app.dart/main.dart); saat ikon/panel overlay debug tidak muncul (`_tampilkanIkon: overlay null? true` / `Overlay.maybeOf` null); saat error `No Directionality widget found` pada Overlay; saat error `No MaterialLocalizations found` pada SelectionArea | Panduan membungkus root app dengan `PengelolaOverlayLogDebug` dari share_global_saya: inisialisasi `L.init(container)` dengan ProviderContainer yang sama, `UncontrolledProviderScope`, wajib Overlay root manual sebagai ancestor (agar `Overlay.maybeOf` non-null), dibungkus `Directionality` **dan `Localizations`** (di ATAS `Directionality`), pola OverlayEntry (postFrameCallback + mounted check), dan `overlayLogDebugTampilProvider`."
metadata:
  kategori: "custom"
  versi: "1.4.0"
  diperbarui: "Thu Nov 19 2026 02:56 WIB"
---

# Overlay Log Debug pada Root Aplikasi

Fitur debug log (ikon melayang + panel log) dari `share_global_saya` harus dipasang di root aplikasi agar log dapat diakses di atas seluruh layar tanpa mengganggu tree utama.

## Cakupan yang Di-Cover

- Package: `share_global_saya` — komponen `PengelolaOverlayLogDebug`, `OverlayLogDebug`, `OverlayLogDebugTampilNotifier` / `overlayLogDebugTampilProvider`, panel `_SheetSalinLog`, `OverlayEntry` (ikon `_IkonMelayangLogDebug`).
- File sumber: `share_global_saya/lib/log_debug/overlay_log_debug.dart`.
- Inisialisasi: `SharedPrefService`, `ProviderContainer`, `L.init`, `UncontrolledProviderScope`.

## Aturan

1. Panggil `WidgetsFlutterBinding.ensureInitialized()` pertama, lalu inisialisasi dependensi (mis. `SharedPrefService.init()`) sebelum `runApp`.
2. Buat `final container = ProviderContainer();` lalu `L.init(container);` — `L` dan widget di dalam app **wajib** memakai container yang sama; jangan buat container kedua.
3. Root app WAJIB dibungkus `PengelolaOverlayLogDebug` **tepat satu kali**, dan letakkan di root (bukan per layar); tetapi pembungkusan saja **tidak cukup** — tambahkan **Overlay root manual** di luar `PengelolaOverlayLogDebug`, **dibungkus `Directionality`** (lihat alasan & contoh pada blok di bawah, dan Aturan 4):

   ```dart
   runApp(
     UncontrolledProviderScope(
       container: container,
       // Overlay root manual berada DI ATAS MaterialApp (satu-satunya penyedia
       // Directionality/Localizations di tree), jadi keduanya dipasang manual:
       // Localizations di ATAS Directionality, Directionality di ATAS Overlay.
       child: Localizations(
         locale: const Locale('en'),
         delegates: const [
           DefaultWidgetsLocalizations.delegate,
           DefaultMaterialLocalizations.delegate,
         ],
         child: Directionality(
           textDirection: TextDirection.ltr,
           child: Overlay(
             initialEntries: [
               OverlayEntry(
                 // PengelolaOverlayLogDebug menyisipkan ikon/panel ke Overlay.maybeOf(context);
                 // Overlay root dibuat manual agar pemanggilan itu menemukan ancestor.
                 builder: (context) => const PengelolaOverlayLogDebug(
                   child: AplikasiSaya(),
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
   ```

   **Mengapa wajib Overlay root manual** (verifikasi runtime, 2026-11-18, `flutter run -d chrome`, proyek `admin_wifi`): `PengelolaOverlayLogDebug` menyisipkan ikon/panel lewat `Overlay.maybeOf(context)` yang hanya mencari ancestor Overlay. Jika ia berada **di atas** `MaterialApp`/`Navigator` (tanpa Overlay ancestor), hasilnya `null` dan `_tampilkanIkon()`/`_sembunyikanIkon()` langsung `return` — gejala di console: `_tampilkanIkon: overlay null? true`, dan ikon tidak pernah muncul. Butir-butir:

   - `MaterialApp.builder` **BUKAN** solusi: widget dari builder disisipkan **di atas** `MaterialApp`'s `Navigator` (lihat SDK `packages/flutter/lib/src/widgets/app.dart`, dok `builder` untuk `home` vs `builder`: "In contrast, the widget returned from builder is inserted _above_ the app's Navigator").
   - `Overlay` bersifat nested dan legal; Overlay root tetap ter-pasang selama aplikasi berjalan; entri ikon/panel disisipkan ke Overlay terdekat (root manual) dan tampil di atas seluruh app; konteks `PengelolaOverlayLogDebug` tidak pernah unmount lintas navigasi sehingga entri tidak di-remove di tengah sesi.
   - Pola bungkus app langsung di root **membuktikan ikon tidak muncul** — jangan gunakan tanpa Overlay root:
     ```dart
     // Salah: ikon tidak pernah tampil (Overlay.maybeOf dari context ini == null)
     runApp(const PengelolaOverlayLogDebug(child: MyApp()));
     ```

   **Mengapa `Overlay` root manual wajib dibungkus `Directionality`** (verifikasi runtime, 2026-11-18, `flutter run -d chrome`, proyek `admin_wifi`): Overlay root manual berada **DI ATAS** `MaterialApp` — satu-satunya penyedia `Directionality` di tree — sehingga tidak ada ancestor `Directionality` untuknya. `_Theater` (bagian internal `Overlay`) mewajibkan `Directionality`; root view hanya menyediakan `MediaQuery`. Tanpa `Directionality`, aplikasi melempar `No Directionality widget found. _Theater widgets require a Directionality widget ancestor` secara berulang (widget pemicu: `Overlay` di `main.dart`). Perbaikan: bungkus `Overlay` dengan `Directionality(textDirection: TextDirection.ltr, ...)` (`MediaQuery` **tidak** cukup). Verifikasi setelah perbaikan: `dart format` bersih, `dart analyze` — **No issues found!**, `flutter test` penuh → **+105/−24, identik baseline**; verifikasi runtime `flutter run -d chrome` (hot restart) terkonfirmasi lewat log pengguna (2026-11-18): tidak ada `No Directionality widget found`, dan `_tampilkanIkon: overlay null? false` serta `_tampilkanIkon: ikon di-insert ke overlay`.

   **Mengapa `Overlay` root manual wajib dibungkus `Localizations` (DI ATAS `Directionality`)** (verifikasi runtime, 2026-11-18, proyek `admin_wifi`; ter-commit `93d649c`): panel `share_global_saya` memakai `SelectionArea` yang membutuhkan `MaterialLocalizations`; Overlay root manual berada DI ATAS `MaterialApp` (penyedia Localizations), jadi root view hanya menyediakan `MediaQuery`. Tanpa `Localizations`, pembukaan panel melempar `No MaterialLocalizations found` secara berulang. Perbaikan: bungkus `Overlay` dengan `Localizations` berisi delegasi default framework (`DefaultWidgetsLocalizations` + `DefaultMaterialLocalizations`, locale `'en'`; proyek tidak memuat `flutter_localizations`). Verifikasi: `dart analyze` bersih; runtime log pengguna mengonfirmasi error hilang.

4. `PengelolaOverlayLogDebug` adalah `ConsumerStatefulWidget` yang menyisipkan `OverlayEntry` ke `Overlay.maybeOf(context)`. Insert entry dilakukan di `addPostFrameCallback` dengan cek `mounted`, bukan di `build` langsung; `build` hanya membandingkan nilai `overlayLogDebugTampilProvider` dengan `_terakhirTampilIkon`.
5. `_entryIkon`/`_entryLog` di-remove secara eksplisit di `dispose`; jangan dibiarkan menumpuk saat root app di-rebuild.
6. Provider `overlayLogDebugTampilProvider` (bool, default `true`) mengendalikan tampil/sembunyi ikon dan panel; gunakan `ref.read(overlayLogDebugTampilProvider.notifier).tampilkan()` / `.sembunyikan()`.
7. Logging internal `share_global_saya` memakai helper `p(...)` dari `log_debug/print_custom.dart` (hanya `print` saat `kDebugMode`). Proyek lain menulis log dengan gaya proyek (`L.i`, `L.w`, `L.e`, atau helper setara) — lihat skill `logging-debug`. Jangan log data sensitif.
8. Untuk proyek yang belum bergantung pada `share_global_saya`, tambahkan dependensi `share_global_saya` (path atau git sesuai kebijakan proyek) terlebih dahulu; jangan menyalin kode overlay ke proyek (duplikasi).
9. `logDebugProvider` dan log buffer `L` akan muncul di panel; overlay ini untuk debug, bukan untuk UI pengguna akhir.
10. Bottom sheet kustom (mis. `_SheetSalinLog`) di-insert sebagai `OverlayEntry` dengan `Overlay.of(context, rootOverlay: true)` SETELAH `_entryLog` di-insert, agar selalu tampil di atas panel (Material milik `OverlayLogDebug`), bukan di bawahnya; area gelap di belakang sheet di-tap untuk menutup. Sebaliknya: overlay ikon/panel memakai `Overlay.maybeOf(context)` (bukan `rootOverlay: true`).
11. `_copyAllLogs` menyalin daftar log ke clipboard (`Clipboard.setData`), lalu LANGSUNG memanggil `logDebugProvider.notifier.hapusSemua()` (seluruh log DB terhapus setelah disalin) dan menampilkan `AppToast.sukses`; salinan per-tipe lewat `_SheetSalinLog` (`onPilih`) memakai alur yang sama — salinan bersifat konsumtif, bukan sekadar pratinjau.
12. Panel menggabungkan dua sumber log: log DB (`logDebugProvider`) dan buffer `L` (`L.buffer`), men-dedup berdasarkan `id` (`semuaList` di `build`, `...?logState?.listLogDebug` + `...L.buffer.where((b) => !...any((s) => s.id == b.id))`). Filter tampilan memakai `ModeTampilanLog` (semua/error/warning/info) lewat `_filterByMode`; badge warna per `TipeLog` (error=merah, warning=oranye, info=biru, sukses=hijau, api=ungu).
13. `Overlay` root manual berada DI ATAS `MaterialApp` — satu-satunya penyedia `Localizations`/`Directionality` di tree — sehingga root view hanya menyediakan `MediaQuery`. Panel `share_global_saya` memakai `SelectionArea` yang membutuhkan `MaterialLocalizations`; proyek tanpa `flutter_localizations` boleh memakai delegasi default framework (`DefaultWidgetsLocalizations` + `DefaultMaterialLocalizations`, locale `'en'`). Bungkus `Overlay` dengan `Localizations` **DI ATAS** `Directionality`; tanpa itu, setiap pembukaan panel melempar `No MaterialLocalizations found` (`SelectionArea`). Verifikasi runtime 2026-11-18 (sesi induk "kode", diperbaiki di `admin_wifi/lib/main.dart`, ter-commit `93d649c`): error `No MaterialLocalizations found` hilang setelah bungkus ganda; `dart analyze` — No issues found!.

Gotcha: `_ItemLogDebug` menyalin `widget.terlihatSemua` ke field lokal pada `initState` dan tidak menerapkan `didUpdateWidget`; toggle "lihat semua" di parent bersifat per-item dan tidak retroaktif ke `_ItemLogDebug` yang sudah ter-build.

## Contoh Benar

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_global_saya/core_shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();

  final container = ProviderContainer();
  L.init(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      // Overlay root manual berada di ATAS MaterialApp (penyedia
      // Localizations/Directionality), jadi keduanya dipasang manual:
      // Localizations di ATAS Directionality, Directionality di ATAS Overlay.
      child: Localizations(
        locale: const Locale('en'),
        delegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                // Overlay root manual: ancestor Overlay untuk PengelolaOverlayLogDebug
                builder: (context) => const PengelolaOverlayLogDebug(
                  child: AplikasiSaya(),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
```

## Contoh Salah

```dart
// Salah: L tidak diinisialisasi dengan container yang sama
void main() {
  runApp(const ProviderScope(child: MyApp())); // overlay & L tidak terhubung
}

// Salah: membungkus per layar, entry menumpuk
Widget build(BuildContext context) =>
    PengelolaOverlayLogDebug(child: BerandaScreen());

// Salah: ikon tidak pernah tampil (Overlay.maybeOf dari konteks ini == null
//   karena PengelolaOverlayLogDebug berada di atas MaterialApp/Navigator)
runApp(const PengelolaOverlayLogDebug(child: MyApp()));

// Salah: MaterialApp.builder tidak berada di bawah Overlay (widget dari builder
//   disisipkan DI ATAS Navigator — SDK app.dart), ikon tetap tidak tampil
MaterialApp(builder: (context, child) => PengelolaOverlayLogDebug(child: child));

// Salah: Overlay root manual TANPA Directionality — _Theater (bagian internal
//   Overlay) mewajibkan ancestor Directionality (MaterialApp di dalam anak Overlay
//   tidak bisa jadi ancestor-nya; root view hanya menyediakan MediaQuery).
//   Runtime melempar "No Directionality widget found. _Theater widgets require
//   a Directionality widget ancestor" secara berulang (sesi 31, admin_wifi)
runApp(
  UncontrolledProviderScope(
    container: container,
    child: Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => const PengelolaOverlayLogDebug(child: MyApp()),
        ),
      ],
    ),
  ),
);

// Salah: Overlay root manual TANPA Localizations — panel (`SelectionArea`)
//   membutuhkan MaterialLocalizations; runtime melempar "No MaterialLocalizations
//   found" secara berulang saat panel dibuka (sesi induk, admin_wifi, diperbaiki
//   di main.dart, commit `93d649c`)
runApp(
  UncontrolledProviderScope(
    container: container,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => const PengelolaOverlayLogDebug(child: MyApp()),
          ),
        ],
      ),
    ),
  ),
);
```

## File Terkait

- `share_global_saya/lib/log_debug/overlay_log_debug.dart` — `PengelolaOverlayLogDebug`, `OverlayLogDebug`, `overlayLogDebugTampilProvider`, `_IkonMelayangLogDebug`, `_SheetSalinLog`.
- `share_global_saya/lib/log_debug/print_custom.dart` — helper `p(...)` (log debug `kDebugMode`-only).
- `share_global_saya/README.md` — bagian "Inisialisasi" (contoh pemasangan lengkap; catatan: contoh README memposisikan overlay di atas MaterialApp — secara runtime ikon tidak tampil, lihat Aturan 3).
- `.agents/rules/overlay_log_debug.md` — kewajiban pemasangan pada root app.
- SDK Flutter: `packages/flutter/lib/src/widgets/overlay.dart` (`Overlay.maybeOf`, rootOverlay), `packages/flutter/lib/src/widgets/app.dart` (dok `home` vs `builder`: widget dari `builder` disisipkan DI ATAS Navigator).

## Sumber Evaluasi

- Berkas sumber: `share_global_saya/README.md` (bagian Inisialisasi) dan `share_global_saya/lib/log_debug/overlay_log_debug.dart` (commit `63111ef`, Oct 2026).
- Permintaan eksplisit pengguna (sesi 22, 2026-11-18): "agar setiap proyek wajib menambahkan ini di app.dart nya" — kewajiban pemasangan tercatat pada `.agents/rules/overlay_log_debug.md`.
- Audit `overlay_log_debug.dart` vs skill (sesi 24, 2026-11-18, atas persetujuan pengguna): Aturan 7 direvisi (`p(...)`), Aturan 10–12 ditambahkan, gotcha `_ItemLogDebug` ditambahkan, File Terkait ditambah `print_custom.dart`; versi 1.0.0 → 1.1.0.
- Temuan runtime (sesi 28, 2026-11-18, atas persetujuan pengguna "Ya, ubah sekarang"): `_tampilkanIkon: overlay null? true` membuktikan `Overlay.maybeOf(context)` mengembalikan null saat `PengelolaOverlayLogDebug` diposisikan di atas `MaterialApp` (ikon tidak pernah tampil); `MaterialApp.builder` terbukti tidak di bawah Overlay (SDK `app.dart`); solusi terverifikasi dipilih: Overlay root manual sebagai ancestor. Aturan 3 ditambahkan penjelasan Overlay root manual; Contoh Benar/Salah diperbarui; File Terkait ditambah rujukan SDK; versi 1.1.0 → 1.2.0.
- Permintaan pengguna (command `tambah_kode_keskill`, sesi 31, 2026-11-18) atas perbaikan `admin_wifi/lib/main.dart`: `Overlay` root manual (pola v1.2.0) melempar `No Directionality widget found. _Theater widgets require a Directionality widget ancestor` di `flutter run -d chrome` karena berada di atas `MaterialApp` (penyedia `Directionality`). Perbaikan: bungkus `Overlay` dengan `Directionality(textDirection: TextDirection.ltr, ...)`. Aturan 3 ditambah penjelasan + contoh (Aturan 3 kode blok), Contoh Benar/Salah diperbarui; `dart format` bersih; `dart analyze` — No issues found!; `flutter test` +105/−24 identik baseline; runtime `flutter run -d chrome` terkonfirmasi lewat log pengguna (hot restart): error `No Directionality widget found` hilang; `_tampilkanIkon: overlay null? false`; `_tampilkanIkon: ikon di-insert ke overlay`. **Catatan provenance**: pengeditan v1.3.0 dilakukan atas persetujuan eksplisit pengguna ("Terapkan sekarang juga") di luar alur commit-history (aturan `.agents/rules/lainnya.md` butir 3) karena perbaikan `admin_wifi/lib/main.dart` belum ter-commit (HEAD `81b5485`); sumber perubahan adalah diff working tree, bukan riwayat commit.
- Skill terkait: `logging-debug`, `riverpod-pola`, `widget-lifecycle-state`.
- Perbaikan `admin_wifi/lib/main.dart` (2026-11-18, ter-commit `93d649c`, sesi induk "kode"; pengguna menegaskan di log runtime 01:20 WIB bahwa panel melempar `No MaterialLocalizations found` dari `overlay_log_debug.dart:688` — `SelectionArea`): root Overlay manual dibungkus `Localizations` (`DefaultWidgetsLocalizations` + `DefaultMaterialLocalizations`, locale `'en'`) DI ATAS `Directionality`; `dart analyze` bersih. Skill diperbarui atas permintaan pengguna (perintah `/tambah_kode_keskill`, sesi 47, 2026-11-19) — versi 1.3.0 → 1.4.0; Aturan 13 (WAJIB Localizations di atas Directionality), penjelasan "Mengapa Overlay root manual wajib dibungkus Localizations", Contoh Benar/Salah, trigger description diperbarui. Provenance: sesi (aplikasi perbaikan ada di commit `93d649c`)
