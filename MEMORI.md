# MEMORI

Diperbarui: 2026-11-17 (sesi 2)

## Konteks Proyek

- Root `workspace` adalah repositori induk (bukan aplikasi Flutter); berisi aturan, skill, konfigurasi Kilo, snippet, skrip, dan submodule (`base_coc`, `share_global_saya`).
- `lib/main.dart` berada di submodule, bukan root.
- Aturan dibaca dari `.agents/rules/`; skill dari `.agents/skills/code/` dan `.agents/skills/non-code/` (`skills.paths` di `.kilo/kilo.jsonc`).

## Konvensi dan Aturan

- Seluruh respons, dokumen, dan komentar kode memakai bahasa Indonesia baku.
- Setiap skill wajib memiliki berkas poin di `prompt/skill/<nama>.md` dengan nama sama seperti nama skill (skill `aturan-pembuatan-skill` Aturan 13).
- Berkas `prompt/` hanya memuat poin ringkas + header `diperbarui :` dan `file :`/`ditimpa ke :`; isi final di `.agents/`, `.kilo/` (skill `aturan-folder-prompt`).
- Verifikasi sebelum laporan: `dart format`, `dart analyze`, `flutter test` bila relevan.
- Berkas sesi `memori/sesi/sesi_N.md` diarsipkan permanen; tidak boleh dihapus (skill `memori-check`).

## Status

- Sesi terakhir: `memori/sesi/sesi_2.md` (Sudah Sinkron) — pembaruan `prompt/skill/aturan-pembuatan-skill.md` + catch-up sync sesi 1.

## Catatan Teknis

- Sesi 1 (2026-11-17): pemisahan skill code/non-code (51 code, 16 non-code), pemindahan `.agents/rules/global/` → `.agents/rules/`, penyelarasan referensi; konflik aturan menghentikan penyelarasan lanjutan.
- Perubahan aturan/skill disertai pembaruan `prompt/` dan indeks `.agents/rules/kelompok_skill_wajib.md` bila status pembaruan berubah.

## Sumber Kebenaran Lain

- Indeks skill: `.agents/rules/kelompok_skill_wajib.md` (dan `skills-lock.json`).
- Aturan: `.agents/rules/`.
- Riwayat perubahan: `memori/riwayat_perubahan.md`.
- Jejak sesi: `memori/sesi/sesi_N.md`.