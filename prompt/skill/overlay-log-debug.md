diperbarui : Wed Nov 18 2026 02:05 WIB
ditimpa ke : `.agents/skills/code/overlay-log-debug/SKILL.md`

# Overlay Log Debug pada Root Aplikasi

1. `WidgetsFlutterBinding.ensureInitialized()` + inisialisasi dependensi (mis. `SharedPrefService.init()`) sebelum `runApp`.

2. `final container = ProviderContainer(); L.init(container);` — `L` dan widget harus container yang sama; jangan buat container kedua.

3. Bungkus root app tepat satu kali di root: `runApp(UncontrolledProviderScope(container: container, child: const PengelolaOverlayLogDebug(child: AplikasiSaya())));`

4. `PengelolaOverlayLogDebug` = `ConsumerStatefulWidget` penyisip `OverlayEntry` ke `Overlay.maybeOf(context)`; insert via `addPostFrameCallback` + cek `mounted`; `build` hanya membandingkan nilai `overlayLogDebugTampilProvider` dengan `_terakhirTampilIkon`.

5. `_entryIkon`/`_entryLog` di-remove eksplisit di `dispose`.

6. `overlayLogDebugTampilProvider` (bool, default `true`) kendalikan tampil/sembunyi via `OverlayLogDebugTampilNotifier.tampilkan()/sembunyikan()`.

7. Gaya log mengikuti skill `logging-debug`; jangan log data sensitif.

8. Proyek yang belum bergantung pada `share_global_saya`: tambahkan dependensi dulu; **jangan** menyalin kode overlay ke proyek (duplikasi).

9. Overlay untuk debug, bukan UI pengguna akhir.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Contoh pemasangan lengkap & tautan komponen ada di target; aturan kewajiban pemasangan ada di `.agents/rules/overlay_log_debug.md` (dirijukan dari target, bukan dari berkas ini).

- Sumber: `share_global_saya/README.md` (Inisialisasi), `share_global_saya/lib/log_debug/overlay_log_debug.dart` (commit `63111ef`)
