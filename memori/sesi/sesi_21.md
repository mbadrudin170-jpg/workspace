# Sesi 21

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-18 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command) — task "Salin Prompt ke Target"
- Topik: menyalin poin-poin dari berkas di folder `prompt/` ke target masing-masing (skill, aturan, command)

## Catatan Sesi

- Awal sesi: membaca `MEMORI.md`, seluruh berkas `.agents/rules/` (`format_hasil_diskusi.md`, `kelompok_skill_wajib.md`, `lainnya.md`, `pengelolaan_konflik.md`), `.kilo/kilo.jsonc` (instructions: `AGENTS.md`).
- Catch-up sync: seluruh `memori/sesi/sesi_1.md`–`sesi_20.md` ber-status `Sudah Sinkron`; tidak ada berkas `Belum Sinkron` yang perlu disinkronkan.
- Menunggu instruksi cakupan dari pengguna: semua berkas atau hanya beberapa; file terbuka di tab bukan dari folder `prompt/` sehingga tidak ditanyakan.
- Cakupan: pengguna memilih SEMUA berkas di `prompt/` (urutan: `prompt/commands/` → `prompt/rules/` → `prompt/skill/`; lapor per folder sebelum lanjut).
- Skill dimuat: `aturan-pembuatan-commands`, `aturan-folder-prompt`, `memori-check`.
- Hasil cek `prompt/commands/` (13 berkas vs target `.kilo/commands/`): 11 berkas sudah sinkron (`audit_riwayat_sesi`, `build_apk`, `cari_apk_kompetitor`, `cari_rules_commands_skill_yang_diinginkan`, `commit_file_sesi_ini`, `evaluasi_skill_dari_commit`, `kerjakan_prd`, `membuat_prd_fitur`, `mode_diskusi`, `riset_kompetitor`, `salin_prompt_ke_target`).
- Perbaikan `prompt/commands/memperbarui_file_di_folder_prompt.md`: diperjelas konteks `$ARGUMENTS` (berkas `prompt/` yang ditunjuk); target `.kilo/commands/memperbarui_file_di_folder_prompt.md` diperbarui agar memuat detail `formatmd` (`npx prettier --write "**/*.md"`), poin ringkas, dan draf sebelum mengedit. Sumber `catat_keluhan.md` diperbaiki frasa ambigu ("agar kita bisa perbaiki di antara ketiga kategori itu" → "agar bisa diperbaiki"); target sudah cocok. Header `diperbarui :` kedua sumber di-bump ke 2026-11-18 00:45 WIB.
- Pengguna memilih lanjut ke `prompt/rules/` (2026-11-18 00:49 WIB). Hasil cek `prompt/rules/AGENTS.md` vs `AGENTS.md` (root): seluruh 8 poin sudah tercermin; poin 8 sumber dirumuskan ulang ke bentuk baku ("Membaca `MEMORI.md` wajib tanpa `offset` dan tanpa `limit` — baca seluruh isi berkas.") agar cocok dengan target; `diperbarui` sumber di-bump ke 2026-11-18 00:49 WIB. Target `AGENTS.md` tidak diubah.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_21.md` | Dibuat | Berkas sesi aktif (Belum Sinkron) |
| `prompt/commands/catat_keluhan.md` | Diubah | Perbaikan frasa ambigu; `diperbarui` di-bump |
| `prompt/commands/memperbarui_file_di_folder_prompt.md` | Diubah | Perbaikan konteks `$ARGUMENTS`; `diperbarui` di-bump |
| `.kilo/commands/memperbarui_file_di_folder_prompt.md` | Diubah | Selaras dengan sumber (detail `formatmd`, poin ringkas, draf) |
| `prompt/rules/AGENTS.md` | Diubah | Poin 8 dirumuskan baku; `diperbarui` di-bump 2026-11-18 00:49 WIB |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan
