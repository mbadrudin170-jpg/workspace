# Sesi 275

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-26 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: Diagnosis error `npm exec eas` / `npx eas` ("could not determine executable to run").

## Catatan Sesi

- Log npm menunjukkan percobaan menjalankan paket `eas@0.1.0` dari registry npm, yang tidak menyediakan executable → error "could not determine executable to run".
- Paket yang benar untuk Expo Application Services CLI adalah `eas-cli`, bukan `eas`.
- Solusi: pasang global `npm install -g eas-cli` lalu jalankan `eas build ...`, atau gunakan `npx eas-cli build --platform android --profile development`.
- Alias `easd` (jika ada) memanggil `eas`, sehingga CLI `eas` harus tersedia di PATH.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| `memori/sesi/sesi_275.md` | Dibuat | Berkas sesi aktif (Belum Sinkron) |

## Sinkronisasi ke MEMORI.md

Tidak ada perubahan proyek untuk disinkronkan ke MEMORI.md (hanya diagnosis terminal).
