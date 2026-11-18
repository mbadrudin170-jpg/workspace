---
name: disiplin-scope-kerja
description: "Trigger: saat mengerjakan tugas apa pun (kode, dokumen, refactor, pemanggilan command) | Panduan disiplin cakupan kerja: jangan membuat perubahan di luar berkas/cakupan tugas (termasuk churn whitespace/format), format hanya pada berkas terdampak tugas, review `git diff` sebelum melapor, dan laporkan berkas yang berubah di luar sesi."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Thu Nov 19 2026 02:56 WIB"
---

# Disiplin Cakupan Kerja

Menetapkan batasan tegas antara pekerjaan yang diperintahkan dan perubahan lain yang "kebetulan lewat" — supaya AI tidak membesarkan cakupan pekerjaan tanpa persetujuan.

## Cakupan yang Di-Cover

- Perubahan kode/dokumen di luar cakupan tugas: format massal, rename opsional, type/fix drive-by.
- Berkas yang berubah akibat proses/sesi lain (paralel) saat sedang dikerjakan.
- Review `git diff` sebelum melapor selesai.

## Aturan

1. Kerjakan hanya berkas/cakupan yang relevan dengan tugas; perubahan tambahan di luar cakupan (opsional cleanup, format, rename, "bagus-bagus tambahan") WAJIB dikonfirmasi ke pengguna sebelum dikerjakan.
2. Format hanya pada berkas yang memang bagian dari tugas (mis. `dart format <berkas>`); jangan jalankan format/linter untuk seluruh proyek kecuali diminta eksplisit.
3. Sebelum melapor selesai, review `git diff --stat`; seluruh berkas yang berubah WAJIB tercantum di laporan/tabel berkas terdampak; berkas yang berubah di luar sesi (proses lain) dilaporkan sebagai temuan — jangan diklaim milik sesi ini dan jangan diperbaiki tanpa persetujuan.
4. Masalah di luar cakupan yang ditemukan saat bekerja (bug, impor rusak, drift dokumen) dicatat/dilaporkan sebagai usulan; jangan sekaligus diperbaiki tanpa persetujuan.
5. Perubahan kosmetik (whitespace, trailing spaces, blank line) pada berkas yang tidak terdampak tugas DILARANG.

## Contoh Benar

```bash
# Memformat satu berkas yang memang diubah dalam tugas
dart format lib/fitur/pelanggan/dummy/pelanggan_dummy.dart
```

Laporan yang jujur:

```text
Berkas a.dart berubah di luar sesi ini (proses lain) — tidak saya klaim dan tidak saya perbaiki.
```

## Contoh Salah

```bash
# DILARANG: format massal seluruh proyek saat tugas hanya menyentuh satu berkas
dart format lib/

# DILARANG: membetulkan impor/path di berkas di luar tugas "sekalian saja"
```

```text
# DILARANG: melapor "selesai" tanpa mengecek git diff — berkas asing ikut terklaim
```

## Sumber Evaluasi

- Sesi 47 (2026-11-19): dua insiden — (a) whitespace churn di berkas test di luar cakupan tugas (`fungsi_menampilkan_notifikasi_test.dart`) sempat masuk dan dikembalikan ke HEAD; (b) berkas yang sedang diedit oleh sesi/agent lain berubah di tengah jalan (impor menunjuk path tidak ada, bagian belum selesai) sehingga suntingan pertama gagal (`oldString` tidak cocok). Atas persetujuan pengguna (perintah `/tambah_kode_keskill`). Provenance: sesi; bukan commit.
- Skill terkait: `penggunaan-tool-bawaan-kilo` (baca ulang sebelum sunting), `memori-check` (tabel Berkas Terdampak wajib mencakup seluruh perubahan).
