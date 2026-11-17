---
name: cek-kesehatan-sistem-kerja
description: Trigger: saat mengaudit kesehatan sistem kerja proyek (struktur, indeks skill, frontmatter skill, command, memori sesi, repositori, hasil diskusi) | Prosedur audit read-only untuk memeriksa konsistensi aset pendukung agen AI lintas proyek, mengklasifikasikan temuan GALAT/PERINGATAN, dan melaporkan hasil hanya di sesi tanpa mengubah berkas.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Cek Kesehatan Sistem Kerja

Prosedur audit portabel untuk memeriksa kesehatan sistem kerja proyek (aset pendukung agen AI: aturan, skill, command, memori, hasil diskusi, dan repositori). Audit bersifat **read-only** dan hasilnya dilaporkan hanya di sesi.

## Cakupan yang Di-Cover

- Aset: struktur folder/berkas wajib, `.agents/rules/global/kelompok_skill_wajib.md`, metadata frontmatter `SKILL.md`, berkas command `.kilo/commands/**.md`, berkas sesi `memori/sesi/sesi_N.md`, kondisi repositori teramati (submodule, pointer, `.gitignore` vs working tree), dan penomoran/pencatatan `hasil_diskusi/diskusi_N.md`.
- Keluaran: laporan temuan di sesi dengan tingkat `GALAT` dan `PERINGATAN`, tanpa berkas laporan baru.
- Referensi: `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`, `.agents/rules/global/format_hasil_diskusi.md`, skill `aturan-pembuatan-commands`, skill `aturan-pembuatan-skill`, skill `memori-check`.
- Sumber perencanaan: `hasil_diskusi/diskusi_8.md`.

## Aturan

1. Perlakukan audit sebagai pemeriksaan **read-only**: kumpulkan bukti dari berkas/struktur aktual, jangan membuat, mengubah, atau menghapus berkas apa pun.
2. Sesuaikan pemeriksaan dengan struktur aktual proyek (portabel lintas proyek); jangan mengasumsikan nama proyek, daftar skill, atau tata letak tertentu yang tidak terverifikasi.
3. Periksa tujuh aset secara berurutan: (1) struktur folder/berkas wajib, (2) konsistensi `.agents/rules/global/kelompok_skill_wajib.md`, (3) metadata frontmatter skill, (4) validasi command, (5) kesehatan memori sesi, (6) kesehatan repositori, (7) penomoran `hasil_diskusi/`.
4. Untuk setiap temuan, catat aset, tingkat, path/objek, bukti singkat, dan saran perbaikan; jangan mengarang temuan tanpa bukti.
5. Klasifikasikan temuan sebagai `GALAT` bila melanggar aturan/konsistensi dan berpotensi menyebabkan perilaku salah atau data tidak dapat dipercaya; sebagai `PERINGATAN` bila berupa potensi masalah, inkonsistensi minor, atau hal yang memerlukan konfirmasi.
6. Laporkan hasil hanya di sesi (ringkasan + tabel/daftar temuan + catatan keterbatasan); jangan menulis temuan ke `task.md` dan jangan membuat berkas laporan.
7. Gunakan tool baca yang sesuai (`read`, `glob`, `grep`) dan hindari operasi git yang mengubah state saat memeriksa repositori.
8. Sampaikan keterbatasan secara eksplisit bila berkas tidak dapat dibaca atau pemeriksaan tidak dapat diselesaikan.

## Steps

1. **Muat konteks**: baca `AGENTS.md`, `MEMORI.md`, dan muat skill relevan (`aturan-pembuatan-skill`, `aturan-pembuatan-commands`, `memori-check`) bila tersedia.
2. **Inventarisasi**: kumpulkan daftar berkas/folder untuk tujuh aset (struktur, indeks skill, folder skill, command, sesi memori, `.gitignore`/status git teramati, folder `hasil_diskusi/`).
3. **Periksa aset 1–7** berurutan:
   - Aset 1 (struktur): verifikasi keberadaan/keterbacaan berkas dan folder kunci yang dirujuk proyek.
   - Aset 2 (`.agents/rules/global/kelompok_skill_wajib.md`): cocokkan entri dengan `SKILL.md` aktual dan deteksi entri yatim atau folder skill tak terindeks.
   - Aset 3 (frontmatter skill): validasi field wajib, segmen `Trigger:` pada `description`, dan kecocokan `name` dengan folder.
   - Aset 4 (command): validasi penamaan, frontmatter `description`, tautan markdown lokal yang keliru, dan rujukan target yang tidak ada.
   - Aset 5 (memori sesi): temukan sesi `Belum Sinkron` (di luar sesi aktif bila teridentifikasi), penomoran/penamaan tidak konsisten, atau status tidak jelas.
   - Aset 6 (repositori): catat anomali submodule/pointer/`.gitignore` vs working tree dari bukti yang tersedia tanpa mengubah state git.
   - Aset 7 (`hasil_diskusi/`): validasi penomoran `diskusi_N.md` dan keselarasan daftar/nomor tertinggi dengan `MEMORI.md`.
