diperbarui : Sun Nov 22 2026 17:15 WIB
ditimpa ke : `.kilo/commands/muat_skill_terkait.md`

1. Baca terlebih dahulu `.agents/rules/kelompok_skill_wajib_non_code.md` (indeks skill non-code) dan `.agents/rules/code.md` (aturan khusus kode beserta skill terkaitnya); bila kedua berkas tidak tersedia, gunakan daftar skill yang tersedia (available_skills).

2. Bila pekerjaan berkaitan dengan kode, pindai `.agents/skills/*/SKILL.md` — cocokkan `description`/Trigger tiap skill dengan pekerjaan tersebut; muat semua yang relevan dan yang sedikit kurang relevan (deskripsi skill belum tentu detail), termasuk yang tidak dirujuk code.md. Jika deskripsi skill menyebut satu kata yang sama dengan pekerjaan yang akan dikerjakan, wajib muat skill itu.

3. Dari berkas pada poin 1–2, cari skill yang relevan (dan yang sedikit kurang relevan) dengan pekerjaan; bila ada, muat semua skill itu via tool `skill`; bila tidak ada, laporkan ke pengguna. Jika deskripsi skill menyebut satu kata yang sama dengan pekerjaan yang akan dikerjakan, wajib muat skill itu.

4. Sebelum menyebut nama/path skill, verifikasi keberadaannya (glob/read); jangan menyebut skill yang tidak ada.

5. Muat juga skill yang berkaitan dengan topik percakapan saat ini (termasuk skill non-code yang relevan), meskipun tidak muncul dari pemindaian code/ pada poin 2. Cocokkan topik sekarang dengan Trigger/description skill.

6. Setelah memuat skill yang relevan, **wajib memperbaiki/menyesuaikan berkas yang sedang dikerjakan agar sesuai dengan aturan dan panduan pada skill yang dimuat** — jangan biarkan berkas proyek melanggar skill yang sudah dimuat.

---

# Daftar Lengkap Skill Tersedia (dengan Deskripsi)

## Code (55 skill)

1. **aturan-penamaan** — Trigger: saat membuat atau memperbarui model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) atau skema tabel | Panduan pola XxxSkema: abstract final class terpisah berisi static const String tabel dan konstanta kolom, interpolasi ${XxxSkema.*} di DDL/query/migrasi, nilai konstanta kolom cocok persis nama kolom DB, hindari kolisi dengan kolom bernama 'tabel'.

2. **aturan-riverpod** — Trigger: saat memakai Riverpod | Panduan pola Riverpod (notifier CRUD, notifier sinkron, ref.watch/read, ConsumerWidget, family, autoDispose, ProviderScope, select, AsyncValue, muatUlang, penamaan provider). Detail tiap topik di references/.

3. **aturan-testing** — Trigger: saat menulis test | Aturan testing standar: package:test untuk unit test, WidgetTester untuk widget test, integration test, mocktail mock manual (tanpa codegen), dummy data, build_runner. **File test mengikuti struktur folder sumber di `lib/` (mirror ke `test/`), DILARANG flat di `test/`.**

4. **bug-runtime** — Trigger: saat mencegah bug runtime Flutter | Indeks skill spesifik: type-promotion-null-safety, penanganan-async, penanganan-error-unawaited, validasi-platform-izin, exception-khusus-deteksi-error.

5. **build-runner-codegen** — Trigger: saat menjalankan atau memperbaiki proses code generation build_runner (Freezed, Riverpod, mock, JSON) | Panduan eksekusi build_runner: direktori paket, perintah build/watch, larangan edit berkas hasil generate, penanganan konflik output, dan pembatasan keluaran dengan --build-filter.

6. **cek-kesehatan-sistem-kerja** — Trigger: saat mengaudit kesehatan sistem kerja proyek (struktur, indeks skill, frontmatter skill, command, memori sesi, repositori, hasil diskusi) | Prosedur audit read-only untuk memeriksa konsistensi aset pendukung agen AI lintas proyek.

