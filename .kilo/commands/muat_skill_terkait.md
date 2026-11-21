1. Baca terlebih dahulu `.agents/rules/kelompok_skill_wajib_non_code.md` (indeks skill non-code) dan `.agents/rules/code.md` (aturan khusus kode beserta skill terkaitnya); bila kedua berkas tidak tersedia, gunakan daftar skill yang tersedia (available_skills).

2. Bila pekerjaan berkaitan dengan kode, pindai `.agents/skills/code/*/SKILL.md` — cocokkan `description`/Trigger tiap skill dengan pekerjaan tersebut; muat semua yang relevan dan yang sedikit kurang relevan (deskripsi skill belum tentu detail), termasuk yang tidak dirujuk code.md. Jika deskripsi skill menyebut satu kata yang sama dengan pekerjaan yang akan dikerjakan, wajib muat skill itu.

3. Dari berkas pada poin 1–2, cari skill yang relevan (dan yang sedikit kurang relevan) dengan pekerjaan; bila ada, muat semua skill itu via tool `skill`; bila tidak ada, laporkan ke pengguna. Jika deskripsi skill menyebut satu kata yang sama dengan pekerjaan yang akan dikerjakan, wajib muat skill itu.

4. Sebelum menyebut nama/path skill, verifikasi keberadaannya (glob/read); jangan menyebut skill yang tidak ada.

5. Muat juga skill yang berkaitan dengan topik percakapan saat ini (termasuk skill non-code yang relevan), meskipun tidak muncul dari pemindaian code/ pada poin 2. Cocokkan topik sekarang dengan Trigger/description skill.

---

# Daftar Lengkap Skill Tersedia

## Code (50 skill)

