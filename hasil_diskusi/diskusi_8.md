# Hasil Diskusi 8 — Command dan Skill untuk Cek Kesehatan Sistem Kerja

## Status

- Dokumen: Draft
- Implementasi: Belum Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Perencanaan command dan skill baru untuk mengaudit kesehatan sistem kerja proyek (struktur folder, indeks skill, frontmatter skill, command, memori/sesi, hasil diskusi, repositori) secara read-only dengan laporan di sesi.

## Latar Belakang

Pengguna ingin membuat command baru untuk memeriksa kesehatan sistem kerja proyek, yaitu memastikan seluruh aset pendukung agen AI (aturan, skill, command, memori, hasil diskusi, konfigurasi, dan repositori) berada dalam kondisi konsisten dan tidak rusak. Pemeriksaan sejenis yang sudah ada hanya menutupi sebagian kecil: `analisa_kesehatan_kode.md` khusus mengevaluasi kode Dart dari riwayat commit, `evaluasi_aturan.md` khusus mengevaluasi cakupan aturan, dan `perbarui_skills_index.md` hanya memvalidasi indeks skill. Belum ada satu pun pemeriksaan yang menilai sistem kerja secara menyeluruh, dan belum ada aturan yang mengatur pembuatan command (aturan yang ada, `aturan_skill.md`, hanya mengatur `SKILL.md`).

## Poin Diskusi

### 1. Tujuan command baru

- Tanya: Apa tujuan utama command yang ingin dibuat?
- Kesimpulan: Command untuk mengaudit kesehatan sistem kerja proyek, bukan membuat command baru secara umum. Setelah klarifikasi pengguna, tujuan diperjelas menjadi pembuatan command **dan** skill yang digunakan bersama untuk pemeriksaan tersebut.

### 2. Cakupan pemeriksaan

- Tanya: Aspek apa saja yang diperiksa?
- Kesimpulan: Tujuh aset diperiksa — (a) struktur folder dan berkas wajib, (b) konsistensi `SKILLS_INDEX.md` terhadap `SKILL.md` yang ada, (c) validasi metadata frontmatter skill sesuai `aturan_skill.md`, (d) validasi command (nama berkas aman, frontmatter, tautan markdown keliru), (e) kesehatan memori (berkas `memori/sesi/*.md` berstatus `Belum Sinkron` dan sinkronisasi tanggal `MEMORI.md`), (f) kesehatan repositori (submodule, pointer submodule, `.gitignore` vs `git status`), (g) penomoran dan pencatatan `hasil_diskusi/diskusi_N.md` di `MEMORI.md`.

### 3. Bentuk keluaran audit

- Tanya: Bagaimana hasil audit dilaporkan?
- Kesimpulan: Laporan hanya disampaikan di sesi (ringkasan temuan `GALAT`/`PERINGATAN` beserta path dan saran), tanpa membuat berkas laporan di root proyek dan tanpa menuliskan temuan ke `task.md`.

### 4. Perizinan mengubah berkas saat audit

- Tanya: Apakah audit boleh mengubah berkas?
- Kesimpulan: Read-only. Audit dilarang membuat, mengubah, atau menghapus berkas apa pun; perbaikan dikerjakan pada sesi terpisah setelah persetujuan pengguna.

### 5. Penulisan berkas pada sesi ini

- Tanya: Apakah draf command dan skill ditulis sekarang?
- Kesimpulan: Belum. Pengguna memilih hanya mendokumentasikan hasil diskusi ini ke berkas hasil diskusi, sehingga command dan skill belum dibuat.

### 6. Temuan pemeriksaan yang sudah terlihat saat diskusi

- Tanya: Adakah ketidaksesuaian yang sudah terlihat?
- Kesimpulan: Ditemukan empat hal yang menjadi bahan audit — (a) `.kilo/commands/sinkronisasi/sinkronkan_commands.md` menunjuk folder mirror `gpt/` yang sudah tidak ada di root proyek; (b) `kerjakan_task.md` dan `analisa_kesehatan_kode.md` memuat tautan markdown keliru berformat `[AGENTS.md](http://AGENTS.md)`; (c) `scan.md` berpotensi tumpang tindih dengan `analisa_kesehatan_kode.md`, dan `saran_aturan_baru.md` dengan `diskusi_penambahan_aturan_baru.md`; (d) tidak ada aturan yang mengatur format command, sehingga variasi frontmatter antar command cukup lebar (sebagian tanpa frontmatter sama sekali).

## Keputusan

- K-1: Tujuan pekerjaan adalah audit kesehatan sistem kerja proyek, bukan audit kesehatan kode Dart.
- K-2: Cakupan audit mencakup tujuh aset: struktur folder/berkas wajib, konsistensi `SKILLS_INDEX.md`, metadata frontmatter skill, validasi command, kesehatan memori sesi, kesehatan repositori, dan penomoran `hasil_diskusi/`.
- K-3: Audit bersifat read-only; dilarang membuat, mengubah, atau menghapus berkas apa pun selama audit.
- K-4: Hasil audit dilaporkan hanya di sesi, tanpa berkas laporan dan tanpa perubahan `task.md`.
- K-5: Rancangan terdiri atas dua berkas — command `.kilo/commands/cek_kesehatan_sistem_kerja.md` dan skill `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md`; keduanya belum ditulis pada sesi ini.
- K-6: Temuan ketidaksesuaian (K-6 di poin 6) ditunda penanganannya sampai audit resmi dijalankan.

