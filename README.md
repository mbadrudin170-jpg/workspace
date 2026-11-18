# Workspace

Repositori induk untuk menghimpun aturan, skill, konfigurasi Kilo, snippet, skrip bantu, dan proyek turunan dalam alur pengembangan Flutter/Dart berbantuan agen AI. Repositori ini bukan aplikasi yang dapat dijalankan langsung dari root; isinya digunakan sebagai pusat konfigurasi dan referensi kerja lintas proyek.

## Tujuan

- Menyediakan sumber kebenaran aturan pengembangan dan format dokumen yang dibaca agen AI.
- Menyediakan skill terindeks yang dimuat sesuai konteks pekerjaan.
- Menyediakan snippet editor, skrip bantu, dan dokumentasi pendukung alur kerja.
- Menghubungkan proyek turunan melalui Git submodule agar riwayat dan pengelolaannya tetap terpisah.

## Submodule

Daftar submodule bersumber dari `.gitmodules` dan verifikasi `git submodule status`/`git ls-tree HEAD`.

| Submodule           | Deskripsi                                                                                                                                          | Repositori                                                  | README                                                       |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------ |
| `admin_wifi`        | Aplikasi Flutter (Android) untuk mengelola pelanggan WiFi: pelanggan aktif, dompet, transaksi, paket, sinkronisasi dua arah ke Firebase Firestore. | `https://github.com/mbadrudin170-jpg/admin_wifi.git`        | [`admin_wifi/README.md`](admin_wifi/README.md)               |
| `share_global_saya` | Pustaka Flutter bersama (logging/overlay debug, utilitas, widget input, dialog, toast).                                                            | `https://github.com/mbadrudin170-jpg/share_global_saya.git` | [`share_global_saya/README.md`](share_global_saya/README.md) |

Catatan: submodule `base_coc` saat ini **tidak aktif** — entri pada `.gitmodules` dikomentari dan tidak ada tautan gitlink aktif di `HEAD`. Submodule tidak memiliki `.gitmodules` bertingkat.

## Struktur Repositori

