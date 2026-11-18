# Sesi 45

- Status: Berjalan
- Tgl: 2026-11-18

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-18
- Command: interaksi langsung (tanpa command)
- Topik: Awal percakapan (sapaan "Hai")

## Checklist Awal Sesi

- [x] Baca `MEMORI.md` (tool Read, tanpa offset/limit)
- [x] Baca seluruh berkas `.agents/rules/` (6 berkas: `code.md`, `format_hasil_diskusi.md`, `kelompok_skill_wajib_non_code.md`, `lainnya.md`, `overlay_log_debug.md`, `pengelolaan_konflik.md`)
- [x] Buat berkas sesi `memori/sesi/sesi_45.md`
- [x] Muat skill `memori-check`

## Catch-up Sync Awal Sesi

- `memori/sesi/*.md` berstatus `Belum Sinkron` milik sesi sebelumnya:
  - `sesi_44.md` — tidak ada perubahan proyek (hanya berkas sesi itu sendiri; ter-commit `f784da7`) → ditandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan".
  - `sesi_43.md` — berisi perubahan nyata (`prompt/commands/muat_skill_terkait.md`, `.kilo/commands/muat_skill_terkait.md`; ter-commit di `6f898b8`, 2026-11-18 16:06 UTC) dan belum disinkronkan → atas persetujuan pengguna ("Ya, sinkronkan sekarang") disinkronkan pada sesi ini: `MEMORI.md` (header → sesi 45; Status; Catatan Teknis), `memori/riwayat_perubahan.md` (entri sesi 43), `sesi_43.md` diisi `## Sinkronisasi ke MEMORI.md` dan ditandai `Sudah Sinkron`.
  - `sesi_39.md` — masih `Berjalan`, ambigu (sudah dilaporkan ke pengguna pada sesi 41–44); tidak disentuh.
- `sesi_42.md`, `sesi_41.md`, `sesi_40.md` — `Sudah Sinkron` (arsip, tidak disentuh).

## Catatan Sesi

- Sesi dibuka oleh sapaan pengguna ("hai").
- Working tree root bersih (`git status --short` tanpa keluaran); HEAD `f784da7` saat sesi dimulai; commit eksternal `3f7cabc` (oleh pengguna, 2026-11-18 16:29 UTC) menyertakan catch-up `sesi_44.md` + pembuatan `sesi_45.md`.
- Catch-up `sesi_43.md` dilakukan atas persetujuan pengguna ("Ya, sinkronkan sekarang"): `MEMORI.md` (header → sesi 45; Status; Catatan Teknis), `memori/riwayat_perubahan.md` (entri sesi 43), `sesi_43.md` diisi `## Sinkronisasi ke MEMORI.md` dan ditandai `Sudah Sinkron`.
- `admin_wifi`: `PelangganAktifModel` direfactor (permintaan pengguna, bertahap):
  1. `toSqlite()`/`toFirebase()` — semua key memakai konstanta `PelangganAktifSkema` (sebelumnya string literal).
  2. Konstanta Firestore `tanggalMulaiFirestore`/`tanggalBerakhirFirestore` dihapus atas permintaan pengguna; **nama field Firestore disamakan dengan SQLite (snake_case `tanggal_mulai`/`tanggal_berakhir`)** — `fromFirebase()` ikut diubah agar round-trip konsisten. Konsekuensi: dokumen Firestore LAMA (camelCase `tanggalMulai`/`tanggalBerakhir`) tidak akan terbaca oleh versi ini (melempar `ArgumentError`); perlu migrasi data atau dual-read bila ada dokumen lama di produksi.
  3. `fromSqlite()`/`fromFirebase()` — semua key memakai konstanta `PelangganAktifSkema`; parsing didelegasikan ke `ParserUtil` (`parseDateTime`, `parseBool`, `parseStringOrNull`, `safeParseEnum`) dari `share_global_saya`. `ParserUtil.parseDateTime` tidak menangani `Timestamp` Firestore, jadi adapter `_parseTanggal` (konversi `Timestamp` → delegasi `ParserUtil`) dipertahankan di model.
  4. `toJson()` (manual) — sudah hilang dari working tree sebelum sesi ini (perubahan pra-eksisting, bukan dari sesi ini; dibiarkan).
  5. Percobaan menambah duck-typing `toDate()` di `share_global_saya/lib/src/utils/parser_util.dart` lalu DIHAPUS lagi atas permintaan pengguna ("hapus lagi saja") → berkas kembali identik dengan HEAD (tidak ada diff).
  6. Verifikasi awal: `dart format` + `dart analyze` bersih pada berkas model; `flutter test` → **+105 −24 identik dengan baseline** (24 test gagal = baseline; tidak berkaitan).
