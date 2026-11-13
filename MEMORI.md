# MEMORI — Proyek workspace

Dokumen hidup proyek. Perbarui bagian yang relevan setiap akhir sesi; perubahan dicatat melalui `memori/sesi/sesi_N.md` (bukan langsung ke file ini) sesuai alur skill `memori-check`.

## Informasi Proyek

- Nama proyek: `workspace`
- Path: `/home/muhamadbadrudin1000/workspace`
- Remote git: `https://github.com/mbadrudin170-jpg/workspace.git` (branch utama: `main`)
- Jenis: repositori pengumpul konfigurasi lintas-proyek milik pengguna (aturan AI agent, skill, snippet VS Code, alias/skrip bash, submodule proyek Flutter). Tujuan persis proyek tidak dijelaskan dalam README root; deskripsi ditulis berdasarkan isi aktual.
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
| `share_global_saya/` | **Submodule** — snapshot berbagi global (`https://github.com/mbadrudin170-jpg/share_global_saya.git`) |

## Aturan Operasional di Mesin Ini

1. Perintah `cat` (dan pola `cat *`) **ditolak** oleh aturan izin proyek; gunakan tool Read untuk membaca berkas.
2. `.kilo/` ter-`.gitignore` — jangan menelusuri/menganggap `.kilo/` sebagai bagian dari git tree.
3. `memori/` **tidak** ter-`.gitignore`; berkas sesi diarsipkan permanen (tidak boleh dihapus).
4. Hindari `git add .` secara membabi buta: `?? .dart_tool/` belum ter-ignore; commit hanya atas perintah eksplisit pengguna.
5. Verifikasi setelah ubah `.dart` pada submodule: `dart format`, `dart analyze`. Submodule `base_coc`/`share_global_saya` memiliki `pubspec.yaml` masing-masing.
6. Bahasa Indonesia baku untuk respons, dokumen, dan komentar kode.
7. Jangan mengedit berkas hasil generate (`*.g.dart`, `*.freezed.dart`, `*.mocks.dart`); ubah sumber lalu jalankan `build_runner`.
8. Larangan operasi destruktif (hapus paksa, `reset --hard`, `push --force`) tanpa konfirmasi pengguna.
9. Root `workspace` bukan proyek Flutter; `lib/main.dart` hanya ada di submodule `base_coc`. Konfigurasi `myapp (debug mode - Local only)` pada `.vscode/launch.json` memakai `cwd` = `${workspaceFolder}/base_coc` dan `program` = `lib/main.dart` (relatif terhadap `cwd`, bukan root workspace); jangan menulis `program` sebagai `base_coc/lib/main.dart` karena akan menjadi path ganda (per 2026-11-14, sesi 6–7).

## Status Kerja (per 2026-11-14)

- Commit `29a2f81` (2026-11-13 22:53 UTC, pesan "a", di luar sesi ini) memuat restrukturisasi `.agents/skills/` → subfolder `custom/` dan `bawaan/`; berkas-berkas yang sebelumnya tampak `D`/`M` kini sudah ter-commit.
- `.dart_tool/` tidak ter-ignore (`.gitignore` hanya berisi `.kilo/`) — jangan `git add .` membabi buta.
- `m share_global_saya` — submodule memiliki perubahan isi yang belum di-pointer-update; jangan di-commit tanpa perintah pengguna.
- `base_coc/README.md` — default Flutter README dikosongkan pengguna, lalu diisi ulang versi minimal oleh agent (sesi_2, 2026-11-14); perubahan di dalam submodule, belum di-commit.
- `MEMORI.md` dan `memori/` dibuat pada sesi 1 (2026-11-14); sebelumnya belum ada.

## Konfigurasi Kilo (Model Agent)

- Sumber kebenaran: `.kilo/kilo.jsonc` (ter-`.gitignore`, jangan dianggap bagian git tree).
- Model global: `model`, `small_model`, `subagent_model` = `kilo/kilo-auto/free`.
- `agent.code`: `model` = `kilo/particle-ai/particle-1:free`, `variant` = `max` (per 2026-11-14, sesi 5; sebelumnya `openrouter/thinkingmachines/inkling-2-small:free`).
- Perubahan model agent hanya dilakukan atas permintaan eksplisit pengguna dengan konfirmasi sebelum eksekusi; bagian config lain (permission, instructions, skills.paths, agent lain) tidak diubah.

## Konvensi & Sumber Kebenaran

- `AGENTS.md` = gabungan berkas aturan di `.agents/rules/` (jangan edit `AGENTS.md` manual bila sumbernya di `.agents/rules/`; regenerasi bila ada tooling).
- `SKILLS_INDEX.md` = indeks skill yang wajib diperbarui saat skill dibuat/diubah (lihat skill `aturan-pembuatan-skill`, `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`).
- Skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) mengatur alur `memori/sesi/sesi_N.md` + sinkronisasi `MEMORI.md` di akhir sesi; baca sebelum interaksi proyek apa pun.
- Aturan penulisan `SKILL.md`, hasil diskusi, PRD, dan `task.md` ada di `.agents/rules/global/` (`aturan_skill.md`, `format_hasil_diskusi.md`, `format_PRD.md`, `format_task.md`).

## Lokasi Berkas Memori

- `MEMORI.md` — dokumen ini (root proyek).
- `memori/sesi/sesi_N.md` — catatan per sesi (nomor tertinggi + 1; gap tidak diisi; diarsipkan permanen).
- `memori/riwayat_perubahan.md` — riwayat perubahan proyek.

## Catatan untuk Model Selanjutnya

- Baca `AGENTS.md` (aturan) dan `SKILLS_INDEX.md` sebelum bertindak; muat skill yang relevan via tool `skill`.
- Jangan mengarang informasi proyek; nyatakan tidak diketahui bila data tidak tersedia.
- Konfirmasi sebelum commit/push; jangan ubah lingkup tanpa persetujuan pengguna.
- Working tree kotor ≠ rusak; periksa `git status`/`git diff` sebelum menyimpulkan.

## Riwayat Perubahan

Lihat `memori/riwayat_perubahan.md`.