7. **konfigurasi-kilo-proyek** — Trigger: saat membuat atau mengubah konfigurasi Kilo proyek atau command Kilo | Panduan prosedur & larangan konfigurasi `.kilo/kilo.jsonc` proyek plus tutorial pembuatan commands Kilo.

8. **data-dummy** — Trigger: saat menambahkan atau memperbarui data dummy untuk pratinjau UI atau pengembangan | Pola data dummy: kelas `abstract final class <Model>Dummy` di `lib/fitur/<fitur>/dummy/<model>_dummy.dart`; daftar `dummyList`; id konstanta UUID; tanggal relatif DateTime.now(); dummy berelasi wajib pakai ID sumber yang sama.

9. **disiplin-scope-kerja** — Trigger: saat mengerjakan tugas apa pun (kode, dokumen, refactor, pemanggilan command), termasuk migrasi massal via codemod/skrip otomatis | Panduan disiplin cakupan kerja: jangan membuat perubahan di luar berkas/cakupan tugas, format hanya pada berkas terdampak, review git diff sebelum melapor.

10. **ekstraksi-perhitungan-turunan** — Trigger: saat logika perhitungan turunan terduplikasi | Panduan ekstraksi logika perhitungan turunan ke ekstensi model atau helper murni agar ditulis sekali dan konsisten di seluruh layar.

11. **empty-state-daftar** — Trigger: saat membuat empty state daftar atau non-daftar | Panduan komponen bersama EmptyStateView (ikon, judul, deskripsi, CTA opsional), CTA kontekstual, SafeArea + padding, warna ColorScheme; DILARANG `Center(child: Text(...))` atau empty state custom per layar.

12. **exception-khusus-deteksi-error** — Trigger: saat mendeteksi tipe error; saat memilih tipe yang dilempar (exception/error) | Panduan exception khusus (class implements Exception) untuk deteksi via type check (is), bukan string matching pesan error; throw string literal DILARANG.

13. **flutter-local-notifications** — Trigger: saat menambahkan notifikasi lokal Flutter | Panduan flutter_local_notifications v23.0.0: cek platform, izin runtime, payload validation, lifecycle tap, exception khusus, unawaited catchError.

14. **format-prd** — Trigger: saat membuat atau memperbarui PRD | Panduan format PRD proyek: header Status Dokumen dan Status Implementasi, enam bagian wajib, konteks penggunaan dan aturan pengisian per bagian, tabel prioritas (Must/Should/Could Have).

15. **format-task-md** — Trigger: saat menambahkan atau memperbarui isi file task.md di root | Panduan gaya penulisan format task.md agar konsisten: pengelompokan task berdasarkan file terdampak, prioritas Tinggi/Rendah, kolom Status/Masalah/Solusi/aturan dilanggar/file bermasalah/prompt.

16. **gaya** — Trigger: saat menata warna dan tema UI | Panduan styling Flutter: withValues(alpha:) bukan withOpacity, warna dari ColorScheme/tema, hardcode hanya status semantic (hijau/merah/kuning), EasyLoading dengan catchError.

17. **isolasi-widget-timer** — Trigger: saat widget diperbarui berkala (Timer.periodic) | Panduan isolasi widget timer ke widget terpisah agar hanya widget itu yang rebuild, bukan seluruh halaman.

18. **keamanan-aplikasi** — Trigger: saat menerapkan keamanan aplikasi | Aturan keamanan: validasi input, enkripsi data sensitif, penyimpanan aman, platform validation, error handling tidak bocor info sensitif, dependency scanning.

19. **logging-debug** — Trigger: saat menambahkan log debug; saat membersihkan/mengurangi log berlebihan (narasi langkah, banner separator) | Panduan logging proyek (L.i, L.s, L.w, L.e, L.json, L.list, L.api) untuk variabel dan parameter, format singkat dan konsisten; log narasi langkah tanpa nilai aktual dan banner/separator DILARANG.

20. **material-app-tema-lokalisasi** — Trigger: saat mengonfigurasi MaterialApp dan WidgetsApp | Panduan tema (theme, darkTheme, themeMode), lokalisasi (locale, supportedLocales, localizationsDelegates), dan ScrollBehavior.

