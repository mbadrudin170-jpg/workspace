# Workspace

Repositori induk untuk menghimpun aturan, skill, snippet, skrip bantu, dan proyek turunan dalam alur pengembangan aplikasi Flutter/Dart berbantuan agen AI. Repositori ini bukan aplikasi yang dapat dijalankan langsung; isinya dipakai oleh agen AI (Kilo) dan lingkungan pengembangan (VS Code serta bash) pada proyek-proyek Flutter/Dart.

## Tujuan

- Menyimpan aturan pengembangan Flutter/Dart dalam satu sumber kebenaran yang dapat dipakai lintas proyek.
- Menyediakan skill yang dimuat sesuai konteks pekerjaan, lengkap dengan indeks dan pengunci versi.
- Menyediakan snippet editor dan skrip otomasi untuk dokumentasi, pemeliharaan, dan build.
- Menghubungkan proyek turunan melalui Git submodule agar tetap terkelola dalam satu repositori.

## Teknologi dan Perkakas

| Teknologi | Penggunaan dalam repositori |
| --------- | --------------------------- |
| Flutter dan Dart | Submodule `base_coc` dan `share_global_saya` |
| Bash | Skrip otomasi pada `script/` dan alias shell |
| JSON dan JSONC | Snippet VS Code, `skills-lock.json`, konfigurasi Kilo |
| Markdown | Aturan, skill, dokumentasi, dan catatan sesi |
| Prettier | Pemformatan berkas Markdown, JSON, dan JSONC melalui `.prettierrc` |
| Git submodule | Pengelolaan proyek `base_coc` dan `share_global_saya` |
| Kilo | Konfigurasi agen AI pada `.kilo/` (diabaikan oleh Git) |

## Struktur Repositori

| Lokasi | Isi |
| ------ | --- |
| `.agents/rules/global/` | 19 berkas aturan global Flutter/Dart, format dokumen, dan standar optimasi |
| `.agents/rules/proyek/` | 2 berkas aturan khusus proyek |
| `.agents/rules/AGENTS.md` | Gabungan berkas aturan yang menjadi sumber `AGENTS.md` root |
| `.agents/skills/custom/` | 59 skill buatan/kurasi pengguna |
| `AGENTS.md` | Gabungan aturan yang dibaca agen AI |
| `SKILLS_INDEX.md` | Indeks skill berisi trigger dan status pembaruan |
| `skills-lock.json` | Kunci versi dan hash skill yang dipasang |
| `.vscode/` | 12 berkas snippet kode, konfigurasi debug, dan pengaturan editor |
| `script/` | 19 skrip bantu Bash dan kumpulan alias |
| `.prettierrc` | Konfigurasi pemformatan Prettier |
| `.config/dart_skills/` | Konfigurasi pemasangan skill Dart |
| `memori/` | Catatan sesi dan riwayat perubahan proyek |
| `base_coc/` | Submodule aplikasi Flutter penyedia base Clash of Clans |
| `share_global_saya/` | Submodule pustaka Flutter bersama (utilitas, widget, logging) |

## Komponen Utama

### Aturan Pengembangan

Folder `.agents/rules/global/` memuat standar yang berlaku untuk seluruh proyek Flutter/Dart, antara lain aturan umum pengembangan, pemanfaatan SDK dan paket, Riverpod, testing, notifikasi, keamanan, performa, UI/UX, serta format dokumen seperti PRD, hasil diskusi, dan task. Folder `.agents/rules/proyek/` memuat ketentuan khusus yang diprioritaskan apabila terjadi konflik dengan aturan global.

Berkas `AGENTS.md` di root merupakan gabungan seluruh berkas aturan dan dihasilkan ulang melalui:

```bash
script/build_rules_context.sh
```

### Skill

Skill disimpan di `.agents/skills/custom/` dan dimuat sesuai trigger pekerjaan. `SKILLS_INDEX.md` mencatat trigger serta waktu pembaruan setiap skill, sedangkan `skills-lock.json` mengunci versi dan hash skill yang dipasang.

### Snippet VS Code

Folder `.vscode/` menyediakan snippet untuk Dart, widget Flutter, Riverpod, Freezed, logging, komentar, method, path, dan kebutuhan IDE lainnya. Konfigurasi debug `myapp (debug mode - Local only)` menjalankan `base_coc` melalui web server pada port `8080` dengan working directory `${workspaceFolder}/base_coc`.

### Skrip Otomasi

Seluruh skrip berada di `script/` dan ditujukan untuk dijalankan dari root proyek Flutter yang memiliki struktur `lib/`, `pubspec.yaml`, atau `pubspec.lock`.

