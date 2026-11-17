# Sesi 27

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-18 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: mengganti seluruh `Log` di `admin_wifi/lib/home.dart` agar memakai logger `L` dari `share_global_saya` (`lib/src/utils/l.dart`) + menerapkan wajib overlay root app (`.agents/rules/overlay_log_debug.md`)

## Catatan Sesi

- Awal sesi: membaca `MEMORI.md` (seluruh isi), seluruh berkas `.agents/rules/` (5 berkas), memuat skill `memori-check`; catch-up sync: tidak ada berkas `Belum Sinkron` (sesi_24/sesi_25/sesi_26 seluruhnya Sudah Sinkron, terverifikasi via baca).
- Permintaan pengguna awal: "ubah semua log disini agar menggunakan `@share_global_saya/lib/src/utils/l.dart` ini" untuk berkas `admin_wifi/lib/home.dart`.
- Temuan awal: `admin_wifi` BELUM bergantung pada `share_global_saya` (publish_to: none; belum ada `share_global_saya` di pubspec mana pun di workspace); `home.dart` memakai `package:admin_wifi/debug/log.dart` (`Log.info`/`Log.warning`).
- Jawaban pengguna (tool question): (1) `share_global_saya` ditambahkan sebagai **path dependency** (`path: ../share_global_saya`); (2) wajib overlay root app **diterapkan** sesuai aturan (`.agents/rules/overlay_log_debug.md`).
- Skill dimuat: `memori-check`, `logging-debug`, `overlay-log-debug`, `pengurutan-paket-pubspec`.
- Perubahan `pubspec.yaml` (admin_wifi):
  - `share_global_saya` (path) + `flutter_riverpod ^3.4.2` ditambahkan.
  - Konflik versi yang dipaksa pub solver (share_global_saya mensyaratkan `freezed ^4.0.2` & `fluttertoast ^10.0.2`): `freezed` dev_dep `^3.2.5` → `^4.0.2`; `fluttertoast` `^9.0.0` → `^10.0.2`. Keduanya TIDAK dipakai sama sekali di kode `lib/` (0 hasil pencarian) → bump aman, tidak ada codegen yang perlu diulang.
  - Section `dependencies` dirapikan abjad (case-insensitive, SDK `flutter` di atas) sesuai skill `pengurutan-paket-pubspec` — sebelumnya tidak terurut; entri ber-komentar tidak terpengaruh (tidak ada komentar di `dependencies`).
  - `fluttertoast` sempat TERHAPUS tidak sengaja saat edit insert awal — segera dikembalikan pada posisi abjad yang benar (setelah `flutter_riverpod`).
- Perubahan `lib/main.dart` (overlay root app, sesuai README paket + skill `overlay-log-debug`; pola wajib `overlay_log_debug.md`):
  - `WidgetsFlutterBinding.ensureInitialized()` → `await SharedPrefService.init()` → `ProviderContainer()` → `L.init(container)` → `runApp(UncontrolledProviderScope(container: container, child: const PengelolaOverlayLogDebug(child: MyApp())))`.
- Perubahan `lib/home.dart`:
  - Import `package:admin_wifi/debug/log.dart` dihapus; tambah `package:share_global_saya/src/utils/l.dart` (literal path yang dirujuk pengguna).
  - `Log.info(` → `L.i(` (replaceAll), `Log.warning(` → `L.w(` (replaceAll); isi pesan log TIDAK diubah.
  - `dart format`: `L.i('Membangun UI ...')` dilipat ke satu baris (perubahan format saja).
- API overlay terverifikasi dari sumber: `SharedPrefService.init()` (async, wajib sebelum dipakai), `PengelolaOverlayLogDebug` (`ConsumerStatefulWidget`, `child` wajib, `const`), `overlayLogDebugTampilProvider`; `L.init`, `L.buffer`, `PengelolaOverlayLogDebug` di-export via `core_shared.dart`.
- Verifikasi:
  - `flutter pub get` berhasil (setelah 2 bump di atas).
  - `dart format lib/home.dart lib/main.dart` → 2 berkas terformat.
  - `dart analyze` → **3 issues, seluruhnya di `test/helpers/test_helpers.mocks.dart` (berkas hasil generate)**: 1 error `invalid_override` (`MockWriteBatch.update` vs `WriteBatch.update` cloud_firestore 6.10.2) + 2 warning `duplicate_ignore`. cloud_firestore TIDAK berubah di `pubspec.lock` (6.10.2 sebelum & sesudah) → **pra-eksisting**, tidak terkait perubahan ini; mocks tidak diedit (berkas generate).
  - `flutter test` → **+105 / -24** (105 lulus, 24 gagal). Gagal identik dengan baseline: baseline diverifikasi dengan `git stash push` → `flutter pub get` → `flutter test` → `git stash pop` → `flutter pub get` (hasil baseline: +105 / -24; daftar berkas gagal sama). **Kerusakan TIDAK ada yang disebabkan perubahan sesi ini**; seluruh kegagalan pra-eksisting (widget test tap di luar layar, `sqflite` FFI `no such table: transaksi`, dsb).
  - `git status` submodule: `M lib/home.dart`, `M lib/main.dart`, `M pubspec.lock`, `M pubspec.yaml`. Root: `m admin_wifi` (pointer submodule kotor) + `?? memori/sesi/sesi_27.md`.
