---
description: Menganalisis commit terbaru setelah commit terakhir yang tercatat pada `catatan.md`, lalu memperbarui atau menambahkan skill custom yang relevan dan memperbarui catatan evaluasi.
agent: code
---

# Analisa Commit ke Skill

## Tujuan

Menentukan pola kode dari riwayat commit yang diinginkan pengguna, lalu memperbarui atau menambahkan skill custom agar pola tersebut dapat dipakai ulang pada proyek Flutter lain.

## Ketentuan Umum

1. Wajib membaca `AGENTS.md`, `catatan.md`, dan `.agents/rules/global/aturan_skill.md` sebelum bekerja.
2. Gunakan bahasa Indonesia baku dan muat skill `aturan-pembuatan-skill` sebelum menulis skill.
3. Sumber kebenaran hanya commit yang sudah ada (`git log`, `git show`, `git diff`); dilarang memakai working tree/staging/untracked.

## Cakupan

- Riwayat commit pada branch `master` (branch yang dipakai pengguna).
- Folder `.agents/skills/custom/` dan `catatan.md` sebagai berkas yang boleh diubah.

## Parameter

- `$ARGUMENTS` (opsional): hash commit awal atau topik skill yang ingin difokuskan.
- Jika `$ARGUMENTS` tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca `catatan.md` dan cari bagian `# Evaluasi Skill dari commit` untuk menentukan commit terakhir yang sudah dievaluasi.
   - Bila `catatan.md` masih kosong: ambil 5 commit terbaru sebagai data awal.
   - Commit awal = commit setelah hash tercatat; commit akhir = `HEAD` saat tugas dimulai; catat hash `HEAD` di awal.
   - Bila ada commit baru saat evaluasi berjalan: abaikan untuk tugas ini.
2. **Plan** — baca commit dari yang terlama ke terbaru; bila dua commit mengubah kode yang sama, gunakan commit terbaru sebagai sumber kebenaran. Evaluasi hanya perubahan kode Dart (bukan seluruh berkas `.md`).
3. **Execute** — untuk commit yang menyentuh `task.md`, baca diff bagian task berstatus `batal` yang dihapus beserta bagian `prompt` untuk memahami alasannya, lalu sesuaikan skill terkait.
4. **Review** — perbarui/tambahkan skill custom sesuai `aturan_skill.md`, lalu perbarui `catatan.md` dengan **hanya** commit terakhir yang dievaluasi.

## Format Laporan

| Commit | Pesan | Berkas | Pola/skill yang diperbarui |
| --- | --- | --- | --- |
| `<hash>` | `<pesan>` | `<berkas>` | `<skill>` |

Sertakan hash commit akhir yang dicatat dan daftar skill yang berubah.

## Larangan

- DILARANG mencatat seluruh commit yang dievaluasi pada `catatan.md`; catat commit terakhir saja.
- DILARANG mengubah berkas selain folder skill custom dan `catatan.md`.
- DILARANG memakai isi working tree/staging/untracked sebagai sumber.
- DILARANG mengubah kode Dart.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila skill relevan diperbarui dan `catatan.md` mencatat commit terakhir yang dievaluasi.
- STOP bila `catatan.md`/`aturan_skill.md` tidak ditemukan atau tidak ada commit yang dapat dievaluasi.
