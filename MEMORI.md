# MEMORI — Proyek workspace

Diperbarui: Sat Nov 14 2026 20:43 WIB (sesi 54)

Dokumen hidup proyek. Perbarui bagian yang relevan setiap akhir sesi; perubahan dicatat melalui `memori/sesi/sesi_N.md` (bukan langsung ke file ini) sesuai alur skill `memori-check`.

## Informasi Proyek

- Nama proyek: `workspace`
- Path: `/home/muhamadbadrudin1000/workspace`
- Remote git: `https://github.com/mbadrudin170-jpg/workspace.git` (branch utama: `main`)
- Jenis: repositori pengumpul konfigurasi lintas-proyek milik pengguna (aturan AI agent, skill, snippet VS Code, alias/skrip bash, submodule proyek Flutter). `README.md` root kini mendokumentasikan tujuan, struktur, komponen, dan status repositori berdasarkan isi aktual (diperbarui 2026-11-14, sesi 8).
- Platform pengembangan: Linux (bash), editor VS Code/Code OSS, Kilo (kode agent) sebagai agent AI.
- Proyek Flutter `berhenti_merokok` (yang dirujuk beberapa skill) **tidak ditemukan** di mesin ini per 2026-11-14.

## Struktur Direktori (ringkas)

| Lokasi | Isi |
| ------ | --- |
| `.agents/rules/global/` | Aturan global (aturan_*.md, format_*.md, optimasi_*.md) |
| `.agents/rules/proyek/` | Aturan khusus proyek (`aturan_khusus.md`, `aturan_proyek.md`) |
| `.agents/rules/AGENTS.md` | Berkas aturan gabungan (sumber AGENTS.md root) |
| `.agents/skills/custom/` | Skill buatan/kurasi pengguna |
| `.agents/skills/bawaan/` | Skill bawaan (Flutter/Dart) |
| `AGENTS.md` | Gabungan aturan (712 baris; dibaca agent AI) |
| `SKILLS_INDEX.md` | Indeks skill (trigger + status pembaruan) |
| `skills-lock.json` | Lock versi skill |
| `script/*.sh` | Skrip bantu (build docs, snippets, struktur proyek, dsb.) |
| `bash_aliases.sh` | Kumpulan alias bash (build, flutter, git, monitoring, supabase) |
| `.vscode/` | Snippet kode (`*.code-snippets`), `settings.json`, `launch.json`, `mcp.json` |
| `.kilo/` | Konfigurasi Kilo proyek (`kilo.jsonc`, commands, prompts) — di-ignore lewat `.gitignore` |
| `base_coc/` | **Submodule** — proyek Flutter untuk membuat APK penyedia base/layout Clash of Clans (`https://github.com/mbadrudin170-jpg/base_coc.git`) |
| `share_global_saya/` | **Submodule** — pustaka Flutter bersama (utils, widget, logging) (`https://github.com/mbadrudin170-jpg/share_global_saya.git`) |

## Aturan Operasional di Mesin Ini

1. Perintah `cat` (dan pola `cat *`) **ditolak** oleh aturan izin proyek; gunakan tool Read untuk membaca berkas.
2. `.kilo/` ter-`.gitignore` — jangan menelusuri/menganggap `.kilo/` sebagai bagian dari git tree.
3. `memori/` **tidak** ter-`.gitignore`; berkas sesi diarsipkan permanen (tidak boleh dihapus).
4. Hindari `git add .` secara membabi buta: `.dart_tool/` tidak ter-ignore dan dua klon skill di dalamnya tercatat sebagai gitlink; commit hanya atas perintah eksplisit pengguna.
5. Verifikasi setelah ubah `.dart` pada submodule: `dart format`, `dart analyze`. Submodule `base_coc`/`share_global_saya` memiliki `pubspec.yaml` masing-masing.
6. Bahasa Indonesia baku untuk respons, dokumen, dan komentar kode.
7. Jangan mengedit berkas hasil generate (`*.g.dart`, `*.freezed.dart`, `*.mocks.dart`); ubah sumber lalu jalankan `build_runner`.
8. Larangan operasi destruktif (hapus paksa, `reset --hard`, `push --force`) tanpa konfirmasi pengguna.
9. Root `workspace` bukan proyek Flutter; `lib/main.dart` hanya ada di submodule `base_coc`. Konfigurasi `myapp (debug mode - Local only)` pada `.vscode/launch.json` memakai `cwd` = `${workspaceFolder}/base_coc` dan `program` = `lib/main.dart` (relatif terhadap `cwd`, bukan root workspace); jangan menulis `program` sebagai `base_coc/lib/main.dart` karena akan menjadi path ganda (per 2026-11-14, sesi 6–7).

