---
description: Mengaudit riwayat sesi (`memori/sesi/`) secara manual dan inkremental — mendeteksi kesalahan yang sering terulang (≥3 sesi), mengklasifikasikan A/B/C, merekomendasikan perbaikan sistem, dan mencatat hasil ke `audit/riwayat_sesi.md`; read-only selain append ke berkas tersebut.
---

# Audit Riwayat Sesi

## Tujuan

Command ini mengaudit riwayat sesi (`memori/sesi/sesi_*.md`) untuk mendeteksi kesalahan/kegagalan yang sering terulang lintas sesi, mengklasifikasikan kebutuhan perbaikannya (A/B/C), dan mencatat hasil audit ke satu berkas berjalan `audit/riwayat_sesi.md` di root proyek (append per audit). Audit bersifat **inkremental**: sesi yang sudah diaudit ditandai di ledger `audit/riwayat_sesi.md` dan dilewati penuh pada audit berikutnya, kecuali berkas tersebut berubah (deteksi lewat mtime + jumlah baris). Audit bersifat **read-only** terhadap seluruh berkas proyek; satu-satunya pengecualian adalah append section baru ke `audit/riwayat_sesi.md`. Tindak lanjut hanya berupa rekomendasi tertulis di sesi; perbaikan berkas/sistem dilakukan lewat sesi terpisah atas persetujuan pengguna.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `MEMORI.md` untuk konteks proyek dan konvensi memori (`memori/riwayat_perubahan.md` selalu dibaca sebagai konteks agregasi).
3. Muat skill yang relevan sebelum bekerja melalui tool `skill`: `audit-riwayat-sesi` (`.agents/skills/custom/audit-riwayat-sesi/SKILL.md`) dan `memori-check`. Gunakan `.kilo/commands/cek_kesehatan_sistem_kerja.md` dan skill `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md` sebagai rujukan pola command + skill read-only (bukan untuk dijalankan).
4. Gunakan bahasa Indonesia baku untuk seluruh laporan.
5. Jangan menggunakan terminal untuk membaca isi berkas; gunakan tool `read`, `glob`, dan `grep` sesuai kebutuhan. Untuk memperoleh mtime berkas sesi, gunakan mekanisme yang tersedia di lingkungan eksekusi (mis. `stat` bila diizinkan); bila tidak tersedia, catat `tidak tersedia` pada kolom mtime dan sebutkan keterbatasannya secara eksplisit pada laporan — jangan mengarang nilai mtime.
6. Audit bersifat portabel: sesuaikan pemeriksaan dengan struktur aktual proyek yang sedang diaudit, bukan dengan asumsi nama proyek tertentu.
7. Git log **tidak** digunakan sebagai sumber data audit.

## Cakupan

- Berkas yang diproses: `memori/sesi/sesi_*.md` (hanya yang baru/berubah dibanding ledger).
- Konteks agregasi yang selalu dibaca: `MEMORI.md`, `memori/riwayat_perubahan.md`.
- Satu-satunya berkas yang boleh ditulis: `audit/riwayat_sesi.md` (append section baru; section lama tidak dihapus/ditimpa).
- Berkas sesi **tidak** diubah, dihapus, atau dikompresi oleh audit.

## Parameter

- Tidak ada parameter. Audit berjalan berdasarkan ledger pada `audit/riwayat_sesi.md` (inkremental).
- Jika pengguna menambahkan `$ARGUMENTS`, abaikan dan jalankan audit inkremental; jika ragu mengenai maksud pengguna, **STOP** dan tanyakan dengan tool `question`.

## Alur Kerja

### 1. Analyze — inventarisasi dan pemindaian ledger

1. Baca `audit/riwayat_sesi.md` (ledger: daftar berkas sesi yang sudah diaudit beserta mtime + jumlah baris). Jika berkas belum ada, anggap seluruh berkas sesi belum pernah diaudit.
2. Inventarisasi seluruh `memori/sesi/sesi_*.md` (tool `glob`); peroleh mtime + jumlah baris tiap berkas.
3. Baca `MEMORI.md` dan `memori/riwayat_perubahan.md` sebagai konteks agregasi (selalu dibaca, tidak dilewati).
4. Tentukan daftar **diproses** vs **dilewati**:
   - Dilewati penuh: berkas yang cocok dengan ledger **dan** mtime **serta** jumlah baris-nya sama.
   - Diproses: berkas yang belum tercatat di ledger, atau yang mtime/jumlah baris-nya berbeda.
   - Berkas yang tercatat di ledger tetapi sudah tidak ada di folder → catat sebagai temuan `berkas hilang` (bukan "sudah diaudit").
5. Jika tidak ada berkas yang perlu diproses, laporkan "tidak ada berkas baru/berubah" dan tetap append section ringkas ke `audit/riwayat_sesi.md` (lihat langkah 4) — atau **STOP** bila pengguna memilih membatalkan di sesi ini.

### 2. Plan — susun rencana audit

