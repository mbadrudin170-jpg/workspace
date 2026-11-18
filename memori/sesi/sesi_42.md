# Sesi 42

- Status Sinkron: Sudah Sinkron (sesi 42)
- Tanggal: 2026-11-18 21:21 WIB (Asia/Jakarta)
- Command: tidak ada (permintaan langsung pengguna)
- Topik: Konversi `PelangganAktifScreen` menjadi `ConsumerStatefulWidget` dan pemanggilan notifier `penggunaAktifProvider` di layar tersebut; penghapusan `AutomaticKeepAliveClientMixin`.

## Catatan Sesi

- Awal sesi: `MEMORI.md` dibaca utuh (tanpa offset/limit); `AGENTS.md` dibaca; seluruh berkas `.agents/rules/` dibaca (`code.md`, `format_hasil_diskusi.md`, `kelompok_skill_wajib.md`, `lainnya.md`, `overlay_log_debug.md`, `pengelolaan_konflik.md`); skill dimuat: `memori-check`.
- Catch-up sync awal sesi: tidak ada berkas `memori/sesi/*.md` berstatus `Belum Sinkron` milik sesi sebelumnya yang menunggu sinkronisasi; `sesi_41.md` sudah `Sudah Sinkron` (arsip, tidak disentuh); `sesi_39.md` ambigu (berstatus `Berjalan`) — sudah dilaporkan ke pengguna pada sesi 41, tidak diputuskan sendiri pada sesi ini.
- Temuan awal: `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` mendeklarasikan `PelangganAktifScreen extends ConsumerStatelessWidget` padahal kelas tersebut memiliki `createState()` yang mengembalikan `_PelangganAktifScreenState` (sebuah `ConsumerState<PelangganAktifScreen>`) — pola yang sah hanya untuk `ConsumerStatefulWidget`. Screen tidak memiliki method `build` sendiri; semuanya berada di `_PelangganAktifScreenState`.
- Permintaan pengguna (berturut-turut):
  1. "ubah jadi consumerstatfulwidget" — basis kelas `PelangganAktifScreen` diubah dari `ConsumerStatelessWidget` menjadi `ConsumerStatefulWidget` (createState sudah ada).
  2. "panggil notifier diisini" — layar kini mengonsumsi `penggunaAktifProvider` (`PenggunaAktifNotifier`, codegen, `@Riverpod(keepAlive: true)`) sebagai satu-satunya sumber daftar pelanggan aktif; filter/urut dihitung murni saat build (`_filterAndSort`), bukan via setState terpisah.
  3. "jangan pakai when" — `AsyncValue` ditangani dengan pola `isLoading` → `hasError` → `requireValue` (skill `riverpod-pola` Aturan 11), bukan `.when(...)`.
  4. "hapus ini" (baris `super.build(context);`) — pengguna menegaskan lewat `question` (opsi "Hapus super.build(context)"); dipanggil dihapus. Akibatnya analyzer menandai `must_call_super`; pengguna lalu diminta menjelaskan `AutomaticKeepAliveClientMixin`, dan pengguna memutuskan "hapus saja" — mixin beserta `wantKeepAlive` dihapus sehingga peringatan hilang (`dart analyze` bersih).
  5. Konsekuensi dijelaskan: hilangnya keep-alive berarti state layar tidak dijamin dipertahankan oleh mixin (tab di `home.dart` selalu dibangun di dalam `IndexedStack`, sehingga dampak praktisnya terbatas; untuk tab yang belum pernah dibuka, layar dibangun saat pertama kali dibuka).
- Implementasi pemanggilan notifier:
  - Import `pengguna_aktif_notifier.dart`; state `PelangganAktifState` tidak dirujuk langsung (inference).
  - `_loadData()`: koneksi + unggah (hanya bila `forceRefresh`) + peta nama lewat `PelangganOperasi`; penyegaran daftar delegasi ke `ref.read(penggunaAktifProvider.notifier).muatUlang()` (hanya bila `forceRefresh`; muat awal ditangani `build()` provider); peta nama memicu `setState(() {})` agar pencarian/pengurutan memakai data terbaru.
  - `_arsipkanPelanggan()`: mutasi lewat `ref.read(penggunaAktifProvider.notifier).hapus(id)` (arsipkan + muat ulang state) — mutasi manual `removeWhere` + `setState` dihapus.
  - `_opsiLanjutan()` (arsipkan kadaluarsa / hapus semua) tetap lewat operasi langsung lalu `_loadData(forceRefresh: true)`.
  - `initState` hanya `_loadData()` (tanpa `forceRefresh`); tidak memodifikasi provider di lifecycle (skill `riverpod-pola` Aturan 14 — mutasi hanya dari callback/interaksi).
  - `build()`: `ref.watch(penggunaAktifProvider)`; body via pola `isLoading`/`hasError`/`requireValue`.
  - `_pelangganAktifOperasi` masih dipakai untuk opsi lanjutan (`arsipkanSemuaPelangganAktif`, `arsipkanPelangganKadaluarsa`).
- Verifikasi: `dart format` OK (0 changed pada pemanggilan ulang), `dart analyze` No issues found (sesudah penghapusan mixin); `flutter test` +105/−24 — identik baseline (kegagalan pra-eksisting: form_paket, form_pelanggan_aktif, versi_apk_user, transaksi, dompet, sqlite ffi `no such table: transaksi`, notifikasi_test loading error).

## Berkas Terdampak

| Lokasi File                                                                | Status Perubahan | Deskripsi                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` | Diubah           | `extends ConsumerStatefulWidget`; konsumsi `penggunaAktifProvider`; body pola isLoading/hasError/requireValue; `_filterAndSort` murni; `AutomaticKeepAliveClientMixin` + `wantKeepAlive` + `super.build(context)` dihapus. |
| `memori/sesi/sesi_42.md`                                                   | Dibuat           | Berkas sesi 42.                                                                                                                                                                                                            |

## Sinkronisasi ke MEMORI.md

Disinkronkan (sesi 42): `MEMORI.md` header → `(sesi 42)`; Status "Sesi terakhir" → entri sesi 42; Catatan Teknis sesi 42 ditambahkan di paling atas. `memori/riwayat_perubahan.md` entri sesi 42 ditambahkan. Tidak ada perubahan kontrak/konvensi lintas proyek.
