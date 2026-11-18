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

## Lanjutan (perintah `tambah_kode_keskill` — "bagian mixin tadi")

- Awal: pengguna menempel command `tambah_kode_keskill` tanpa potongan kode; lewat `question` jawaban "bagian mixin tadi" (bagian `AutomaticKeepAliveClientMixin`). Relevansi: skill `code/performa-aplikasi` (Aturan #32–#33) dan `.agents/rules/code.md`; alur commit-first dipilih pengguna; potongan terpilih: Aturan #34 + Contoh Benar/Salah + Aturan #7 `code.md`.
- Commit layar (hanya layar; `lib/dummy/dummy_helper.dart` & `lib/dummy/dummy_screen.dart` yang ter-stage oleh pihak lain DIBIARKAN ter-stage, tidak ikut di-commit): `admin_wifi` `18699fe` "refactor(pelanggan_aktif): konversi layar ke ConsumerStatefulWidget + konsumsi penggunaAktifProvider" (`git -C` submodule; 1 berkas, +124/−127).
- `.agents/skills/code/performa-aplikasi/SKILL.md` v1.1.1→1.2.0: Aturan #34 (anak IndexedStack keep-alive wajib mixin + `super.build(context)`; bila tidak diperlukan wajib hapus mixin sepenuhnya); Contoh Benar (anak IndexedStack keep-alive) + Contoh Salah (mixin tanpa `super.build(context)`); description trigger diperjelas; Sumber Evaluasi + `18699fe`; `diperbarui` 2026-11-18 21:43 WIB.
- `.agents/rules/code.md` Aturan #7 baru (wajib `wantKeepAlive => true` + `super.build(context)`; keep-alive yang tidak diperlukan wajib hapus mixin; skill terkait `performa-aplikasi`).
- `.agents/rules/kelompok_skill_wajib.md` indeks code #35 (`performa-aplikasi`): Trigger dirapikan, Status → Wed Nov 18 2026 21:43 WIB.
- Verifikasi: prettier pada 3 berkas terformat (hanya `performa-aplikasi/SKILL.md` yang berubah; `code.md` & indeks unchanged); tidak ada `dart analyze` baru (tidak ada perubahan kode non-layar yang baru; layar sudah terverifikasi bersih sebelum commit).
- Catatan koreksi: prettier sempat merusak Aturan #34 karena nested backtick; diperbaiki manual lalu `prettier --write` ulang (unchanged).

## Lanjutan 2 (layar Data Dummy)

- Permintaan pengguna: "buatkan dummy screen dengan 3 tombol 1, tambah semua dummy, 2. riset semua dummy 3. hapus semua dummy".
- Berkas `admin_wifi/lib/dummy/dummy_helper.dart` (sebelumnya 0 byte, ter-stage oleh pihak lain) diisi: `abstract final class DummyHelper` — `tambahSemuaDummy()` (upsert `PelangganAktifDummy.dummyList` via `PelangganAktifOperasi.sisipkanAtauPerbaruiBatch`, tanpa notifikasi), `hapusSemuaDummy()` (DELETE permanen hanya baris ID dummy, `PelangganAktifSkema.tabel`, `id IN (...)`; bukan `hapusSemuaPelangganAktif()` yang menyasar semua data), `risetSemuaDummy()` (= hapus lalu tambah). Error: `Log.error` + `rethrow`.
- `admin_wifi/lib/dummy/dummy_screen.dart`: 3 tombol (Tambah [FilledButton.icon], Riset [OutlinedButton.icon], Hapus [FilledButton.icon error]); konfirmasi dialog untuk Riset & Hapus; state `_isProcessing` (setState set true/finally false, `if (!mounted) return` di semua jalur); toast sukses/gagal via `AppToast`; `ref.invalidate(penggunaAktifProvider)` setelah setiap aksi agar layar Pelanggan Aktif tidak menampilkan data basi; `L.i`/`L.e` ($e $s). `dispose()` TODO dihapus (tidak ada resource yang perlu dibuang).
- `DummyScreen` belum dirujuk dari navigasi mana pun (bukan bagian permintaan); `dart format` & `dart analyze` bersih (2 berkas).
- Lanjutan (permintaan "tambahkan screen tadi kesini" pada `lib/halaman/tab/lainnya.dart`): import relatif `../../dummy/dummy_screen.dart` (komentar `// ditambahkan:`), tombol navigasi `[DEBUG] Data Dummy` (icon `Icons.science`, di bawah `[DEBUG] Alat Migrasi Data`) via `_handleNavigation`; `dart format` & `dart analyze` bersih.
- FK `pelanggan_aktif → pelanggan/paket/transaksi` terdeklarasi tetapi PRAGMA `foreign_keys` tidak diaktifkan di `DatabaseHelper` (diperiksa), sehingga insert dummy tanpa baris pelanggan/paket berhasil.
- Data pengguna biasa tidak tersentuh: penghapusan hanya pada ID dummy yang dikenal.

## Lanjutan 3 (migrasi Log → L)

- Permintaan pengguna: `lib/debug/log.dart` (kelas `Log` dengan `_formatData` pretty printer) dihapus; seluruh pemakaian dialihkan ke `package:share_global_saya/src/utils/l.dart` (`L.i/L.w/L.e/L.api`) yang sudah dibaca sesi ini.
- 70+ berkas dimigrasi (99 berkas berubah total termasuk lanjutan 1–3) lewat 3 skrip migrasi (`/tmp/kilo/admin_wifi_log_migrasi.dart` → v4/v5) + perbaikan manual:
  - Skrip 1: hapus import `debug/log.dart`/`../debug/log.dart`; sisipkan & urutkan ulang import `l.dart`; `Log.info/warning/error/api` → `L.i/L.w/L.e/L.api`.
  - Skrip 2 (perbaiki quoting): suffix "Error: $e $s"/"Data: ..." yang keluar dari string literal dipindah ke dalam literal (varian multiline & implicit concatenation ditangani dalam 3 tahap).
  - Skrip 3/4 (dotted ident `snapshot.error` dll.): merge argumen bernama `error:`/`stackTrace:` ke dalam string pesan (nilai `error:` berupa ident bertitik maupun string `'Data RAW: ...'`).
  - Skrip 5: hapus 27 import l.dart yang menjadi tidak terpakai + `lib/main.dart` (unnecessary_import — `L` sudah disediakan `core_shared.dart`).
  - Perbaikan manual: `operasi_dasar.dart` (6 situs `Data: {...}` map-literal + 4 L.e berargumen `data:`); `form_kategori.dart` (L.e dengan pesan ternary bersarang); `unduh_data.dart` (`error: 'Data RAW: ...'`); `status_pembayaran_enum.dart` (tanpa import apa pun — import l.dart disisipkan manual).
- **PERHATIAN PENTING**: penggabungan `Data: {...}` map-literal ke dalam string dilakukan dengan interpolasi `${{...}}` (map di dalam interpolasi); pemakaian L.i/L.e dengan `$e $s` memenuhi skill `logging-debug` (L.e wajib `$s`).
- `lib/debug/log.dart` DIHAPUS (`rm`); tidak ada referensi `debug/log.dart` maupun `Log.` tersisa di `lib/` (grep bersih).
- `README.md` masih memuat referensi dokumen `lib/debug/log.dart` (dokumentasi sistem pelacakan kasar) — dibiarkan; menunggu keputusan pengguna apakah ikut diperbarui.
- Verifikasi: `dart format lib` 0 changed; `dart analyze` — **No issues found**; `flutter test` **+105/−24 identik baseline** (24 kegagalan pra-eksisting: form_paket, form_pelanggan_aktif, versi_apk_user, transaksi ×2, dompet ×4, sqlite ffi `no such table: transaksi`, pelanggan_aktif ×2/ops, notifikasi_test — sama dengan baseline, tidak ada regresi baru).
- Skrip migrasi bersifat satu arah (destruktif terhadap teks asli); hasil diff 99 berkas belum di-review baris per baris; disarankan review sebelum commit.

## Lanjutan 4 (perintah "perbarui README di root dan semua submodule")

- Berkas target (kosong = root + submodule terdaftar di `.gitmodules`):
  - `README.md` root — **Diperbarui**: daftar submodule nyata (`admin_wifi` + `share_global_saya`; `base_coc` dinonaktifkan di `.gitmodules` dan tidak ada gitlink aktif; sebelumnya menulis `share_global_saya` + `base_coc`); struktur diperbarui dengan kondisi terverifikasi (`.agents/skills/` = 55 code + 17 non-code skill, tanpa folder `bawaan/`; tanpa `skills-lock.json` di root; tanpa `.config/dart_skills/`, `apk/` (diabaikan `.gitignore`), `hasil_diskusi/`, `docs/model_agents.md`; `docs/` nyata (`hasil_analisa/`, `kilo/`, `laporan_linter.md`, `paket_favorit.md`, `snippet.md`, `vs code/`); `audit/riwayat_sesi.md`; `prompt/` terstruktur `commands/`, `rules/`, `skill/`; `.dart_tool/` terlacak berisi gitlink tool tanpa entri `.gitmodules`; `script/` 4 skrip); klausa "Skill terindeks" tanpa `skills-lock.json`.
  - `admin_wifi/README.md` — **Dibuat ulang** (isi lama adalah changelog panjang yang usang; `lib/debug/log.dart` sudah dihapus sesi ini): identitas, tujuan, fitur (bottom nav Aktif/Dompet/Transaksi/Lainnya; tab Lainnya: Pesanan, Kategori, Paket, Pelanggan, Riwayat Aktivasi, Kritik & Saran, Versi APK, Pengaturan, Tentang, [DEBUG] Alat Migrasi Data, [DEBUG] Data Dummy); integrasi dua arah SQLite↔Firestore; notifikasi terjadwal; koneksi internet; server TCP lokal :8080 untuk pesanan; WhatsApp; `version: 1.1.0+6`; struktur direktori nyata; instruksi build APK lewat `.github/workflows/build-apk.yml`; `flutter test` +105/−24 pra-eksisting; `dart analyze` bersih.
  - `share_global_saya/README.md` — **Diperbarui** (sebagian masih akurat): klaim `AsyncValueX.whenDefault` dihapus (tidak ada di paket); `test/` ada (`mocks.dart` saja); catatan migrasi logging `admin_wifi` → `L` (2026-11-18).
- Hanya berkas `README.md` yang berubah pada ketiga target per perintah (plus pencatatan memori yang diwajibkan aturan).
- Temuan penting di luar cakupan yang TIDAK diubah: root commit `a651e4d` ("refactor(skill-index): hapus indeks skill code dan terapkan pemisahan indeks non-code") dibentuk oleh pengguna/harness pada 15:24 WIB+7 (memuat berkas root terubah sesi ini: `.agents/rules/*`, `.agents/skills/code/performa-aplikasi/SKILL.md`, `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_42.md`). Submodule `admin_wifi` commit `ef883f2` ("m") dibentuk pada waktu yang sama (memuat seluruh migrasi `Log`→`L` sesi ini, 99 berkas, dan berkas dummy belum ter-commit sebelumnya). README TIDAK ikut ter-commit: root masih ` M README.md`, submodule `admin_wifi` ` M README.md`, `share_global_saya` ` M README.md`. `git submodule status` root gagal: gitlink `.dart_tool/skills/repos/*` tanpa entri `.gitmodules` (pra-eksisting). Sesi bersamaan `memori/sesi/sesi_43.md` (berjalan) tidak disentuh.
- Verifikasi: prettier pada 3 berkas (README.md root & admin_wifi reformatted; share_global_saya unchanged); tidak menyentuh kode Dart/konfigurasi/pointer submodule.

## Lanjutan 5 (perintah "tambahkan larangan log manual ke skill")

- Permintaan pengguna: "Tambahkan ke skill agar jangan membuat log manual cukup gunakan class L di share global saya".
- `.agents/skills/code/logging-debug/SKILL.md` diperbarui **v1.1.1 → 1.1.2** (permintaan eksplisit pengguna; alur commit-based terpenuhi lewat `admin_wifi` commit `ef883f2` yang menghapus `lib/debug/log.dart` dan memigrasikan 99 berkas ke `L`):
  - Aturan/larangan baru (di `## Larangan`): dilarang membuat kelas/wrapper log manual per proyek (mis. `lib/debug/log.dart` dengan `class Log`, `_formatData`, atau `_logCustom`) — hapus dan migrasikan ke `L` dari `share_global_saya` (`package:share_global_saya/src/utils/l.dart`); `L` satu-satunya pintu masuk logging yang sah.
  - `## Contoh Salah` ditambah cuplikan `class Log` wrapper manual.
  - Description trigger diperjelas ("dilarang membuat wrapper log manual per proyek").
  - `## Sumber Evaluasi` ditambah entri: `admin_wifi` commit `ef883f2` ("m", 15:24 WIB+7) sebagai bukti migrasi.
  - Indeks skill: root commit `a651e4d` ("refactor(skill-index)…") telah menghapus indeks skill code (`.agents/rules/kelompok_skill_wajib_code.md` dihapus); indeks hanya memuat non-code — tidak ada berkas indeks yang perlu diperbarui untuk skill code.
- Verifikasi: prettier OK (unchanged). Tidak menyentuh kode; tidak menyentuh `prompt/skill/` (skill code tidak memiliki berkas poin — Aturan 16 `aturan-pembuatan-skill`).
- Tindak lanjut permintaan (pengguna: "Perbarui aturannya juga"): `.agents/rules/code.md` Aturan **#8** baru — "Dilarang membuat kelas/wrapper log manual per proyek (mis. `lib/debug/log.dart` dengan `class Log`/`_formatData`/`_logCustom`); seluruh logging wajib memakai `L` dari `share_global_saya` (`L.i`, `L.s`, `L.w`, `L.e`, `L.json`, `L.list`, `L.api`); wrapper manual yang sudah ada wajib dihapus dan pemakaiannya dimigrasikan ke `L`." — skill terkait: `logging-debug`. Prettier OK (unchanged). Terikat skill ini dan aturan `code.md` #6 yang sudah ada (L.e wajib $s). Tidak ada berkas `prompt/rules/code.md` (tidak perlu sinkronisasi). Pengeditan `.agents/rules/code.md` sah: permintaan eksplisit pengguna + commit `ef883f2` + skill terkait (Aturan `lainnya.md`).

## Sinkronisasi ke MEMORI.md

Disinkronkan (sesi 42): `MEMORI.md` header → `(sesi 42)`; Status "Sesi terakhir" → entri sesi 42; Catatan Teknis sesi 42 ditambahkan di paling atas. `memori/riwayat_perubahan.md` entri sesi 42 ditambahkan. Tidak ada perubahan kontrak/konvensi lintas proyek.