| Skrip | Fungsi |
| ----- | ------ |
| `build_docs.sh` | Menggabungkan berkas/folder yang terdaftar pada berkas konfigurasi menjadi satu dokumen Markdown |
| `build_rules_context.sh` | Menggabungkan seluruh berkas `.agents/rules/*.md` menjadi `AGENTS.md` |
| `build_structure.sh` | Menghasilkan struktur proyek rekursif ke Markdown |
| `build_fitur.sh` | Membuat dokumentasi per fitur dari `lib/fitur/` ke `docs/fitur/` |
| `build_lib_docs.sh` | Menggabungkan seluruh isi `lib/` ke `docs/lib.md` |
| `build_core_shared.sh` | Menggabungkan isi `lib/shared/` ke `docs/core_shared.md` |
| `build_snippets.sh` | Menggabungkan seluruh snippet `.code-snippets` ke `docs/snippet.md` |
| `build_sh_docs.sh` | Menggabungkan berkas skrip shell ke `docs/sh.md` |
| `generate_model_docs.sh` | Mengumpulkan berkas model ke `model.md` |
| `path_paket.sh` | Menulis daftar path paket dari `pubspec.lock` ke `path_paket.md` |
| `script_tes.sh` | Mendokumentasikan berkas dan menelusuri import paket secara rekursif |
| `gabung_example_teks.sh` | Menggabungkan contoh paket dari `pub-cache` ke `example.md` |
| `code_paket.sh` | Menyalin berkas dari daftar `code_paket.txt` ke `README_PAKET.md` |
| `full_clean.sh` | Membersihkan artefak build dan cache proyek Flutter |
| `rename_apk.sh` | Mengganti nama berkas APK hasil build |
| `migrate_batch.sh` | Memigrasikan pemanggilan `Log` menjadi `L` dengan opsi dry-run |
| `duplicate_file.sh` | Menduplikasi berkas ke folder cadangan |
| `cp_to_service.sh` | Menyalin berkas/folder dari `~/warkop` ke `~/service` |
| `bash_aliases.sh` | Kumpulan alias untuk build, Flutter, Dart, Git, monitoring, dan Supabase |

Kumpulan alias dapat dimuat dengan:

```bash
source script/bash_aliases.sh
```

### Memori dan Dokumentasi

`MEMORI.md` menyimpan konteks hidup proyek, sedangkan `memori/sesi/sesi_N.md` menyimpan catatan per sesi dan `memori/riwayat_perubahan.md` menyimpan riwayat perubahan. Alur pencatatan mengikuti skill `memori-check`.

## Kelebihan

- Aturan terpusat dan dapat diregenerasi: seluruh ketentuan global dan proyek berada di `.agents/rules/` dan digabungkan menjadi `AGENTS.md` melalui satu skrip.
- Skill terindeks dan terkunci versinya: `SKILLS_INDEX.md` memetakan trigger ke skill, sedangkan `skills-lock.json` menjaga konsistensi skill yang dipasang.
- Otomasi dokumentasi: skrip dapat menghasilkan dokumentasi aturan, struktur proyek, isi `lib/`, fitur, snippet, dan skrip shell tanpa penyusunan manual.
- Perkakas pengembangan terpusat: snippet VS Code dan alias Bash tersedia dalam satu repositori untuk dipakai lintas proyek.
- Keterkaitan proyek terjaga: submodule menghubungkan aplikasi `base_coc` dan pustaka bersama `share_global_saya` tanpa menggabungkan riwayat Git keduanya.
- Jejak kerja terdokumentasi: `MEMORI.md`, berkas sesi, dan riwayat perubahan mencatat keputusan serta perubahan proyek.

## Submodule

### `base_coc`

Submodule aplikasi Flutter untuk penyedia base/layout Clash of Clans. Status saat ini masih tahap awal: `lib/main.dart` masih berupa aplikasi counter bawaan `flutter create`, belum ada fitur penyedia base. Rincian proyek tersedia di [`base_coc/README.md`](base_coc/README.md).

- Repositori: `https://github.com/mbadrudin170-jpg/base_coc.git`
- Paket: `base_coc` versi `1.0.0+1`
- Application ID Android: `com.example.base_coc`

### `share_global_saya`

Submodule pustaka Flutter bersama yang menyediakan utilitas, widget input, dialog konfirmasi, pemilih tanggal/waktu, toast, serta logging dan overlay debug. Pustaka ini mengekspor API utamanya melalui `lib/core_shared.dart` dan tidak diterbitkan ke pub.dev. Rincian paket tersedia di [`share_global_saya/README.md`](share_global_saya/README.md).

- Repositori: `https://github.com/mbadrudin170-jpg/share_global_saya.git`
- Versi: `1.0.0`
- Dependensi utama: `flutter_riverpod`, `freezed`, `riverpod_annotation`, `intl`, `uuid`, `shared_preferences`, `fluttertoast`, `stack_trace`
- Berkas hasil generate (`*.g.dart`, `*.freezed.dart`) dibuat melalui `build_runner`

## Mulai Menggunakan

1. Pastikan Flutter SDK, Dart, Bash, dan Git tersedia.
2. Clone repositori beserta submodule:

   ```bash
   git clone --recurse-submodules https://github.com/mbadrudin170-jpg/workspace.git
   ```

3. Apabila repositori sudah ada tanpa submodule:

   ```bash
   git submodule update --init --recursive
   ```

4. Muat alias shell (opsional):

   ```bash
   source script/bash_aliases.sh
   ```

5. Jalankan skrip pada root proyek Flutter yang dituju, bukan pada root `workspace`, karena sebagian besar skrip membutuhkan `lib/` dan `pubspec.lock` proyek tersebut.

## Status Proyek

- Repositori root berfungsi sebagai pusat konfigurasi dan perkakas, bukan aplikasi yang dapat dijalankan.
- `base_coc` masih berupa template Flutter; fitur penyedia base Clash of Clans belum diimplementasikan.
- `share_global_saya` sudah berisi implementasi pustaka bersama, tetapi belum diterbitkan sebagai paket publik.
