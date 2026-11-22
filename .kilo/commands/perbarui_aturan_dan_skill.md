---
description: Menambahkan aturan baru ke code.md dan skill terkait (beserta contoh kode benar dan pembaruan deskripsi skill), lalu menyinkronkan prompt/commands/muat_skill_terkait.md dan .kilo/commands/muat_skill_terkait.md, tanpa menghapus poin aturan yang sudah ada.
agent: code
---

# Perbarui Aturan dan Skill

## Tujuan

Menambahkan aturan baru ke `.agents/rules/code.md` dan skill terkait, beserta contoh kode benar dan pembaruan deskripsi skill, lalu menyinkronkan `prompt/commands/muat_skill_terkait.md` dan `.kilo/commands/muat_skill_terkait.md`.

## Ketentuan (WAJIB dipatuhi)

1. **Baca dulu** `.agents/rules/code.md` secara **utuh** (tanpa offset/limit) sebelum bertindak, agar tidak menghapus poin aturan yang tidak relevan/sudah ada.
2. **Jangan hapus** poin aturan yang sudah ada di `code.md`. Hanya **tambahkan** aturan baru dengan nomor lanjutan (nomor tertinggi + 1), atau perbarui poin yang memang secara eksplisit diminta.
3. Jika menambah aturan, **append** di akhir berkas; jangan menimpa/mengganti seluruh isi.
4. Sebelum menyunting, catat nomor aturan tertinggi yang ada; aturan baru memakai nomor berikutnya.
5. Muat skill terkait (via tool `skill`) dan perbarui deskripsi skill bila diperlukan; tambahkan contoh kode benar di skill/aturan.
6. Setelah selesai, **sinkronkan** `prompt/commands/muat_skill_terkait.md` dan `.kilo/commands/muat_skill_terkait.md` (deskripsi skill yang berubah, jumlah skill, tanggal).
7. Verifikasi akhir: `code.md` masih memuat semua aturan lama (jumlah poin tidak berkurang) + aturan baru.
8. Gunakan bahasa Indonesia baku.
9. **Setelah menyunting**, baca ulang berkas `code.md` dan skill terkait secara utuh untuk memastikan tidak ada poin aturan yang terhapus atau tergantikan; jika ada poin yang hilang, pulihkan segera sebelum melapor selesai. Verifikasi jumlah poin (nomor tertinggi) sesuai dengan yang diharapkan.

## Larangan

- DILARANG menimpa/mengganti seluruh isi `code.md` atau menghapus poin yang tidak diminta.
- DILARANG mengubah nomor aturan yang sudah ada.
- DILARANG menyinkronkan berkas command dengan menghapus entri skill.
- DILARANG melaporkan selesai sebelum membaca ulang berkas yang disunting dan memverifikasi semua poin lama masih ada.