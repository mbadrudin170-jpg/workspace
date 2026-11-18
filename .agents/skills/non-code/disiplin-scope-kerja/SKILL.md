---
name: disiplin-scope-kerja
description: "Trigger: saat mengerjakan tugas apa pun (kode, dokumen, refactor, pemanggilan command), termasuk migrasi massal via codemod/skrip otomatis | Panduan disiplin cakupan kerja: jangan membuat perubahan di luar berkas/cakupan tugas (termasuk churn whitespace/format), format hanya pada berkas terdampak tugas, review `git diff` sebelum melapor, laporkan berkas yang berubah di luar sesi, dan verifikasi codemod lintas berkas setelah dieksekusi."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 03:20 WIB"
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
6. Migrasi massal lintas berkas (mis. skrip codemod yang memodifikasi puluhan berkas sekaligus) WAJIB memakai persetujuan eksplisit pengguna atas cakupannya; skrip ditulis ke direktori sementara (mis. `/tmp`) dan tidak boleh menyentuh berkas di luar pola yang disetujui; setelah dieksekusi WAJIB `git diff --stat` + `dart format <berkas>` pada berkas tugas (bukan `dart format lib`) + `dart analyze`; seluruh berkas tersentuh wajib tercantum di tabel Berkas Terdampak; pola yang gagal dikonversi wajib diselesaikan manual atau dilaporkan, tidak boleh diabaikan.

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
- Sesi 48 (2026-11-19): Butir 6 baru — aturan migrasi massal via codemod/skrip otomatis (temuan transkrip `ses_e0ff43aabffeZAT9lQX9Ao60Av`: codemod `migrasi_nav.dart` mengubah ~30 berkas `Navigator.*` → `Nav.*`; scope massal sudah disetujui pengguna secara eksplisit, tetapi metode codemod dan kewajiban verifikasi setelahnya belum diatur). Atas persetujuan pengguna.
