---
description: Mengaudit riwayat sesi secara read-only dan inkremental, mengekstraksi sinyal berulang lintas sesi, mengklasifikasikannya, lalu menulis rekomendasi ke `audit/riwayat_sesi.md` (append section baru) tanpa mengubah berkas lain.
agent: code
---

# Audit Riwayat Sesi

## Tujuan

Mengaudit riwayat sesi (`memori/sesi/*.md`) secara read-only dan inkremental untuk menemukan sinyal berulang lintas sesi, mengklasifikasikannya, dan menulis rekomendasi perbaikan sistem ke `audit/riwayat_sesi.md` (append section baru) tanpa mengubah berkas lain.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh interaksi dan laporan.
3. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`) untuk membaca berkas; gunakan perintah shell hanya bila diperlukan.
4. Muat skill `audit-riwayat-sesi` dan `memori-check` sebelum bekerja.
5. Audit bersifat read-only; satu-satunya berkas yang boleh ditulis: `audit/riwayat_sesi.md` (append section baru).

## Cakupan

- Berkas sumber baca: `memori/sesi/*.md` (semua berkas sesi), `MEMORI.md`, `memori/riwayat_perubahan.md`.
- Berkas target tulis: `audit/riwayat_sesi.md` (append section baru; section lama tidak dihapus/ditimpa).
- Tidak mengubah kode Dart, konfigurasi, atau berkas lain di luar cakupan.

## Parameter

- `$ARGUMENTS` (opsional): batas jumlah sesi yang diaudit, filter topik, atau rentang sesi. Jika kosong, audit seluruh berkas sesi yang tersedia.

## Alur Kerja

1. **Analyze** — baca `AGENTS.md` dan `MEMORI.md`; muat skill `audit-riwayat-sesi` dan `memori-check`. Baca ledger `audit/riwayat_sesi.md` (jika ada) untuk menentukan berkas yang sudah diaudit (mtime + jumlah baris).
2. **Plan** — tentukan berkas sesi baru/berubah yang perlu diaudit; proses inkremental: lewati penuh bila cocok dengan ledger.
3. **Execute** — untuk setiap berkas sesi yang diaudit:
   - Abaikan (lewati) sesi berstatus `Belum Sinkron`; catat sebagai dilewati dengan alasan pada laporan.
   - Ekstraksi sinyal via `grep` (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`); verifikasi manual tiap temuan.
   - Agregasi frekuensi lintas sesi; ambang "sering terulang" = ≥3 sesi (gabungan catatan lama + temuan baru).
   - Klasifikasi: (A) insidental sekali jadi; (B) pola berulang (≥3 sesi) → kandidat perbaikan sistem; (C) kerusakan arsip/rujukan yatim.
   - Rekomendasi hanya kategori B/C (tindakan konkret); perbaikan dilakukan lewat sesi terpisah atas persetujuan pengguna.
4. **Review** — append section baru ke `audit/riwayat_sesi.md` (Ringkasan, Tabel Pola, Daftar Berkas Diaudit); section lama tidak dihapus/ditimpa. Laporkan hasil audit (ringkasan, tabel pola, dan daftar berkas diaudit) kepada pengguna.

## Format Laporan

- Ringkasan audit (jumlah berkas diaudit, jumlah sinyal ditemukan, klasifikasi A/B/C).
- Tabel Pola: `Pola | Frekuensi (sesi) | Klasifikasi | Rekomendasi`.
- Daftar Berkas Diaudit: `Berkas | Status | Catatan`.
- Sertakan hash/versi ledger yang diperbarui.

## Larangan

- DILARANG mengubah berkas lain selain `audit/riwayat_sesi.md`.
- DILARANG menggunakan git log sebagai sumber utama (sumber utama adalah berkas sesi).
- DILARANG mengarang frekuensi atau temuan yang tidak terverifikasi.
- DILARANG commit/push.
- DILARANG menjalankan operasi git yang mengubah state.
- DILARANG mengubah atau menghapus section lama pada `audit/riwayat_sesi.md`.

## Kriteria Selesai / STOP

- Selesai bila ledger/konteks terbaca, berkas diproses diaudit, section baru ter-append ke `audit/riwayat_sesi.md`, dan laporan disampaikan.
- STOP bila `memori/sesi/` tidak dapat dibaca atau `audit/riwayat_sesi.md` tidak dapat ditulis; sebutkan alasan dan tindakan yang disarankan.