1. Susun daftar berkas diproses dan dilewati; sampaikan ringkasannya pada laporan (tidak mengubah berkas apa pun).
2. Jika jumlah berkas diproses sangat besar, laporkan estimasi cakupan dan lanjutkan (audit read-only; tidak memerlukan konfirmasi per berkas).

### 3. Execute — ekstraksi, agregasi, klasifikasi

1. **Ekstraksi sinyal** (hanya untuk berkas yang diproses): pindai dengan tool `grep` kata kunci berikut (dapat disesuaikan): `ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`.
2. **Verifikasi manual**: baca setiap berkas yang cocok untuk memastikan temuan nyata (mencegah false positive kata kunci). Jangan mengarang frekuensi.
3. **Agregasi frekuensi**: kelompokkan masalah sejenis lintas sesi; hitung frekuensi dan rentang sesi. Untuk berkas yang dilewati, kemunculan dihitung dari catatan audit sebelumnya di `audit/riwayat_sesi.md`; ambang "sering terulang" (≥3 sesi) dihitung dari gabungan catatan lama + temuan baru.
4. **Klasifikasi** per pola:
   - **(A)** kesalahan insidental sekali jadi;
   - **(B)** pola berulang (≥3 sesi) → kandidat perbaikan sistem (aturan/skill/command/instruksi);
   - **(C)** kerusakan arsip/rujukan yatim.
5. **Rekomendasi** (hanya untuk kategori B/C): usulkan tindakan konkret per pola (mis. aturan eskalasi bila berkas yang sama dilaporkan ≥N sesi berturut-turut). Tindak lanjut hanya rekomendasi tertulis; perbaikan dilakukan lewat sesi terpisah atas persetujuan pengguna.

### 4. Review — catat hasil dan laporkan

1. Append section baru ke `audit/riwayat_sesi.md` dengan format:

   ```markdown
   ## Audit YYYY-MM-DD (sesi N)

   ### Ringkasan
   <jumlah sesi diproses, dilewati, berkas hilang bila ada>

   ### Tabel Pola
   | Masalah | Sesi kemunculan | Frekuensi | Klasifikasi | Rekomendasi |
   |---------|-----------------|-----------|-------------|-------------|

   ### Daftar Berkas yang Diaudit
   | Sesi | Tanggal audit | mtime | Jumlah baris |
   |------|---------------|-------|--------------|
   ```

   Section lama tidak dihapus/ditimpa (jejak tren dipertahankan).
2. Sampaikan laporan di sesi (format pada bagian Format Laporan).
3. Verifikasi akhir: pastikan `audit/riwayat_sesi.md` dapat dibaca dan berisi section baru; pastikan tidak ada berkas selain `audit/riwayat_sesi.md` yang tersentuh (`git status --short` sebagai pemeriksaan pelengkap, tanpa operasi yang mengubah state).

## Format Laporan

Sampaikan laporan yang memuat:

1. **Ringkasan** — jumlah sesi diproses, dilewati, dan berkas hilang (bila ada).
2. **Tabel pola** dengan kolom: Masalah, Sesi kemunculan, Frekuensi, Klasifikasi (A/B/C), Rekomendasi.
3. **Daftar berkas yang diaudit** pada run ini (Sesi, Tanggal audit, mtime, Jumlah baris).
4. **Catatan keterbatasan** — bila ada berkas yang tidak dapat dibaca atau mtime tidak tersedia, sebutkan secara eksplisit.

## Larangan

- DILARANG mengubah berkas apa pun selain append ke `audit/riwayat_sesi.md`.
- DILARANG memperbaiki temuan audit secara otomatis; tindak lanjut hanya rekomendasi tertulis dan dieksekusi lewat sesi terpisah atas persetujuan pengguna.
- DILARANG mengubah berkas `memori/sesi/*.md` (termasuk penandaan apa pun di dalamnya), `MEMORI.md`, `memori/riwayat_perubahan.md`, `.agents/rules/global/kelompok_skill_wajib.md`, skill, command, aturan, `task.md`, atau kode sumber.
- DILARANG menghapus, mengompres, atau mengubah sesi yang sudah diaudit; penandaan di ledger adalah satu-satunya perlakuan tambahan.
- DILARANG memakai git log sebagai sumber data audit.
- DILARANG menganalisis ulang penuh berkas yang dilewati; bila meragukan mtime, baca ulang berkas hanya untuk verifikasi, bukan analisis ulang (lihat skill `audit-riwayat-sesi`).
- DILARANG mengarang frekuensi atau temuan tanpa bukti dari berkas yang diproses/dicatat.
- DILARANG commit/push.
- DILARANG menjalankan operasi git yang mengubah state.

## Kriteria Selesai / STOP

- **Selesai** bila ledger dan konteks terbaca, seluruh berkas diproses diaudit (atau dilewati dengan alasan sah), section baru ter-append di `audit/riwayat_sesi.md`, dan laporan disampaikan di sesi.
- **STOP** bila `memori/sesi/` tidak dapat dibaca atau `audit/riwayat_sesi.md` tidak dapat ditulis; laporkan alasannya dan jangan melanjutkan ke langkah lain.
