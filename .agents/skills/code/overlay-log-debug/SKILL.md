---
name: overlay-log-debug
description: "Trigger: saat menyusun root aplikasi Flutter (app.dart/main.dart); saat ikon/panel overlay debug tidak muncul (`_tampilkanIkon: overlay null? true` / `Overlay.maybeOf` null) | Panduan membungkus root app dengan `PengelolaOverlayLogDebug` dari share_global_saya: inisialisasi `L.init(container)` dengan ProviderContainer yang sama, `UncontrolledProviderScope`, wajib Overlay root manual sebagai ancestor (agar `Overlay.maybeOf` non-null), pola OverlayEntry (postFrameCallback + mounted check), dan `overlayLogDebugTampilProvider`."
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Wed Nov 18 2026 05:48 WIB"
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
3. Root app WAJIB dibungkus `PengelolaOverlayLogDebug` **tepat satu kali**, dan letakkan di root (bukan per layar); tetapi pembungkusan saja **tidak cukup** — tambahkan **Overlay root manual** di luar `PengelolaOverlayLogDebug` (lihat alasan & contoh pada blok di bawah, dan Aturan 4):

   ```dart
   runApp(
     UncontrolledProviderScope(
       container: container,
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

4. `PengelolaOverlayLogDebug` adalah `ConsumerStatefulWidget` yang menyisipkan `OverlayEntry` ke `Overlay.maybeOf(context)`. Insert entry dilakukan di `addPostFrameCallback` dengan cek `mounted`, bukan di `build` langsung; `build` hanya membandingkan nilai `overlayLogDebugTampilProvider` dengan `_terakhirTampilIkon`.
5. `_entryIkon`/`_entryLog` di-remove secara eksplisit di `dispose`; jangan dibiarkan menumpuk saat root app di-rebuild.
6. Provider `overlayLogDebugTampilProvider` (bool, default `true`) mengendalikan tampil/sembunyi ikon dan panel; gunakan `ref.read(overlayLogDebugTampilProvider.notifier).tampilkan()` / `.sembunyikan()`.
7. Logging internal `share_global_saya` memakai helper `p(...)` dari `log_debug/print_custom.dart` (hanya `print` saat `kDebugMode`). Proyek lain menulis log dengan gaya proyek (`L.i`, `L.w`, `L.e`, atau helper setara) — lihat skill `logging-debug`. Jangan log data sensitif.
8. Untuk proyek yang belum bergantung pada `share_global_saya`, tambahkan dependensi `share_global_saya` (path atau git sesuai kebijakan proyek) terlebih dahulu; jangan menyalin kode overlay ke proyek (duplikasi).
9. `logDebugProvider` dan log buffer `L` akan muncul di panel; overlay ini untuk debug, bukan untuk UI pengguna akhir.
10. Bottom sheet kustom (mis. `_SheetSalinLog`) di-insert sebagai `OverlayEntry` dengan `Overlay.of(context, rootOverlay: true)` SETELAH `_entryLog` di-insert, agar selalu tampil di atas panel (Material milik `OverlayLogDebug`), bukan di bawahnya; area gelap di belakang sheet di-tap untuk menutup. Sebaliknya: overlay ikon/panel memakai `Overlay.maybeOf(context)` (bukan `rootOverlay: true`).
11. `_copyAllLogs` menyalin daftar log ke clipboard (`Clipboard.setData`), lalu LANGSUNG memanggil `logDebugProvider.notifier.hapusSemua()` (seluruh log DB terhapus setelah disalin) dan menampilkan `AppToast.sukses`; salinan per-tipe lewat `_SheetSalinLog` (`onPilih`) memakai alur yang sama — salinan bersifat konsumtif, bukan sekadar pratinjau.
12. Panel menggabungkan dua sumber log: log DB (`logDebugProvider`) dan buffer `L` (`L.buffer`), men-dedup berdasarkan `id` (`semuaList` di `build`, `...?logState?.listLogDebug` + `...L.buffer.where((b) => !...any((s) => s.id == b.id))`). Filter tampilan memakai `ModeTampilanLog` (semua/error/warning/info) lewat `_filterByMode`; badge warna per `TipeLog` (error=merah, warning=oranye, info=biru, sukses=hijau, api=ungu).

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
- Skill terkait: `logging-debug`, `riverpod-pola`, `widget-lifecycle-state`.
