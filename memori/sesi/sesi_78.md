# Sesi 78 — Penyederhanaan Aturan Rujukan Skill

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 03:00 WIB (sesi 78)
- Topik: Tindak lanjut sesi 77 — pengguna meminta `.agents/rules/global/rujukan_skill.md` disederhanakan menjadi daftar pemetaan topik→skill.

## Catatan Sesi

- Membaca `MEMORI.md` (sudah dibaca sesi 77; interaksi lanjutan pada percakapan yang sama).
- Pengguna menolak bentuk aturan panjang sesi 77; umpan balik: "harusnya begini saja untuk file ini" dengan contoh satu baris: `saya ingin menggunakan riverpod maka gunakan skill .agents/skills/custom/riverpod-pola/SKILL.md`.
- Klarifikasi via tool `question` (2026-11-15): (1) bentuk berkas = daftar pemetaan topik→skill (bukan satu baris saja); (2) cakupan = semua skill custom di `SKILLS_INDEX.md` (61 skill); (3) format = hanya daftar, tanpa bagian Tujuan/Larangan/Alur Kerja.
- Berkas `.agents/rules/global/rujukan_skill.md` ditulis ulang: H1 `# Rujukan Skill (Global)` + 61 baris pemetaan satu baris per skill custom (`saya ingin <trigger> maka gunakan skill <path>`), diambil dari trigger pada `SKILLS_INDEX.md` (entri 1–61); entri `memori-check` ditulis sebagai "untuk setiap interaksi apa pun di proyek mana pun maka gunakan skill ...".
- Tindak lanjut (format yang mudah dibaca, permintaan pengguna 2026-11-15): berkas ditulis ulang lagi menjadi tabel Markdown dua kolom (`Saya ingin …` | `Gunakan skill …`), 61 baris, path dalam backtick; tanpa bagian naratif lainnya.
- `AGENTS.md` tetap tidak diubah (penolakan pengguna pada sesi 77 tidak dicabut).
- Berkas sesi 77 berstatus `Sudah Sinkron` sehingga tidak diubah; tindak lanjut ini dicatat di berkas sesi ini.
- Tidak ada kode Dart yang diubah; belum ada commit.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/rujukan_skill.md` | Diubah | Tabel Markdown 2 kolom (Saya ingin … | Gunakan skill …), 61 baris; sebelumnya daftar satu baris per skill |
| `MEMORI.md` | Diubah | Status kerja dan sumber kebenaran diperbarui (sesi 78) |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru (teratas) |
| `memori/sesi/sesi_78.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

Sinkronisasi selesai pada 2026-11-15 (sesi 78): bagian `Status Kerja` dan `Konvensi & Sumber Kebenaran` pada `MEMORI.md` diperbarui — `rujukan_skill.md` kini berupa tabel Markdown dua kolom (`Saya ingin …` | `Gunakan skill …`, 61 baris dari `SKILLS_INDEX.md`); header `MEMORI.md` → `Diperbarui: Sun Nov 15 2026 03:00 WIB (sesi 78)`. `memori/riwayat_perubahan.md` ditambah entri (teratas). `AGENTS.md` tidak diubah. Berkas sesi lama `Sudah Sinkron` tidak diubah.
