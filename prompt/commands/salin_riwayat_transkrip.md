diperbarui : Sat Nov 21 2026 16:34 WIB
ditimpa ke : `.kilo/commands/salin_riwayat_transkrip.md`

description: Menyalin riwayat sesi (memori/sesi/) dan ID transkrip ke file output.

# Salin Riwayat Transkrip

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `id_transkrip.txt` di root proyek; identifikasi semua ID transkrip yang statusnya `Belum Disalin` (bukan transkrip sesi saat ini).
3. Gunakan tool `bash` untuk menyalin seluruh isi `memori/sesi/sesi_*.md` yang sesuai dengan ID transkrip `Belum Disalin` + `docs/perintah_analisa.md` ke file output (default: `hasil_riwayat_sesi.txt`).
4. Setelah selesai, perbarui status ID transkrip tersebut di `id_transkrip.txt` menjadi `Sudah Disalin`.
5. Tampilkan ringkasan hasil (jumlah baris, file output, ID transkrip yang disalin).
6. Jika tidak ada ID transkrip dengan status `Belum Disalin`, tampilkan pesan "Tidak ada transkrip baru untuk disalin" dan hentikan.

# Skill Terkait

- memori-check
- aturan-folder-prompt