- Semua model lain dengan from/to juga direfactor (permintaan "agar seperti ini"):
  - Konversi 10 model ke pola sama: constanta `*Skema` (status_unggah ditambah konstanta `id`/`perluUnggah`), parsing via `ParserUtil` (termasuk `parseString` menggantikan cast `as String`, `safeParseEnum` menggantikan `firstWhere`), tanggal tulis `toUtc()` (ISO/Timestamp) dan baca `toLocal()` (lewat `_parseTanggal`), nama field Firestore disamakan snake_case untuk `transaksi_model` (`durasiPaket`/`tipeDurasiPaket`/`tanggalMulai`/`tanggalBerakhir`/`aktivasiPaket`) dan untuk seluruh key `transaksi_model`. `transaksi_model.toFirebase` `tanggal` kini `Timestamp.fromDate(toUtc)`, `diarsipkan` menjadi Timestamp kondisional. `kritik_saran`/`pesanan`/`transaksi` (tanggal wajib) melempar `ArgumentError` bila kosong (sebelumnya fallback `DateTime.now()`). `pengaturan_model.toSqlite` tetap menulis `DateTime.now()` tetapi `.toUtc()`. `sub_kategori.toFirebase.diperbarui` → `FieldValue.serverTimestamp()`; `diarsipkan` → Timestamp kondisional (kategori/sub_kategori). `versi_apk_user_model`: `_arsitekturDariString` dihapus → `ParserUtil.safeParseEnum`; nilai nomorBuild/tautanUnduhan lewat `parseInt`/`parseString`.
  - **Konversi 10 model ke Freezed** (permintaan "ubah juga modelnya agar menggunakan freezed"): class → `abstract class ... with _$Xxx` + `const factory ... = _Xxx`; `id` menjadi `required String id` non-nullable (auto-UUID dihapus dari model; konsisten dengan `PelangganAktifModel`); manual `copyWith` dihapus (di-generate); `@Default` menggantikan default lama. Call site disesuaikan: `form_paket` (`id:` null → `const Uuid().v4()` + tambah import uuid), `form_kategori` (`SubKategoriModel` tambah `id: const Uuid().v4()`). `detail_dompet.dart` diperbaiki (`_namaDompetTerbaru` non-final tidak bisa dipromosikan → ditangkap ke variabel lokal). `versi_apk_user_model` `@Default` merujuk `VersiApkUserModel.defaultNomorBuildTerbaru/defaultTautanUnduhan` (dikualifikasi). `RiwayatLanggananModel` tidak dikonversi (seluruhnya dikomentari). `toJson` manual (pelanggan/versi_apk_user, khusus logging) dibiarkan.
  - **Insiden build_runner (PENTING):** `--build-filter` menyebabkan build_runner MENGHAPUS berkas generated yang terlacak: `pelanggan_aktif_state.freezed.dart` (dipulihkan byte-identik), `pelanggan_aktif_model.freezed.dart`, `pengguna_aktif_notifier.g.dart`, dan 8 `*_test.mocks.dart` (test/data/operasi/pelanggan_aktif_operasi_test, versi_apk_user_operasi_test, unggah_data_test, form_paket_test, form_pelanggan_aktif_test, form_versi_apk_user_test, versi_apk_user_test (lainnya), transaksi_test) — semuanya DIBALIHKAN via `git checkout --` dari HEAD (identik). Build terakhir dieksekusi tanpa `--build-filter` (standar skill build-runner-codegen): 22 outputs ditulis; `pengguna_aktif_notifier.g.dart` hanya berubah hash codegen (`_$penggunaAktifNotifierHash`). 11 `*.freezed.dart` model baru dibuat (dan kini staged). `dart analyze lib` → **No issues found!**
  - **flutter test BELUM dijalankan** — pengguna memutuskan test hanya dijalankan sekali saat versi final (lihat di bawah). Risiko regresi dari konversi Freezed belum diverifikasi; wajib dijalankan saat final.
  - Berkas test diperbaiki agar kompatibel dengan `id` wajib (konversi Freezed): `test/data/operasi/kategori_operasi_test.dart` (tambah `id: const Uuid().v4()` + import uuid), `test/model/dompet_model_test.dart` (test "Inisialisasi: UUID otomatis" diubah menjadi ekspektasi `id` eksplisit; satu konstruksi ditambah `id:`), `test/model/paket_model_test.dart` (3 konstruksi ditambah `id:`), `test/data/operasi/kritik_saran_operasi_test.dart` (bug `..copyWith` cascade yang hasilnya terbuang → diubah jadi assignment langsung — sekaligus memperbaiki test urutan DESC, perilaku sebelumnya memang tidak efektif). `dart analyze test` → **No issues found!** (test files berstatus unstaged; 27 berkas model/lib lain staged oleh mekanisme di luar sesi ini).
  - **Penghapusan `toJson()` di semua model** (permintaan pengguna, 2026-11-18): `versi_apk_user_model.dart` dan `pelanggan_model.dart` kehilangan method `toJson()` manual (yang hanya untuk logging; `toJson` di `pelanggan_aktif_model.dart` sudah hilang pra-sesi). Dua call site log disesuaikan agar tidak lagi memanggil `toJson()` dan tidak membocorkan data sensitif: `form_pelanggan.dart` kini log `id`+`nama` saja (password tidak pernah dilog), `form_versi_apk_user.dart` log `versi`+`wajibUpdate` saja. `dart analyze lib` + `dart analyze test` → bersih.
  - **Rename `displayName` → `label`** (permintaan pengguna via `/lanjut_tugas_selanjutnya`, 2026-11-18): 2 getter (`TipeDurasi.label` di `paket_model.dart`, `StatusPembayaranEnum.label` di `enum/status_pembayaran_enum.dart`) dan seluruh pemakaiannya diubah (`form_paket.dart`, `form_pelanggan_aktif.dart`, `detail_pelanggan_aktif.dart`, `pelanggan_aktif_screen.dart`, `info_paket.dart`, serta komentar `form_edit_riwayat_langganan.dart`); log `L.i('Mengakses getter displayName ...')` di-enum disesuaikan. `grep displayName` di seluruh workspace → tidak ada sisa. `dart format` + `dart analyze lib` + `dart analyze test` → bersih.
  - **Command `/tambah_kode_keskill` (2026-11-18) — draf disiapkan, BELUM diterapkan (menunggu commit sah).** Target dipilih pengguna: kandidat A–E (konversi Freezed; ParserUtil + `_parseTanggal`; `XxxSkema` selaras Firestore snake_case; UTC tulis/lokal baca; pelajaran build_runner tanpa `--build-filter`). Draf dipetakan ke `.agents/skills/code/model-state-freezed-abstract` (A,B,D), `.agents/skills/code/konstanta-skema-tabel` (C), `.agents/skills/code/build-runner-codegen` (E), dan usulan Aturan #9 `.agents/rules/code.md` (wajib menyertakan skill terkait). Per aturan `lainnya.md` + command aturan 8: skill `code/` hanya boleh diubah dari riwayat commit — seluruh kode sesi 45 hanya staged, BELUM di-commit → draf hanya ditampilkan, tidak ada berkas skill/rules yang diubah. Pengguna memilih "Saya commit dulu"; setelah commit sah tersedia, draf 1–4 dapat diterapkan lewat perintah lanjutan.
  - **Command `/tambah_kode_keskill` untuk diff `pelanggan_aktif_screen.dart`** (spacing, 2026-11-18; diff hanya STAGED, belum ada commit): pengguna memilih **A + B** — keduanya TIDAK bisa diterapkan sekarang (skill `code/` dan `code.md` hanya sah diubah dari riwayat commit). Tertunda sampai commit sah: **A** — skill `code/spacing` tambah `Sumber Evaluasi` (commit `<hash>`, contoh `pelanggan_aktif_screen.dart` — 3 `SizedBox(height: 4)` → `Column(spacing: 4)`) dan 1 contoh benar; **B** — `.agents/rules/code.md` Aturan **#11** baru: jarak seragam antar anak Row/Column/Wrap WAJIB `spacing`/`Wrap.runSpacing`; `SizedBox` hanya untuk jarak khusus; skill terkait `spacing`.
  - **Command `/muat_skill_terkait`** (2026-11-18): `kelompok_skill_wajib_non_code.md` dan `.agents/rules/code.md` dibaca; skill yang relevan dengan pekerjaan ini dimuat: `memori-check`, `model-state-freezed-abstract`, `konstanta-skema-tabel`, `build-runner-codegen`, `aturan-pembuatan-skill`, `aturan-pembuatan-rules`, `penamaan-konvensi`. Tidak ada skill lain yang relevan. Temuan: tool `skill` menyajikan snapshot `penamaan-konvensi` yang usang (belum memuat kaidah 19/`versi 1.2.0`), padahal di disk sudah benar — Kilo menyajikan cache konten skill; verifikasi selalu lewat Read berkas langsung.
  - **Enum `label` (aturan baru, perintah pengguna)**: `.agents/rules/code.md` Aturan **#10** — setiap enum yang perlu ditampilkan ke pengguna wajib getter `label` (`switch` exhaustive); dilarang teks tampilan enum manual di layar. Skill `penamaan-konvensi` v1.1.1 → 1.2.0 (Aturan 19 + Larangan "teks tampilan enum tulis manual" + sumber `a57b6bb`). Pelanggaran aktif ditemukan & diperbaiki: `form_pelanggan_aktif.dart` — `const Text('Lunas')`/`const Text('Belum Lunas')` → `Text(StatusPembayaranEnum.lunas.label)`/`Text(StatusPembayaranEnum.belumLunas.label)`. `dart analyze lib` + `test` → bersih. Catatan: `dart format test` sempat memformat ulang 10 berkas test di luar cakupan — seluruh churn format dibatalkan via `git checkout HEAD -- test/` (edit yang dimaksud sudah ter-commit di `ea08f25`/`a57b6bb`); diff kini hanya `form_pelanggan_aktif.dart`.
  - **`pelanggan_aktif_screen.dart`** (2026-11-18): seluruh `SizedBox(height: 4)` (3 kemunculan di dalam subtitle `Column`) dihapus; jarak seragam antar anak kini lewat `Column(spacing: 4)` (skill `spacing` Aturan 1–2). Berkas bebas `SizedBox`. `dart analyze` → bersih. Permintaan pengguna hanya untuk berkas ini; ratusan `SizedBox` di berkas lain TIDAK dikonversi (di luar cakupan, belum disetujui).
  - `formatmd` (`npx prettier --write`) dijalankan hanya untuk 5 berkas yang diedit (`model-state-freezed-abstract`, `konstanta-skema-tabel`, `build-runner-codegen`, `penamaan-konvensi`, `code.md`) — seluruh berkas `unchanged`; alias global TIDAK dijalankan (insiden format massal sesi 22/29).
  - Seluruh perubahan `admin_wifi` kini ber-status staged di index (git add dijalankan oleh mekanisme di luar sesi — bukan oleh sesi ini; sesi ini tidak menjalankan `git add`/`commit`).
