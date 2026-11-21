# Analisa Kesehatan Kode — Commit Dart Terbaru

## Ringkasan Evaluasi

- Tanggal evaluasi: 2026-11-21 (sesi 187).
- SDK terpasang (sumber kebenaran verifikasi): Flutter 3.47.9 (channel stable), Dart 3.13.7 (`flutter --version` / `dart --version`).
- Repositori dievaluasi (dari `.gitmodules`): root (`.`), `admin_wifi/`, `share_global_saya/`. `base_coc` **tidak dievaluasi** — submodul dinonaktifkan (dikomentari) dalam `.gitmodules` dan direktori `base_coc/` tidak ada.
- Commit terakhir per repositori (tercatat): root `37abe16a` (HEAD), `admin_wifi` `8554b96` (HEAD), `share_global_saya` `680fbe5` (HEAD).
- Commit terakhir yang dievaluasi: root `61bf4f7`, `admin_wifi` `e6fd72d`, `share_global_saya` `705dbdf`.
- Commit Dart baru sejak evaluasi terakhir:
  - root: tidak ada (`git log 61bf4f7..HEAD -- '*.dart'` kosong). Tidak ada temuan untuk root.
  - `share_global_saya`: 2 commit Dart (`680fbe5`, `9253bd9`) dalam rentang `705dbdf..HEAD`, dievaluasi; patuh skill/SDK, tidak ada ketidaksesuaian.
  - `admin_wifi`: 18 commit Dart dalam rentang `e6fd72d..HEAD`, dibaca dari tertua ke terbaru; dievaluasi; ditemukan ketidaksesuaian baru (Kelompok 14–16).
- Pointer gitlink (informasi, bukan temuan kode): `share_global_saya` cocok dengan HEAD submodul (`680fbe5`); `admin_wifi` root menempel di `8554b96` sedangkan HEAD submodul adalah `8554b96` (cocok).
- `pubspec.yaml` `admin_wifi` tidak berubah dalam rentang dievaluasi; `environment.sdk: ^3.9.0` terpenuhi oleh Dart 3.13.7. `share_global_saya` `environment.sdk ">=3.4.0 <4.0.0"` dan `flutter ">=3.22.0"` terpenuhi Flutter 3.47.9 / Dart 3.13.7. Versi paket terlock sama dengan verifikasi sesi 133 (`supabase_flutter 2.18.3`, `flutter_riverpod 3.5.0`, `freezed_annotation 3.1.0`, `riverpod_annotation 4.0.8`, `build_runner`, `sqflite ^2.4.2`, `material_ui` melalui path lokal ke `share_global_saya`, dst. diverifikasi ke pub.dev sebelumnya).
- Semua task berstatus `selesai` telah dikerjakan dan diverifikasi. Task baru (Kelompok 14–16) bert status `belum`.

## Kelompok 14

## file terdampak

- (lib/fitur/dompet/notifier/dompet_notifier.dart)[../admin_wifi/lib/fitur/dompet/notifier/dompet_notifier.dart]
- (lib/fitur/paket/notifier/paket_notifier.dart)[../admin_wifi/lib/fitur/paket/notifier/paket_notifier.dart]
- (lib/fitur/pelanggan/notifier/pelanggan_notifier.dart)[../admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart]
- (lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart)[../admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart]

## Tinggi

#### Task 14

- Status : selesai
- Masalah : Pemakaian `L.e(...$e\n$s...)` (baris baru antara `$e` dan `$s`) alih-alih `L.e(...$e $s...)` dengan spasi pada `muatUlang()` dan method lain. code.md aturan 6 mengharuskan interpolasi `$e $s`.
- Solusi : Ganti `\n` menjadi spasi pada setiap pemakaian `L.e` yang menyertakan `$e $s`, mis. `L.e('Gagal memuat ulang dompet: $e $s')`.
- aturan dilanggar : (code.md)[.agents/rules/code.md:6]
- file bermasalah : (dompet_notifier.dart)[../admin_wifi/lib/fitur/dompet/notifier/dompet_notifier.dart], (paket_notifier.dart)[../admin_wifi/lib/fitur/paket/notifier/paket_notifier.dart], (pelanggan_notifier.dart)[../admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart], (pengguna_aktif_notifier.dart)[../admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart]
- prompt : hanya diisi oleh saya

## Kelompok 15

## file terdampak

- (lib/fitur/kategori/notifier/kategori_notifier.dart)[../admin_wifi/lib/fitur/kategori/notifier/kategori_notifier.dart]
- (lib/fitur/kategori/notifier/sub_kategori_notifier.dart)[../admin_wifi/lib/fitur/kategori/notifier/sub_kategori_notifier.dart]
- (lib/fitur/kritik_saran/notifier/kritik_saran_notifier.dart)[../admin_wifi/lib/fitur/kritik_saran/notifier/kritik_saran_notifier.dart]
- (lib/fitur/dompet/notifier/dompet_notifier.dart)[../admin_wifi/lib/fitur/dompet/notifier/dompet_notifier.dart]
- (lib/fitur/paket/notifier/paket_notifier.dart)[../admin_wifi/lib/fitur/paket/notifier/paket_notifier.dart]
- (lib/fitur/pelanggan/notifier/pelanggan_notifier.dart)[../admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart]
- (lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart)[../admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart]
- (lib/fitur/pengaturan/notifier/pengaturan_notifier.dart)[../admin_wifi/lib/fitur/pengaturan/notifier/pengaturan_notifier.dart]
- (lib/fitur/pesanan/notifier/pesanan_notifier.dart)[../admin_wifi/lib/fitur/pesanan/notifier/pesanan_notifier.dart]
- (lib/fitur/versi_apk_user/notifier/versi_apk_user_notifier.dart)[../admin_wifi/lib/fitur/versi_apk_user/notifier/versi_apk_user_notifier.dart]

