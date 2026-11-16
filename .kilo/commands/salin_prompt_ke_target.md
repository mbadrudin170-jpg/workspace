---
description: Memeriksa dan menyalin poin-poin dari berkas di folder `prompt/` ke target masing-masing (skill, aturan, command) sesuai aturan pembuatan, dengan konfirmasi cakupan dan perbaikan typo/poin ambigu sebelum menimpa.
agent: code
---

# Salin Prompt ke Target

## Tujuan

Memeriksa apakah seluruh berkas di folder `prompt/` sudah ditimpa ke target masing-masing, lalu menyalin/menyelaraskan poin-poin penting dari sumber (`prompt/`) ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`) sesuai skill pembuatan yang relevan, dengan konfirmasi cakupan dan perbaikan typo/poin ambigu sebelum menimpa.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh interaksi dan laporan.
3. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`) untuk membaca berkas; gunakan perintah shell hanya bila diperlukan.
4. Muat skill `memori-check` (baca `MEMORI.md` sebelum bekerja dan perbarui setelahnya; catat sesi di `memori/sesi/sesi_N.md`).
5. Muat skill `aturan-folder-prompt` untuk validasi header/target setiap berkas di `prompt/`.
6. Skill terkait pembuatan target dimuat sesuai lokasi sumber:
   - `prompt/commands/` → `aturan-pembuatan-commands`.
   - `prompt/rules/` → `aturan-pembuatan-rules`.
   - `prompt/skill/` → `aturan-pembuatan-skill`.
7. Tidak ada skill terkait lain yang trigger-nya terpenuhi; nyatakan secara eksplisit bila tidak ada.

## Cakupan

- Semua berkas di folder `prompt/` dan subfoldernya (`prompt/skill/`, `prompt/rules/`, `prompt/commands/`, `prompt/mode/` bila ada).
- Target masing-masing berkas: `.agents/skills/custom/<nama>/SKILL.md`, `.agents/rules/global/<nama>.md`, `.kilo/commands/<nama>.md`, `.kilo/commands/mode/<nama>.md`, atau `AGENTS.md` (root) sesuai header target berkas sumber.
- Berkas yang boleh diubah: berkas target yang ditentukan oleh header sumber, berkas sumber di `prompt/` (perbaikan typo/poin ambigu), serta berkas memori (`MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_N.md`).

## Parameter

- `$ARGUMENTS` (opsional): daftar nama/path berkas di `prompt/` yang ingin diproses, atau kata kunci `semuanya` untuk memproses seluruh berkas. Jika kosong, WAJIB gunakan tool `question` untuk menanyakan cakupan kepada pengguna sebelum memulai (proses semua atau beberapa).

## Alur Kerja

Urutan pemrosesan per folder (kerjakan satu folder tuntas sebelum pindah): `prompt/skill/` → `prompt/rules/` → `prompt/commands/` → `prompt/mode/` (bila ada).

Kewajiban progres: setelah satu folder selesai, laporkan daftar berkas yang diproses dan celah yang ditutup sebelum lanjut ke folder berikutnya. Bila satu langkah tidak menghasilkan keluaran, **STOP** dan laporkan.

1. **Analyze** — daftar seluruh berkas di `prompt/` (via `glob` pola `prompt/**/*`). Untuk setiap berkas, baca header `diperbarui :` dan target (`ditimpa ke :` / `file :`). Jika sebuah berkas tidak menyertakan target, **STOP** dan laporkan berkas tersebut.
2. **Konfirmasi cakupan** — jika `$ARGUMENTS` kosong, tanyakan pengguna (tool `question`): proses semua berkas atau hanya beberapa (sebutkan nama). Jika pengguna memilih beberapa, minta daftar nama/path.
3. **Plan** — untuk setiap berkas sumber yang akan diproses:
   - Baca sumber terlebih dahulu.
   - Perbaiki typo, poin ambigu, atau poin yang kurang jelas pada sumber agar AI tidak salah langkah.
   - Tentukan skill pembuatan yang relevan berdasarkan lokasi (`prompt/commands/`, `prompt/rules/`, `prompt/skill/`).
   - Baca target terkait (jika ada) untuk memeriksa apakah poin sumber sudah tercermin.
4. **Execute** — timpa/selaraskan target dengan poin sumber yang telah diperbaiki, mengikuti skill pembuatan yang relevan:
   - Jangan memasukkan catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta link referensi) ke target.
   - Pastikan target mencakup seluruh poin sumber; tambahkan poin yang belum tercermin; perbaiki typo/ambigu pada target.
   - Pertahankan struktur/format target (frontmatter untuk skill/command, struktur aturan untuk rules) sesuai skill pembuatan.
5. **Review** — baca ulang sumber dan target untuk verifikasi; laporkan berkas yang diproses, celah yang ditutup, dan perbaikan yang dilakukan.

## Format Laporan

- Daftar berkas sumber yang diproses (path).
- Per berkas: target, status (sudah selaras / ditimpa / celah ditutup), perbaikan typo/ambigu.
- Ringkasan perbaikan pada sumber (prompt) dan target.
- Berkas yang tidak diproses (jika ada) dan alasannya.

## Larangan

- DILARANG menimpa target tanpa membaca sumber terlebih dahulu.
- DILARANG memproses berkas tanpa target; jika ditemukan, **STOP** dan laporkan.
- DILARANG memasukkan catatan "hanya untuk penulis prompt" atau link referensi dari sumber ke target.
- DILARANG mengubah kode sumber Dart, konfigurasi, atau berkas lain di luar cakupan.
- DILARANG commit/push tanpa perintah eksplisit pengguna.
- DILARANG mengarang path/isi target yang tidak terverifikasi.

## Kriteria Selesai / STOP

- Selesai bila seluruh berkas yang dipilih telah diperiksa, target selaras dengan poin sumber (setelah perbaikan), dan laporan disampaikan.
- STOP bila ditemukan berkas tanpa target, cakupan tidak jelas, atau verifikasi gagal; sebutkan alasan dan tindakan yang disarankan.
