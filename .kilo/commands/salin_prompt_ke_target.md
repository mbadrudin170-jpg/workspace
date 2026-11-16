---
description: Salin isi berkas prompt ke berkas target secara rapi: rapikan sumber, tampilkan pratinjau, minta konfirmasi, tulis, lalu laporkan diff.
agent: code
---

# Salin Prompt ke Target

## Tujuan

Menyalin isi berkas prompt/sumber ke berkas target secara **rapi dan terkontrol**: rapikan sumber terlebih dahulu, tampilkan pratinjau, minta konfirmasi pengguna, tulis ke target, lalu laporkan diff. Mencegah penimpaan apa adanya yang berisiko kehilangan informasi.

## Ketentuan Umum

1. Gunakan bahasa Indonesia baku untuk seluruh respons dan laporan.
2. Gunakan tool bawaan Kilo (`read`, `edit`, `write`, `glob`) sebelum shell; patuhi `.agents/rules/global/prioritas_tool_bawaan.md`.
3. Izin `deny` pada `.kilo/kilo.jsonc` bersifat mutlak.
4. Jangan ubah berkas apa pun tanpa persetujuan pengguna.
5. Muat skill `aturan-pembuatan-rules` dan `aturan-pembuatan-skill` bila relevan (cek `.agents/rules/global/SKILLS_INDEX.md`).

## Parameter

- `$ARGUMENTS` (opsional): `<path-sumber> <path-target>` (dipisah spasi). Jika kosong atau tidak valid, tanyakan via tool `question`.
- Jika hanya satu path diberikan, tanyakan path yang kurang via tool `question`.

## Alur Kerja

### Analyze

1. Tentukan path sumber dan path target dari `$ARGUMENTS`; jika kosong/ambigu, tanyakan via tool `question`.
2. Baca berkas sumber dengan tool `read`; jika tidak ada, STOP dan laporkan.
3. Baca berkas target bila ada (untuk diff); jika tidak ada, catat sebagai berkas baru.
4. Identifikasi masalah pada sumber: typo, poin kosong, path salah, kapitalisasi, istilah tidak konsisten. Laporkan temuan ke pengguna.

### Plan

5. Susun versi rapi dari sumber (perbaiki temuan pada langkah 4) tanpa mengubah poin utama; tampilkan sebagai pratinjau.
6. Tampilkan diff ringkas (sumber asli vs versi rapi) dan (target lama vs target baru) bila target sudah ada.
7. Tanyakan konfirmasi pengguna via tool `question`: "Timpa target dengan versi rapi?" (Ya / Tidak / Edit lagi).

### Execute

8. Jika pengguna memilih "Ya": tulis versi rapi ke target dengan tool `write` (overwrite). Jika "Tidak": STOP, tidak ada perubahan. Jika "Edit lagi": kembali ke langkah 5.
9. Jangan ubah berkas sumber; hanya target yang ditulis.

### Review

10. Baca ulang berkas target dengan tool `read` untuk verifikasi.
11. Laporkan hasil (lihat Format Laporan).

## Format Laporan

```
Status: selesai | dibatalkan | gagal
Sumber: <path-sumber>
Target: <path-target>
Perubahan:
- <ringkasan perubahan>
Verifikasi: read ulang OK | gagal
```

## Larangan

- DILARANG menimpa target tanpa konfirmasi pengguna.
- DILARANG mengubah berkas sumber.
- DILARANG memakai shell redirection (`>`, `>>`) untuk menulis berkas; gunakan tool `write`.
- DILARANG menimpa berkas kritis (mis. root `AGENTS.md`) tanpa peringatan eksplisit tentang risiko kehilangan aturan.
- DILARANG mengarang isi; rapikan hanya berdasarkan sumber yang ada.

## Kriteria Selesai / STOP

- Selesai: target ditulis dengan versi rapi dan verifikasi `read` ulang OK; laporan ditampilkan.
- STOP (dibatalkan): pengguna memilih "Tidak" → tidak ada perubahan.
- STOP (gagal): sumber tidak ada, path tidak valid, atau verifikasi gagal → laporkan penyebab.