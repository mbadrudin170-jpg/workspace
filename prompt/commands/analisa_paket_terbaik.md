diperbarui : Wed Nov 18 2026 18:49 WIB
file : [analisa_paket_terbaik](../../.kilo/commands/analisa_paket_terbaik.md)

1. Baca `AGENTS.md` dan `instructions` pada `.kilo/kilo.jsonc`; patuhi aturan yang berlaku.

2. Menganalisis paket Dart/Flutter di pub.dev. Nama paket diambil dari `$ARGUMENTS`; jika kosong atau ambigu, minta pengguna menyebutkan nama paket (jangan menebak).

3. Kumpulkan informasi yang dapat diverifikasi: deskripsi & tujuan, cakupan/fitur utama yang disediakan paket, platform yang didukung, versi terbaru & status pemeliharaan, tautan halaman paket pub.dev (`https://pub.dev/packages/<nama_paket>`), tautan dokumentasi API paket (contoh: `https://pub.dev/documentation/<nama_paket>/latest/`), serta metrik pub.dev (Pub Points, Likes, Popularity/Downloads bila tersedia) yang wajib dibaca dari halaman skor paket `https://pub.dev/packages/<nama_paket>/score` (contoh: `https://pub.dev/packages/stack_trace/score`), dan catatan kelebihan/keterbatasan singkat. Jangan mengarang data, angka, atau tautan.

4. Sampaikan ringkasan hasil analisis, lalu minta izin eksplisit kepada pengguna apakah paket perlu ditambahkan/diperbarui di `docs/paket_favorit.md`. Jangan mengubah berkas keluaran sebelum ada persetujuan.

5. Jika pengguna menyetujui: perbarui `docs/paket_favorit.md` dengan entri paket tersebut (tabel ringkas: Nama Paket, Link pub.dev, Link Dokumentasi, Pub Points, Likes, Popularity, Ringkasan cakupan, Catatan). Jika entri paket sudah ada, perbarui barisnya; jika belum, tambahkan. Susun baris tabel berdasarkan Popularity tertinggi ke terendah; entri yang Popularity-nya tidak tersedia/tidak dapat diverifikasi ditempatkan di bagian bawah. Buat header tabel bila berkas masih kosong.

6. Laporkan ringkasan hasil analisis dan sebutkan apakah `docs/paket_favorit.md` diperbarui; nyatakan "tidak diketahui/tidak tersedia" bila informasi tidak dapat diverifikasi.
