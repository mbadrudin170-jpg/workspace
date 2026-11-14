# Sesi 77 — Sapaan Awal dan Pembuatan Aturan Rujukan Skill

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 02:55 WIB (sesi 77)
- Topik: Pengguna menyapa, lalu meminta pembuatan berkas aturan global baru tentang kewajiban memuat skill yang relevan (contoh: ingin memakai Riverpod → wajib sertakan skill relevan).

## Catatan Sesi

- Membaca `MEMORI.md`; catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron` pada `memori/sesi/` tidak menemukan berkas `Belum Sinkron` (kecocokan awal bersifat subteks historis di `sesi_49.md`, `sesi_62.md`, `sesi_70.md`, `sesi_71.md`, `sesi_76.md` — semuanya `Sudah Sinkron`). Tidak ada catch-up yang perlu dilakukan.
- Pengguna awalnya hanya menyapa ("hai"), lalu meminta "saya ingin membuat file aturan baru".
- Klarifikasi via tool `question` (2026-11-15):
  1. Interpretasi pertama ("aturan rujuk skill pada command, mirip aturan 16 pembuatan-command-kilo") ditolak pengguna; yang dimaksud: "semisal saya ingin menggunakan riverpod nah disini harus sertakan skill yang relevan nya gitu".
  2. Isi aturan: wajib memuat skill relevan dari `SKILLS_INDEX.md` sebelum mengerjakan topik (opsi "Wajib muat skill").
  3. Nama berkas: `.agents/rules/global/rujukan_skill.md`.
  4. Cakupan: semua jenis pekerjaan (bukan khusus kode).
  5. Backfill aturan lama (`alur_git_commit.md`, `format_hasil_diskusi.md`): tidak.
  6. Dimasukkan ke `AGENTS.md`: ya — namun saat eksekusi pengguna menolak edit `AGENTS.md` dengan umpan balik "jangan dulu ubah agent"; `AGENTS.md` TIDAK diubah.
- Berkas dibuat: `.agents/rules/global/rujukan_skill.md` (tujuan, cakupan, aturan 1–9, contoh penerapan — Riverpod → `riverpod-pola`, dll., larangan, alur kerja, contoh benar/salah, sumber evaluasi).
- `AGENTS.md` tidak disentuh (penolakan eksplisit pengguna). Blok `// FILE: .agents/rules/global/rujukan_skill.md` belum ditambahkan; `kilo.jsonc` instructions juga belum ditambah (di luar permintaan).
- Temuan sampingan (dikoreksi di MEMORI.md): klaim bahwa `.kilo/` ter-`.gitignore` tidak sesuai kondisi terkini — root `.gitignore` hanya berisi satu baris kosong; `.kilo/commands/**` terlacak git; sebagian `.kilo/` di-ignore via `.kilo/.gitignore`. Folder `.agents/rules/proyek/` tidak ditemukan.
- Tidak ada kode Dart yang diubah; belum ada commit.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/rujukan_skill.md` | Dibuat | Aturan global wajib muat skill relevan |
| `MEMORI.md` | Diubah | Header tanggal; struktur direktori; aturan operasional poin 2; status kerja; sumber kebenaran |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru (teratas) |
| `memori/sesi/sesi_77.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

Sinkronisasi selesai pada 2026-11-15 (sesi 77): header `MEMORI.md` (`Diperbarui: Sun Nov 15 2026 02:55 WIB (sesi 77)`), `Struktur Direktori` (global rules + `rujukan_skill.md`, folder `.agents/rules/proyek/` ditandai tidak ditemukan, `.kilo/` dikoreksi), `Aturan Operasional` poin 2 (koreksi klaim `.gitignore`), `Status Kerja` (entri aturan baru + temuan), `Konvensi & Sumber Kebenaran` (entri aturan rujukan skill), dan `memori/riwayat_perubahan.md` (entri teratas) diperbarui. `AGENTS.md` tidak diubah (penolakan pengguna). Berkas sesi lama `Sudah Sinkron` tidak diubah.
