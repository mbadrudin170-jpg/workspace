diperbarui : Wed Nov 18 2026 18:18 WIB
file : [analisa_paket_terbaik](../../.kilo/commands/analisa_paket_terbaik.md)

1. Baca `AGENTS.md` dan `instructions` pada `.kilo/kilo.jsonc`; patuhi aturan yang berlaku.

2. Menganalisis paket Dart/Flutter di pub.dev. Nama paket diambil dari `$ARGUMENTS`; jika kosong atau ambigu, minta pengguna menyebutkan nama paket (jangan menebak).

3. Kumpulkan informasi yang dapat diverifikasi: deskripsi & tujuan, cakupan/fitur utama yang disediakan paket, platform yang didukung, versi terbaru & status pemeliharaan, tautan dokumentasi API paket (contoh: `https://pub.dev/documentation/<nama_paket>/latest/`), metrik pub.dev (Pub Points, Likes, Popularity/Downloads bila tersedia), serta catatan kelebihan/keterbatasan singkat. Jangan mengarang data, angka, atau tautan.

4. Keluaran: perbarui `docs/paket_favorit.md` dengan entri paket tersebut (tabel ringkas: Nama Paket, Link pub.dev, Link Dokumentasi, Pub Points, Likes, Popularity, Ringkasan cakupan, Catatan). Jika entri paket sudah ada, perbarui barisnya; jika belum, tambahkan. Buat header tabel bila berkas masih kosong.

5. Laporkan ringkasan hasil analisis dan sebutkan berkas yang diperbarui; nyatakan "tidak diketahui/tidak tersedia" bila informasi tidak dapat diverifikasi.