## Status Kerja (per 2026-11-14)

- Commit `29a2f81` (2026-11-13 22:53 UTC, pesan "a", di luar sesi ini) memuat restrukturisasi `.agents/skills/` → subfolder `custom/` dan `bawaan/`; berkas-berkas yang sebelumnya tampak `D`/`M` kini sudah ter-commit.
- Pembersihan skill longgar (sesi 48, 2026-11-14): 27 folder skill yang masih berada langsung di `.agents/skills/` (25 folder `dart-*`/`flutter-*` versi lama berformat luar yang sudah punya padanan di `bawaan/`, serta `sqflite-common-ffi-desktop` dan `sqflite-common-ffi-testing` yang tidak punya padanan nama di `bawaan/`) **dihapus** atas persetujuan pengguna; kini `.agents/skills/` hanya berisi `custom/` dan `bawaan/`. Total 35 berkas terhapus dan sudah ter-commit pada `a8bb38f` (commit oleh sesi paralel/pengguna, bukan oleh sesi ini). `SKILLS_INDEX.md` tidak berubah karena hanya mencantumkan skill `custom/` dan `bawaan/`.
- `base_coc/.github/workflows/build-apk.yml` ditambahkan (sesi 29): workflow GitHub Actions build APK debug, trigger push/PR ke `main`, setup Flutter 3.47.9, analisis + test + build, upload artefak `app-debug-apk`; perubahan di dalam submodule, belum di-commit.
- `.dart_tool/` tidak ter-ignore (`.gitignore` hanya berisi `.kilo/`) — berisi cache tool `dart_skills` (klon `dart-lang/skills` dan `flutter/agent-plugins`, 2,3 MB) dan tercatat sebagai dua gitlink (mode `160000`) pada commit `29a2f81` tanpa entri `.gitmodules`, sehingga tidak dapat dipulihkan lewat `git clone`; jangan `git add .` membabi buta.
- `m share_global_saya` — submodule memiliki perubahan isi yang belum di-pointer-update; jangan di-commit tanpa perintah pengguna.
- `riverpod_lint` 3.2.0 terpasang di submodule `share_global_saya` dan `base_coc` (`dev_dependencies` + `plugins` pada `analysis_options.yaml`); perubahan sudah ter-commit di repo submodule (`share_global_saya` `c59ed5b`, `base_coc` `ad79bd6`, sesi 13), tetapi pointer submodule di root belum diperbarui.
- `flutter pub get` dijalankan pada 2026-11-14 (sesi 21) di submodule `base_coc` dan `share_global_saya` dengan Flutter 3.47.9 — berhasil (`Got dependencies!`). Tool Flutter menambahkan `analyzer.exclude` (`build/**` dan folder platform) pada `base_coc/analysis_options.yaml`; perubahan belum di-commit.
- `base_coc` implementasi PRD `prd/prd_copy_base_link.md` (Copy base link satu ketuk) selesai pada sesi 37: service clipboard + validasi + layar detail base + konfirmasi + pembukaan game + test; dependensi `url_launcher` ditambahkan; navigasi dari galeri ke detail diaktifkan; status PRD `Sudah Diimplementasikan` lalu berkas PRD dihapus; section A2 dihapus dari `refrensi_apk.md`. Pointer submodule di root belum diperbarui.
- `base_coc` implementasi PRD `prd/prd_galeri_base_terfilter.md` (Galeri base terfilter per Town Hall dan tipe base) selesai pada commit `36fc573` (submodule); status PRD diubah menjadi `Sudah Diimplementasikan`; section A1 dihapus dari `refrensi_apk.md` (sesi 23/27). Pointer submodule di root belum diperbarui.
- `README.md` root — sebelumnya kosong (0 byte), kini diisi dokumentasi repositori `workspace` pada sesi 8 (2026-11-14).
- `share_global_saya/README.md` — dibuat pada sesi 9 (2026-11-14) sebagai dokumentasi paket pustaka bersama sesuai implementasi aktual; ditautkan dari README root; perubahan di dalam submodule, belum di-commit.
- `share_global_saya/docs/laporan_linter.md` — dibuat pada sesi 11 (2026-11-14) dari hasil `flutter analyze`: 235 temuan `info` (231 `public_member_api_docs`, 3 `discarded_futures`, 1 `avoid_print`); `base_coc` bersih. Dokumen memuat rencana penanganan per berkas dan contoh perbaikan; belum diimplementasikan dan belum di-commit.
- `refrensi_apk.md` root — pada sesi 19 (2026-11-14) ditulis ulang untuk aplikasi sasaran `base_coc` (penyedia base/layout Clash of Clans) berisi analisa 10 APK Google Play Store: 15 rekomendasi fitur baru, 2 arahan kualitas pra-implementasi, 10 pola UI/UX, katalog, prioritas gabungan, verifikasi, dan sumber. Sebelumnya berkas ini berisi analisa 10 APK Spektra (sesi 14) dan dikosongkan pengguna sebelum sesi 19.
- `base_coc` implementasi PRD `prd/prd_upgrade_progress_desa.md` (Pelacakan Progres Upgrade Desa Data Export) selesai pada sesi 51: ditambahkan dependensi `sqflite` dan `sqflite_common_ffi`; dibuat model (`akun_desa.dart`, `item_upgrade.dart`, `progres_upgrade.dart`, `kategori_upgrade.dart`, `nama_tabel_progres.dart`, `impor_data_export_exception.dart`), parser Data Export toleran & kalkulator progres (`parser_data_export.dart`, `progres_calculator.dart`), lapisan database (`lib/core/database/db_helper.dart`, `lib/core/database/progres_dao.dart`), provider Riverpod (`lib/fitur/upgrade_progress/provider/progres_provider.dart`), widget ringkasan kategori (`ringkasan_kategori.dart`), layar impor & progres desa (`impor_data_export_screen.dart`, `progres_desa_screen.dart`), serta unit test (`parser_data_export_test.dart`, `progres_calculator_test.dart`); verifikasi `dart format`, `dart analyze` (bersih), dan `flutter test` (14 test lulus); status PRD diperbarui menjadi `Sudah Diimplementasikan` lalu berkas PRD dihapus. Pointer submodule di root belum diperbarui.
- PRD `prd/prd_katalog_lokal_offline.md` (item A4 katalog lokal offline) dibuat dan difinalisasi pada sesi 44; status dokumen `Final`, status implementasi `Belum Diimplementasikan` karena sesi ini hanya membuat PRD dan tidak melakukan perubahan kode atau implementasi fitur. Fondasi yang sudah ada hanya dicatat sebagai hasil pemeriksaan sumber, bukan implementasi sesi ini. Item A4 pada `refrensi_apk.md` ditandai sudah dibuatkan PRD.
- `apk_kompetitor.md` — pada sesi 20 (2026-11-14) ditambahkan 54 listing baru berstatus `Belum Dianalisa` dari Google Play Store (18), GitHub (1), Apple App Store (32), dan APKPure (3); katalog kini memuat 64 listing (10 `Sudah Dianalisa`, 54 `Belum Dianalisa`).
- `MEMORI.md` dan `memori/` dibuat pada sesi 1 (2026-11-14); sebelumnya belum ada.
- `.kilo/commands/perbarui_readme.md` — diperluas pada sesi 12 (2026-11-14) agar memperbarui `README.md` root **dan** README setiap submodule (daftar dibaca dinamis dari `.gitmodules`); `.kilo/` ter-`.gitignore`, perubahan hanya di working tree.
- `.kilo/commands/cari_apk_kompetitor.md` — diperbarui pada sesi 16 (2026-11-14) menjadi portabel/global: nama aplikasi dan daftar fitur proyek dihapus; acuan aplikasi sasaran dibaca dari `README.md`, `AGENTS.md`, PRD, atau dokumen produk proyek. `.kilo/` ter-`.gitignore`, perubahan hanya di working tree.
- `.kilo/commands/fitur/diskusi_fitur_baru.md` — diperbaiki pada sesi 46 (2026-11-14): aturan 6 diarahkan ke aturan 19-20, dan aturan 19-20 ditambahkan agar header `Status Implementasi` PRD untuk sesi tanpa ubah kode wajib `Belum Diimplementasikan`; temuan "fondasi fitur sudah ada" dicatat di `Status pengembangan` (bagian 1) dan/atau `Pemeriksaan Implementasi`, bukan header. `.kilo/` ter-`.gitignore`, perubahan hanya di working tree. Rujukan: `hasil_diskusi/diskusi_7.md`.
- `.kilo/commands/analisa_kesehatan_kode_alur.md` — dibuat pada sesi 47 (2026-11-14): command mandiri yang memeriksa ketersediaan/status `apk_kompetitor.md` → `refrensi_apk.md` → PRD di `prd/` → hasil diskusi di `hasil_diskusi/` secara berurutan, berhenti dan melapor bila prasyarat tidak terpenuhi, dan melanjutkan ke eksekusi `analisa_kesehatan_kode.md` bila seluruh prasyarat lolos. Status `hasil_diskusi/` selain `Sudah Diimplementasikan` dianggap belum selesai. `analisa_kesehatan_kode.md` tidak diubah. `.kilo/` ter-`.gitignore`, perubahan hanya di working tree. Rujukan: `hasil_diskusi/diskusi_8.md`.
- Audit kesehatan sistem kerja (sesi 47, 2026-11-14) — command `.kilo/commands/cek_kesehatan_sistem_kerja.md` dan skill `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md` **sudah dibuat** pada sesi 49 (Kelompok 1 `task.md`, Task 1–2): audit read-only tujuh aset (struktur folder/berkas wajib, konsistensi `SKILLS_INDEX.md`, metadata frontmatter skill, validasi command, berkas `memori/sesi/*.md` `Belum Sinkron`, kesehatan repositori — submodule/pointer/`.gitignore` vs `git status` — dan penomoran `hasil_diskusi/`), laporan GALAT/PERINGATAN hanya di sesi. `SKILLS_INDEX.md` ikut diperbarui (Task 3). Rujukan: `hasil_diskusi/diskusi_8.md`.
- PRD `prd/prd_preview_base_zoom.md` (item A3 preview base resolusi tinggi dengan pinch-to-zoom) dibuat dan diperbarui pada sesi 53 (catch-up sync sesi 54): status dokumen `Draft`, implementasi `Belum Diimplementasikan`; keputusan diskusi: skema data field detail terpisah (mis. `detailImagePath`) dengan fallback `thumbnailPath`, aset bundel lokal offline dua ukuran bila tersedia, galeri tetap thumbnail, tanpa penanda trap. Item A3 pada `refrensi_apk.md` ditandai sudah dibuatkan PRD. Belum di-commit (working tree `M refrensi_apk.md` + `?? prd/`).
- Skill `.agents/skills/custom/model-state-freezed-abstract/SKILL.md` digabung dengan cakupan Freezed state + model (JSON + DB) pada sesi 54 (v1.1.1 → v2.0.0): menambahkan pola Freezed state dari commit `share_global_saya` (`LogDebugState` `@freezed` + notifier Riverpod), contoh model JSON dari SDK resmi package:freezed, dan larangan mengedit berkas hasil generate; pola model DB lama (`fromSqflite`/`toSqflite`/`ParserUtil`/UTC) dipertahankan. Folder skill baru `freezed-model-state` yang sempat dibuat dihapus karena tumpang tindih trigger. `SKILLS_INDEX.md` (root + `share_global_saya`) tidak menambah entri baru, hanya memperbarui status. Rujukan: `hasil_diskusi/diskusi_9.md`. Tidak ada kode Dart yang diubah.
- Temuan audit yang masih menunggu penanganan (belum diperbaiki, di luar cakupan `task.md`): tautan markdown keliru `[AGENTS.md](http://AGENTS.md)` pada `.kilo/commands/fitur/diskusi_fitur_baru.md`; beberapa command `.kilo/commands/` belum memakai frontmatter `description` (mis. `scan.md`, `kerjakan_task.md`, `cek_linter.md`). Temuan tautan markdown pada `kerjakan_task.md` dan `analisa_kesehatan_kode.md` sudah diperbaiki (sesi 47, tindak lanjut 5 diskusi 8); tabel tindak lanjut `diskusi_8.md` sudah ditandai selesai (sesi 50).
- `.agents/skills/custom/pembuatan-command-kilo/SKILL.md` — dibuat pada sesi 47 (2026-11-14, v1.0.0): panduan pembuatan/perbaruan command Kilo (lokasi rekursif `.kilo/commands/`, penamaan `[a-z0-9_]`, frontmatter `description`/`agent`/`model`/`variant`/`subtask`, variabel `$ARGUMENTS`/`$1`–`$N`, larangan `@file` dan `` !`cmd` ``, pola subcommand + fallback `question`, alur laporan, larangan, checklist verifikasi). Aturan format command **tidak** ditambahkan ke `.agents/rules/global/`. `SKILLS_INDEX.md` disinkronkan.
- `.kilo/commands/saran_aturan_baru.md` — **dihapus** pada sesi 47 (2026-11-14) atas perintah pengguna. `scan.md` dan `analisa_kesehatan_kode.md` **tidak** disatukan (keduanya tetap berdiri sendiri). `.kilo/` ter-`.gitignore`, perubahan hanya di working tree.
- `.kilo/commands/sinkronisasi/sinkronkan_commands.md` — **dihapus** pada sesi 47 (2026-11-14) atas perintah pengguna karena folder mirror `gpt/` yang menjadi targetnya sudah tidak ada. Skill `konfigurasi-kilo-proyek` (v1.0.0 → v1.0.1) disesuaikan: rujukan mirror `gpt/`, contoh subfolder `sinkronisasi/`, dan daftar `Sumber Evaluasi` tidak lagi menunjuk berkas yang dihapus. `.kilo/` ter-`.gitignore`, perubahan hanya di working tree.
- Status berkas hasil diskusi (per 2026-11-14, sesi 47): commit `5690938` (sesi lain) menghapus `hasil_diskusi/diskusi_1.md` dan `hasil_diskusi/diskusi_7.md` yang masih tercatat di bagian `Hasil Diskusi` dan dirujuk skill `memori-check`; pemulihan memerlukan keputusan pengguna karena berkas sudah ter-commit.
- Pencarian kata `spektra` (sesi 18, 2026-11-14): 13 kecocokan di 8 berkas — `.agents/skills/custom/struktur-folder-lib/SKILL.md` (2), `MEMORI.md` (1), `share_global_saya/docs/lib.md` (2), `share_global_saya/SKILLS_INDEX.md` (1), `memori/riwayat_perubahan.md` (1), `memori/sesi/sesi_10.md` (3), `memori/sesi/sesi_14.md` (2), dan `.kilo/commands/salin_konfigurasi_ke_global.md` (1); tidak ada perubahan kode.