21. **material-ui** — Trigger: saat menambah/mengubah impor material Flutter, saat memakai/mengganti MaterialApp, saat migrasi package:flutter/material.dart ke package:material_ui/material_ui.dart | Impor material wajib package:material_ui/material_ui.dart; MaterialApp material_ui menyediakan delegasi MaterialLocalizations bawaan.

22. **membuat-readme-yang-baik** — Trigger: saat membuat atau memperbaiki file README proyek | Panduan struktur README (judul, deskripsi, TOC, instalasi, penggunaan, kredit, lisensi, badge, kontribusi, test), prinsip what/why/how, visual (GIF/screenshot), daftar kontributor.

23. **memori-check** — Trigger: saat memulai percakapan atau tugas di proyek mana pun | Panduan wajib baca MEMORI.md di root proyek sebelum interaksi dan perbarui bagian relevan setelahnya (kode, dokumen, state). Satu berkas sesi (`memori/sesi/sesi_N.md`) per percakapan/tugas.

24. **memuat-skill-terkait** — Trigger: saat memulai tugas apa pun (kode, dokumen, refactor, dll.) | Panduan memuat skill yang relevan sebelum mengerjakan tugas: baca indeks non-code + code.md, pindai skill code/ cocokkan Trigger/description, muat via tool skill, verifikasi keberadaan, muat juga skill non-code relevan dengan topik percakapan.

25. **migrasi-skema-sqlite** — Trigger: saat menambah atau mengubah tabel, kolom, indeks, atau migrasi SQLite | Naikkan versi, update onCreate dan onUpgrade, cerminkan perubahan di onCreate, verifikasi PRAGMA table_info; hindari untuk perubahan non-skema.

26. **model-state-freezed-abstract** — Trigger: saat membuat model atau state Freezed | Panduan model/state Freezed abstract class: serialisasi JSON (part '_.freezed.dart' + '_.g.dart'), private constructor `._()` untuk getter/method, `@Default` (literal konstan), pengosongan field nullable via `copyWith(field: null)` sentinel codegen, integrasi notifier Riverpod, model database (fromSqflite/toSqflite, ParserUtil, konversi UTC).

27. **navigator-routing** — Trigger: saat navigasi atau routing Flutter | Panduan Navigator, Route, Page, MaterialApp.router, pushNamed, pop, onGenerateRoute, onUnknownRoute, restorablePushNamed. **Nav.pop(context) tanpa argumen untuk navigasi mundur biasa; DILARANG Nav.pop(context, false/null/true); AppBar tidak perlu leading BackButton kustom.**

28. **overlay-log-debug** — Trigger: saat menyusun root aplikasi Flutter (app.dart/main.dart); saat ikon/panel overlay debug tidak muncul; saat error `No Directionality widget found` pada Overlay; saat error `No MaterialLocalizations found` pada SelectionArea | Panduan membungkus root app dengan `PengelolaOverlayLogDebug` dari share_global_saya.

29. **parsing-nullable-int** — Trigger: saat membaca field integer nullable dari database | Panduan parseIntOrNull (null tetap null, tidak jadi 0) dan parseInt/parseBool dengan defaultValue untuk field non-nullable.

30. **penamaan-konvensi** — Trigger: saat menamai identifier, file, atau class | Konvensi proyek Flutter: identifier bahasa Indonesia, file snake_case, variable camelCase, class PascalCase, konstanta SCREAMING_SNAKE_CASE, import package:, tabel/kolom snake_case, enum alih-alih String untuk banyak opsi, non-nullable dengan default alih-alih nullable.

31. **pengurutan-paket-pubspec** — Trigger: saat menambah atau mengurutkan dependensi pubspec.yaml | Panduan urutan paket pada section `dependencies` dan `dev_dependencies` di `pubspec.yaml`: abjad case-insensitive, entri berbasis SDK (`flutter`, `flutter_test`) tetap di posisi teratas.

32. **penanganan-async** — Trigger: saat layar menangani state async, data kosong, atau beberapa AsyncValue | Panduan isLoading, hasError, requireValue, empty state, data tidak lengkap, early return, mounted check, cache provider, loading gabungan, error terpisah, tipe generic konkret, satu method helper error.

