# Sesi 4

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-17 (WIB)
- Command: /salin_prompt_ke_target
- Topik: Periksa dan selaraskan seluruh berkas di folder `prompt/` ke target masing-masing.

## Catatan Sesi

- Awal sesi: membaca `MEMORI.md`, seluruh berkas `.agents/rules/` (`format_hasil_diskusi.md`, `kelompok_skill_wajib.md`, `lainnya.md`, `pengelolaan_konflik.md`), dan memori sesi; memuat skill `memori-check` dan `aturan-folder-prompt`.
- Checklist awal sesi: MEMORI.md ✓, rules ✓, sesi_4 dibuat ✓, memori-check ✓.
- Parameter `$1` kosong → konfirmasi cakupan (tool `question`): pengguna memilih "Beberapa berkas saja" dan menetapkan `prompt/skill/aturan-folder-prompt.md`.
- Analyze: `prompt/skill/aturan-folder-prompt.md` memiliki header `diperbarui` dan `file` (target) → valid. Target `.agents/skills/non-code/aturan-folder-prompt/SKILL.md` ada.
- Plan: memuat `aturan-pembuatan-skill` (lokasi sumber `prompt/skill/`). Membandingkan sumber vs target: sumber memuat poin zona waktu Asia/Jakarta dan kewajiban perbarui tanggal; target masih duplikatif (aturan 1/8 duplikat tanggal, 5/8 duplikat poin ringkas) dan belum eksplisit zona waktu WIB.
- Execute: target diselaraskan (frontmatter diperbarui ke v1.2.0, `diperbarui` 21:55 WIB, deskripsi ditambah zona waktu, aturan digabung/dirapikan; contoh & larangan tetap valid). Indeks `.agents/rules/kelompok_skill_wajib.md` diperbarui untuk entri `aturan-folder-prompt`. Header sumber diselaraskan ke 21:55 WIB. Catatan "hanya untuk penulis prompt" tidak dimasukkan ke target.
- Review: sumber dan target dibaca ulang; poin sumber tercermin di target.

## Berkas Terdampak

| Lokasi File                                           | Status Perubahan | Deskripsi                                                                                                                       |
| ----------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| memori/sesi/sesi_4.md                                 | Dibuat           | Berkas sesi untuk pencatatan tugas salin prompt ke target                                                                       |
| prompt/skill/aturan-folder-prompt.md                  | Diubah           | Header `diperbarui` diselaraskan ke 21:55 WIB                                                                                   |
| .agents/skills/non-code/aturan-folder-prompt/SKILL.md | Diubah           | Diselaraskan dengan poin sumber: zona waktu WIB, kewajiban perbarui tanggal, penggabungan aturan duplikatif; frontmatter v1.2.0 |
| .agents/rules/kelompok_skill_wajib.md                 | Diubah           | Status diperbarui entri `aturan-folder-prompt` → 21:55 WIB                                                                      |

## Sinkronisasi ke MEMORI.md

- `MEMORI.md` (sesi 5, catch-up): `Status` — sesi terakhir `sesi_4.md` (Sudah Sinkron) dengan ringkasan penyelarasan `aturan-folder-prompt` v1.2.0 (zona waktu Asia/Jakarta).
- `memori/riwayat_perubahan.md` (sesi 5, catch-up): entri sesi 4 ditambahkan.
- Status: `Belum Sinkron` → `Sudah Sinkron` (catch-up, sesi 5).
