---
description: Diskusikan isi berkas di folder prompt/ untuk memperbaiki typo, menghapus ambiguitas, dan menata ulang poin, lalu tampilkan hasilnya tanpa langsung mengedit.
agent: code
---

# Perbarui Berkas di Folder Prompt

## Tujuan

Mendiskusikan isi berkas di folder `prompt/` bersama pengguna untuk memperbaiki typo, menghilangkan ambiguitas, dan menata ulang poin, lalu menampilkan hasilnya tanpa mengedit tanpa persetujuan.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Gunakan bahasa Indonesia baku.
4. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`) untuk membaca berkas.

## Alur Kerja

1. **Analyze** — baca berkas `$ARGUMENTS` dari folder `prompt/`; identifikasi typo, poin ambigu, salah penempatan, dan poin yang kurang jelas.
2. **Plan** — usulkan perbaikan (tambahan, penghapusan, penataan ulang) kepada pengguna.
3. **Review** — tampilkan hasil diskusi; jangan edit tanpa persetujuan pengguna.

## Larangan

- DILARANG mengedit berkas tanpa persetujuan pengguna.
- DILARANG mengubah berkas di luar folder `prompt/`.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila hasil diskusi ditampilkan dan disetujui pengguna.
- STOP bila `$ARGUMENTS` kosong atau tidak menunjuk berkas di folder `prompt/`; tanyakan via tool `question`.