33. **penanganan-data-null** — Trigger: saat menangani data null | Indeks skill khusus penanganan data null: type-promotion-null-safety, parsing-nullable-int, penanganan-async, validasi-form-sebelum-penyimpanan.

34. **penanganan-error-unawaited** — Trigger: saat memanggil Future tanpa await (unawaited) | Panduan wajib catchError dengan logging L.e pada Future yang dilepas; jangan biarkan unhandled.

35. **performa-aplikasi** — Trigger: saat mengoptimasi performa aplikasi | Aturan performa Flutter: rebuild minimal, const constructor, builder list (lazy), lazy IndexedStack tab BottomNavigationBar, image caching, async gap yielding, memory leak, query DB optimization, profiling.

36. **pencarian-koleksi-null-safe** — Trigger: saat mencari, mengurutkan, atau mengakses elemen dalam koleksi (List/Iterable/Map) | Panduan koleksi: pencarian wajib `firstWhereOrNull`, pengurutan wajib `.sorted`/`.sortedBy`/`.sortedByDescending`, akses nilai Map DILARANG memakai `!` (gunakan `.entries`, `??`, atau `putIfAbsent`); larangan `cast<T?>().firstWhere(..., orElse: ...)`, `..sort(...)` in-place, dan `map[key]!`.

37. **pola-ui** — Trigger: saat menerapkan pola UI Flutter | Indeks: visualisasi-progres-impian, isolasi-widget-timer, gaya, widget-custom. Prinsip single responsibility dan textTheme + copyWith.

38. **pola-ux** — Trigger: saat menerapkan pola UX Flutter (termasuk dialog konfirmasi ya/tidak dengan showOkCancelAlertDialog) | Indeks: empty-state-daftar, validasi-form-sebelum-penyimpanan, penanganan-async. **Notifikasi sementara wajib AppToast (via core_shared.dart); DILARANG ScaffoldMessenger.showSnackBar; Impor utilitas shared wajib core_shared.dart. Loading simpan/hapus wajib EasyLoading.show/dismiss (maskType black); DILARANG CircularProgressIndicator manual di tombol.**

39. **riset-kompetitor** — Trigger: saat membuat atau memperbarui katalog aplikasi kompetitor proyek | Panduan riset kompetitor portabel lintas proyek: menentukan aplikasi sasaran dari dokumen proyek, format tabel apk_kompetitor.md, status analisa per listing, verifikasi tautan, alur satu run mencakup semua store, dan laporan refrensi_apk.md.

40. **spacing** — Trigger: saat mengatur jarak antar elemen UI | Panduan spacing pada Row/Column, SizedBox hanya khusus, padding tepi layar tanggung jawab parent, nilai spacing mengikuti skala standar optimasi_ui.md.

41. **sqlite** — Trigger: saat menambahkan atau memperbaiki dukungan SQLite (sqflite) di Flutter Web | Panduan `sqflite_common_ffi_web`: tambah paket via `flutter pub add`, setup `dart run sqflite_common_ffi_web:setup`, set `databaseFactoryFfiWeb` di `main()` untuk `kIsWeb`, path database di web hanya nama (IndexedDB).

42. **struktur-class-ui** — Trigger: saat membuat widget custom reusable | Panduan struktur class UI reusable: StatelessWidget, parameter final, const constructor, build pure, semua method widget di bawah build, dispose di bawah initState, method helper non-widget di paling bawah kelas; DILARANG method helper di atas build. Rujuk skill gaya/spacing/aturan-riverpod.

43. **struktur-folder-lib** — Trigger: saat menata atau membuat struktur folder lib/ Flutter | Panduan feature-first + core/ untuk proyek Flutter: sub-folder lapisan di dalam folder fitur (screens/, notifier/, provider/, widgets/), pembeda state Riverpod yang bisa diubah (notifier/) vs provider read-only (provider/), main.dart/app.dart/home.dart (shell) tetap di akar. **Test WAJIB mirror struktur `lib/fitur/<fitur>/...` di `test/fitur/<fitur>/...` (DILARANG flat di `test/`).**

