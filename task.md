# Analisa Kesehatan Kode — Commit Dart Terbaru

## Ringkasan Evaluasi

- Tanggal evaluasi: 2026-11-23 (sesi 247).
- SDK terpasang (sumber kebenaran verifikasi): Flutter 3.47.9 (channel stable), Dart 3.13.7 (`flutter --version` / `dart --version`).
- Repositori dievaluasi (dari `.gitmodules`): root (`.`), `admin_wifi/`, `share_global_saya/`. `base_coc` entri dikomentari dalam `.gitmodules` dan direktori `base_coc/` tidak ada → tidak dievaluasi (bukan dianggap lolos).
- Branch aktif: root `main`, `admin_wifi` `main`, `share_global_saya` `main`.
- Commit terakhir per repositori: root `84106597352270ad15b9fd5f417bd1850e967057`, `admin_wifi` `82ac9a84187d38aec385ef4f8fabed7d7a59735b`, `share_global_saya` `a747108f5a7d47eed623379c09423304ff62753e`.
- Commit terakhir yang sudah dievaluasi (sebelum sesi ini, per `catatan.md`): root `5d517beb7530af32b716242486158e4048f7c0f0`, `admin_wifi` `cd1c62471e97696ff36044a20bad742362ebc583`, `share_global_saya` `c9d5136c8a0cdcff73eaac9fb983ad10b731bd1f`.
- Rentang commit dievaluasi (terlama → terbaru): root `5d517beb..8410659` (tidak ada commit Dart); `admin_wifi` `cd1c6247..82ac9a8` (27 commit Dart); `share_global_saya` `c9d5136c..a747108` (2 commit Dart).
- Pointer gitlink root pada HEAD: `admin_wifi` `095c7407`, `share_global_saya` `a747108f`. HEAD `admin_wifi` (`82ac9a8`) **beda** dengan pointer root → informasi (submodul belum di-bump ke root), bukan temuan kode. `share_global_saya` cocok.
- `pubspec.yaml` tidak berubah dalam rentang yang dievaluasi. SDK terpenuhi: `admin_wifi` `sdk: ^3.9.0` terpenuhi Dart 3.13.7; `share_global_saya` `sdk ">=3.4.0 <4.0.0"` dan `flutter ">=3.22.0"` terpenuhi Flutter 3.47.9 / Dart 3.13.7.
- Hasil: temuan baru — 4 berkas `admin_wifi` tidak lolos `dart format` + operator `!` pada `wifi_analyzer_notifier.dart`; 1 berkas `share_global_saya` tidak lolos `dart format` + log narasi + `L.e` `$stackTrace`. Task.md ditambah Kelompok 2 (Task 3–6) dan Kelompok 3 (Task 7). Task lama Kelompok 1 (Task 1–2) tetap.

# Kelompok 1

## file terdampak

- (admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart)[admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart]
- (admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart)[admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart]

## Tinggi

#### Task 1

- Status : belum
- Masalah : Commit `cd1c624` (`chore(operasi): hapus OperasiDasar dan standarisasi pemanggilan metode OperasiSqlite`) meninggalkan indentasi yang tidak konsisten dan tidak lolos `dart format` pada `pelanggan_notifier.dart` (panggilan `await operasiSqlite.perbarui(...)` beserta argumen berikutnya berada di margin yang salah, di luar struktur blok yang benar). Terconfirmi secara objektif via `dart format --output none --set-exit-if-changed` → exit 1, berkas terdeteksi "Changed" (berkas tidak ditimpa, hanya diperiksa).
- Solusi : Jalankan `dart format` pada berkas tersebut untuk memperbaiki indentasi tanpa mengubah logika, lalu verifikasi ulang dengan `dart format --output none --set-exit-if-changed` harus lolos (exit 0) sebelum komit. DILARANG mengubah logika atau menambahkan fitur dalam komit perbaikan ini.
- aturan dilanggar : konvensi proyek `dart format` bersih sebelum komit (verifikasi `dart format`/`dart analyze` sebelum laporan per MEMORI.md), terkait `code.md` aturan 22 (format/linter hanya pada berkas tugas) dan `disiplin-scope-kerja`.
- file bermasalah : (admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart)[admin_wifi/lib/fitur/pelanggan/notifier/pelanggan_notifier.dart]
- prompt : hanya diisi oleh saya

