---
description: Mengerjakan seluruh task berstatus `kerjakan` pada `task.md` per kelompok, memperbarui status setiap task, membuat cadangan berkas, dan memverifikasi dengan `flutter analyze`.
agent: code
---

# Kerjakan Task

## Tujuan

Mengerjakan task yang berstatus `kerjakan` pada `task.md` secara berurutan per kelompok, dengan pembaruan status dan verifikasi yang konsisten.

## Ketentuan Umum

1. Baca `AGENTS.md` di root terlebih dahulu dan patuhi seluruh aturannya.
2. Baca `task.md` dan `.agents/rules/global/format_task.md`.
3. Gunakan bahasa Indonesia baku pada seluruh laporan dan komentar kode.

## Cakupan

- Berkas `task.md` di root proyek dan berkas-berkas yang disebut pada `file bermasalah` setiap task.

## Parameter

- `$ARGUMENTS` (opsional): nomor kelompok atau nomor task yang ingin dikerjakan.
- Jika `$ARGUMENTS` kosong: kerjakan seluruh task berstatus `kerjakan` sesuai urutan kelompok.

## Alur Kerja

1. **Analyze** — inventarisasi task berstatus `kerjakan` per kelompok; catat berkas terdampak tiap task.
2. **Plan** — tentukan urutan: selesaikan seluruh task dalam satu kelompok sebelum pindah kelompok; lewati task yang berkasnya sedang terbuka di editor.
3. **Execute** — untuk setiap task:

- Terapkan solusi pada task; tambahkan komentar singkat yang menjelaskan alasan perubahan.
  - Perbarui status pada `task.md` menjadi `selesai` atau `dilewati` beserta alasannya.

4. **Review** — jalankan `flutter analyze` hingga bersih; bila galat tidak kunjung hilang, kembalikan berkas `.dart` ke kondisi semula lalu tandai task `dilewati` beserta alasan.
5. Setelah semua task satu kelompok selesai, periksa kelompok kosong dan hapus kelompok yang tidak lagi memuat `#### Task N`.
6. Bila task sudah terimplementasi sebelumnya: tandai `selesai` tanpa mengubah kode.

## Format Laporan

| Kelompok | Task   | Status akhir | Berkas diubah | Catatan       |
| -------- | ------ | ------------ | ------------- | ------------- |
| 1        | Task 2 | selesai      | `lib/...`     | `<ringkasan>` |

Sertakan hasil akhir `flutter analyze`.

## Larangan

- DILARANG mengerjakan task yang berkasnya sedang terbuka di editor; tandai `dilewati` beserta alasan.
- DILARANG mengubah status task tanpa benar-benar mengerjakan atau memverifikasinya.
- DILARANG mengerjakan task di luar status `kerjakan`.
- DILARANG membiarkan kelompok kosong di `task.md`.
- DILARANG commit/push tanpa perintah eksplisit pengguna.

## Kriteria Selesai / STOP

- Selesai bila seluruh task sasaran berstatus `selesai`/`dilewati` dengan alasan, kelompok kosong dihapus, dan `flutter analyze` bersih.
- STOP bila `task.md` tidak ditemukan, ada task yang tidak dapat diverifikasi, atau verifikasi gagal berulang.
