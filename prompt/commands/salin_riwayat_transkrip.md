diperbarui : Sat Nov 21 2026 16:50 WIB
ditimpa ke : `.kilo/commands/salin_riwayat_transkrip.md`

description: Menyalin riwayat sesi (memori/sesi/) dan ID transkrip ke file output.

# Salin Riwayat Transkrip

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `id_transkrip.txt` di root proyek; identifikasi semua ID transkrip yang statusnya `Belum Disalin` (bukan transkrip sesi saat ini).
3. Gunakan tool `kilo_local_recall` (mode `search` dengan query ID transkrip, lalu mode `read` untuk setiap sesi) untuk membaca **SELURUH ISI TRANSKRIP** sesi yang sesuai ID `Belum Disalin` (tidak ringkasan, tidak dibatasi).
4. Gabungkan **SELURUH hasil pembacaan** + `docs/perintah_analisa.md` ke file output (default: `hasil_riwayat_sesi.txt`).
5. Setelah selesai, perbarui **hanya status** ID transkrip tersebut di `id_transkrip.txt` menjadi `Sudah Disalin` — **jangan menghapus atau mengubah ID transkrip yang sudah ada**.
6. Tampilkan ringkasan hasil (jumlah baris, file output, ID transkrip yang disalin).
7. Jika tidak ada ID transkrip dengan status `Belum Disalin`, tampilkan pesan "Tidak ada transkrip baru untuk disalin" dan hentikan.

# Skill Terkait

- memori-check
- aturan-folder-prompt
