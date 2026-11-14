# Sesi 80 — Aturan Model/State Wajib Freezed

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 03:12 WIB (sesi 80)
- Topik: Tindak lanjut sesi 79 — pengguna menambahkan aturan: semua model dan state yang harus punya method dan getter wajib pakai freezed.

## Catatan Sesi

- Membaca `MEMORI.md` (interaksi lanjutan pada percakapan yang sama).
- Umpan balik pengguna: "semua model dan state yang harus punya method dan getter wajib pakai freezed".
- Berkas `.agents/rules/global/rujukan_skill.md` ditambah satu kelompok baru (setelah kelompok Freezed): "semua model dan state yang harus punya method dan getter wajib pakai freezed maka gunakan skill: `model-state-freezed-abstract`, `build-runner-codegen`".
- Alasan menyertakan `model-state-freezed-abstract`: skill tersebut memuat pola getter/method pada Freezed abstract class (private constructor `._()`). `build-runner-codegen` disertakan konsisten dengan kelompok Freezed (model Freezed memerlukan code generation).
- `AGENTS.md` tetap tidak diubah (penolakan sesi 77 tidak dicabut).
- Berkas sesi 79 berstatus `Sudah Sinkron` sehingga tidak diubah; tindak lanjut ini dicatat di berkas sesi ini.
- Benturan penomoran sesi: entri `memori/riwayat_perubahan.md` (03:10 WIB, "Interaksi sapaan (sesi 80)") dan header `MEMORI.md` ("03:10 WIB (sesi 80)") sudah diisi sesi lain sebelum berkas ini dibuat; isi berkas ini tetap dipertahankan (dibuat sebelum isi paralel teramati) dan benturan dilaporkan ke pengguna. Sesi ini tidak mengubah entri paralel.
- Tidak ada kode Dart yang diubah; belum ada commit.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/rujukan_skill.md` | Diubah | Tambah kelompok "model dan state yang harus punya method dan getter wajib pakai freezed" |
| `MEMORI.md` | Diubah | Status kerja dan sumber kebenaran diperbarui (sesi 80) |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru (teratas) |
| `memori/sesi/sesi_80.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

Sinkronisasi selesai pada 2026-11-15 (sesi 80): bagian `Status Kerja` dan `Konvensi & Sumber Kebenaran` pada `MEMORI.md` diperbarui — `rujukan_skill.md` kini memuat 6 kelompok (Riverpod, SQLite, Freezed, model/state wajib freezed, Testing, UI gaya/tema); header `MEMORI.md` → `Diperbarui: Sun Nov 15 2026 03:12 WIB (sesi 80)` (ditemukan sudah tertulis "03:10 WIB (sesi 80)" oleh sesi paralel; diperbarui jam-nya oleh sinkronisasi ini). `memori/riwayat_perubahan.md` ditambah entri (teratas, ditandai benturan penomoran sesi 80). `AGENTS.md` tidak diubah. Berkas sesi lama `Sudah Sinkron` tidak diubah.