## Tinggi

#### Task 15

- Status : selesai
- Masalah : `L.i()` narasi langkah eksekusi tanpa nilai aktual (mis. `'Memuat daftar kategori dari database'`, `'Memulai getKategori (...)'`) pada `build()` dan method notifier. code.md aturan 12 melarang log yang hanya menarasikan langkah tanpa nilai aktual.
- Solusi : Hapus `L.i()` narasi tanpa nilai aktual, atau sertakan nilai aktual (mis. jumlah data, ID, timestamp) dalam pesan log.
- aturan dilanggar : (code.md)[.agents/rules/code.md:12]
- file bermasalah : semua berkas notifier di daftar file terdampak
- prompt : hanya diisi oleh saya

## Kelompok 16

## file terdampak

- (lib/fitur/dompet/notifier/dompet_notifier.dart)[../admin_wifi/lib/fitur/dompet/notifier/dompet_notifier.dart]
- (lib/fitur/kritik_saran/notifier/kritik_saran_notifier.dart)[../admin_wifi/lib/fitur/kritik_saran/notifier/kritik_saran_notifier.dart]
- (lib/fitur/pengaturan/notifier/pengaturan_notifier.dart)[../admin_wifi/lib/fitur/pengaturan/notifier/pengaturan_notifier.dart]
- (lib/fitur/versi_apk_user/notifier/versi_apk_user_notifier.dart)[../admin_wifi/lib/fitur/versi_apk_user/notifier/versi_apk_user_notifier.dart]

## Tinggi

#### Task 16

- Status : selesai
- Masalah : Beberapa method notifier menangkap error dengan `L.e(...)` lalu mengembalikan nilai default (`[]`, `null`, atau `PengaturanModel()`) alih-alih `rethrow`, sehingga error tersembunyi diam-diam. Terjadi pada `kritik_saran_notifier.dart` (`unduhDataDariSupabase`), `pengaturan_notifier.dart` (`getPengaturan`), dan `versi_apk_user_notifier.dart` (4 method). code.md aturan 2 wajib `rethrow` pada catch block.
- Solusi : Tambahkan `rethrow;` setelah `L.e(...)` pada setiap catch block yang menangkap error tanpa propagasi lebih lanjut.
- aturan dilanggar : (code.md)[.agents/rules/code.md:2]
- file bermasalah : (kritik_saran_notifier.dart)[../admin_wifi/lib/fitur/kritik_saran/notifier/kritik_saran_notifier.dart], (pengaturan_notifier.dart)[../admin_wifi/lib/fitur/pengaturan/notifier/pengaturan_notifier.dart], (versi_apk_user_notifier.dart)[../admin_wifi/lib/fitur/versi_apk_user/notifier/versi_apk_user_notifier.dart]
- prompt : hanya diisi oleh saya

#### Task 17

- Status : belum
- Masalah : `dompet_notifier.dart` baris 93 mengakses `state.value` tanpa null-check (`final stateData = state.value ?? await _ambilSemua();`). Jika state berada dalam kondisi error atau loading, `state.value` akan melempar exceptions. code.md aturan 27 mengharuskan salin field nullable ke variabel lokal dan gunakan null-check.
- Solusi : Gunakan `state.maybeWhen` atau cek `state.hasError`/`state.isLoading` sebelum mengakses `state.value`, atau salin ke variabel lokal dengan null-check terlebih dahulu.
- aturan dilanggar : (code.md)[.agents/rules/code.md:27]
- file bermasalah : (dompet_notifier.dart)[../admin_wifi/lib/fitur/dompet/notifier/dompet_notifier.dart]
- prompt : hanya diisi oleh saya

## Catatan Tidak Masuk task.md

- Root dan `share_global_saya`: tidak ada commit Dart dalam rentang evaluasi, tidak ada ketidaksesuaian baru; `task.md` tidak ditambah untuk keduanya.
- `share_global_saya` commit `680fbe5` (style/format pada log debug page dan empty state view) dan `9253bd9` (docs: perbarui referensi skill testing di komentar mock) tidak menimbulkan ketidaksesuaian.
- `admin_wifi` aspek yang sudah patuh (bukan temuan): notifier `@Riverpod(keepAlive: true)` + `muatUlang()` dengan `AsyncValue.data(await ...)` + `catch (e, s)` + `L.e` + `rethrow` pada kebanyakan notifier; model `@freezed` + `@Default` + konstanta skema snake_case; impor `package:material_ui/material_ui.dart`; root app `PengelolaOverlayLogDebug` + `Localizations` di atas `Directionality`; berkas hasil generate tidak diedit manual.
- Semua `L.e` pada notifier `pesanan_notifier.dart` dan sebagian method pada `versi_apk_user_notifier.dart` sudah menggunakan format `$e $s` dengan benar.
