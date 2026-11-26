# Sesi 272

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-26 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: Menjawab pertanyaan terminal: mengapa `easd` tidak ditemukan.

## Catatan Sesi

- Pengguna melampirkan keluaran terminal: `easd` menghasilkan `bash: eas: command not found` (alias `easd` memanggil `eas`).
- Ditemukan alias `easd='eas build --platform android --profile development'` di `~/.bash_aliases` dan `workspace/script/bash_aliases.sh`.
- Pemeriksaan `command -v eas` menunjukkan `eas` (Expo Application Services CLI) belum terpasang di lingkungan ini.
- Penyebab ganda: (1) alias belum termuat di shell aktif (shell non-interaktif/tidak source), (2) CLI `eas` belum terpasang.
- Solusi diberikan: `source ~/.bash_aliases` lalu pasang `eas-cli` (`npm install -g eas-cli`) atau jalankan via `npx eas-cli build --platform android --profile development`.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| `memori/sesi/sesi_272.md` | Dibuat | Berkas sesi aktif (Belum Sinkron) |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan (tidak ada perubahan kode/dokumen proyek; hanya penjelasan).
