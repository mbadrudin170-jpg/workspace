---
description: Membuat atau memperbarui PRD untuk satu item fitur dari `refrensi_apk.md`, berdiskusi hingga PRD final, tanpa mengubah kode Dart.
---

# Diskusi Fitur Baru

## Tujuan

Membuatkan PRD untuk satu item fitur yang belum memiliki PRD, lalu berdiskusi dengan pengguna hingga PRD dinyatakan final.

## Ketentuan Umum

1. Baca `AGENTS.md` dan `.agents/skills/custom/format-prd/SKILL.md`; patuhi keduanya.
2. Gunakan bahasa Indonesia baku.
3. Command ini hanya menghasilkan/memperbarui dokumen PRD; tidak mengubah kode.

## Cakupan

- `refrensi_apk.md` (sumber item fitur) dan berkas PRD di folder `prd/`.

## Parameter

- `$ARGUMENTS`: nama fitur atau item pada `refrensi_apk.md` yang akan dibuatkan PRD.
- Jika `$ARGUMENTS` kosong atau tidak cocok dengan item mana pun: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — ambil satu item dari `refrensi_apk.md`; periksa apakah fitur sudah diimplementasikan dan catat hasilnya sesuai aturan 19–20 (status implementasi tetap `Belum Diimplementasikan`).
2. **Plan** — identifikasi `file terdampak`; jika bertumpang tindih dengan PRD lain, pilih item lain. Periksa tautan APK referensi untuk gambaran fitur.
3. **Execute** — susun PRD sesuai `.agents/skills/custom/format-prd/SKILL.md`, sertakan path dan baris `refrensi_apk.md`, serta contoh potongan kode singkat. Tandai item pada `refrensi_apk.md` sebagai sudah dibuatkan PRD.
4. **Review** — perbarui PRD sambil berdiskusi; gunakan tool `question` sampai pengguna menyatakan PRD final.
5. Muat skill yang trigger-nya relevan dengan fitur sebelum menyusun PRD.

## Format Laporan

- Path PRD yang dibuat/diperbarui.
- Daftar `file terdampak` dan bukti tidak bertumpang tindih dengan PRD lain.
- Status diskusi (Draft/Final) dan pertanyaan yang masih terbuka.

## Larangan

- DILARANG mengubah kode Dart satu pun.
- DILARANG mengedit berkas di luar PRD terkait dan penanda pada `refrensi_apk.md`.
- DILARANG menaikkan `Status Implementasi` menjadi `Sedang/Sudah Diimplementasikan`.
- DILARANG mengarang fitur atau tautan referensi.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila PRD tersusun sesuai `.agents/skills/custom/format-prd/SKILL.md` dan pengguna menyatakan final.
- STOP bila item tidak ditemukan, seluruh item bertumpang tindih, atau informasi fitur tidak cukup.