## Riset Kompetitor

- Berkas katalog: `apk_kompetitor.md` (root proyek).
- Berkas analisa: `refrensi_apk.md` (root proyek).
- Status terbaru (sesi 38, 2026-11-14): riset APK kompetitor dijalankan ulang store demi store (satu run, perintah `cari_apk_kompetitor.md`) untuk aplikasi sasaran `base_coc`; katalog diperbarui per store.
- Total listing saat ini: 82 baris data; 10 listing `Sudah Dianalisa`, 72 listing `Belum Dianalisa`.
- Sebaran: Google Play Store 30 (10 sudah, 20 belum), GitHub 2, Apple App Store 38, APKPure 7, Aptoide 5.
- Listing baru sesi 38 (18): Play Store — BaseVault for Clash of Clans (`com.apphubnow.basedrop`), Cockit – Clash Base Layouts (`com.heyisoft.cockit`); GitHub — Clash Trackers (`Killersparrow1/clash-Trackers`); Apple App Store — COC Baselinks (6790808297), Cockit – Clash Base Layouts (6760241444), Clash of Helper (6636552878), Keepwatch for Clash of Clans (6828926176), Database for Clash of Clans™ (unofficial) (898757582), House of Clashers: Clash Guide (653987498); APKPure — Hall Base Layouts for Clash (`com.hall.editor`), COC Base Layouts Clash of Maps (`com.sb.newclashmaps2020`), Clash of Maps - Base, Layouts (`com.akstudio.clashofmaps`), Maps of Clash of Clans 2026 (`com.moonstudio.mapcoc`); Aptoide (section baru, verifikasi via hasil pencarian karena HTTP 403 anti-bot) — Clash Base Layout | Quick Copy, Cocbases, Clash of Maps - Base, Layouts, Pro Clash of Maps Base Layouts, Maps of Clash of Clans 2026.
- Store nihil temuan pada sesi 38 (dicatat di `apk_kompetitor.md`): F-Droid, Samsung Galaxy Store (`galaxy.store` tidak dapat diakses), Mi/GetApps (konten dirender JS, tanpa link aplikasi spesifik), Oppo App Market, Uptodown (HTTP 410), IzzyOnDroid (index 200, tidak ada paket `clash` relevan), Amazon Appstore, SlideME (403), Huawei AppGallery (503), Tencent MyApp.
- Listing yang sudah dianalisa: COC Base Layouts Design links, COC Base Layouts:Clash of Maps, Coc Base Layout 2026, clashOFbase, Maps For COC Base Layouts 2026, Base Drop, Map Layout Links Base for COC, ClasherPro, CoC Base Maps 2026, Notificlash.
- Status PRD item A4: `prd/prd_katalog_lokal_offline.md` tersedia dan `refrensi_apk.md` ditandai sudah dibuatkan PRD; status implementasi adalah `Belum Diimplementasikan`.
- Katalog lama 159 listing bertema Spektra (sesi 10/14) dikosongkan pengguna sebelum sesi 19 dan tidak dipakai ulang.
- `apk_serupa.md` tidak ditemukan di root proyek; lingkup riset mengikuti `apk_kompetitor.md` sesuai perintah pengguna.
- Acuan riset: `base_coc/README.md` (masih template Flutter; fitur penyedia base belum ada) dan skill `riset-kompetitor`.



