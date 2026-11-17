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
- Pengguna memilih lanjut ke `prompt/skill/` (2026-11-18 00:59 WIB). 12 berkas poin dicek vs target: 9 sinkron (`aturan-pembuatan-skill`, `build-apk-github-workflow`, `build-runner-codegen` [code/, tidak disentuh — aturan 4 lainnya.md], `format-prd`, `kelompok-skill-wajib`, `memori-check`, `penggunaan-tool-bawaan-kilo`, `riset-kompetitor`, `riverpod-pola` [code/, tidak disentuh]).
- `aturan-folder-prompt`: target ditambah Aturan 8 (pemisahan satu baris kosong antar butir poin, sesuai poin 7 sumber); metadata `versi` 1.2.0→1.3.0, `diperbarui` → Wed Nov 18 2026 00:59 WIB; provenance ditambah di Sumber Evaluasi. Indeks `.agents/rules/kelompok_skill_wajib.md` diperbarui (aturan-folder-prompt → 00:59 WIB).
- `aturan-pembuatan-commands`: target ditambah section "Contoh Frontmatter" (poin 9 sumber); provenance ditambah di Sumber Evaluasi; indeks kelompok_skill_wajib diperbarui (→ 00:59 WIB).
- `aturan-pembuatan-rules`: **KONFLIK → terselesaikan** — pengguna memilih "Sesuaikan target dengan kilo.jsonc" (hanya `AGENTS.md` di `instructions`; jalur baca rules via `AGENTS.md`). Target `.agents/skills/non-code/aturan-pembuatan-rules/SKILL.md` direvisi: Aturan 3 → hanya `AGENTS.md` terdaftar; Aturan 4 baru (AGENTS.md wajib memuat perintah baca `.agents/rules/`); Larangan dan Contoh Benar disesuaikan; metadata versi 1.0.0→1.1.0, `diperbarui` → Wed Nov 18 2026 01:03 WIB; frontmatter description direvisi; provenance di Sumber Evaluasi (sesi 21). Sumber `prompt/skill/aturan-pembuatan-rules.md` poin 3–4 diperjelas; `diperbarui` di-bump ke 01:03 WIB. Indeks kelompok_skill_wajib diperbarui → 01:03 WIB.
- `memori-check`: poin 15 sumber ("sebelum sinkron ke memori cek sesi yang masih berjalan") sudah tercakup di target (Aturan 2 "Sesi paralel: best-effort; bila ambigu, lapor" + Aturan 23 "Penandaan hanya oleh sesi pembuat"). In sync.
- Catatan di luar cakupan (tidak diubah, dilaporkan): rujukan usang `.agents/rules/global/...` di `build-apk-github-workflow/SKILL.md` dan `format-prd/SKILL.md` (kelas backlog sesi 10, rujukan path lama setelah pemindahan `global/` → `.agents/rules/`).
- Anomali git: commit `69a3181` ("a", 00:39 WIB) berisi pekerjaan pra-sesi (bukan sesi ini); commit `92e716e` ("a", 00:58 WIB) berisi sebagian edit sesi ini (prompt/commands catat_keluhan & memperbarui_file_di_folder_prompt, prompt/rules/AGENTS.md, .kilo/commands/memperbarui_file_di_folder_prompt.md, sesi_21 versi saat itu) — dibuat oleh pengguna/proses lain (author badrudin), bukan oleh AI. Berkas baru ter-stage `prompt/commands/tambah_kode_keskill.md` (isi `1`) bukan milik sesi ini; tidak disentuh.
- Sinkronisasi MEMORI.md ditahan: pengguna menolak/menutup pertanyaan akhir sesi — MEMORI.md belum diperbarui; sesi tetap `Belum Sinkron`.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_21.md` | Dibuat | Berkas sesi aktif (Belum Sinkron) |
| `prompt/commands/catat_keluhan.md` | Diubah | Perbaikan frasa ambigu; `diperbarui` di-bump |
| `prompt/commands/memperbarui_file_di_folder_prompt.md` | Diubah | Perbaikan konteks `$ARGUMENTS`; `diperbarui` di-bump |
| `.kilo/commands/memperbarui_file_di_folder_prompt.md` | Diubah | Selaras dengan sumber (detail `formatmd`, poin ringkas, draf) |
| `prompt/rules/AGENTS.md` | Diubah | Poin 8 dirumuskan baku; `diperbarui` di-bump 2026-11-18 00:49 WIB |
| `.agents/skills/non-code/aturan-folder-prompt/SKILL.md` | Diubah | Aturan 8 baru; versi 1.3.0; `diperbarui` 00:59 WIB; provenance ditambah |
| `.agents/skills/non-code/aturan-pembuatan-commands/SKILL.md` | Diubah | Section Contoh Frontmatter; provenance ditambah |
| `.agents/rules/kelompok_skill_wajib.md` | Diubah | Indeks: tanggal diperbarui aturan-folder-prompt & aturan-pembuatan-commands → 00:59 WIB; aturan-pembuatan-rules → 01:03 WIB |
| `.agents/skills/non-code/aturan-pembuatan-rules/SKILL.md` | Diubah | Revisi sesuai keputusan pengguna: hanya AGENTS.md di instructions; jalur baca rules via AGENTS.md; versi 1.1.0; description diperbarui |
| `prompt/skill/aturan-pembuatan-rules.md` | Diubah | Poin 3–4 diperjelas (ambigu); `diperbarui` di-bump 2026-11-18 01:03 WIB |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan
