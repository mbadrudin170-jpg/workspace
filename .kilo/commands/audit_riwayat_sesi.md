description: Audit inkremental riwayat sesi ke audit/riwayat_sesi.md (read-only, append section baru).

# Audit Riwayat Sesi

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Baca `AGENTS.md` dan `MEMORI.md`; muat skill `audit-riwayat-sesi` dan `memori-check` sebelum bekerja.
4. Audit bersifat read-only; satu-satunya berkas yang boleh ditulis: `audit/riwayat_sesi.md` (append section baru).
5. Inkremental: baca ledger `audit/riwayat_sesi.md`; proses hanya berkas baru/berubah (mtime + jumlah baris); dilewati penuh jika cocok dengan ledger.
6. Ekstraksi sinyal via `grep` (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`); verifikasi manual tiap temuan.
7. Agregasi frekuensi lintas sesi; ambang "sering terulang" = ≥3 sesi (gabungan catatan lama + temuan baru).
8. Klasifikasi: (A) insidental sekali jadi; (B) pola berulang (≥3 sesi) → kandidat perbaikan sistem; (C) kerusakan arsip/rujukan yatim.
9. Rekomendasi hanya kategori B/C (tindakan konkret); perbaikan dilakukan lewat sesi terpisah atas persetujuan pengguna.
10. Append section baru ke `audit/riwayat_sesi.md` (Ringkasan, Tabel Pola, Daftar Berkas Diaudit); section lama tidak dihapus/ditimpa.
11. Larangan: ubah berkas lain; gunakan git log sebagai sumber; mengarang frekuensi/temuan; commit/push; operasi git yang mengubah state.
12. Selesai bila ledger/konteks terbaca, berkas diproses diaudit, section baru ter-append, laporan disampaikan; STOP bila `memori/sesi/` tidak dapat dibaca atau `audit/riwayat_sesi.md` tidak dapat ditulis.
13. Abaikan (lewati) sesi berstatus `Belum Sinkron` pada audit; catat sebagai dilewati dengan alasan pada laporan.
14. Setelah semua sesi selesai diaudit, laporkan hasil audit (ringkasan, tabel pola, dan daftar berkas diaudit) kepada pengguna.
15. Tandai berkas sesi yang sudah diaudit (mis. ledger `audit/riwayat_sesi.md`).
16. Yang dianalisa hanya masalah/pola berulang (kategori B dan C).

# Skill Terkait
- audit-riwayat-sesi
- memori-check