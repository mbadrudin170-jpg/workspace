diperbarui : Mon Nov 16 2026 13:06 WIB
file : [audit_riwayat_sesi](../../.kilo/commands/audit_riwayat_sesi.md)

1. Baca `AGENTS.md` dan `MEMORI.md`; muat skill `audit-riwayat-sesi` dan `memori-check` sebelum bekerja.
2. Audit bersifat read-only; satu-satunya berkas yang boleh ditulis: `audit/riwayat_sesi.md` (append section baru).
3. Inkremental: baca ledger `audit/riwayat_sesi.md`; proses hanya berkas baru/berubah (mtime + jumlah baris); dilewati penuh jika cocok dengan ledger.
4. Ekstraksi sinyal via `grep` (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`); verifikasi manual tiap temuan.
5. Agregasi frekuensi lintas sesi; ambang "sering terulang" = ≥3 sesi (gabungan catatan lama + temuan baru).
6. Klasifikasi: (A) insidental sekali jadi; (B) pola berulang (≥3 sesi) → kandidat perbaikan sistem; (C) kerusakan arsip/rujukan yatim.
7. Rekomendasi hanya kategori B/C (tindakan konkret); perbaikan dilakukan lewat sesi terpisah atas persetujuan pengguna.
8. Append section baru ke `audit/riwayat_sesi.md` (Ringkasan, Tabel Pola, Daftar Berkas Diaudit); section lama tidak dihapus/ditimpa.
9. Larangan: ubah berkas lain; gunakan git log sebagai sumber; mengarang frekuensi/temuan; commit/push; operasi git yang mengubah state.
10. Selesai bila ledger/konteks terbaca, berkas diproses diaudit, section baru ter-append, laporan disampaikan; STOP bila `memori/sesi/` tidak dapat dibaca atau `audit/riwayat_sesi.md` tidak dapat ditulis.
11. Abaikan (lewati) sesi berstatus `Belum Sinkron` pada audit; catat sebagai dilewati dengan alasan pada laporan.
12. Setelah semua sesi selesai diaudit, laporkan hasil audit (ringkasan, tabel pola, dan daftar berkas diaudit) kepada pengguna.