| Lokasi                     | Isi                                                                                                                                                |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AGENTS.md`                | Aturan gabungan yang wajib dibaca sebelum bekerja (urutan baca, ceklist sesi, aturan proyek).                                                      |
| `MEMORI.md`                | Status proyek dan catatan teknis (memori hidup); `memori/sesi/sesi_N.md`, `memori/riwayat_perubahan.md`.                                           |
| `.agents/rules/`           | Aturan proyek (`code.md`, `kelompok_skill_wajib_*.md`, `lainnya.md`, `pengelolaan_konflik.md`, `overlay_log_debug.md`, `format_hasil_diskusi.md`). |
| `.agents/skills/code/`     | Skill kustom terkait kode (`SKILL.md`, 55 skill) untuk konteks kerja tertentu.                                                                     |
| `.agents/skills/non-code/` | Skill kustom non-kode (`SKILL.md`, 17 skill) untuk konteks kerja tertentu.                                                                         |
| `.kilo/`                   | Konfigurasi Kilo proyek (`kilo.jsonc`, `commands/`, `prompts/`, …) — terlacak di repositori ini.                                                   |
| `.vscode/`                 | 12 berkas snippet (`*.code-snippets`) serta `launch.json`, `settings.json`, `tasks.json`, `mcp.json`.                                              |
| `.prettierrc`              | Konfigurasi pemformatan (Markdown/JSON/JSONC).                                                                                                     |
| `script/`                  | Skrip bantu Bash: `bash_aliases.sh`, `build_apk.sh`, `full_clean.sh`, `rename_apk.sh`.                                                             |
| `memori/`                  | Memori kerja: `sesi/` (catatan per sesi) dan `riwayat_perubahan.md`.                                                                               |
| `audit/`                   | Audit sistem kerja (`riwayat_sesi.md`).                                                                                                            |
| `prd/`                     | Dokumen PRD yang tersedia (mis. `prd_umpan_balik_setelah_menyalin.md`).                                                                            |
| `docs/`                    | Dokumentasi pendukung (`hasil_analisa/`, `kilo/`, `laporan_linter.md`, `paket_favorit.md`, `snippet.md`, `vs code/`).                              |
| `prompt/`                  | Poin ringkas per skill/aturan/command (`skill/`, `rules/`, `commands/`).                                                                           |
| `.dart_tool/`              | Direktori kerja tool (cache pemasangan Agent Skill) yang ikut terlacak; memuat gitlink tool tanpa entri `.gitmodules`.                             |
| `admin_wifi/`              | Submodule aplikasi Flutter (lihat [`admin_wifi/README.md`](admin_wifi/README.md)).                                                                 |
| `share_global_saya/`       | Submodule pustaka Flutter bersama (lihat [`share_global_saya/README.md`](share_global_saya/README.md)).                                            |
| Berkas kerja tingkat root  | `alur_kerja.md`, `apk_kompetitor.md`, `catatan.md`, `fitur_khusus.md`, `keluhan.md`, `refrensi_apk.md`, `task.md`.                                 |

Folder `apk/` diabaikan oleh Git (`.gitignore`) sehingga artefak APK tidak ikut ter-commit.

## Komponen Utama

### Aturan dan Skill

- Aturan pada `.agents/rules/` mencakup format hasil diskusi, indeks skill, aturan proyek, dan aturan pendukung lainnya.
- `AGENTS.md` menjadi rujukan aturan gabungan bagi agen AI.
- Skill dimuat sesuai trigger; indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) menjaga pemetaan trigger dan status pembaruan.
- Skill `code/` hanya boleh berubah dari riwayat commit yang sah.

### Konfigurasi Kilo

- `.kilo/kilo.jsonc` menyimpan konfigurasi proyek (model, izin, agent, dan pengaturan terkait). Command di `.kilo/commands/` dan prompt di `.kilo/prompts/` ikut terlacak di repositori ini.

### Snippet dan Skrip

- `.vscode/` menyediakan snippet untuk Dart/Flutter, Riverpod, Freezed, logging, komentar, method, path, dan kebutuhan IDE lainnya.
- `script/` berisi alias shell serta skrip pembersihan/penamaan/build APK. Sebagian skrip dirancang untuk dijalankan pada root proyek Flutter yang memiliki `lib/`, `pubspec.yaml`, atau `pubspec.lock`.

### Memori dan Dokumentasi

- `MEMORI.md` menyimpan konteks hidup proyek; `memori/sesi/sesi_N.md` dan `memori/riwayat_perubahan.md` menyimpan jejak sesi dan perubahan.
- `audit/`, `prd/`, `docs/`, dan `prompt/` menyimpan catatan audit, kebutuhan, referensi, dan poin ringkas aturan/skill/command.

## Kelebihan Repositori

- **Konfigurasi terpusat**: aturan, skill, snippet, command, dan skrip dihimpun dalam satu repositori induk.
- **Skill terindeks**: trigger dan status pembaruan terdokumentasi di indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`).
- **Keterlacakan kerja**: memori sesi, riwayat perubahan, audit, PRD, dan hasil analisis mendukung kontinuitas pengerjaan.
- **Pemisahan riwayat kode**: submodule menjaga aplikasi (`admin_wifi`) dan pustaka bersama (`share_global_saya`) tetap independen; `share_global_saya` ditulis lintas proyek sehingga dipakai bersama.

## Mulai Menggunakan

### Prasyarat

- Git, Bash.
- Flutter SDK dan Dart (untuk mengerjakan submodule Flutter).
- VS Code/Code OSS (opsional, untuk snippet dan konfigurasi debug).
- Kilo (opsional, bila memakai alur agen AI pada repositori ini).

### Kloning

```bash
git clone --recurse-submodules https://github.com/mbadrudin170-jpg/workspace.git
```

Jika repositori sudah ada tanpa submodule:

```bash
git submodule update --init --recursive
```

### Penggunaan Singkat

- Muat alias shell (opsional): `source script/bash_aliases.sh`
- Baca `AGENTS.md` beserta indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) sebelum bekerja dengan agen AI.
- Jalankan perintah Flutter/Dart dari root submodule yang relevan (`admin_wifi/` atau `share_global_saya/`), bukan dari root `workspace`.

## Status Proyek

- Root `workspace` berfungsi sebagai pusat konfigurasi, dokumentasi, dan orkestrasi kerja; bukan aplikasi yang dapat dijalankan.
- `admin_wifi` merupakan aplikasi manajemen pelanggan WiFi yang masih dalam pengembangan aktif (lihat [`admin_wifi/README.md`](admin_wifi/README.md)).
- `share_global_saya` merupakan pustaka bersama internal dan belum diterbitkan ke pub.dev (`publish_to: "none"`).
