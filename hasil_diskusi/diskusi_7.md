# Hasil Diskusi 7 — Penyebab Status PRD `Sedang Diimplementasikan` dan Perbaikan Command

## Status

- Dokumen: Final
- Implementasi: Sudah Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Analisis penyebab status PRD `prd/prd_katalog_lokal_offline.md` tertulis `Sedang Diimplementasikan` (bukan `Belum Diimplementasikan`) saat menjalankan command `diskusi_fitur_baru.md`, dan perbaikan command terkait.

## Latar Belakang

Pengguna menjalankan command `.kilo/commands/fitur/diskusi_fitur_baru.md` untuk membuat PRD fitur dari `refrensi_apk.md`. PRD `prd/prd_katalog_lokal_offline.md` (item A4) dihasilkan dengan header `Status Implementasi: Sedang Diimplementasikan`, padahal sesi tersebut hanya menyusun dokumen PRD dan tidak mengubah kode Dart. Pengguna mempertanyakan mengapa statusnya bukan `Belum Diimplementasikan`.

## Poin Diskusi

### 1. Penyebab status `Sedang Diimplementasikan`

- Tanya: Mengapa AI menyetel status PRD menjadi `Sedang Diimplementasikan`?
- Kesimpulan: Pada sesi 44, aturan 6 command (`cek dulu apakah sudah diimplementasikan`) dijalankan dan ditemukan sebagian fondasi fitur sudah ada di kode (`katalog_provider` membaca aset JSON via `rootBundle`, filter, state loading/error/kosong, dan test dasar). AI menafsirkan temuan "fondasi sudah ada sebagian" sebagai "fitur sedang diimplementasikan", lalu menaikkan header status.

### 2. Ketepatan status tersebut

- Tanya: Apakah `Sedang Diimplementasikan` sudah tepat untuk PRD ini?
- Kesimpulan: Belum tepat. Sesi pembuatan PRD tidak mengubah kode Dart (aturan 13), sehingga status header yang benar adalah `Belum Diimplementasikan`. Temuan "fondasi sudah ada" seharusnya dicatat pada `Status pengembangan` (bagian 1) dan/atau `Pemeriksaan Implementasi`, bukan pada header status. Sesi 45 telah mengoreksi status menjadi `Belum Diimplementasikan`.

### 3. Perbaikan yang diperlukan

- Tanya: Bagaimana mencegah terulangnya kekeliruan status?
- Kesimpulan: Perlu aturan eksplisit pada command `diskusi_fitur_baru.md` yang menegaskan bahwa sesi pembuatan/perbaruan PRD tanpa perubahan kode wajib berstatus `Belum Diimplementasikan`, dan temuan pemeriksaan tidak boleh menaikkan header status.

## Keputusan

- K-1: Status implementasi PRD untuk sesi yang hanya membuat atau memperbarui PRD (tanpa mengubah kode Dart) wajib `Belum Diimplementasikan`.
- K-2: Temuan pemeriksaan bahwa sebagian fondasi fitur sudah ada di kode dicatat pada `Status pengembangan` (bagian 1) dan/atau `Pemeriksaan Implementasi`, bukan pada header `Status Implementasi`.
- K-3: Command `.kilo/commands/fitur/diskusi_fitur_baru.md` diperbaiki: aturan 6 diarahkan ke aturan 19-20, dan aturan 19-20 ditambahkan untuk menetapkan aturan status secara eksplisit.
- K-4: Perbaikan `format_PRD.md` tidak diadopsi pada diskusi ini; dipertimbangkan sebagai pertanyaan terbuka.

## Rekomendasi

- R-1: Terapkan aturan 19-20 pada command `diskusi_fitur_baru.md` (sudah diterapkan pada sesi ini).
- R-2: Pertimbangkan memperjelas definisi tiga nilai `Status Implementasi` beserta aturan keputusan di `format_PRD.md`.
- R-3: Bila ditemukan PRD lain dengan pola serupa (ditandai `Sedang/Sudah Diimplementasikan` padahal sesi hanya menyusun PRD), koreksi statusnya dan catat temuan fondasi pada bagian yang tepat.

## Tindak Lanjut

| No  | Tindakan                                                                 | File Terdampak                              | Status  |
| --- | ------------------------------------------------------------------------ | ------------------------------------------- | ------- |
| 1   | Perbaiki command agar eksplisit soal status implementasi PRD             | `.kilo/commands/fitur/diskusi_fitur_baru.md` | selesai |
| 2   | Dokumentasikan hasil diskusi ini                                         | `hasil_diskusi/diskusi_7.md`                | selesai |
| 3   | Pertimbangkan perbaikan `format_PRD.md` (definisi status)                | `.agents/rules/global/format_PRD.md`        | belum   |

## File Terdampak

| Lokasi File                                | Status Perubahan | Deskripsi                                                                    |
| ------------------------------------------ | ---------------- | ---------------------------------------------------------------------------- |
| `.kilo/commands/fitur/diskusi_fitur_baru.md` | Diubah           | Aturan 6 diarahkan ke aturan 19-20; aturan 19-20 ditambahkan untuk status PRD. |
| `hasil_diskusi/diskusi_7.md`               | Dibuat           | Dokumen hasil diskusi ini.                                                    |
| `memori/sesi/sesi_46.md`                   | Diubah           | Catatan sesi dan sinkronisasi.                                               |
| `MEMORI.md`                                | Diubah           | Sinkronisasi status dan daftar hasil diskusi.                                |
| `memori/riwayat_perubahan.md`              | Diubah           | Entri riwayat perubahan sesi ini.                                            |

## Pertanyaan Terbuka

- Apakah `format_PRD.md` perlu diperbaiki agar definisi tiga nilai `Status Implementasi` dan aturan keputusannya lebih tegas? (belum diputuskan)

## Riwayat Perubahan

| Tanggal    | Perubahan                                                                                                     |
| ---------- | ------------------------------------------------------------------------------------------------------------- |
| 2026-11-14 | Diskusi dibuat: analisis penyebab status PRD `Sedang Diimplementasikan` dan perbaikan command `diskusi_fitur_baru.md`. |