#### Task 2

- Status : belum
- Masalah : Commit `cd1c624` (`chore(operasi): hapus OperasiDasar dan standarisasi pemanggilan metode OperasiSqlite`) meninggalkan indentasi yang tidak konsisten dan tidak lolos `dart format` pada `pengguna_aktif_notifier.dart` (baris `final pelangganAktif = ...` dan `final operasiSqlite = ...` hilang indentasi di dalam blok `if`; struktur serangkaian panggilan `perbarui(...)` juga tidak rata). Terconfirmi secara objektif via `dart format --output none --set-exit-if-changed` → exit 1, berkas terdeteksi "Changed".
- Solusi : Jalankan `dart format` pada berkas tersebut untuk memperbaiki indentasi tanpa mengubah logika, lalu verifikasi ulang dengan `dart format --output none --set-exit-if-changed` harus lolos (exit 0) sebelum komit. DILARANG mengubah logika atau menambahkan fitur dalam komit perbaikan ini.
- aturan dilanggar : konvensi proyek `dart format` bersih sebelum komit (verifikasi `dart format`/`dart analyze` sebelum laporan per MEMORI.md), terkait `code.md` aturan 22 (format/linter hanya pada berkas tugas) dan `disiplin-scope-kerja`.
- file bermasalah : (admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart)[admin_wifi/lib/fitur/pelanggan_aktif/notifer/pengguna_aktif_notifier.dart]
- prompt : hanya diisi oleh saya

# Kelompok 2

## file terdampak

- (admin_wifi/lib/fitur/pesanan/notifier/pesanan_notifier.dart)[admin_wifi/lib/fitur/pesanan/notifier/pesanan_notifier.dart]
- (admin_wifi/lib/fitur/riwayat_langganan/screens/detail_riwayat_langganan.dart)[admin_wifi/lib/fitur/riwayat_langganan/screens/detail_riwayat_langganan.dart]
- (admin_wifi/lib/fitur/wifi_analyzer/notifier/wifi_analyzer_notifier.dart)[admin_wifi/lib/fitur/wifi_analyzer/notifier/wifi_analyzer_notifier.dart]
- (admin_wifi/lib/fitur/wifi_analyzer/screens/wifi_analyzer_screen.dart)[admin_wifi/lib/fitur/wifi_analyzer/screens/wifi_analyzer_screen.dart]

## Tinggi

#### Task 3

- Status : selesai
- Masalah : Commit dalam rentang `cd1c6247..82ac9a8` (wifi_analyzer & pesanan & riwayat_langganan) meninggalkan indentasi yang tidak konsisten dan tidak lolos `dart format` pada `pesanan_notifier.dart`. Terconfirmi secara objektif via `dart format --output none --set-exit-if-changed` → exit 1, berkas terdeteksi "Changed".
- Solusi : Jalankan `dart format` pada berkas tersebut untuk memperbaiki indentasi tanpa mengubah logika, lalu verifikasi ulang dengan `dart format --output none --set-exit-if-changed` harus lolos (exit 0) sebelum komit. DILARANG mengubah logika atau menambahkan fitur dalam komit perbaikan ini.
- aturan dilanggar : konvensi proyek `dart format` bersih sebelum komit (verifikasi `dart format`/`dart analyze` sebelum laporan per MEMORI.md), terkait `code.md` aturan 22 (format/linter hanya pada berkas tugas) dan `disiplin-scope-kerja`.
- file bermasalah : (admin_wifi/lib/fitur/pesanan/notifier/pesanan_notifier.dart)[admin_wifi/lib/fitur/pesanan/notifier/pesanan_notifier.dart]
- prompt : hanya diisi oleh saya

#### Task 4

