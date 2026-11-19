---
description: Ambil id transkrip Kilo tertua yang belum dianalisa dari storage session_diff.
---

# Analisa Transkrip

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya; baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturannya.

2. Baca `docs/hasil_analisa/hasil_analisa_transkrip.md`. Jika berkas kosong, atau semua id yang terdaftar sudah dianalisa: baca daftar berkas `ses_*.json` pada `~/.local/share/kilo/storage/session_diff/`; jika folder kosong/tidak ada, lapor ke pengguna dan berhenti. Untuk setiap id, catat tanggal Created At (sumber murah: waktu pembuatan berkas `session_diff/<id>.json` via `stat`/`ls -l --time-style`; bila tidak tersedia, fallback waktu `Updated` dari `kilo_local_recall` mode `search`). Tambahkan semua id tersebut ke `docs/hasil_analisa/hasil_analisa_transkrip.md` beserta tanggal Created At-nya dan nama topiknya (mis. baris `- Topik: <judul sesi>`), dengan status "belum dianalisa", agar AI tidak perlu mencari tanggal/topik berulang. Sebelum menambahkan id baru ke daftar, periksa ketersediaan transkrip via `kilo_local_recall` mode `read`; id yang tidak tersedia dan tidak ada lampiran tidak perlu ditambahkan (atau langsung hapus per poin 9). (Jika folder kosong/tidak ada, lapor ke pengguna dan berhenti.)

3. Dari daftar di `docs/hasil_analisa/hasil_analisa_transkrip.md`, lewati id yang sudah dianalisa; ambil id belum dianalisa yang paling lama berdasarkan Created At yang tersimpan. Jika tidak ada id yang belum dianalisa, lapor ke pengguna dan berhenti.

4. Sebelum menganalisa, tampilkan id transkrip terpilih kepada pengguna dan tanyakan (tool `question`) apakah AI boleh menganalisa transkrip tersebut — khawatir transkrip masih aktif. Jika pengguna menolak atau melewati, berhenti tanpa menganalisa dan tanpa menandai id.

5. Sebelum menganalisa, baca seluruh isi transkrip dengan full dump: jika id sesi, gunakan `kilo_local_recall` mode `read` dan baca seluruhnya sampai tuntas (jangan gunakan sub-agent/agen explore untuk membaca transkrip — baca langsung agar tepat; untuk transkrip besar, baca bertahap dengan offset/limit, jangan delegasikan ekstraksi bukti ke sub-agent); jika pengguna memberikan lampiran transkrip, baca seluruhnya sampai tuntas. Dilarang menganalisa dari ringkasan/kutipan sebagian.

6. Analisa pekerjaan AI di transkrip: identifikasi kesalahan AI — tidak memuat skill yang relevan, tidak memahami command, tidak mengikuti aturan yang berlaku — serta analisa apakah kesalahan berasal dari AI atau dari commands/skills/aturan yang kurang jelas/ambigu/salah.

7. Setelah id selesai dianalisa, simpan hasil analisa ke `docs/hasil_analisa/hasil_analisa_transkrip.md` (format seperti entri yang sudah ada: ringkasan transkrip (apa yang dilakukan pengguna dengan AI); kesalahan AI yang diidentifikasi beserta bukti/lokasi; analisa sumber kesalahan (AI vs commands/skills/aturan); saran agar AI di masa mendatang lebih pintar dan sesuai keinginan pengguna), lalu tandai id tersebut sudah dianalisa (perbarui status entri yang ada).

8. Setelah analisa transkrip selesai, laporkan kepada pengguna apakah ada saran agar AI di masa mendatang lebih pintar dan sesuai dengan keinginan pengguna.

9. Jika suatu id tidak dapat dianalisa (transkrip tidak tersedia di `kilo_local_recall` dan tidak ada lampiran transkrip) atau nama topiknya tidak dapat diketahui, hapus entri id tersebut dari `docs/hasil_analisa/hasil_analisa_transkrip.md` agar daftar hanya memuat id yang dapat dianalisa.

# Skill Terkait

- memori-check
- penggunaan-tool-bawaan-kilo
- penggunaan-tool-question