## Konfigurasi Kilo (Model Agent)

- Sumber kebenaran: `.kilo/kilo.jsonc` (ter-`.gitignore`, jangan dianggap bagian git tree).
- Model global: `model`, `small_model`, `subagent_model` = `kilo/kilo-auto/free`.
- `agent.code`: `model` = `kilo/reflection/beam-free`, `variant` = `max` (per 2026-11-14, sesi 22; sebelumnya `kilo/particle-ai/particle-1:free`).
- `docs/model_agents.md` (sesi 39, diperbarui sesi 40–41, 2026-11-14) — H1 `# List Model`, daftar model di bagian atas (sejak sesi 41); dokumentasi model yang digunakan beserta kondisi konfigurasi Kilo; hanya pencatatan, bukan sumber kebenaran konfigurasi. Daftar model: `kilo/kilo-auto/free` (model global), `kilo/particle-ai/particle-1:free` (bekas `agent.code.model`), `kilo/reflection/beam-free` (`agent.code.model` saat ini, variant `max`), dan `openrouter/thinkingmachines/inkling-2-small:free` (model sesi 39; sempat menjadi `agent.code.model` hingga 2026-11-14 06:10).
- Perubahan model agent hanya dilakukan atas permintaan eksplisit pengguna dengan konfirmasi sebelum eksekusi; bagian config lain (permission, instructions, skills.paths, agent lain) tidak diubah.

