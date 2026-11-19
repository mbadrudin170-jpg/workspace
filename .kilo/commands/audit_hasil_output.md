description: Membaca seluruh isi berkas di folder tool-output Kilo dan melaporkan kesalahan yang dilakukan agen AI.

# Audit Hasil Output

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Tentukan folder target: `~/.local/share/kilo/tool-output/` (path absolut: `/home/warkopalic35/.local/share/kilo/tool-output/`). Jangan gunakan path `/` (root filesystem) karena salah.
3. Baca seluruh isi berkas di folder tersebut (gunakan tool Read/Glob; jangan `cat` massal via shell). Catat nama berkas, ukuran, dan ringkasan isi.
4. Identifikasi kesalahan yang dilakukan agen AI berdasarkan isi berkas (mis. perintah yang gagal, path salah, output error). Jangan mengarang.
5. Laporkan hasil ke pengguna: daftar berkas dibaca, ringkasan temuan, dan kesimpulan kesalahan (jika ada).
6. Jangan mengubah berkas apa pun; hanya laporan. Dilarang commit/push.
