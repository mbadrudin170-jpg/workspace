# Kelompok 2

## file terdampak

- (base_coc/lib/fitur/upgrade_progress/model/akun_desa.dart)[base_coc/lib/fitur/upgrade_progress/model/akun_desa.dart]
- (base_coc/lib/fitur/upgrade_progress/model/item_upgrade.dart)[base_coc/lib/fitur/upgrade_progress/model/item_upgrade.dart]
- (base_coc/lib/fitur/upgrade_progress/model/progres_upgrade.dart)[base_coc/lib/fitur/upgrade_progress/model/progres_upgrade.dart]
- (base_coc/lib/fitur/upgrade_progress/provider/progres_provider.dart)[base_coc/lib/fitur/upgrade_progress/provider/progres_provider.dart]
- (base_coc/lib/fitur/galeri_base/model/base_layout.dart)[base_coc/lib/fitur/galeri_base/model/base_layout.dart]

## Tinggi

#### Task 4

- Status : selesai
- Masalah : Model dan state pada commit base_coc `2297549`/`aa8488b` (`AkunDesa`, `ItemUpgrade`, `ProgresUpgrade`, `ProgresKategori`, `ProgresDesaState`) dan `BaseLayout` (getter baru `previewImagePath`, commit `aa8488b`) ditulis sebagai `class` biasa yang memuat getter/method/`copyWith` — tidak memakai `@freezed`, dan `base_coc/pubspec.yaml` tidak memasang `freezed`, `freezed_annotation`, maupun `build_runner`. Enum `KategoriUpgrade` diparse dari kolom database dengan string matching manual (`kategoriUpgradeDariNama` pada `nama_tabel_progres.dart`, serta `row['kategori'] as String?` langsung pada `item_upgrade.dart`), bukan `ParserUtil.safeParseEnum`; tidak ada `ParserUtil` di `base_coc` (berkas dirujuk skill berada di `share_global_saya/lib/src/utils/parser_util.dart` dan `base_coc` tidak depend pada `share_global_saya`). Field int dari database diparse dengan cast manual (`as num?)?.toInt() ?? 0`, bukan `ParserUtil.parseInt`/`parseIntOrNull`.
- Solusi : Tambahkan `freezed_annotation` (dependencies) serta `freezed` dan `build_runner` (dev_dependencies) pada `base_coc/pubspec.yaml`; ubah setiap model/state menjadi `abstract class` beranotasi `@freezed` dengan mixin `_$Nama`, `const Nama._();` untuk getter/method, `factory Nama.fromJson`/`.fromSqflite`, dan `toSqflite()`; parse enum dengan `ParserUtil.safeParseEnum(KategoriUpgrade.values, ParserUtil.parseStringOrNull(row[...]))` dengan fallback default valid; gunakan `ParserUtil.parseInt`/`parseIntOrNull` untuk field int. Bila keputusan pengguna adalah `base_coc` tetap tanpa codegen Freezed (pola yang sudah dipakai sesi 67 untuk favorit), catat pengecualian itu eksplisit pada `.agents/rules/global/kelompok_skill_wajib.md` / skill terkait, bukan mendiamkan ketidaksesuaian. Contoh: `abstract class AkunDesa with _$AkunDesa { const AkunDesa._(); const factory AkunDesa({...}) = _AkunDesa; factory AkunDesa.fromSqflite(Map<String, Object?> row) => ...; Map<String, Object?> toSqflite() => ...; }` lalu `dart run build_runner build --delete-conflicting-outputs`.
- aturan dilanggar : kelompok_skill_wajib (kelompok "semua model dan state yang harus punya method dan getter wajib pakai freezed" dan kelompok "semua proyek saya wajib menggunakan freezed"), model-state-freezed-abstract (aturan 1, 5, 7, 8, 10; larangan "memparse enum dari database dengan cast/string matching langsung tanpa `ParserUtil.safeParseEnum`" dan "melakukan parsing `dynamic` dari database secara langsung tanpa `ParserUtil`")
- file bermasalah : akun_desa.dart, item_upgrade.dart, progres_upgrade.dart, progres_provider.dart (ProgresDesaState), base_layout.dart
- prompt : hanya diisi oleh saya
- catatan implementasi : selesai (keputusan pengguna via `question`: "Terapkan codegen penuh"). `base_coc/pubspec.yaml` memasang `freezed_annotation` + `riverpod_annotation` (dependencies) dan `freezed` + `build_runner` + `riverpod_generator` (dev_dependencies, urut abjad). `AkunDesa`, `ItemUpgrade`, `ProgresKategori`, `ProgresUpgrade`, `ProgresDesaState`, dan `BaseLayout` kini `@freezed abstract class` dengan `const Nama._()`, `const factory`, serta getter/method di body; `fromJson`/`toJson` BaseLayout dan validasi ketat `KatalogGagalException` dipertahankan. `ParserUtil` lokal baru `base_coc/lib/core/util/parser_util.dart` (`parseDateTime`, `parseInt`, `parseIntOrNull`, `parseStringOrNull`, `safeParseEnum`); `kategoriUpgradeDariNama` mendelegasikan ke `ParserUtil.safeParseEnum`; field int/enum database memakai `ParserUtil` (nullable tetap `null`). Berkas generate (`*.freezed.dart`, `*.g.dart`) dibuat via `build_runner` dan tidak diedit manual. Verifikasi: `dart format` (0 perubahan tersisa), `dart analyze` bersih, `flutter test` 42/42 lulus.

#### Task 5

- Status : selesai
- Masalah : `ItemUpgrade.fromSqflite`/`toSqflite` (commit `2297549`) menulis nama kolom sebagai string literal (`'kategori'`, `'nama'`, `'level_saat_ini'`, `'level_target'`, `'sisa_detik'`, `'sisa_sumber_daya'`) alih-alih memakai konstanta `NamaKolomProgres` yang sudah didefinisikan pada `nama_tabel_progres.dart` (konstanta itu sendiri sudah dipakai oleh `ProgresDao` dan `AkunDesa`). Nilai literal cocok dengan skema, jadi ini pelanggaran bentuk (bukan mismatch), tetapi aturan mewajibkan konstanta, bukan string manual.
- Solusi : Ganti seluruh string literal kolom pada `ItemUpgrade` dengan konstanta `NamaKolomProgres`: `row[NamaKolomProgres.sisaDetik] as int?`, `'kategori'` → `NamaKolomProgres.kategori`, `'nama'` → `NamaKolomProgres.nama`, `'level_saat_ini'` → `NamaKolomProgres.levelSaatIni`, `'level_target'` → `NamaKolomProgres.levelTarget`, `'sisa_sumber_daya'` → `NamaKolomProgres.sisaSumberDaya`.
- aturan dilanggar : kelompok_skill_wajib (kelompok "semua model database jangan ditulis manual (nama tabel/kolom) wajib pakai konstanta, bukan string literal"), penamaan-konstanta-snake-case (nilai konstanta wajib cocok dengan skema/migrasi SQLite)
- file bermasalah : item_upgrade.dart
- prompt : hanya diisi oleh saya
- catatan implementasi : selesai. Seluruh akses kolom `ItemUpgrade.fromSqflite`/`toSqflite` memakai konstanta `NamaKolomProgres` (`kategori`, `nama`, `levelSaatIni`, `levelTarget`, `sisaDetik`, `sisaSumberDaya`); tidak ada string literal nama kolom tersisa. Nilai konstanta tetap cocok dengan skema `SqfliteOpener`. Verifikasi `dart analyze` bersih dan `flutter test` 42/42 lulus.

#### Task 6

- Status : selesai
- Masalah : `ProgresNotifier` (commit `2297549`) dibuat `extends StateNotifier<AsyncValue<ProgresDesaState>>` dan provider utama memakai `StateNotifierProvider` dari `package:flutter_riverpod/legacy.dart` pada `flutter_riverpod` 3.5.0. Pola wajib menurut skill `riverpod-pola` dan `notifier-crud-database` (aturan 1) adalah notifier `@Riverpod(keepAlive: true)` (class `extends _$ProgresNotifier`, `build()` memanggil `_ambilSemua()`, CRUD memperbarui state setelah operasi DB berhasil, menangkap `Exception` lalu `rethrow`) dengan codegen `riverpod_generator`. `base_coc` tidak memasang `riverpod_generator`/`riverpod_annotation` (commit `2297549`/`b927ac3`), sehingga kode tidak mengikuti pola standar — `FavoritNotifier` (commit `b927ac3`) juga manual (`AsyncNotifier` tanpa codegen).
- Solusi : Dua opsi — (a) pasang `riverpod_annotation` dan `riverpod_generator` pada `base_coc`, ubah `ProgresNotifier` menjadi `@Riverpod(keepAlive: true) class ProgresNotifier extends _$ProgresNotifier { @override Future<ProgresDesaState> build() => _ambilSemua(); ... }` (dan `FavoritNotifier` mengikuti), lalu `build_runner`; atau (b) atas keputusan pengguna, catat pengecualian `base_coc` (provider Riverpod manual tanpa codegen, tanpa `NotifierProvider`/`keepAlive` codegen) secara eksplisit pada aturan/skill `riverpod-pola` atau `kelompok_skill_wajib.md` agar selaras. Jangan membiarkan selisih ini tanpa keputusan. Catatan positif: `state` diperbarui setelah operasi DB berhasil, `daftarAkun`/`progres` tidak diubah sebelum DB selesai, dan callback `_muat()` menangkap `Exception` lalu menyimpan `AsyncValue.error` — hanya pola deklarasi provider/notifier yang menyimpang.
- aturan dilanggar : kelompok_skill_wajib (kelompok "semua provider (state) wajib dibuat dengan Riverpod" dan "semua provider yang bisa punya fungsi CRUD wajib dijadikan notifier" — implementasi harus mengikuti pola Riverpod standar), riverpod-pola, notifier-crud-database (aturan 1: notifier database wajib `@Riverpod(keepAlive: true)`)
- file bermasalah : progres_provider.dart, favorit_provider.dart
- prompt : hanya diisi oleh saya
- catatan implementasi : selesai (keputusan pengguna via `question`: "Terapkan codegen penuh"). `ProgresNotifier` kini `@Riverpod(keepAlive: true)` `extends _$ProgresNotifier` dengan `build()` memanggil `_ambilSemua()`; `ProgresDesaState` menjadi `@freezed`; provider `progresProvider` dihasilkan `riverpod_generator` (bukan `StateNotifierProvider` legacy). `FavoritNotifier` juga dikonversi menjadi `@Riverpod(keepAlive: true)` dengan `build()` memanggil `_ambilSemua()`, `toggle` memperbarui state setelah DB berhasil, menangkap `Exception` + `debugPrint` lalu `rethrow`; provider `favoritProvider` dihasilkan codegen. `_muat()` mempertahankan `AsyncValue.loading` → data/error. `progresDaoProvider`, `databaseProvider`, `dbHelperProvider`, `favoritDaoProvider` tetap `Provider`/`FutureProvider` manual (bukan CRUD) dan tetap dapat di-override test. Berkas generate `*.freezed.dart`/`*.g.dart` dibuat via `build_runner`. Verifikasi: `dart format`, `dart analyze` bersih, `flutter test` 42/42 lulus (termasuk `favorit_provider_test`).

# Kelompok 3

## file terdampak

- (base_coc/lib/fitur/upgrade_progress/screen/progres_desa_screen.dart)[base_coc/lib/fitur/upgrade_progress/screen/progres_desa_screen.dart]
- (base_coc/lib/fitur/upgrade_progress/widget/ringkasan_kategori.dart)[base_coc/lib/fitur/upgrade_progress/widget/ringkasan_kategori.dart]

## Tinggi

#### Task 7

- Status : selesai
- Masalah : Logika `_formatDurasi(Duration)` ditulis tiga kali dengan implementasi yang identik pada commit `2297549`: pada `_ProgresDesaScreenState` (`progres_desa_screen.dart`), pada `RingkasanKategoriCard` dan pada `DaftarItemUpgrade` (`ringkasan_kategori.dart`). Ketiganya memformat hari/jam/menit dengan aturan tampilan yang sama.
- Solusi : Ekstraksi ke satu lokasi bersama (helper murni tanpa `BuildContext`/provider, atau ekstensi `Duration`), mis. `extension FormatDurasi on Duration { String toTeksSingkat() { ... } }` pada berkas `lib/fitur/upgrade_progress/util/durasi_format.dart`; ketiga pemanggil wajib memakainya. Contoh keluaran tetap: `hari > 0` → `'3h 5j 20m'`; `jam > 0` → `'2j 15m'`; selain itu → `'45m'`.
- aturan dilanggar : ekstraksi-perhitungan-turunan (aturan 1–3: perhitungan yang sama di lebih dari satu layar wajib diekstrak ke satu lokasi bersama; konsumen wajib memakai hasil dari lokasi bersama)
- file bermasalah : progres_desa_screen.dart, ringkasan_kategori.dart
- prompt : hanya diisi oleh saya
- catatan implementasi : selesai. Helper baru `base_coc/lib/fitur/upgrade_progress/util/durasi_format.dart` berisi `extension FormatDurasi on Duration { String toTeksSingkat(); }` (murni, tanpa `BuildContext`/provider). Tiga implementasi lokal `_formatDurasi` dihapus; `_ProgresDesaScreenState`, `RingkasanKategoriCard`, dan `DaftarItemUpgrade` memakai `toTeksSingkat()` dengan keluaran identik (`3h 5j 20m`, `2j 15m`, `45m`). Verifikasi `dart analyze` bersih dan `flutter test` 42/42 lulus.

# Kelompok 4

## file terdampak

- (base_coc/lib/fitur/galeri_base/model/filter_state.dart)[base_coc/lib/fitur/galeri_base/model/filter_state.dart]
- (base_coc/lib/fitur/galeri_base/provider/filter_provider.dart)[base_coc/lib/fitur/galeri_base/provider/filter_provider.dart]

## Tinggi

#### Task 8

- Status : selesai
- Masalah : `FilterState` (state untuk `FilterNotifier`) ditulis sebagai `class` biasa dengan implementasi manual `copyWith`, `operator ==`, `hashCode` (memakai `setEquals`/`Object.hashAllUnordered`) dan getter `hasFilter`; tidak memakai `@freezed`. `base_coc` sudah memasang `freezed`/`freezed_annotation` sejak commit `c0ed41e` (Kelompok 2 Task 4 selesai), tetapi `FilterState` tidak dikonversi. Commit `71a69f0` (PRD A6) menambahkan field `tags` ke `FilterState`; kelas masih manual pada HEAD.
- Solusi : Ubah menjadi `@freezed abstract class FilterState with _$FilterState` dengan `const FilterState._();` (getter `hasFilter` dipertahankan di body), `@Default(<TagStrategi>{}) Set<TagStrategi> tags`, lalu `dart run build_runner build --delete-conflicting-outputs`. `copyWith`/`==`/`hashCode` dihasilkan codegen. Verifikasi: `dart analyze` bersih dan `flutter test` lulus.
- aturan dilanggar : kelompok_skill_wajib (kelompok "semua model dan state yang harus punya method dan getter wajib pakai freezed" dan kelompok "semua proyek saya wajib menggunakan freezed"), model-state-freezed-abstract
- file bermasalah : filter_state.dart (pemanggilan `copyWith` oleh `filter_provider.dart` menyesuaikan signature codegen bila perlu)
- prompt : hanya diisi oleh saya
- catatan implementasi : selesai. `FilterState` kini `@freezed abstract class` dengan `const FilterState._()` dan `@Default(<TagStrategi>{}) Set<TagStrategi> tags`; getter `hasFilter` dipertahankan di body; `copyWith`/`==`/`hashCode` dihasilkan codegen (`filter_state.freezed.dart`). Field `townHall`/`tipe` nullable memanfaatkan sentinel codegen sehingga `copyWith(townHall: null)` menghapus filter. Tanda `clearTownHall`/`clearTipe`/`clearTags` dihapus dari API (tidak ada pemanggil di luar `filter_provider.dart`). Verifikasi: `dart format` (0 perubahan), `dart analyze` bersih (satu `info` unnecessary_import pada `filter_provider.dart` dihapus), `flutter analyze` bersih, `flutter test` 63/63 lulus.

#### Task 9

- Status : selesai
- Masalah : `FilterNotifier extends StateNotifier<FilterState>` dan provider utamanya memakai `StateNotifierProvider` dari `package:flutter_riverpod/legacy.dart`. Commit `c0ed41e` mengkonversi `ProgresNotifier` dan `FavoritNotifier` menjadi `@Riverpod(keepAlive: true)` dengan codegen `riverpod_generator`, tetapi `filter_provider.dart` tidak ikut dikonversi dan masih memakai pola legacy pada HEAD. `FilterNotifier` bukan provider CRUD database sehingga di luar cakupan eksplisit Kelompok 2 Task 6; apakah `filter_provider` sengaja dibiarkan legacy atau terlewat dari codegen sesi 102 belum diketahui dan menunggu keputusan pengguna. (Rujukan: skill `riverpod-pola` mensyaratkan pola Riverpod standar/codegen untuk provider state.)
- Solusi : Opsi (a) konversi ke `@Riverpod(keepAlive: true) class FilterNotifier extends _$FilterNotifier { @override FilterState build() => const FilterState(); ... }` lalu `dart run build_runner build --delete-conflicting-outputs`; seluruh pemanggil (`filter_chip_bar.dart`, `katalog_provider.dart`, `beranda_galeri_screen.dart`, dst.) memakai `filterProvider` hasil codegen. Opsi (b) atas keputusan pengguna, catat pengecualian eksplisit `filter_provider` sebagai legacy pada aturan/skill terkait. Jangan membiarkan selisih tanpa keputusan.
- aturan dilanggar : kelompok_skill_wajib (kelompok "semua provider (state) wajib dibuat dengan Riverpod"), riverpod-pola
- file bermasalah : filter_provider.dart (konsumen: filter_chip_bar.dart, katalog_provider.dart, beranda_galeri_screen.dart)
- prompt : hanya diisi oleh saya
- catatan implementasi : selesai (keputusan pengguna via `question` sesi 115: "Konversi codegen (Recommended)"). `FilterNotifier` kini `@Riverpod(keepAlive: true)` `extends _$FilterNotifier` dengan `build()` mengembalikan `const FilterState()`; pemanggilan `copyWith` disesuaikan signature codegen (`copyWith(townHall: null)` / `copyWith(tipe: null)` untuk menghapus filter; `copyWith(tags: {...})` untuk tag). `filterProvider` dihasilkan `riverpod_generator` (bukan `StateNotifierProvider` legacy); `package:flutter_riverpod/legacy.dart` tidak lagi dipakai. Nama provider tetap `filterProvider`; pemanggil (`filter_chip_bar.dart`, `katalog_provider.dart`, `beranda_galeri_screen.dart`, `test/tag_strategi_test.dart`) tidak berubah. `filter_provider.g.dart` dibuat via `build_runner`. Verifikasi: `dart format`, `dart analyze` bersih, `flutter analyze` bersih, `flutter test` 63/63 lulus.