1. aturan-penamaan — konstanta skema tabel model database
2. aturan-riverped — pola Riverpod (notifier CRUD, family, autoDispose, select, AsyncValue)
3. aturan-testing — pola testing standar (unit, widget, integration, mocktail)
4. bug-runtime — indeks pencegahan bug runtime Flutter
5. build-runner-codegen — eksekusi build_runner (Freezed, Riverpod, mock, JSON)
6. cek-kesehatan-sistem-kerja — audit kesehatan sistem kerja proyek
7. konfigurasi-kilo-proyek — konfigurasi Kilo proyek dan command
8. data-dummy — pola data dummy untuk pratinjau UI/pengembangan
9. disiplin-scope-kerja — batasan cakupan kerja (anti churn, review git diff)
10. ekstraksi-perhitungan-turunan — ekstraksi logika perhitungan turunan ke helper/ekstensi
11. empty-state-daftar — komponen EmptyStateView bersama
12. exception-khusus-deteksi-error — exception khusus untuk deteksi via type check
13. flutter-local-notifications — notifikasi lokal Flutter v23.0.0
14. format-prd — format PRD proyek
15. format-task-md — gaya penulisan task.md
16. gaya — styling warna/tema (withValues, ColorScheme, semantic color)
17. install-rg — memasang/memverifikasi ripgrep
18. isolasi-widget-timer — isolasi widget Timer.periodic ke StatefulWidget terpisah
19. keamanan-aplikasi — aturan keamanan (validasi input, enkripsi, penyimpanan aman)
20. logging-debug — logging proyek (L.i, L.s, L.w, L.e, L.json, L.list, L.api)
21. material-app-tema-lokalisasi — konfigurasi MaterialApp, tema, lokalisasi
22. material-ui — impor material wajib package:material_ui/material_ui.dart
23. membuat-readme-yang-baik — panduan struktur README
24. memori-check — cek MEMORI.md + buat berkas sesi
25. memuat-skill-terkait — memuat skill relevan sebelum tugas
26. migrasi-skema-sqlite — migrasi skema SQLite (naikkan versi, onCreate/onUpgrade)
27. model-state-freezed-abstract — model/state Freezed abstract class
28. navigator-routing — navigasi dan routing Flutter
29. overlay-log-debug — PengelolaOverlayLogDebug di root app
30. parsing-nullable-int — parseIntOrNull untuk field nullable int dari DB
31. penamaan-konvensi — konvensi penamaan identifier/file/class
32. pengurutan-paket-pubspec — urutan paket pubspec.yaml abjad
33. penanganan-async — penanganan state async, data kosong, AsyncValue
34. penanganan-data-null — indeks penanganan data null
35. penanganan-error-unawaited — catchError wajib pada unawaited
36. performa-aplikasi — aturan performa Flutter (rebuild minimal, const, lazy, caching)
37. pencarian-koleksi-null-safe — firstWhereOrNull, sorted dari package:collection
38. pola-ui — indeks pola UI (visualisasi-progres-impian, isolasi-widget-timer, gaya, widget-custom)
39. pola-ux — indeks pola UX (empty-state-daftar, validasi-form-sebelum-penyimpanan, penanganan-async)
40. riset-kompetitor — riset kompetitor aplikasi mobile lintas proyek
41. spacing — pengaturan jarak antar elemen (Row/Column spacing)
42. sqlite — dukungan SQLite di Flutter Web (sqflite_common_ffi_web)
43. struktur-class-ui — struktur class UI reusable (StatelessWidget, const, pure)
44. struktur-folder-lib — struktur folder lib/ (feature-first + core/)
45. supabase — integrasi Supabase (singleton, OperasiSupabase CRUD)
46. text-form-field-validasi — TextFormField, Form, GlobalKey, validasi
47. theme-data-color-schema — ThemeData, ColorScheme, tipografi
48. tipografi — panduan tipografi (textTheme, google_fonts, FontFeature)
49. type-promotion-null-safety — type promotion untuk field nullable objek
50. validasi-form-sebelum-penyimpanan — Form + GlobalKey + validate() sebelum simpan
51. validasi-json-katalog-ketat — validasi ketat JSON katalog lokal
52. validasi-platform-izin — cek dukungan platform & izin runtime
53. visualisasi-progres-impian — ImpianProgresHelper, VisualTabunganImpian
54. widget-custom — indeks widget custom reusable
55. widget-lifecycle-state — lifecycle Widget/State (mounted, initState, dispose)
56. zona-waktu-perangkat-pengingat — flutter_timezone untuk pengingat harian

## Non-Code (20 skill)

1. aturan-folder-prompt — aturan folder prompt/ (header diperbarui/ditimpa ke)
2. aturan-pembuatan-commands — panduan pembuatan/pembaruan command Kilo
3. aturan-pembuatan-rules — panduan pembuatan aturan global/portabel
4. aturan-pembuatan-skill — panduan pembuatan/pembaruan SKILL.md
5. aturan-pubspec — pengelolaan paket Flutter/Dart (flutter pub add/remove)
6. audit-riwayat-sesi — audit manual/inkremental riwayat sesi
7. build-apk-github-workflow — build APK release via GitHub Actions
8. cek-kesehatan-sistem-kerja — audit kesehatan sistem kerja proyek
9. disiplin-scope-kerja — batasan cakupan kerja
10. format-prd — format PRD proyek
11. format-task-md — gaya penulisan task.md
12. install-rg — memasang/memverifikasi ripgrep
13. kelompok-skill-wajib — pemeliharaan indeks skill wajib
14. larangan-backup-task — larangan bawa berkas cadangan ke repo
15. memori-check — cek MEMORI.md + buat berkas sesi
16. memuat-skill-terkait — memuat skill relevan sebelum tugas
17. membuat-readme-yang-baik — panduan struktur README
18. penggunaan-tool-bawaan-kilo — pemilihan tool bawaan Kilo
19. penggunaan-tool-question — tool question Kilo
20. perbaikan-test-notifikasi — memperbaiki test notifikasi gagal