## Konvensi & Sumber Kebenaran

- `AGENTS.md` = gabungan berkas aturan di `.agents/rules/` (jangan edit `AGENTS.md` manual bila sumbernya di `.agents/rules/`; regenerasi bila ada tooling).
- `SKILLS_INDEX.md` = indeks skill yang wajib diperbarui saat skill dibuat/diubah (lihat skill `aturan-pembuatan-skill`, `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`).
- Skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) mengatur alur `memori/sesi/sesi_N.md` + sinkronisasi `MEMORI.md` di akhir sesi; baca sebelum interaksi proyek apa pun.
- Skill `riset-kompetitor` (`.agents/skills/custom/riset-kompetitor/SKILL.md`) v1.6.0 bersifat portabel lintas proyek; konteks aplikasi sasaran wajib dibaca dari `README.md`/`AGENTS.md`/PRD, bukan di-hardcode ke dalam skill.
- Aturan alur Git & commit (Conventional Commits, Trunk-based, penamaan branch prefix wajib, Squash merge, Semver + changelog, wajib PR tanpa commit langsung ke `main`, template PR wajib, minimal 1 reviewer tanpa auto-merge, tag manual oleh maintainer, changelog Keep a Changelog wajib commit, berlaku root + submodule) tersimpan di `.agents/rules/global/alur_git_commit.md` (diperbarui sesi 28; rujukan hasil diskusi `hasil_diskusi/diskusi_2.md` dan `diskusi_3.md`).

