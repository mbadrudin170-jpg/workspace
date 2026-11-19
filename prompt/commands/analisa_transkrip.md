diperbarui : Thu Nov 19 2026 20:29 WIB
ditimpa ke : `.kilo/commands/analisa_transkrip.md`

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya; baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturannya.

2. Baca `docs/hasil_analisa/hasil_analisa_transkrip.md`. Jika berkas kosong, atau semua id yang terdaftar sudah dianalisa: baca daftar berkas `ses_*.json` pada `~/.local/share/kilo/storage/session_diff/`; jika folder kosong/tidak ada, lapor ke pengguna dan berhenti. Untuk setiap id, catat tanggal Created At (sumber murah: waktu pembuatan berkas `session_diff/<id>.json` via `stat`/`ls -l --time-style`; bila tidak tersedia, fallback waktu `Updated` dari `kilo_local_recall` mode `search`). Tambahkan semua id tersebut ke `docs/hasil_analisa/hasil_analisa_transkrip.md` beserta tanggal Created At-nya, dengan status "belum dianalisa", agar AI tidak perlu mencari tanggal Created At berulang. Jika folder kosong/tidak ada, lapor ke pengguna dan berhenti.

3. Dari daftar di `docs/hasil_analisa/hasil_analisa_transkrip.md`, lewati id yang sudah dianalisa; ambil id belum dianalisa yang paling lama berdasarkan Created At yang tersimpan. Jika tidak ada id yang belum dianalisa, lapor ke pengguna dan berhenti.

4. Sebelum menganalisa, tampilkan id transkrip terpilih kepada pengguna dan tanyakan (tool `question`) apakah AI boleh menganalisa transkrip tersebut — khawatir transkrip masih aktif. Jika pengguna menolak atau melewati, berhenti tanpa menganalisa dan tanpa menandai id.

5. Sebelum menganalisa, baca seluruh isi transkrip dengan full dump: jika id sesi, gunakan `kilo_local_recall` mode `read` (untuk transkrip besar, delegasikan ekstraksi bukti — kutipan + lokasi — ke agen explore); jika pengguna memberikan lampiran transkrip, baca seluruhnya sampai tuntas. Dilarang menganalisa dari ringkasan/kutipan sebagian.

6. Analisa pekerjaan AI di transkrip: identifikasi kesalahan AI — tidak memuat skill yang relevan, tidak memahami command, tidak mengikuti aturan yang berlaku — serta analisa apakah kesalahan berasal dari AI atau dari commands/skills/aturan yang kurang jelas/ambigu/salah.

7. Setelah id selesai dianalisa, simpan hasil analisa ke `docs/hasil_analisa/hasil_analisa_transkrip.md` (format seperti entri yang sudah ada: ringkasan transkrip; kesalahan AI yang diidentifikasi beserta bukti/lokasi; analisa sumber kesalahan (AI vs commands/skills/aturan); saran agar AI di masa mendatang lebih pintar dan sesuai keinginan pengguna), lalu tandai id tersebut sudah dianalisa (perbarui status entri yang ada).

8. Setelah analisa transkrip selesai, laporkan kepada pengguna apakah ada saran agar AI di masa mendatang lebih pintar dan sesuai dengan keinginan pengguna.

# Skill Terkait

- memori-check
- penggunaan-tool-bawaan-kilo