- Status : selesai
- Masalah : Commit dalam rentang `cd1c6247..82ac9a8` meninggalkan indentasi yang tidak konsisten dan tidak lolos `dart format` pada `detail_riwayat_langganan.dart`. Terconfirmi secara objektif via `dart format --output none --set-exit-if-changed` → exit 1, berkas terdeteksi "Changed".
- Solusi : Jalankan `dart format` pada berkas tersebut untuk memperbaiki indentasi tanpa mengubah logika, lalu verifikasi ulang dengan `dart format --output none --set-exit-if-changed` harus lolos (exit 0) sebelum komit. DILARANG mengubah logika atau menambahkan fitur dalam komit perbaikan ini.
- aturan dilanggar : konvensi proyek `dart format` bersih sebelum komit (verifikasi `dart format`/`dart analyze` sebelum laporan per MEMORI.md), terkait `code.md` aturan 22 (format/linter hanya pada berkas tugas) dan `disiplin-scope-kerja`.
- file bermasalah : (admin_wifi/lib/fitur/riwayat_langganan/screens/detail_riwayat_langganan.dart)[admin_wifi/lib/fitur/riwayat_langganan/screens/detail_riwayat_langganan.dart]
- prompt : hanya diisi oleh saya

#### Task 5

- Status : selesai
- Masalah : Commit dalam rentang `cd1c6247..82ac9a8` (fitur wifi_analyzer baru) meninggalkan indentasi yang tidak konsisten dan tidak lolos `dart format` pada `wifi_analyzer_notifier.dart`. Terconfirmi secara objektif via `dart format --output none --set-exit-if-changed` → exit 1, berkas terdeteksi "Changed". Selain itu, berkas memakai operator `!` pada field nullable (`_lastScanAttemptAt!`, `_lastTcpAttemptAt!`) yang melanggar aturan type-promotion (code.md #27/#49, skill `type-promotion-null-safety`).
- Solusi : Jalankan `dart format` pada berkas tersebut untuk memperbaiki indentasi tanpa mengubah logika; ganti operator `!` pada field nullable dengan variabel lokal + null-check (type promotion) sesuai skill `type-promotion-null-safety`; verifikasi ulang dengan `dart format --output none --set-exit-if-changed` (exit 0) dan `dart analyze` (No issues) sebelum komit. DILARANG mengubah logika atau menambahkan fitur dalam komit perbaikan ini.
- aturan dilanggar : konvensi proyek `dart format` bersih sebelum komit (code.md aturan 22, `disiplin-scope-kerja`); type-promotion pada field nullable (code.md #27/#49, skill `type-promotion-null-safety`).
- file bermasalah : (admin_wifi/lib/fitur/wifi_analyzer/notifier/wifi_analyzer_notifier.dart)[admin_wifi/lib/fitur/wifi_analyzer/notifier/wifi_analyzer_notifier.dart]
- prompt : hanya diisi oleh saya

#### Task 6

- Status : selesai
- Masalah : Commit dalam rentang `cd1c6247..82ac9a8` meninggalkan indentasi yang tidak konsisten dan tidak lolos `dart format` pada `wifi_analyzer_screen.dart`. Terconfirmi secara objektif via `dart format --output none --set-exit-if-changed` → exit 1, berkas terdeteksi "Changed".
- Solusi : Jalankan `dart format` pada berkas tersebut untuk memperbaiki indentasi tanpa mengubah logika, lalu verifikasi ulang dengan `dart format --output none --set-exit-if-changed` harus lolos (exit 0) sebelum komit. DILARANG mengubah logika atau menambahkan fitur dalam komit perbaikan ini.
- aturan dilanggar : konvensi proyek `dart format` bersih sebelum komit (verifikasi `dart format`/`dart analyze` sebelum laporan per MEMORI.md), terkait `code.md` aturan 22 (format/linter hanya pada berkas tugas) dan `disiplin-scope-kerja`.
- file bermasalah : (admin_wifi/lib/fitur/wifi_analyzer/screens/wifi_analyzer_screen.dart)[admin_wifi/lib/fitur/wifi_analyzer/screens/wifi_analyzer_screen.dart]
- prompt : hanya diisi oleh saya
