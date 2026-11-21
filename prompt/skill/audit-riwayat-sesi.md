diperbarui : Sat Nov 21 2026 15:59 WIB
file : [audit-riwayat-sesi](../../.agents/skills/non-code/audit-riwayat-sesi/SKILL.md)

1. Audit riwayat sesi manual dan inkremental terhadap `memori/sesi/`, `MEMORI.md`, dan `memori/riwayat_perubahan.md`.

2. Inventarisasi berkas sesi + ledger (mtime + jumlah baris) di `audit/riwayat_sesi.md`.

3. Ekstraksi sinyal (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`) dengan verifikasi manual.

4. Agregasi frekuensi lintas sesi (ambang ≥3 sesi), klasifikasi A/B/C, dan rekomendasi perbaikan sistem tertulis.

5. Read-only dengan satu pengecualian: append section baru ke `audit/riwayat_sesi.md`; berkas sesi tidak diubah, dihapus, atau dikompresi.