44. **supabase** — Trigger: saat mengintegrasikan Supabase (PostgREST) di Flutter | Panduan singleton SupabaseKlien idempotent (StateError bila belum init), OperasiSupabase CRUD generik (ambil/tambah/ubah/hapus/tambahBatch) dengan filter match, order, limit/range, logging L dengan $e $s, rethrow.

45. **text-form-field-validasi** — Trigger: saat membuat input teks dengan validasi | Panduan TextFormField, TextEditingController, Form, GlobalKey, dan validasi sebelum penyimpanan.

46. **theme-data-color-schema** — Trigger: saat mengonfigurasi tema aplikasi | Panduan ThemeData, ColorScheme, textTheme, useMaterial3 untuk konsistensi visual.

47. **tipografi** — Trigger: saat mengatur tipografi | Panduan: Theme.of(context).textTheme utama, copyWith untuk kustomisasi, DILARANG TextStyle(fontSize:...) manual tanpa textTheme, paket `google_fonts` wajib, hierarki label/sub-label/nilai, bold terarah, FontFeature.tabularFigures() untuk angka/timer, FittedBox/Flexible secukupnya.

48. **type-promotion-null-safety** — Trigger: saat mengakses field nullable objek model | Panduan type promotion: salin field nullable ke variabel lokal sebelum null-check agar promotion berlaku. **Operator `!` DILARANG — gunakan type promotion via variabel lokal universal (model, widget property, fungsi, Map, GlobalKey.currentState).**

49. **validasi-form-sebelum-penyimpanan** — Trigger: saat memvalidasi form sebelum simpan | Panduan Form + GlobalKey + validate(); jangan masking input tidak valid dengan ?? 0.

50. **validasi-json-katalog-ketat** — Trigger: saat memuat atau memvalidasi data JSON katalog lokal | Panduan validasi ketat katalog JSON: field enum lewat `values.firstWhere(..., orElse: () => throw ...)`, array bertipe string dicek per elemen, objek bersarang dicek `is! Map<String, dynamic>` lalu didelegasikan ke `fromJson` bersarang, exception khusus per domain dengan pesan memuat `id` entri dan nama field.

51. **validasi-platform-izin** — Trigger: saat fitur memerlukan platform atau izin | Panduan: cek dukungan platform sebelum API, minta izin sesuai kebijakan OS, periksa hasil izin sebelum mengaktifkan fitur.

52. **visualisasi-progres-impian** — Trigger: saat memvisualisasikan progres impian atau perayaan | Panduan ImpianProgresHelper, guard divisi nol, SharedPreferences penandaan sekali, AppToast, saldo aktual via MetrikBerhentiHelper, clamp 0-1, VisualTabunganImpian.

53. **widget-custom** — Trigger: saat membuat widget custom reusable | Indeks: visualisasi-progres-impian, isolasi-widget-timer, empty-state-daftar. Wajib StatelessWidget, pure, aman tema (ColorScheme), Column.spacing.

54. **widget-lifecycle-state** — Trigger: saat mengelola lifecycle widget | Panduan Widget/State lifecycle: mounted, initState, build, didUpdateWidget, dispose, setState, dependOnInheritedWidgetOfExactType.

55. **zona-waktu-perangkat-pengingat** — Trigger: saat menjadwalkan pengingat berbasis zona waktu | Panduan flutter_timezone untuk deteksi zona lokal, inisialisasi tz database, fallback Asia/Jakarta, handle error tiap tahap.

## Non-Code (20 skill)

1. **aturan-folder-prompt** — Trigger: saat menambah atau memperbarui file di folder prompt/ | Aturan folder prompt/: setiap file wajib memuat tanggal diperbarui (lengkap + jam, zona waktu Asia/Jakarta) dan target 'ditimpa ke'/'file' (path tujuan), karena folder prompt/ hanya mencatat poin-poin penting untuk masing-masing skill, aturan, dan command.

2. **aturan-pembuatan-commands** — Trigger: saat membuat command Kilo baru atau memperbarui command Kilo | Panduan pembuatan dan pembaruan command Kilo: description ringkas/jelas, wajib baca instructions di .kilo/kilo.jsonc, singkat tapi tidak menyesatkan, bahasa Indonesia, nama berkas Indonesia, sertakan skill terkait, simpan di .kilo/commands/, wajib baca AGENTS.md.

