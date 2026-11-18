---
description: Menganalisis paket pub.dev dan memperbarui docs/paket_favorit.md.
---

# Analisa Paket Terbaik

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Nama paket diambil dari `$ARGUMENTS`. Jika `$ARGUMENTS` kosong atau ambigu, minta pengguna menyebutkan nama paket yang jelas; jangan menebak.
4. Analisis paket Dart/Flutter pada pub.dev dan kumpulkan informasi yang dapat diverifikasi:
   - deskripsi dan tujuan paket,
   - cakupan/fitur utama yang disediakan,
   - platform yang didukung,
   - versi terbaru dan status pemeliharaan,
   - tautan halaman paket pub.dev (`https://pub.dev/packages/<nama_paket>`),
   - tautan dokumentasi API paket (contoh format: `https://pub.dev/documentation/<nama_paket>/latest/`),
   - metrik pub.dev: Pub Points, Likes, Popularity/Downloads (bila tersedia),
   - kelebihan/keterbatasan singkat yang relevan.
5. Jangan mengarang data, angka, atau tautan. Jika informasi tidak dapat diverifikasi, tulis "tidak diketahui" atau "tidak tersedia".
6. Sampaikan ringkasan hasil analisis kepada pengguna, lalu minta izin eksplisit apakah paket perlu ditambahkan atau diperbarui di `docs/paket_favorit.md` (gunakan tool `question` bila sesuai). Jangan mengubah `docs/paket_favorit.md` sebelum ada persetujuan.
7. Jika pengguna menyetujui, perbarui `docs/paket_favorit.md`:
   - jika berkas kosong, buat tabel dengan kolom: `| Nama Paket | Link pub.dev | Link Dokumentasi | Pub Points | Likes | Popularity | Ringkasan Cakupan | Catatan |` beserta baris pemisah,
   - jika entri paket sudah ada, perbarui barisnya; jika belum, tambahkan baris baru.
8. Laporkan ringkasan analisis dan sebutkan apakah `docs/paket_favorit.md` diperbarui.

# Skill Terkait

- penggunaan-tool-question