4. **Klasifikasikan** setiap temuan ke `GALAT` atau `PERINGATAN` dengan bukti.
5. **Susun laporan**: ringkasan jumlah temuan, tabel temuan (No, Aset, Tingkat, Path/Objek, Temuan, Saran), dan catatan keterbatasan.
6. **Sampaikan laporan** di sesi dan nyatakan audit selesai; jangan melakukan perbaikan otomatis.

## Larangan

- DILARANG membuat, mengubah, atau menghapus berkas apa pun sebagai bagian dari audit.
- DILARANG menulis temuan ke `task.md` atau membuat berkas laporan di root proyek.
- DILARANG menjalankan operasi git yang mengubah state (commit, push, checkout, reset, stash, add, restore tulis, dsb.).
- DILARANG mengarang hasil pemeriksaan; temuan tanpa bukti aktual tidak boleh dilaporkan sebagai fakta.
- DILARANG mengubah `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/*.md`, `.agents/rules/global/kelompok_skill_wajib.md`, skill, command, aturan, atau kode sumber.
- DILARANG memperbaiki temuan yang ditemukan tanpa instruksi/konfirmasi pengguna pada sesi terpisah.

## Contoh Benar

```text
Ringkasan: 1 GALAT, 1 PERINGATAN (7 aset diperiksa).

| No | Aset | Tingkat | Path/Objek | Temuan | Saran |
| --- | --- | --- | --- | --- | --- |
| 1 | .agents/rules/global/kelompok_skill_wajib.md | GALAT | `.agents/rules/global/kelompok_skill_wajib.md` | Entri menunjuk `.agents/skills/non-code/contoh/SKILL.md` tetapi berkas tidak ada | Hapus entri atau pulihkan skill, lalu sinkronkan indeks |
| 2 | Command | PERINGATAN | `.kilo/commands/contoh.md` | Tidak ada frontmatter `description` | Tambahkan frontmatter `description` sesuai konvensi command |

Catatan keterbatasan: tidak ada.
```

```text
Langkah aman pemeriksaan repositori (read-only): baca hasil `git status` atau struktur `.gitmodules`/pointer submodule yang tersedia tanpa menjalankan perintah yang mengubah state.
```

## Contoh Salah

```text
Saya menemukan masalah lalu langsung memperbaiki SKILL.md dan memperbarui task.md.
```

```text
GALAT: command rusak. (tanpa path, tanpa bukti, tanpa saran)
```

```text
Menjalankan git add/reset/commit untuk merapikan temuan audit.
```

## Sumber Evaluasi

- Hasil diskusi: `hasil_diskusi/diskusi_8.md` (K-1 s.d. K-6, R-1, R-2, R-5; audit read-only, tujuh aset, laporan di sesi).
- Aturan skill: `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md` (aturan 1–18, frontmatter, segmen trigger, section wajib).
- Format hasil diskusi: `.agents/rules/global/format_hasil_diskusi.md` (konteks status/penomoran `hasil_diskusi/`).
- Skill terkait: `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`, `.agents/skills/non-code/aturan-pembuatan-commands/SKILL.md`, `.agents/skills/non-code/memori-check/SKILL.md`.
- Riwayat commit: tidak ada commit yang secara langsung menyentuh folder skill `cek-kesehatan-sistem-kerja` sebelum pembuatan ini; isi disusun dari `hasil_diskusi/diskusi_8.md` yang disepakati pengguna (bukan dari working directory/staging/untracked).