3. **aturan-pembuatan-rules** — Trigger: saat membuat atau memperbarui aturan (rules) Kilo | Panduan pembuatan aturan global/portabel: aturan wajib bersifat global, izin deny dan pembatasan platform ditulis generik, berkas rules tidak didaftarkan di instructions, AGENTS.md wajib memuat perintah membaca seluruh berkas .agents/rules/.

4. **aturan-pembuatan-skill** — Trigger: saat membuat skill baru atau memperbarui skill | Panduan pembuatan dan pembaruan SKILL.md: frontmatter wajib (name, description), name sama dengan nama folder, nama folder Indonesia, lokasi .agents/skills/, bahasa Indonesia, description jelas kapan dibutuhkan, diawali Trigger, contoh benar/salah wajib, larangan section Sumber Evaluasi, name 1-64 char, progressive disclosure (<500 baris + references/), berkas poin di prompt/skill/, sumber dari commit/permintaan eksplisit, skill code hanya dari commit/kode eksplisit, tanya dulu ke pengguna, global bukan spesifik repo, frontmatter YAML valid, folder references/ wajib ada, file references/ wajib contoh kode untuk skill code.

5. **aturan-pubspec** — Trigger: saat menambah, menghapus, atau meng-upgrade paket pada pubspec.yaml, atau mengurutkan dependensi pubspec.yaml secara abjad | Panduan pengelolaan paket Flutter/Dart: `flutter pub add`/`remove`/`pub upgrade`, larangan penyuntingan manual pubspec.yaml (kecuali path:/git: dan reorder abjad), kewajiban bertanya ke pengguna saat konflik.

