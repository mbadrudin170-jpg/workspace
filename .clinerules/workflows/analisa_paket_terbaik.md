---
description: Menganalisis paket pub.dev dan memperbarui docs/paket_favorit.md.
---

# Analisa Paket Terbaik

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. `$ARGUMENTS` dapat berupa satu atau lebih nama paket/tautan paket pub.dev. Jika pengguna memberikan lebih dari satu tautan/nama paket (misalnya 5), baca dan analisis setiap paket satu per satu secara sangat rinci (jangan digabung sekaligus tanpa analisis per paket). Jika pengguna memberikan tautan paket, identifikasi nama paket dari tautan tersebut dan lakukan analisis sangat rinci terlebih dahulu. Jika `$ARGUMENTS` kosong atau ambigu, minta pengguna menyebutkan nama paket/tautan yang jelas; jangan menebak.
4. Untuk setiap paket, wajib membaca halaman paket pub.dev (`https://pub.dev/packages/<nama_paket>`), halaman skor (`https://pub.dev/packages/<nama_paket>/score`), dan dokumentasi API (`https://pub.dev/documentation/<nama_paket>/latest/`), serta baca `docs/paket_favorit.md` untuk mengidentifikasi paket-paket sejenis yang sudah terdaftar. Kumpulkan informasi yang dapat diverifikasi:
   - deskripsi dan tujuan paket,
   - masalah yang diselesaikan,
   - cakupan paket — jelaskan secara sangat rinci apa saja yang dicakup (fitur utama, API/komponen/kelas utama, kemampuan, kasus penggunaan yang didukung, serta batasan yang tidak dicakup sejauh dapat diverifikasi),
   - platform yang didukung,
   - versi terbaru dan status pemeliharaan,
   - tautan halaman paket pub.dev dan tautan dokumentasi API,
   - metrik pub.dev: Pub Points, Likes, Popularity/Downloads (bila tersedia) — wajib dibaca dari halaman skor,
   - kelebihan/keterbatasan singkat yang relevan.
5. Jangan mengarang data, angka, atau tautan. Jika informasi tidak dapat diverifikasi, tulis "tidak diketahui" atau "tidak tersedia".
6. Sampaikan hasil analisis sangat rinci kepada pengguna untuk setiap paket, mencakup minimal: skor/metrik, masalah yang diselesaikan, dan fitur utama. Di bagian akhir, sertakan perbandingan terlebih dahulu dengan paket-paket sejenis yang terdaftar di `docs/paket_favorit.md`, lalu (bila relevan dan dapat diverifikasi) dengan paket-paket sejenis lain dan/atau antar paket yang dianalisis.
7. Setelah menyampaikan analisis, minta izin eksplisit kepada pengguna paket mana yang perlu ditambahkan atau diperbarui di `docs/paket_favorit.md` (gunakan tool `question` bila sesuai). Jangan mengubah `docs/paket_favorit.md` sebelum ada persetujuan.
8. Jika pengguna menyetujui, perbarui `docs/paket_favorit.md`:
   - jika berkas kosong, buat tabel dengan kolom: `| Nama Paket | Link pub.dev | Link Dokumentasi | Pub Points | Likes | Popularity | Masalah yang Diselesaikan | Ringkasan Cakupan | Catatan |` beserta baris pemisah,
   - jika entri paket sudah ada, perbarui barisnya; jika belum, tambahkan baris baru,
   - susun baris tabel berdasarkan Popularity tertinggi ke terendah; entri yang Popularity-nya tidak tersedia/tidak dapat diverifikasi ditempatkan di bagian bawah.
9. Laporkan ringkasan analisis dan sebutkan apakah `docs/paket_favorit.md` diperbarui (dan untuk paket mana).

# Skill Terkait

- penggunaan-tool-question