## Lokasi Berkas Memori

- `MEMORI.md` — dokumen ini (root proyek).
- `memori/sesi/sesi_N.md` — catatan per sesi (nomor tertinggi + 1; gap tidak diisi; diarsipkan permanen).
- `memori/riwayat_perubahan.md` — riwayat perubahan proyek.

## Hasil Diskusi

- Lokasi: `hasil_diskusi/` di root proyek (dibuat 2026-11-14, sesi 12).
- Daftar berkas: `diskusi_1.md` — perluasan cakupan command `perbarui_readme.md` ke README submodule (status Final, sudah diimplementasikan); `diskusi_2.md` — sistem kerja global: alur Git & commit (Conventional Commits + Trunk-based) (status Final, sudah diimplementasikan sebagian); `diskusi_3.md` — lanjutan: PR, review, tag, changelog, pengecualian, submodule (status Final, sebagian diimplementasikan); `diskusi_4.md` — penambahan tanggal diperbarui pada `MEMORI.md` dan instruksi di skill `memori-check` (status Final, sudah diimplementasikan); `diskusi_5.md` — analisa mengapa agen AI tidak menggunakan mockito saat membuat test, plus rekomendasi R-1..R-5 (status Final, sudah diimplementasikan); `diskusi_6.md` — praktik skrip shell: chmod, alias, variabel argumen (status Final, sudah diimplementasikan); `diskusi_7.md` — penyebab status PRD `Sedang Diimplementasikan` dan perbaikan command `diskusi_fitur_baru.md` (status Final, sudah diimplementasikan); `diskusi_8.md` — rencana command dan skill audit kesehatan sistem kerja (struktur, indeks skill, command, memori, hasil diskusi, repositori) secara read-only dengan laporan di sesi (status Final, sudah diimplementasikan — seluruh 12 tindak lanjut selesai, diverifikasi 2026-11-14 sesi 50); `diskusi_9.md` — penggabungan skill Freezed ke `model-state-freezed-abstract` (Freezed state + model JSON + model DB) (status Final, sudah diimplementasikan, sesi 54).
- Nomor tertinggi: 9.

## Catatan untuk Model Selanjutnya

- Baca `AGENTS.md` (aturan) dan `SKILLS_INDEX.md` sebelum bertindak; muat skill yang relevan via tool `skill`.
- Jangan mengarang informasi proyek; nyatakan tidak diketahui bila data tidak tersedia.
- Konfirmasi sebelum commit/push; jangan ubah lingkup tanpa persetujuan pengguna.
- Working tree kotor ≠ rusak; periksa `git status`/`git diff` sebelum menyimpulkan.

## Riwayat Perubahan

Lihat `memori/riwayat_perubahan.md`.