- Catatan jujur / belum terverifikasi:
  - Ikon melayang overlay debug disisipkan via `Overlay.maybeOf(context)` dari `PengelolaOverlayLogDebug` yang posisinya DI ATAS `MaterialApp` (belum ada `Overlay` ancestor dari context wrapper) — pola ini PERSIS pola wajib di README paket & skill/aturan; perilaku runtime ikon tidak dapat diverifikasi tanpa menjalankan aplikasi di device/emulator. Bila ikon tidak muncul saat dijalankan, lapor saja — itu perilaku paket, bukan keputusan lokal sesi ini.
  - `lib/app.dart` MASIH memakai `Log.info` dari `lib/debug/log.dart` (di luar cakupan permintaan "semua log di home.dart"); belum dikonversi.
  - `lib/debug/log.dart` tetap ada (dipakai `app.dart` & lain-lain); belum dihapus.
- `app.dart` tidak diubah; `provider` (paket) tetap dipakai — berdampingan dengan `flutter_riverpod` (hanya untuk overlay/`L`), tidak menggantikan state management.

## Berkas Terdampak

| Lokasi File                   | Status Perubahan | Deskripsi                                                                                                                                                                                              |
| ----------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `memori/sesi/sesi_27.md`      | Dibuat           | Berkas sesi aktif (Sudah Sinkron pada akhir sesi)                                                                                                                                                      |
| `admin_wifi/lib/home.dart`    | Diubah           | Import `debug/log.dart` → `share_global_saya/src/utils/l.dart`; seluruh `Log.info` → `L.i`, `Log.warning` → `L.w`                                                                                      |
| `admin_wifi/lib/main.dart`    | Diubah           | Overlay root app: `SharedPrefService.init()` + `ProviderContainer` + `L.init` + `UncontrolledProviderScope` + `PengelolaOverlayLogDebug`                                                               |
| `admin_wifi/pubspec.yaml`     | Diubah           | Tambah `share_global_saya` (path `../share_global_saya`), `flutter_riverpod ^3.4.2`; bump paksa pub solver: `fluttertoast ^9.0.0`→`^10.0.2`, `freezed ^3.2.5`→`^4.0.2`; `dependencies` diurutkan abjad |
| `admin_wifi/pubspec.lock`     | Diubah           | Hasil `flutter pub get` (share_global_saya, riverpod, bump di atas, dsb)                                                                                                                               |
| `MEMORI.md`                   | Diubah           | Header `(sesi 27)`; Konteks Proyek (ketergantungan `share_global_saya`); Status (sesi terakhir = sesi 27; entri Sesi 26 diberi prefix sendiri); Catatan Teknis (entri sesi 27)                         |
| `memori/riwayat_perubahan.md` | Diubah           | Entri "Sesi 27" ditambahkan di atas tabel                                                                                                                                                              |

## Sinkronisasi ke MEMORI.md

- `MEMORI.md`: header `Diperbarui: 2026-11-18 (sesi 27)`; Konteks Proyek dilengkapi fakta ketergantungan `admin_wifi` → `share_global_saya` (path) + `flutter_riverpod`; Status: sesi terakhir → sesi 27 (entri Sesi 26 dipindahkan ke prefix sendiri agar tidak bertumpuk); Catatan Teknis: entri sesi 27 ditambahkan (konversi home.dart, overlay root app, pubspec, verifikasi stash-vs-baseline, catatan app.dart belum dikonversi & overlay runtime belum terverifikasi).
- `memori/riwayat_perubahan.md`: entri "Sesi 27" ditambahkan di atas tabel (tanpa commit).
- Berkas sesi_27.md ditandai Sudah Sinkron. Tidak ada berkas `Sudah Sinkron` lain yang diubah; tidak ada kredensial/API key yang ditulis.
