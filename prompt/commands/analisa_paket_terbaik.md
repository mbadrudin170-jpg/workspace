diperbarui : Wed Nov 18 2026 19:22 WIB
file : [analisa_paket_terbaik](../../.kilo/commands/analisa_paket_terbaik.md)

1. Baca `AGENTS.md` dan `instructions` pada `.kilo/kilo.jsonc`; patuhi aturan yang berlaku.

2. Menganalisis paket Dart/Flutter di pub.dev. `$ARGUMENTS` dapat berupa satu atau lebih nama paket/tautan paket pub.dev. Jika pengguna memberikan lebih dari satu tautan/nama paket (misalnya 5), baca dan analisis setiap paket satu per satu secara sangat rinci (jangan digabung sekaligus tanpa analisis per paket). Jika pengguna memberikan tautan paket, identifikasi nama paket dari tautan tersebut dan lakukan analisis sangat rinci terlebih dahulu. Jika `$ARGUMENTS` kosong atau ambigu, minta pengguna menyebutkan nama paket/tautan yang jelas (jangan menebak).

3. Untuk setiap paket, wajib membaca halaman paket pub.dev (`https://pub.dev/packages/<nama_paket>`), halaman skor (`https://pub.dev/packages/<nama_paket>/score`), dan dokumentasi API (`https://pub.dev/documentation/<nama_paket>/latest/`), serta baca `docs/paket_favorit.md` untuk mengidentifikasi paket-paket sejenis yang sudah terdaftar. Kumpulkan informasi yang dapat diverifikasi: deskripsi & tujuan; masalah yang diselesaikan; cakupan paket — jelaskan secara sangat rinci apa saja yang dicakup (fitur utama, API/komponen/kelas utama, kemampuan, kasus penggunaan yang didukung, serta batasan yang tidak dicakup sejauh dapat diverifikasi); platform yang didukung; versi terbaru & status pemeliharaan; metrik pub.dev (Pub Points, Likes, Popularity/Downloads bila tersedia) dari halaman skor; serta catatan kelebihan/keterbatasan singkat. Jangan mengarang data, angka, atau tautan.

4. Sampaikan hasil analisis sangat rinci kepada pengguna untuk setiap paket, mencakup minimal: skor/metrik, masalah yang diselesaikan, dan fitur utama. Di bagian akhir, sertakan perbandingan terlebih dahulu dengan paket-paket sejenis yang terdaftar di `docs/paket_favorit.md`, lalu (bila relevan dan dapat diverifikasi) dengan paket-paket sejenis lain dan/atau antar paket yang dianalisis. Nyatakan "tidak diketahui/tidak tersedia" bila informasi tidak dapat diverifikasi.

5. Setelah menyampaikan analisis, minta izin eksplisit kepada pengguna paket mana yang perlu ditambahkan/diperbarui di `docs/paket_favorit.md`. Jangan mengubah berkas keluaran sebelum ada persetujuan.

6. Jika pengguna menyetujui: perbarui `docs/paket_favorit.md` dengan entri paket yang disetujui (tabel ringkas: Nama Paket, Link pub.dev, Link Dokumentasi, Pub Points, Likes, Popularity, Masalah yang Diselesaikan, Ringkasan cakupan, Catatan). Jika entri paket sudah ada, perbarui barisnya; jika belum, tambahkan. Susun baris tabel berdasarkan Popularity tertinggi ke terendah; entri yang Popularity-nya tidak tersedia/tidak dapat diverifikasi ditempatkan di bagian bawah. Buat header tabel bila berkas masih kosong.

7. Laporkan ringkasan hasil analisis dan sebutkan apakah `docs/paket_favorit.md` diperbarui (dan untuk paket mana).
