# Workspace

Repositori induk untuk menghimpun aturan, skill, konfigurasi Kilo, snippet, skrip bantu, dan proyek turunan dalam alur pengembangan Flutter/Dart berbantuan agen AI. Repositori ini bukan aplikasi yang dapat dijalankan langsung dari root; isinya digunakan sebagai pusat konfigurasi dan referensi kerja lintas proyek.

## Tujuan

- Menyediakan sumber kebenaran aturan pengembangan dan format dokumen yang dibaca agen AI.
- Menyediakan skill terindeks yang dimuat sesuai konteks pekerjaan.
- Menyediakan snippet editor, skrip bantu, dan dokumentasi pendukung alur kerja.
- Menghubungkan proyek turunan melalui Git submodule agar riwayat dan pengelolaannya tetap terpisah.

## Submodule

| Submodule           | Deskripsi                                                                                                             | Repositori                                                  | README                                                       |
| ------------------- | --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------ |
| `base_coc`          | Aplikasi Flutter penyedia base/layout Clash of Clans (galeri, detail & salin tautan, pelacakan progres upgrade desa). | `https://github.com/mbadrudin170-jpg/base_coc.git`          | [`base_coc/README.md`](base_coc/README.md)                   |
| `share_global_saya` | Pustaka Flutter bersama (logging/debug overlay, utilitas, widget input, dialog, toast).                               | `https://github.com/mbadrudin170-jpg/share_global_saya.git` | [`share_global_saya/README.md`](share_global_saya/README.md) |

Daftar submodule bersumber dari `.gitmodules`. Submodule tidak memiliki `.gitmodules` bertingkat.

## Struktur Repositori

| Lokasi                                           | Isi                                                                                             |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| `AGENTS.md`                                      | Gabungan aturan yang dibaca agen AI.                                                            |
| `.agents/rules/`                                 | Aturan proyek (format hasil diskusi, indeks skill, dan aturan pendukung).                       |
| `.agents/skills/code/`                           | Skill kustom terkait kode (`SKILL.md`) untuk konteks kerja tertentu.                            |
| `.agents/skills/non-code/`                       | Skill kustom non-kode (`SKILL.md`) untuk konteks kerja tertentu.                                |
| `.agents/skills/bawaan/`                         | Skill bawaan (`flutter-dart`).                                                                  |
| `.agents/rules/kelompok_skill_wajib_code.md`     | Indeks skill code (trigger dan status pembaruan).                                               |
| `.agents/rules/kelompok_skill_wajib_non_code.md` | Indeks skill non-code (trigger dan status pembaruan).                                           |
| `skills-lock.json`                               | Kunci versi/hash skill yang dipasang.                                                           |
| `.kilo/`                                         | Konfigurasi Kilo proyek (`kilo.jsonc`, command, prompt); diabaikan Git (`.gitignore`).          |
| `.vscode/`                                       | 12 berkas snippet (`*.code-snippets`) serta konfigurasi editor/debug/MCP.                       |
| `script/`                                        | Skrip bantu Bash: `bash_aliases.sh`, `build_apk.sh`, `full_clean.sh`, `rename_apk.sh`.          |
| `memori/`                                        | Dokumen memori kerja: `sesi/` (catatan per sesi) dan `riwayat_perubahan.md`.                    |
| `hasil_diskusi/`                                 | Berkas hasil diskusi (`diskusi_*.md`).                                                          |
| `prd/`                                           | Dokumen PRD yang tersedia.                                                                      |
| `docs/`                                          | Dokumentasi pendukung (mis. `model_agents.md`).                                                 |
| `apk/`                                           | Artefak APK yang disimpan di repositori.                                                        |
| `.config/dart_skills/`                           | Konfigurasi pemasangan skill Dart.                                                              |
| `.prettierrc`                                    | Konfigurasi pemformatan (Markdown/JSON/JSONC).                                                  |
| `base_coc/`                                      | Submodule aplikasi Flutter (lihat [`base_coc/README.md`](base_coc/README.md)).                  |
| `share_global_saya/`                             | Submodule pustaka Flutter (lihat [`share_global_saya/README.md`](share_global_saya/README.md)). |

## Komponen Utama

### Aturan dan Skill

- Aturan pada `.agents/rules/` mencakup format hasil diskusi, indeks skill, dan aturan pendukung lainnya.
- `AGENTS.md` menjadi rujukan aturan gabungan bagi agen AI.
- Skill dimuat sesuai trigger; `.agents/rules/kelompok_skill_wajib_code.md`, `.agents/rules/kelompok_skill_wajib_non_code.md`, dan `skills-lock.json` menjaga keterlacakan serta konsistensi skill.

### Konfigurasi Kilo

- `.kilo/kilo.jsonc` menyimpan konfigurasi proyek (model, izin, agent, dan pengaturan terkait). Folder `.kilo/` tidak termasuk git tree.

### Snippet dan Skrip

- `.vscode/` menyediakan snippet untuk Dart/Flutter, Riverpod, Freezed, logging, komentar, method, path, dan kebutuhan IDE lainnya.
- `script/` berisi alias shell serta skrip pembersihan/penamaan/build APK. Sebagian skrip dirancang untuk dijalankan pada root proyek Flutter yang memiliki `lib/`, `pubspec.yaml`, atau `pubspec.lock`.

### Memori dan Dokumentasi

- `MEMORI.md` menyimpan konteks hidup proyek; `memori/sesi/sesi_N.md` dan `memori/riwayat_perubahan.md` menyimpan jejak sesi dan perubahan.
- `hasil_diskusi/`, `prd/`, dan `docs/` menyimpan catatan keputusan, kebutuhan, dan referensi pendukung.

## Kelebihan Repositori

- **Konfigurasi terpusat**: aturan, skill, snippet, dan skrip dihimpun dalam satu repositori induk.
- **Skill terindeks**: trigger dan status pembaruan terdokumentasi di `.agents/rules/kelompok_skill_wajib_code.md` dan `.agents/rules/kelompok_skill_wajib_non_code.md` dengan penguncian versi di `skills-lock.json`.
- **Keterlacakan kerja**: memori sesi, riwayat perubahan, hasil diskusi, dan PRD mendukung kontinuitas pengerjaan.
- **Pemisahan riwayat kode**: submodule menjaga aplikasi (`base_coc`) dan pustaka bersama (`share_global_saya`) tetap independen.

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
- Baca `AGENTS.md`, `.agents/rules/kelompok_skill_wajib_code.md`, dan `.agents/rules/kelompok_skill_wajib_non_code.md` sebelum bekerja dengan agen AI.
- Jalankan perintah Flutter/Dart dari root submodule yang relevan (`base_coc/` atau `share_global_saya/`), bukan dari root `workspace`.

## Status Proyek

- Root `workspace` berfungsi sebagai pusat konfigurasi, dokumentasi, dan orkestrasi kerja; bukan aplikasi yang dapat dijalankan.
- `base_coc` telah memiliki implementasi awal fitur (galeri base, detail & salin tautan, pelacakan progres upgrade desa) dan masih dalam tahap pengembangan aktif.
- `share_global_saya` telah berisi implementasi pustaka bersama internal dan belum diterbitkan ke pub.dev.
