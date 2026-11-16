# Hasil Diskusi 6 — Praktik skrip shell: chmod, alias, dan variabel argumen

## Status

- Dokumen: Final
- Implementasi: Sebagian Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Kenapa skrip baru tidak menjalankan chmod, kebutuhan alias, dan penggunaan variabel untuk argumen yang sumbernya dapat diubah

## Latar Belakang

Pengguna membuat skrip shell baru di folder `script/` tetapi izin eksekusi (`chmod +x`) tidak dijalankan otomatis. Pengguna juga ingin mengetahui apakah perlu membuat alias untuk skrip tersebut, serta ingin selalu menggunakan variabel jika argumen berasal dari sumber yang dapat diubah. Repositori `workspace` memiliki folder `script/` berisi berbagai skrip `.sh` dan berkas `script/bash_aliases.sh` yang memuat alias untuk sebagian skrip.

## Poin Diskusi

### 1. Kenapa skrip baru tidak menjalankan chmod?

- Tanya: Mengapa izin eksekusi tidak diatur otomatis saat membuat skrip baru?
- Kesimpulan: Default umask pada umumnya tidak menetapkan bit eksekusi untuk berkas baru, sehingga skrip baru dibuat tanpa izin eksekusi dan perlu `chmod +x` secara manual.

### 2. Apakah perlu membuat alias?

- Tanya: Apakah setiap skrip perlu memiliki alias di `script/bash_aliases.sh`?
- Kesimpulan: Alias berguna untuk skrip yang sering dipanggil. Keputusan: semua skrip `.sh` di `script/` yang belum memiliki alias akan diberikan alias.

### 3. Penggunaan variabel untuk argumen

- Tanya: Apakah selalu menggunakan variabel jika argumen bisa diubah sumbernya?
- Kesimpulan: Direkomendasikan menggunakan variabel untuk argumen yang sumbernya dapat diubah, guna menghindari hardcode dan mempermudah pemeliharaan.

## Keputusan

- K-1: Semua skrip `.sh` di `script/` yang belum memiliki alias akan diberikan alias di `script/bash_aliases.sh`.
- K-2: `chmod +x` akan dijalankan otomatis dalam alur pembuatan skrip baru.

## Rekomendasi

- R-1: Jalankan `chmod +x` pada setiap skrip shell baru setelah dibuat agar dapat dieksekusi langsung.
- R-2: Buat alias hanya untuk skrip yang sering digunakan untuk mengurangi kebocoran alias yang tidak terpakai.
- R-3: Selalu gunakan variabel untuk argumen yang sumbernya dapat diubah (bukan hardcode langsung dalam skrip).
- R-4: Pertimbangkan membuat skrip pembuat skrip (script generator) yang secara otomatis menambahkan shebang, `chmod +x`, dan struktur variabel standar.

## Tindak Lanjut

| No  | Tindakan                                                                    | File Terdampak           | Status  |
| --- | --------------------------------------------------------------------------- | ------------------------ | ------- |
| 1   | Tambah alias untuk semua skrip `.sh` di `script/` yang belum memiliki alias | `script/bash_aliases.sh` | selesai |
| 2   | Terapkan otomatisasi `chmod +x` dalam alur pembuatan skrip baru             | alur pembuatan skrip     | belum   |
| 3   | Terapkan variabel untuk argumen yang sumbernya dapat diubah                 | skrip terkait            | belum   |

## File Terdampak

| Lokasi File              | Status Perubahan | Deskripsi                                                     |
| ------------------------ | ---------------- | ------------------------------------------------------------- |
| `script/bash_aliases.sh` | Diubah           | Tambah alias untuk `build_sh_docs.sh` dan `migrate_batch.sh`. |
| `script/rename_apk.sh`   | Diubah           | Berikan izin eksekusi (`chmod +x`).                           |
| `script/*.sh`            | Belum            | Tambah `chmod +x` otomatis dan variabel sesuai keputusan.     |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan

| Tanggal    | Perubahan                                                                                                                                                 |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-11-14 | Buat `hasil_diskusi/diskusi_6.md` (Draft) — topik diskusi skrip shell: chmod, alias, variabel argumen.                                                    |
| 2026-11-14 | Ubah status ke `Final`; tetapkan K-1 (alias semua skrip tanpa alias) dan K-2 (chmod otomatis); tutup Pertanyaan Terbuka; perbarui Tindak Lanjut.          |
| 2026-11-14 | Eksekusi Task 1 & 2: tambah alias `build_sh_docs` & `migrate_batch` ke `bash_aliases.sh`; `chmod +x` pada `rename_apk.sh`. Tindak lanjut #1 & #2 selesai. |
