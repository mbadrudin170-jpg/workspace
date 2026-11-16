# Sesi 195

## Status
- Status: Sudah Sinkron
- Tanggal: 2026-11-16
- Command: salin_prompt_ke_target (semuanya)
- Topik: Verifikasi dan penyalinan berkas folder `prompt/` ke target masing-masing

## Catatan Sesi
Pengguna meminta pemrosesan seluruh berkas di folder `prompt/` ke target masing-masing. Telah diperiksa 12 berkas prompt; semua memiliki target. Ditemukan satu celah: skill `kelompok-skill-wajib` belum memuat poin 7 dari `prompt/skill/kelompok-skill-wajib.md` (wajib perbarui `.agents/rules/global/kelompok_skill_wajib.md` saat ada skill baru/pembaruan). Celah ditutup. Typo pada `prompt/rules/AGENTS.md` diperbaiki (kapitalisasi). Berkas target lain sudah selaras dengan poin prompt.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| .agents/skills/custom/kelompok-skill-wajib/SKILL.md | Diubah | Tambah Aturan 7 (perbarui indeks kelompok skill wajib), Larangan terkait, dan Sumber Evaluasi poin 1–7 |
| prompt/rules/AGENTS.md | Diubah | Perbaikan kapitalisasi typo (baris 2, 4, 5, 6) |
| memori/sesi/sesi_195.md | Dibuat | Berkas sesi baru |

## Sinkronisasi ke MEMORI.md
Sudah disinkronkan: MEMORI.md (header + Status Kerja), memori/riwayat_perubahan.md (entri sesi). Berkas sesi ditandai Sudah Sinkron.