---
description: Mengerjakan PRD yang ditentukan dari status Sedang Diimplementasikan hingga Sudah Diimplementasikan, dengan pemeriksaan bentrok file terdampak dan pembersihan referensi terkait.
agent: code
---

# Kerjakan PRD

## Tujuan

Mengimplementasikan PRD yang ditentukan pengguna secara utuh, dari pemeriksaan bentrok hingga verifikasi akhir.

## Ketentuan Umum

1. Baca `AGENTS.md`, `.agents/rules/global/`, `.agents/skills/custom/`, dan `.agents/skills/custom/format-prd/SKILL.md`; patuhi seluruhnya.
2. Gunakan bahasa Indonesia baku.
3. Muat skill yang trigger-nya terpenuhi sebelum mengubah kode.

## Cakupan

- Berkas PRD target di `prd/` dan seluruh berkas pada bagian "File-File Terdampak".

## Parameter

- `$ARGUMENTS`: path berkas PRD (mis. `prd/prd_contoh.md`).
- Jika `$ARGUMENTS` kosong, tidak ditemukan, atau statusnya sudah `Sudah Diimplementasikan`: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca PRD, daftar `File-File Terdampak`, dan PRD lain yang berstatus `Sedang Diimplementasikan`/`Sudah Diimplementasikan`.
2. **Plan** — periksa bentrok: file yang sama dengan bagian perubahan yang beririsan. Bila bentrok, **STOP** tanpa mengubah berkas apa pun dan tanpa memperbarui status.
3. **Execute** — ubah `Status Implementasi` menjadi `Sedang Diimplementasikan`, lalu implementasikan seluruh kebutuhan PRD.
4. **Review** — jalankan verifikasi (`dart format`, `dart analyze`, `flutter test` bila relevan) dan pastikan tidak ada perubahan di luar cakupan PRD.
5. Setelah selesai: ubah status menjadi `Sudah Diimplementasikan`, hapus berkas PRD, dan hapus section terkait pada `refrensi_apk.md` (lewati bila section tidak ditandai nama berkas PRD).

## Format Laporan

| Item PRD | Berkas diubah | Verifikasi | Status |
| --- | --- | --- | --- |
| `<fitur>` | `<path>` | `analyze`/`test` | Selesai |

Sertakan konfirmasi status PRD dan penghapusan referensi terkait.

## Larangan

- DILARANG mengimplementasikan PRD yang bentrok dengan PRD lain.
- DILARANG mengubah berkas di luar `File-File Terdampak` PRD.
- DILARANG menghapus berkas PRD sebelum implementasi diverifikasi.
- DILARANG menandai `Sudah Diimplementasikan` tanpa verifikasi.
- DILARANG commit/push tanpa perintah eksplisit pengguna.

## Kriteria Selesai / STOP

- Selesai bila seluruh kebutuhan PRD terimplementasi, verifikasi lulus, status diperbarui, dan referensi terkait dibersihkan.
- STOP bila terjadi bentrok, PRD tidak ditemukan, atau verifikasi gagal dan tidak dapat diselesaikan.
