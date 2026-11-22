# Sesi 216

Tanggal: 2026-11-22 (Asia/Jakarta)

## Status
- **Status Sinkron:** Sudah Sinkron
- **Tanggal:** 2026-11-22 (Asia/Jakarta)
- **Command:** interaksi langsung (tanpa command)
- **Topik:** Tambah aturan 55 ke `.agents/rules/code.md` — helper privat di UI yang membutuhkan state wajib menerima state via parameter (dari `ref.watch` di `build`) atau memakai `ref.read(provider.future)` di dalam fungsinya; DILARANG `ref.read(provider)` sinkron lalu `.requireValue` di helper.

## Catatan Sesi

- Membaca `MEMORI.md` (utuh) dan `.agents/rules/code.md` (utuh, 54 aturan) sebelum bertindak.
- Catch-up sync awal sesi: `sesi_184.md`/`sesi_190.md` ambigu (tidak disentuh); `sesi_215.md` `Sudah Sinkron` (arsip, tidak diubah per Aturan 13).
- Perubahan:
  - `.agents/rules/code.md`: append aturan 55 (helper privat menerima state via parameter atau `ref.read(provider.future)`; DILARANG `ref.read(provider)` sinkron + `.requireValue` di helper). Skill terkait: `aturan-riverpod`, `penanganan-async`.
- Verifikasi: `code.md` 55 aturan (54 lama utuh + 1 baru).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| .agents/rules/code.md | Diubah | Append aturan 55 (helper privat + state) |
| memori/sesi/sesi_216.md | Dibuat | Berkas sesi aktif |

## Sinkronisasi ke MEMORI.md

`MEMORI.md` header diperbarui ke `(sesi 216)`; Catatan Teknis ditambah entri aturan 55 dengan provenance sesi 216; `memori/riwayat_perubahan.md` ditambah entri sesi 216. Aturan 1–54 tetap utuh (55 aturan total).