- `share_global_saya`: bersih (tidak ada diff).
- Keputusan pengguna (2026-11-18): **test tidak dijalankan berulang kali selama iterasi; `flutter test` hanya dijalankan sekali saat versi sudah final.** Hasil `flutter test` terakhir (+105/−24) adalah baseline pra-final dan belum dianggap verifikasi akhir.

## Berkas Terdampak

| Lokasi File                             | Status Perubahan | Deskripsi                                            |
| --------------------------------------- | ---------------- | ---------------------------------------------------- |
| `memori/sesi/sesi_45.md`                | Dibuat           | Berkas sesi aktif (Berjalan)                         |
| `memori/sesi/sesi_44.md`                | Diubah           | Catch-up: ditandai `Sudah Sinkron` (tanpa perubahan proyek) |
| `memori/sesi/sesi_43.md`                | Diubah           | Catch-up: `## Sinkronisasi ke MEMORI.md` diisi; ditandai `Sudah Sinkron` |
| `MEMORI.md`                             | Diubah           | Header → sesi 45; Status (sesi terakhir → sesi_43); Catatan Teknis entri sesi 43 |
| `memori/riwayat_perubahan.md`           | Diubah           | Entri "Sesi 43 ditandai Sudah Sinkron via catch-up sesi 45" |
| `admin_wifi/lib/fitur/pelanggan_aktif/model/pelanggan_aktif_model.dart` | Diubah | Key Firestore disamakan snake_case; semua key via konstanta `PelangganAktifSkema`; parsing via `ParserUtil` (+ adapter `_parseTanggal` untuk `Timestamp`) |
| `admin_wifi/lib/model/{dompet,paket,transaksi,pengaturan,versi_apk_user,kategori,sub_kategori,kritik_saran,pesanan,pelanggan,status_unggah}_model.dart` | Diubah | Konstanta Skema + ParserUtil (parseString/safeParseEnum/dll.) + `toUtc` tulis / `toLocal` baca (via `_parseTanggal`) + key Firestore `transaksi` disamakan snake_case + dikonversi ke Freezed (abstract class + const factory) |
| `admin_wifi/lib/model/{dompet,paket,transaksi,pengaturan,versi_apk_user,kategori,sub_kategori,kritik_saran,pesanan,pelanggan,status_unggah}_model.freezed.dart` | Dibuat | Berkas generated Freezed (hasil build_runner) |
| `admin_wifi/lib/halaman/detail/detail_dompet.dart` | Diubah | Tangkap `_namaDompetTerbaru` ke variabel lokal (non-final tidak bisa dipromosikan; parameter copyWith freezed non-nullable) |
| `admin_wifi/lib/halaman/form/form_paket.dart` | Diubah | `id:` null → `const Uuid().v4()`; tambah import uuid |
| `admin_wifi/lib/halaman/form/form_kategori.dart` | Diubah | `SubKategoriModel` tambah `id: const Uuid().v4()` |
| `admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.g.dart` | Diubah | Hanya hash codegen (`_$penggunaAktifNotifierHash`) setelah rebuild penuh; dipulihkan dari build_runner (tanpa `--build-filter`) |
| `admin_wifi/test/data/operasi/kategori_operasi_test.dart` | Diubah | Konstruksi `KategoriModel` tanpa id ditambah `id: const Uuid().v4()` + import uuid |
| `admin_wifi/test/model/dompet_model_test.dart` | Diubah | Test "UUID otomatis" diubah menjadi ekspektasi id eksplisit; 1 konstruksi ditambah `id:` |
| `admin_wifi/test/model/paket_model_test.dart` | Diubah | 3 konstruksi ditambah `id:` |
| `admin_wifi/test/data/operasi/kritik_saran_operasi_test.dart` | Diubah | Bug `..copyWith` cascade (hasil terbuang) → assignment langsung |
| `admin_wifi/lib/model/versi_apk_user_model.dart` | Diubah | Penghapusan `toJson()` manual (khusus logging) |
| `admin_wifi/lib/model/pelanggan_model.dart` | Diubah | Penghapusan `toJson()` manual (khusus logging, redaksi password hilang bersama method) |
| `admin_wifi/lib/halaman/form/form_pelanggan.dart` | Diubah | Log model tanpa `toJson()`; log `id`+`nama` saja (password tidak dilog) |
| `admin_wifi/lib/halaman/form/form_versi_apk_user.dart` | Diubah | Log model tanpa `toJson()`; log `versi`+`wajibUpdate` saja |
| `.agents/rules/code.md` | Diubah | Aturan #9 (model DB wajib Freezed/`ParserUtil`/`XxxSkema`/UTC tulis–lokal baca/field Firestore = kolom SQLite) + Aturan #10 (enum `label`) |
| `.agents/skills/code/model-state-freezed-abstract/SKILL.md` | Diubah | Kaidah 17–21 + 5 Larangan baru + Sumber `ea08f25` + permintaan pengguna |
| `.agents/skills/code/konstanta-skema-tabel/SKILL.md` | Diubah | Kaidah 7–8 + Larangan + Sumber (`ea08f25`) |
| `.agents/skills/code/build-runner-codegen/SKILL.md` | Diubah | Kaidah 7–8 + Contoh Salah + Sumber insiden 2026-11-18; perintah contoh hilangkan `--delete-conflicting-outputs` |
| `.agents/skills/code/penamaan-konvensi/SKILL.md` | Diubah | v1.1.1→1.2.0: Aturan 19 (`label` getter, wajib dipakai, manual dilarang) + Larangan + Sumber `a57b6bb` |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/form_pelanggan_aktif.dart` | Diubah | `Text('Lunas')`/`Text('Belum Lunas')` → `Text(StatusPembayaranEnum.lunas.label)`/`Text(StatusPembayaranEnum.belumLunas.label)` |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` | Diubah | 3 `SizedBox(height: 4)` dihapus; `Column(spacing: 4)` menggantikan |
| `admin_wifi/lib/model/paket_model.dart` | Diubah | Enum `TipeDurasi`: getter `displayName` → `label` |
| `admin_wifi/lib/enum/status_pembayaran_enum.dart` | Diubah | Getter `displayName` → `label` (termasuk teks log) |
| `admin_wifi/lib/halaman/form/form_paket.dart` | Diubah | Semua `displayName` → `label` |
| `admin_wifi/lib/whatsapp/info_paket.dart` | Diubah | Semua `displayName` → `label` |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` | Diubah | Semua `displayName` → `label` |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/form_pelanggan_aktif.dart` | Diubah | Semua `displayName` → `label` |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/detail_pelanggan_aktif.dart` | Diubah | Semua `displayName` → `label` |
| `admin_wifi/lib/halaman/form/form_edit_riwayat_langganan.dart` | Diubah | Komentar referensi stale `displayName` → `label` |

## Sinkronisasi ke MEMORI.md

Belum dilakukan.
