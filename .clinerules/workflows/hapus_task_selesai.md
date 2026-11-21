---
description: Menghapus entri `task.md` yang sudah selesai, dikerjakan tanpa pembaruan status, atau berstatus batal, lalu merapikan kelompok yang menjadi kosong sesuai `format_task.md`.
---

# Hapus Task Selesai

## Tujuan

Merapikan `task.md` di root proyek dengan menghapus entri yang sudah tidak perlu dikerjakan lagi, tanpa mengubah entri yang masih relevan.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `.agents/rules/global/format_task.md` sebagai acuan struktur `task.md`.
3. Gunakan bahasa Indonesia baku pada seluruh laporan.

## Cakupan

- Berkas `task.md` di root proyek.

## Parameter

- `$ARGUMENTS` (opsional): status atau nama task yang ingin dihapus.
- Jika `$ARGUMENTS` kosong: gunakan kriteria default pada alur kerja.

## Alur Kerja

1. **Analyze** — baca seluruh `task.md` dan identifikasi task berstatus `selesai`, task yang sudah dikerjakan tetapi statusnya belum diubah, dan task berstatus `batal`.
2. **Plan** — tampilkan ringkasan task yang akan dihapus beserta alasannya.
3. **Execute** — konfirmasi kepada pengguna dengan tool `question`, lalu hapus hanya entri yang disetujui.
4. **Review** — periksa kelompok yang menjadi kosong (tidak memuat `#### Task N` di `## Tinggi`/`## Sedang`/`## Rendah`) dan hapus kelompok tersebut; pastikan task lain tidak berubah.
5. Bila `task.md` tidak ditemukan: **STOP** dan laporkan.

## Format Laporan

| Task          | Kelompok     | Alasan dihapus                           | Status             |
| ------------- | ------------ | ---------------------------------------- | ------------------ |
| `<nama task>` | `<kelompok>` | `selesai` / `batal` / `sudah dikerjakan` | Dihapus / Dilewati |

## Larangan

- DILARANG menghapus task yang masih berstatus `kerjakan`, `belum`, atau `setengah` tanpa persetujuan pengguna.
- DILARANG mengubah isi task lain atau struktur kelompok yang masih berisi task aktif.
- DILARANG mengubah kode Dart atau berkas selain `task.md`.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila task sasaran terhapus, kelompok kosong ikut dihapus, dan laporan disampaikan.
- STOP bila `task.md` tidak ditemukan atau daftar penghapusan belum disetujui pengguna.
