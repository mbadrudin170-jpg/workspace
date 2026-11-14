---
description: Mengerjakan permintaan pengguna secara terfokus sesuai topik atau perintah yang diberikan, tanpa memperluas cakupan.
agent: code
---

# Kerjakan

## Tujuan

Mengerjakan permintaan pengguna secara terfokus: hanya pada topik atau perintah yang diberikan, dengan hasil yang dapat diverifikasi.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku saat berinteraksi dan pada laporan.
3. Muat skill yang trigger-nya terpenuhi sebelum mengubah kode atau dokumen.

## Cakupan

- Hanya pekerjaan yang disebutkan atau tersirat jelas dari permintaan pengguna.

## Parameter

- `$ARGUMENTS`: topik atau perintah yang harus dikerjakan.
- Jika `$ARGUMENTS` kosong atau ambigu: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca konteks yang relevan (berkas, aturan, skill) sebelum mengubah apa pun.
2. **Plan** — nyatakan rencana singkat; bila akan mengubah beberapa berkas, tampilkan daftar berkasnya.
3. **Execute** — kerjakan hanya bagian yang diminta, sesuai konvensi proyek.
4. **Review** — verifikasi hasil (`dart format`, `dart analyze`, `flutter test` bila relevan) dan pastikan tidak ada perubahan di luar cakupan.
5. Bila permintaan bertentangan dengan aturan proyek: **STOP** dan laporkan pertentangannya.

## Format Laporan

- Ringkasan perubahan: berkas yang diubah beserta alasannya.
- Verifikasi yang dijalankan beserta hasilnya.
- Hal yang belum dikerjakan atau membutuhkan keputusan pengguna.

## Larangan

- DILARANG memperluas cakupan pekerjaan tanpa persetujuan pengguna.
- DILARANG mengubah berkas di luar topik atau yang tidak terkait.
- DILARANG commit/push tanpa perintah eksplisit pengguna.
- DILARANG mengarang hasil verifikasi yang tidak dijalankan.

## Kriteria Selesai / STOP

- Selesai bila permintaan terpenuhi, verifikasi relevan lulus, dan laporan disampaikan.
- STOP bila permintaan ambigu, di luar cakupan, atau memerlukan keputusan pengguna.