## Rekomendasi

- R-1: Susun command `.kilo/commands/cek_kesehatan_sistem_kerja.md` dengan frontmatter `description`, instruksi memuat skill terkait, alur kerja bertahap, larangan mengubah berkas, dan format laporan temuan `GALAT`/`PERINGATAN`.
- R-2: Susun skill `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md` sebagai prosedur portabel (cakupan, aturan/kriteria valid, langkah, larangan, contoh benar/salah, sumber evaluasi) agar dapat dipakai lintas proyek.
- R-3: Pertimbangkan menambahkan aturan format command di `.agents/rules/global/` karena `aturan_skill.md` hanya mengatur `SKILL.md`; tanpa aturan ini variasi command akan terus melebar.
- R-4: Tangani keempat temuan pada poin 6 pada sesi terpisah: hapus atau tandai usang `sinkronkan_commands.md`, perbaiki tautan markdown keliru, dan putuskan penyatuan command yang tumpang tindih.
- R-5: Jalankan audit secara berkala (mis. setiap akhir sesi besar) dan perlakukan hasilnya sebagai bahan tindak lanjut, bukan sebagai perubahan otomatis.

## Tindak Lanjut

| No  | Tindakan                                                                                          | File Terdampak                                                        | Status  |
| --- | ------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ------- |
| 1   | Tulis command audit kesehatan sistem kerja                                                        | `.kilo/commands/cek_kesehatan_sistem_kerja.md`                        | belum   |
| 2   | Tulis skill prosedur audit kesehatan sistem kerja                                                 | `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md`            | belum   |
| 3   | Perbarui `SKILLS_INDEX.md` setelah skill dibuat                                                   | `SKILLS_INDEX.md`                                                     | belum   |
| 4   | Tangani `sinkronkan_commands.md` yang menunjuk folder `gpt/` yang sudah tidak ada                  | `.kilo/commands/sinkronisasi/sinkronkan_commands.md`                  | belum   |
| 5   | Perbaiki tautan markdown keliru pada command                                                      | `.kilo/commands/kerjakan_task.md`, `.kilo/commands/analisa_kesehatan_kode.md` | belum |
| 6   | Putuskan penyatuan command yang tumpang tindih                                                    | `.kilo/commands/scan.md`, `.kilo/commands/saran_aturan_baru.md`       | belum   |
| 7   | Dokumentasikan hasil diskusi ini                                                                  | `hasil_diskusi/diskusi_8.md`                                          | selesai |
| 8   | Pertimbangkan penambahan aturan format command                                                    | `.agents/rules/global/`                                               | belum   |

## File Terdampak

| Lokasi File                                                  | Status Perubahan | Deskripsi                                                                              |
| ------------------------------------------------------------ | ---------------- | -------------------------------------------------------------------------------------- |
| `hasil_diskusi/diskusi_8.md`                                 | Dibuat           | Dokumen hasil diskusi ini.                                                             |
| `.kilo/commands/cek_kesehatan_sistem_kerja.md`               | Dibuat           | Rencana command audit kesehatan sistem kerja (belum ditulis).                          |
| `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md`  | Dibuat           | Rencana skill prosedur audit kesehatan sistem kerja (belum ditulis).                   |
| `SKILLS_INDEX.md`                                            | Diubah           | Perlu pembaruan setelah skill audit dibuat (belum dikerjakan).                         |
| `.kilo/commands/sinkronisasi/sinkronkan_commands.md`         | Diubah           | Menunjuk folder `gpt/` yang sudah tidak ada; perlu keputusan pengguna.                  |
| `.kilo/commands/kerjakan_task.md`                            | Diubah           | Memuat tautan markdown keliru `[AGENTS.md](http://AGENTS.md)`.                         |
| `.kilo/commands/analisa_kesehatan_kode.md`                   | Diubah           | Memuat tautan markdown keliru pada `task.md`, `catatan.md`, dan `AGENTS.md`.           |
| `memori/sesi/sesi_47.md`                                     | Diubah           | Catatan sesi dan sinkronisasi.                                                         |
| `MEMORI.md`                                                  | Diubah           | Sinkronisasi daftar hasil diskusi.                                                     |
| `memori/riwayat_perubahan.md`                                | Diubah           | Entri riwayat perubahan sesi ini.                                                      |

## Pertanyaan Terbuka

- Apakah aturan format command perlu ditambahkan di `.agents/rules/global/`, dan apakah `aturan_skill.md` diperluas atau dibuat berkas baru? (belum diputuskan)
- Bagaimana penanganan `sinkronkan_commands.md`: dihapus, ditandai usang, atau diarahkan ke target mirror yang baru? (belum diputuskan)
- Apakah `scan.md` dan `analisa_kesehatan_kode.md` perlu disatukan, dan apakah `saran_aturan_baru.md` digabung dengan `diskusi_penambahan_aturan_baru.md`? (belum diputuskan)

## Riwayat Perubahan

| Tanggal    | Perubahan                                                                                          |
| ---------- | -------------------------------------------------------------------------------------------------- |
| 2026-11-14 | Diskusi dibuat: tujuan, cakupan, bentuk keluaran, dan perizinan audit kesehatan sistem kerja; command dan skill belum ditulis atas keputusan pengguna. |