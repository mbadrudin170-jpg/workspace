---
name: format-prd
description: "Gunakan ini saat membuat atau memperbarui PRD | Panduan format PRD proyek: header Status Dokumen dan Status Implementasi, enam bagian wajib (Informasi Produk, Tujuan PRD, Daftar Fitur, Alur Pengguna, Steps, File-File Terdampak), konteks penggunaan dan aturan pengisian per bagian, tabel prioritas (Must/Should/Could Have). Jangan digunakan untuk berkas hasil diskusi (`hasil_diskusi/diskusi_N.md`) atau `task.md`. Format PRD Mengatur bentuk dan isi dokumen PRD (_Product Requirements Document_) agar konsisten di seluruh proyek: header status, enam bagian wajib, konteks penggunaan dan aturan pengisian per bagian. Skill ini menggantikan berkas aturan `format_PRD.md` (dahulu `.agents/rules/global/format_PRD.md`, konversi penuh, sesi 66; berkas sumber kini dihapus); aturan format PRD kini mengikat melalui skill ini. Cakupan yang Di-Cover - Dokumen: PRD pada `prd/` di root proyek (mis. `prd/prd_<nama>.md`) - Header wajib: `**Status Dokumen:**` dan `**Status Implementasi:**` - Bagian wajib: Informasi Produk, Tujuan PRD, Da"
---

# Format PRD

Mengatur bentuk dan isi dokumen PRD (_Product Requirements Document_) agar konsisten di seluruh proyek: header status, enam bagian wajib, konteks penggunaan dan aturan pengisian per bagian. Skill ini menggantikan berkas aturan `format_PRD.md` (dahulu `.agents/rules/global/format_PRD.md`, konversi penuh, sesi 66; berkas sumber kini dihapus); aturan format PRD kini mengikat melalui skill ini.

## Cakupan yang Di-Cover

- Dokumen: PRD pada `prd/` di root proyek (mis. `prd/prd_<nama>.md`)
- Header wajib: `**Status Dokumen:**` dan `**Status Implementasi:**`
- Bagian wajib: Informasi Produk, Tujuan PRD, Daftar Fitur, Alur Pengguna, Steps, File-File Terdampak
- Tabel: Daftar Fitur (`| Fitur | Deskripsi | Prioritas |`) dan File-File Terdampak (`| Lokasi File | Status Perubahan | Deskripsi Perubahan |`)
- Status prioritas: `Must Have`, `Should Have`, `Could Have`
- Status dokumen: `Draft` / `Final`
- Status implementasi: `Belum Diimplementasikan` / `Sedang Diimplementasikan` / `Sudah Diimplementasikan`

## Aturan

1. PRD diawali header `**Status Dokumen:** Draft / Final` dan `**Status Implementasi:** Belum Diimplementasikan / Sedang Diimplementasikan / Sudah Diimplementasikan`, diikuti pemisah `---`.
2. PRD memuat tepat enam bagian berurutan dengan judul persis: `## 1. Informasi Produk`, `## 2. Tujuan PRD`, `## 3. Daftar Fitur`, `## 4. Alur Pengguna`, `## 5. Steps`, `## 6. File-File Terdampak`.
3. Tiap bagian (setelah header) memuat `Konteks penggunaan:`, `Aturan pengisian:`, dan isi (`**Informasi:**`, `**Isi:**`, atau tabel).
4. Bedakan status dokumen dengan status implementasi; jangan mengarang informasi yang belum diketahui - tulis secara eksplisit (mis. `Belum diketahui`).
5. Bagian 1 Informasi Produk: isi `Nama aplikasi`, `Deskripsi produk`, `Platform`, `Versi`, `Status pengembangan` berdasarkan kondisi proyek yang sebenarnya; gunakan nama yang konsisten dengan proyek; cantumkan platform dan versi target.
6. Bagian 2 Tujuan PRD: tuliskan hasil yang diharapkan dari PRD; setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; gunakan tujuan yang jelas dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.
7. Bagian 3 Daftar Fitur: satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah (`| Fitur | Deskripsi | Prioritas |`); jangan menggabungkan beberapa fitur dalam satu baris; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`; setiap fitur wajib mendukung tujuan produk dan masuk dalam ruang lingkup.
8. Bagian 4 Alur Pengguna: mulai dari kondisi awal pengguna; jelaskan langkah secara berurutan; sebutkan tindakan pengguna dan respons aplikasi; sertakan percabangan atau kondisi alternatif bila ada; jelaskan kondisi akhir yang diharapkan; pastikan alur sesuai persyaratan fitur; jangan memasukkan proses yang tidak didukung kebutuhan produk.
9. Bagian 5 Steps: buat langkah yang spesifik dan dapat diikuti; gunakan numbered list; setiap langkah harus tidak ambigu dan dapat dikerjakan; jangan memasukkan langkah yang tidak relevan atau redundan.
10. Bagian 6 File-File Terdampak: periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi file spesifik sesuai struktur proyek sebenarnya; tandai `Dibuat` / `Diubah` / `Dihapus`; jelaskan alasan dan tujuan perubahan; cantumkan hanya file yang terkait kebutuhan fitur; jika file belum dapat ditentukan, tandai sebagai belum diketahui - jangan menebak; perbarui daftar setelah analisis teknis atau implementasi bila ditemukan file terdampak tambahan.

## Steps

1. Tentukan status dokumen (`Draft`/`Final`) dan status implementasi yang sesuai kondisi aktual.
2. Isi bagian 1-6 secara berurutan sesuai Aturan 4-10.
3. Verifikasi: enam judul bagian sesuai persis, tabel prioritas terisi, status implementasi konsisten dengan perubahan kode sesi ini.

## Larangan

- DILARANG mengubah jumlah, judul, atau urutan enam bagian wajib.
- DILARANG menulis status `Sudah Diimplementasikan` (atau `Sedang Diimplementasikan`) tanpa implementasi kode yang faktual.
- DILARANG mengarang lokasi, nama, atau keberadaan file pada bagian File-File Terdampak.
- DILARANG menggabungkan beberapa fitur dalam satu baris tabel Daftar Fitur.
- DILARANG memakai struktur PRD untuk berkas hasil diskusi (`hasil_diskusi/diskusi_N.md`) - gunakan `.agents/rules/global/format_hasil_diskusi.md`; untuk `task.md` gunakan skill `.agents/skills/non-code/format-task-md/SKILL.md`.
- DILARANG mengosongkan bagian tanpa keterangan eksplisit (`Belum dibahas` / `Belum diketahui`).

## Contoh Benar

```markdown
**Status Dokumen:** Draft
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek. ...
**Aturan pengisian:**
...
**Informasi:**

- Nama aplikasi: <nama aktual proyek>
- Deskripsi produk: <deskripsi aktual>
- Platform: <platform target>
- Versi: <versi>
- Status pengembangan: <status aktual>
```

## Contoh Salah

```markdown
**Status Implementasi:** Sudah Diimplementasikan // salah: dikarang; sesi hanya membuat dokumen

| Fitur                         | Deskripsi | Prioritas |
| ----------------------------- | --------- | --------- |
| Fitur A dan Fitur B sekaligus | ...       | Must Have | // salah: satu baris dua fitur |
```
