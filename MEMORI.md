# MEMORI

Diperbarui: 2026-11-17 (sesi 15)

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

- Sesi terakhir: `memori/sesi/sesi_14.md` (catch-up, sesi 15) — pembuatan PRD fitur C3 "Tombol aksi utama menetap" (`prd/prd_c3_tombol_aksi_utama_menetap.md`, Final, Belum Diimplementasikan); `refrensi_apk.md` baris 1154 item C3 ditandai sudah dibuatkan PRD (commit `63d4050`); berkas PRD C3 masih staged (belum di-commit).
- Sesi 13: `memori/sesi/sesi_13.md` (Sudah Sinkron) — implementasi PRD A2 "Copy base link satu ketuk" untuk `base_coc`: fitur sudah terimplementasikan sepenuhnya (tombol Copy Base, validasi tautan, umpan balik SnackBar, opsi buka game); verifikasi `dart format`, `dart analyze` No issues, `flutter test` 147 lulus; berkas PRD dihapus, referensi di `refrensi_apk.md` dibersihkan.
- Sesi 10: `memori/sesi/sesi_10.md` (Sudah Sinkron) — rename command `.kilo/commands/fitur/diskusi_fitur_baru.md` → `.kilo/commands/fitur/membuat_prd_fitur.md` (via `git mv`, judul H1 `# Membuat PRD Fitur`) beserta penyelarasan 5 rujukan di `.kilo/commands/alur_kerja.md`, `alur_kerja.md`, `.agents/skills/non-code/format-prd/SKILL.md`, dan `.agents/skills/code/konfigurasi-kilo-proyek/SKILL.md`; metadata `diperbarui` kedua skill dan indeks `kelompok_skill_wajib.md` diselaraskan.
- Sesi 9: riset kompetitor batch 10 — 10 listing `Belum Dianalisa` pertama (Apple App Store, `apk_kompetitor.md` baris 95–104) diverifikasi via `webfetch`, dianalisa, dan ditandai `Sudah Dianalisa`; `refrensi_apk.md` ditambahkan batch 10 (sumber 81–90, rekomendasi A70–A80, optimasi B26–B27, UI/UX C34–C36, contoh format item A1, dan fitur `fitur_khusus.md` "desa malam" prioritas Tinggi); `memori/sesi/sesi_8.md` disinkronkan lewat catch-up (Sudah Sinkron).

## Catatan Teknis

- Sesi 1 (2026-11-17): pemisahan skill code/non-code (51 code, 16 non-code), pemindahan `.agents/rules/global/` → `.agents/rules/`, penyelarasan referensi; konflik aturan menghentikan penyelarasan lanjutan.
- Sesi 3 (2026-11-17): evaluasi command commit→skill. Command `analisa_commit_skill.md` dihapus (langsung memperbarui skill, dianggap berbahaya), `evaluasi_code_yang_baru_dicommit.md` dihapus. Command `evaluasi_skill_dari_commit.md` dipertahankan (hasil ke `docs/hasil_analisa/`, tidak mengubah skill otomatis). Pipeline `alur_kerja.md` L1–L7 → L1–L6.
- Sesi 4 (2026-11-17): penyelarasan `prompt/skill/aturan-folder-prompt.md` → target (v1.2.0): zona waktu Asia/Jakarta, penggabungan aturan duplikatif, indeks skill diperbarui.
- Sesi 6 (2026-11-17): audit riwayat sesi pertama (`audit/riwayat_sesi.md`, Audit 1). Sesi 1–5 diaudit; tidak ditemukan pola kategori B/C atau kerusakan arsip; catch-up sync `Belum Sinkron` tercatat sebagai mekanisme normal (kategori A).
- Sesi 7 (2026-11-17): implementasi PRD `prd/prd_indikator_popularitas_base.md` (indikator popularitas + kurasi manual "Pilihan" pada kartu katalog `base_coc`) — seluruh kebutuhan sudah terimplementasi dalam kode; verifikasi `dart analyze` No issues dan `flutter test` 147 lulus. Status PRD diubah ke `Sudah Diimplementasikan`, berkas PRD dihapus, section A36 di `refrensi_apk.md` dibersihkan.
- Sesi 10 (2026-11-17): rename command `.kilo/commands/fitur/diskusi_fitur_baru.md` → `.kilo/commands/fitur/membuat_prd_fitur.md`; konflik `.agents/rules/lainnya.md` butir 2–3 vs butir 4 (edit skill `code` vs mismatch rujukan) diselesaikan oleh pengguna: rujukan di skill `code` tetap diperbarui.
- Sesi 10 — tunggakan terbuka: ±30 rujukan `.agents/skills/custom/...` masih usang (skill kini di `.agents/skills/code/` dan `.agents/skills/non-code/`), termasuk di dalam command `membuat_prd_fitur.md` baris 13, 30, 50; belum diperbaiki karena di luar cakupan sesi ini.
- Sesi 13 (2026-11-17): implementasi PRD A2 "Copy base link satu ketuk" — fitur sudah lengkap di kode, tidak perlu implementasi baru; hanya verifikasi dan cleanup PRD.
- Perubahan aturan/skill disertai pembaruan `prompt/` dan indeks `.agents/rules/kelompok_skill_wajib.md` bila status pembaruan berubah.

## Sumber Kebenaran Lain

- Indeks skill: `.agents/rules/kelompok_skill_wajib.md` (dan `skills-lock.json`).
- Aturan: `.agents/rules/`.
- Riwayat perubahan: `memori/riwayat_perubahan.md`.
- Jejak sesi: `memori/sesi/sesi_N.md`.