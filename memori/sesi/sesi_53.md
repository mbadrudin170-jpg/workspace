# Sesi 53

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Kamis, 19 November 2026 (Asia/Jakarta, ±05:15 WIB)
- Command: `muat_skill_terkait` (argumen: tidak ada)
- Topik: Pemuatan skill relevan untuk pekerjaan migrasi layar `pelanggan_aktif_*` ke notifier (lanjutan sesi 50–52)

## Catatan Sesi

- Kelanjutan percakapan yang sama; `sesi_52.md` sudah `Sudah Sinkron` (arsip permanen) → pemuatan skill ini dicatat di berkas sesi baru (53).
- Perintah: baca `.agents/rules/kelompok_skill_wajib_non_code.md` (dibaca ulang — tidak berubah substantif) dan `.agents/rules/code.md` (23 aturan), cari skill relevan dengan pekerjaan yang sedang/akan dikerjakan, muat semua.

### Skill yang DIMUAT (konteks: migrasi layar `pelanggan_aktif_*` ke notifier Riverpod)

- `riverpod-pola` (code) — aturan 2, 14, 15, 21 code.md (notifier codegen + reload `AsyncValue.data(...)` + rethrow; larangan `.when`; `ConsumerState.build` satu parameter).
- `penanganan-async-data-kosong` (code) — layar menangani `isLoading → hasError → requireValue` + empty state.
- `penanganan-asyncvalue-berkali` (code) — tiga provider async sekaligus di `build()` (pola `detail_pelanggan_aktif.dart`).
- `penanganan-error-unawaited` (code) — aturan 13 code.md; lokasi `_loadData(forceRefresh: true)` yang dilepas tanpa `unawaited(...)`/`catchError` di layar (temuan; belum diperbaiki).
- `validasi-platform-izin` (code) — aturan 18 code.md; `LayananUnggahData().unggahDataPelangganAktif()` di jalur refresh tanpa guard `kIsWeb` (sumber `[core/not-initialized]` — sesi 49, 2026-11-18).
- `logging-debug` (code) — aturan 6, 8, 12 code.md (`L.*`, larangan narasi/banner).
- `model-state-freezed-abstract` (code) — aturan 3, 9, 19, 23 code.md (state Freezed; `ParserUtil`; UTC/lokal; adapter `_parseTanggal`).
- `notifier-crud-database` (code) — pola CRUD notifier (`_ambilSemua`, DB dulu baru update state, `rethrow`); dipakai pola `KategoriNotifier` sesi 50.
- `import-ordering` (code) — aturan 17 penamaan; urutan import alfabetis (edit impor sesi 50/51/52).
- `penamaan-konvensi` (code) — aturan 10 code.md (enum `label`); identifier Indonesia, file snake_case.
- `disiplin-scope-kerja` (non-code) — aturan 22 code.md; format scoped `dart format <berkas>`; laporkan berkas di luar sesi.
- (Sudah dimuat lebih awal pada sesi ini: `memori-check`, `build-runner-codegen`.)

### Skill yang TIDAK dipilih (relevansi rendah untuk pekerjaan ini)

- `data-dummy`, `konstanta-skema-tabel`, `pola-testing`, `navigator-routing`, `struktur-folder-lib`, `overlay-log-debug`, `flutter-local-notifications`, `kartu-motivasi-pintasan-dashboard`, `empty-state-daftar`, `gaya`, `spacing`, `scaffold-struktur-layar`, `material-app-tema-lokalisasi`, `theme-data-color-schema`, `tipografi`, `zona-waktu-perangkat-pengingat`, `migrasi-skema-sqlite`, `parsing-nullable-int`, `konfirmasi-sebelum-simpan`, dll. — tidak menyentuh/menemukan pekerjaan yang sedang berjalan saat ini; tidak ada aturan `.agents/rules/code.md` yang memetakan pekerjaan ini ke skill tersebut.

### Temuan terkait pekerjaan mendatang (belum dikerjakan, menunggu perintah pengguna)

- Future yang dilepas tanpa `catchError` di titik panggilan (aturan 13 code.md; skill `penanganan-error-unawaited`); mis. `_loadData(forceRefresh: true)` di `_tambahPelangganAktif`/`onTap`/`_opsiLanjutan` pada `pelanggan_aktif_screen.dart`, dan `_loadData()` di `initState`.
- `LayananUnggahData` tanpa guard `kIsWeb` (aturan 18 code.md; skill `validasi-platform-izin`) — sumber error `[core/not-initialized]` (sesi 49).
- Log narasi/banner pada layar ini melanggar aturan 12 code.md (skill `logging-debug`) — pra-eksisting, di luar cakupan sesi 51/52.

## Perubahan Kode (sesi ini)

- `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart`: penanganan error pada `build()` diganti dari gabungan (`asyncPelangganAktif.error ?? asyncPelanggan.error ?? asyncPaket.error` → teks tanpa retry) menjadi penanganan `hasError` terpisah per provider (`penggunaAktifProvider`, `pelangganProvider`, `paketProvider`), masing-masing dengan pesan error + tombol "Coba Lagi" → `ref.invalidate(provider terkait)` (selaras skill `penanganan-asyncvalue-berkali` #2 + `penanganan-async-data-kosong` #2; paritas dengan `detail_pelanggan_aktif.dart`). Ditambah helper `_buildMuatGagal(String pesan, VoidCallback onCobaLagi)`. Verifikasi: `dart format` OK; `dart analyze` No issues found. Belum di-commit; tidak ada commit oleh sesi.

## Berkas Terdampak

| Lokasi File        | Status Perubahan | Deskripsi        |
| ------------------ | ---------------- | ---------------- |
| `memori/sesi/sesi_53.md` | Dibuat       | Berkas sesi aktif |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` | Diubah | Penanganan error per-provider + retry |

## Sinkronisasi ke MEMORI.md

Sudah disinkronkan.
