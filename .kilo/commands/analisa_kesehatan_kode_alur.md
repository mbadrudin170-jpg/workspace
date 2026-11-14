---
description: Memeriksa ketersediaan dan status berkas apk_kompetitor.md, refrensi_apk.md, PRD di prd/, dan hasil diskusi di hasil_diskusi/ secara berurutan; berhenti dan melapor bila prasyarat tidak terpenuhi, atau melanjutkan ke eksekusi analisa_kesehatan_kode.md bila seluruh prasyarat lolos.
---

# Analisa Kesehatan Kode — Dengan Pemeriksaan Prasyarat

Command ini adalah command mandiri. Command ini **tidak** mengubah isi `analisa_kesehatan_kode.md`, dan `analisa_kesehatan_kode.md` tetap dapat dipakai sendiri tanpa pemeriksaan prasyarat.

Alur kerja berbentuk **rantai pemeriksaan**: setiap tahap wajib berhenti dan melapor kepada pengguna bila prasyaratnya tidak terpenuhi. DILARANG melanjutkan ke tahap berikutnya sebelum tahap sebelumnya dinyatakan lolos.

## 1. Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku untuk seluruh laporan.
3. Setiap laporan "stop" wajib memuat tiga hal:
   - **Berkas atau folder yang diperiksa** beserta status yang ditemukan.
   - **Alasan berhenti** (prasyarat mana yang tidak terpenuhi).
   - **Tindakan yang disarankan** kepada pengguna agar prasyarat terpenuhi.
4. Jika argumen command berisi path berkas tertentu, batasi pemeriksaan pada path tersebut. Jika argumen kosong, periksa seluruh berkas `.md` pada folder yang ditentukan (subbagian 2).
5. JANGAN menduplikasi isi `analisa_kesehatan_kode.md`. Bila seluruh prasyarat lolos, eksekusi command tersebut dengan aturan dan batasan yang sama.

## 2. Cakupan Pemeriksaan

1. Berkas tunggal `apk_kompetitor.md` dan `refrensi_apk.md` di root proyek.
2. Seluruh berkas `.md` pada folder `prd/` dan `hasil_diskusi/`.
3. Jika folder `prd/` atau `hasil_diskusi/` tidak ada, perlakukan sebagai **kosong** (lihat 3.3 dan 3.4).

## 3. Rantai Pemeriksaan

### 3.1 Tahap 1 — `apk_kompetitor.md`

1. Periksa keberadaan berkas dan isinya.
2. Jika berkas tidak ada, atau isinya kosong/tanpa baris data listing, atau seluruh baris berstatus `Belum Dianalisa` (belum ada yang `Sudah Dianalisa`):
   - **STOP.**
   - Laporkan temuan sesuai 1.3.
   - Akhiri eksekusi command; jangan lanjut ke tahap 2.
3. Jika berkas ada dan memuat sekurang-kurangnya satu listing berstatus `Sudah Dianalisa`: lanjut ke tahap 2.

### 3.2 Tahap 2 — `refrensi_apk.md`

1. Periksa keberadaan berkas dan isinya.
2. Jika berkas tidak ada, atau isinya kosong:
   - **STOP.**
   - Laporkan temuan sesuai 1.3.
   - Akhiri eksekusi command; jangan lanjut ke tahap 3.
3. Jika berkas ada dan berisi laporan referensi: lanjut ke tahap 3.

### 3.3 Tahap 3 — PRD pada `prd/`

1. Kumpulkan seluruh berkas `.md` pada `prd/`.
2. Tentukan status implementasi tiap PRD dari bagian `**Status Implementasi:**` pada header berkas.
3. Jika `prd/` tidak ada, kosong, atau **seluruh** PRD berstatus `Sudah Diimplementasikan`:
   - **STOP.**
   - Laporkan jumlah PRD beserta status masing-masing sesuai 1.3.
   - Akhiri eksekusi command; jangan lanjut ke tahap 4.
4. Jika terdapat sekurang-kurangnya satu PRD berstatus `Belum Diimplementasikan` atau `Sedang Diimplementasikan`: lanjut ke tahap 4.

### 3.4 Tahap 4 — Hasil diskusi pada `hasil_diskusi/`

1. Kumpulkan seluruh berkas `.md` pada `hasil_diskusi/`.
2. Tentukan status implementasi tiap berkas dari bagian `## Status` (field `Implementasi`).
3. Jika `hasil_diskusi/` tidak ada, kosong, atau **seluruh** berkas berstatus `Sudah Diimplementasikan`:
   - **STOP.**
   - Laporkan jumlah berkas beserta status masing-masing sesuai 1.3.
   - Akhiri eksekusi command; jangan lanjut ke tahap 5.
4. Status selain `Sudah Diimplementasikan` — termasuk `Belum Diimplementasikan`, `Sedang Diimplementasikan`, `Sebagian Diimplementasikan`, dan `Belum diketahui` — dianggap **belum selesai**.
5. Jika terdapat sekurang-kurangnya satu berkas berstatus belum selesai: lanjut ke tahap 5.

### 3.5 Tahap 5 — Eksekusi analisa kesehatan kode

1. Seluruh prasyarat dinyatakan lolos. Katakan secara eksplisit bahwa pemeriksaan prasyarat selesai dan seluruh tahap lolos.
2. Baca `.kilo/commands/analisa_kesehatan_kode.md` dan laksanakan seluruh isinya **apa adanya**, termasuk:
   - kewajiban membaca berkas yang ditentukan di dalamnya terlebih dahulu;
   - penentuan commit yang dievaluasi;
   - format penulisan mengikuti `.agents/rules/global/format_task.md`;
   - larangan menyentuh berkas selain yang ditentukan di dalamnya;
   - pembaruan `catatan.md` setelah `task.md` diperbarui.
3. Jangan menambah, mengurangi, atau mengubah aturan dari `analisa_kesehatan_kode.md` pada eksekusi ini.

## 4. Format Laporan

Laporkan ringkas dalam bentuk tabel rantai pemeriksaan:

| Tahap | Berkas atau Folder | Status Ditemukan | Hasil |
| --- | --- | --- | --- |
| 1 | `apk_kompetitor.md` | <jumlah listing, jumlah `Sudah Dianalisa`> | Lolos / STOP |
| 2 | `refrensi_apk.md` | <ada/kosong/tidak ada> | Lolos / STOP |
| 3 | `prd/` | <jumlah PRD per status> | Lolos / STOP |
| 4 | `hasil_diskusi/` | <jumlah berkas per status> | Lolos / STOP |

Tutup laporan dengan salah satu dari:

- `Rantai pemeriksaan berhenti pada tahap <N>. <alasan>.` — bila ada tahap yang gagal.
- `Seluruh prasyarat lolos. Melanjutkan ke analisa_kesehatan_kode.md.` — bila seluruh tahap lolos.

## 5. Larangan

1. DILARANG melanjutkan ke tahap berikutnya ketika tahap sebelumnya berhenti.
2. DILARANG mengubah kode Dart, berkas hasil generate, aturan, skill, command, atau dokumen apa pun pada tahap pemeriksaan.
3. DILARANG mengubah isi `.kilo/commands/analisa_kesehatan_kode.md`.
4. DILARANG mengubah berkas selain yang diizinkan oleh `analisa_kesehatan_kode.md` pada tahap 5.
5. DILARANG mengarang status berkas; status wajib dibaca dari berkas yang sebenarnya.
6. DILARANG commit/push.