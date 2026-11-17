# MEMORI

Diperbarui: 2026-11-17 (sesi 7)

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

- Sesi terakhir: `memori/sesi/sesi_7.md` (Sudah Sinkron) — implementasi PRD indikator popularitas base; audit riwayat sesi inkremental (Audit 1): 5 sesi diaudit (`sesi_1`–`sesi_5`), 1 dilewati (`sesi_6` aktif), 0 berkas hilang; klasifikasi A=4 B=0 C=0, tidak ada rekomendasi B/C. Ledger: `audit/riwayat_sesi.md`.

## Catatan Teknis

- Sesi 1 (2026-11-17): pemisahan skill code/non-code (51 code, 16 non-code), pemindahan `.agents/rules/global/` → `.agents/rules/`, penyelarasan referensi; konflik aturan menghentikan penyelarasan lanjutan.
- Sesi 3 (2026-11-17): evaluasi command commit→skill. Command `analisa_commit_skill.md` dihapus (langsung memperbarui skill, dianggap berbahaya), `evaluasi_code_yang_baru_dicommit.md` dihapus. Command `evaluasi_skill_dari_commit.md` dipertahankan (hasil ke `docs/hasil_analisa/`, tidak mengubah skill otomatis). Pipeline `alur_kerja.md` L1–L7 → L1–L6.
- Sesi 4 (2026-11-17): penyelarasan `prompt/skill/aturan-folder-prompt.md` → target (v1.2.0): zona waktu Asia/Jakarta, penggabungan aturan duplikatif, indeks skill diperbarui.
- Sesi 6 (2026-11-17): audit riwayat sesi pertama (`audit/riwayat_sesi.md`, Audit 1). Sesi 1–5 diaudit; tidak ditemukan pola kategori B/C atau kerusakan arsip; catch-up sync `Belum Sinkron` tercatat sebagai mekanisme normal (kategori A).
- Sesi 7 (2026-11-17): implementasi PRD `prd/prd_indikator_popularitas_base.md` (indikator popularitas + kurasi manual "Pilihan" pada kartu katalog `base_coc`) — seluruh kebutuhan sudah terimplementasi dalam kode; verifikasi `dart analyze` No issues dan `flutter test` 147 lulus. Status PRD diubah ke `Sudah Diimplementasikan`, berkas PRD dihapus, section A36 di `refrensi_apk.md` dibersihkan.
- Perubahan aturan/skill disertai pembaruan `prompt/` dan indeks `.agents/rules/kelompok_skill_wajib.md` bila status pembaruan berubah.

## Sumber Kebenaran Lain

- Indeks skill: `.agents/rules/kelompok_skill_wajib.md` (dan `skills-lock.json`).
- Aturan: `.agents/rules/`.
- Riwayat perubahan: `memori/riwayat_perubahan.md`.
- Jejak sesi: `memori/sesi/sesi_N.md`.