6. **audit-riwayat-sesi** — Trigger: saat mengaudit riwayat sesi | Panduan audit manual dan inkremental terhadap `memori/sesi/`, `MEMORI.md`, dan `memori/riwayat_perubahan.md`: inventarisasi berkas sesi + ledger (mtime + jumlah baris) di `audit/riwayat_sesi.md`, ekstraksi sinyal (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`) dengan verifikasi manual, agregasi frekuensi lintas sesi (ambang ≥3 sesi), klasifikasi A/B/C, rekomendasi perbaikan sistem tertulis; read-only dengan satu pengecualian append section baru ke `audit/riwayat_sesi.md`.

7. **build-apk-github-workflow** — Trigger: saat membangun APK Android release atau memperbarui proses build APK | Panduan build APK release via GitHub Actions workflow: prasyarat `gh` terautentikasi dengan scope `workflow`, proyek wajib memiliki `.github/workflows/build-apk.yml`, konfigurasi tetap `--split-per-abi --target-platform android-arm64`, pemicuan `gh workflow run`, pemantauan `gh run watch --exit-status`, pengunduhan artefak `app-release-apk`, verifikasi berkas `<proyek>-arm64-v8a-release.apk`.

8. **cek-kesehatan-sistem-kerja** — Trigger: saat mengaudit kesehatan sistem kerja proyek (struktur, indeks skill, frontmatter skill, command, memori sesi, repositori, hasil diskusi) | Prosedur audit read-only untuk memeriksa kesehatan sistem kerja proyek (aset pendukung agen AI: aturan, skill, command, memori, hasil diskusi, dan repositori), mengklasifikasikan temuan GALAT/PERINGATAN, dan melaporkan hasil hanya di sesi tanpa mengubah berkas.

9. **disiplin-scope-kerja** — Trigger: saat mengerjakan tugas apa pun (kode, dokumen, refactor, pemanggilan command), termasuk migrasi massal via codemod/skrip otomatis | Panduan disiplin cakupan kerja: jangan membuat perubahan di luar berkas/cakupan tugas (termasuk churn whitespace/format), format hanya pada berkas terdampak tugas, review `git diff` sebelum melapor, laporkan berkas yang berubah di luar sesi, dan verifikasi codemod lintas berkas setelah dieksekusi.

10. **format-prd** — Trigger: saat membuat atau memperbarui PRD | Panduan format PRD proyek: header Status Dokumen dan Status Implementasi, enam bagian wajib (Informasi Produk, Tujuan PRD, Daftar Fitur, Alur Pengguna, Steps, File-File Terdampak), konteks penggunaan dan aturan pengisian per bagian, tabel prioritas (Must/Should/Could Have).

11. **format-task-md** — Trigger: saat menambahkan atau memperbarui isi file task.md di root | Panduan gaya penulisan format task.md agar setiap orang dan AI yang mengedit task.md menghasilkan isi yang konsisten: pengelompokan task berdasarkan file terdampak, prioritas Tinggi/Rendah, kolom Status/Masalah/Solusi/aturan dilanggar/file bermasalah/prompt, serta catatan kepatuhan terhadap skill yang terpenuhi.

12. **aturan-penggunaan-rg** — Trigger: saat menggunakan rg (ripgrep) untuk pencarian konten di codebase | Panduan penggunaan rg via tool Bash: flag standar (-n, -i, -t, -g, -e), filter file, fallback ke Grep bawaan, verifikasi ketersediaan `command -v rg`.

13. **kelompok-skill-wajib** — Trigger: saat memperbarui kelompok skill wajib | Panduan kelompok skill wajib: path file valid, trigger jelas, tanggal diperbarui lengkap beserta jam, laporan skill yang tidak tersedia, dan penyusunan A-Z. Indeks non-code HANYA berisi skill non-code.

14. **larangan-backup-task** — Trigger: saat membuat berkas cadangan task | Larangan membawa berkas .backup/.bak/.sebelum_* ke repository: hanya di working tree, jangan git add, gunakan git stash/reflog.

15. **memori-check** — Trigger: saat memulai percakapan atau tugas di proyek mana pun | Panduan wajib baca MEMORI.md di root proyek sebelum interaksi dan perbarui bagian relevan setelahnya (kode, dokumen, state). Satu berkas sesi (`memori/sesi/sesi_N.md`) per percakapan/tugas, bukan per pesan; berkas sesi baru hanya dibuat bila percakapan/tugas baru dimulai atau ada pekerjaan nyata yang belum tercatat.

16. **memuat-skill-terkait** — Trigger: saat memulai tugas apa pun (kode, dokumen, refactor, dll.) | Panduan memuat skill yang relevan sebelum mengerjakan tugas: baca indeks non-code + code.md, pindai skill code/ cocokkan Trigger/description, muat via tool skill, verifikasi keberadaan, muat juga skill non-code relevan dengan topik percakapan.

17. **membuat-readme-yang-baik** — Trigger: saat membuat atau memperbaiki file README proyek | Panduan struktur README (judul, deskripsi, TOC, instalasi, penggunaan, kredit, lisensi, badge, kontribusi, test), prinsip what/why/how, visual (GIF/screenshot), daftar kontributor, perbedaan tipe proyek, dan referensi eksternal freeCodeCamp & DEV Community.

18. **penggunaan-tool-bawaan-kilo** — Trigger: saat memilih atau memakai tool bawaan Kilo (read, edit, glob, grep, bash, webfetch, dll.) | Panduan pemilihan tool bawaan Kilo: pemetaan kebutuhan ke tool yang tepat, contoh pemanggilan, aturan prioritas tool bawaan atas shell, dan izin deny yang mutlak.

19. **penggunaan-tool-question** — Trigger: saat menyusun pertanyaan ke pengguna | Panduan tool question Kilo: header maks 30 karakter, label + description, multiple vs single, default, rekomendasi pertama (Recommended), larangan opsi catch-all, opsi Skip wajib di setiap pertanyaan, kunci i18n.

20. **perbaikan-test-notifikasi** — Trigger: saat memperbaiki test notifikasi yang gagal karena mismatch jumlah call mock atau mock tidak diisolasi | Panduan prosedur: baca log aktual jumlah jadwal notifikasi, cocokkan dengan kontrak domain, reset mock setelah setup, verifikasi ID/hash notifikasi spesifik, jalankan test terkait lalu semua test.
