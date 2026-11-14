# Sesi 79 — Aturan Rujukan Skill Menjadi Kelompok Wajib per Teknologi

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 03:05 WIB (sesi 79)
- Topik: Tindak lanjut sesi 77–78 — pengguna menolak bentuk pemetaan 1 skill per baris; berkas `.agents/rules/global/rujukan_skill.md` diubah menjadi kelompok wajib per teknologi (satu teknologi, beberapa skill).

## Catatan Sesi

- Membaca `MEMORI.md` (interaksi lanjutan pada percakapan yang sama).
- Umpan balik pengguna: "jadi bukan begitu harusnya begini semua proyek saya wajib menggunakan riverpod maka gunakan skill A, B dan C gitu".
- Klarifikasi via tool `question` (2026-11-15):
  1. Satu teknologi boleh merujuk beberapa skill (kombinasi per teknologi).
  2. Kelompok Riverpod = `riverpod-pola`, `model-state-freezed-abstract`, `notifier-crud-database`, `penanganan-asyncvalue-berkali`, `penanganan-async-data-kosong` (opsi rekomendasi).
  3. Teknologi wajib lain selain Riverpod: SQLite, Freezed, Testing, UI (gaya/tema; pengguna memilih semua opsi).
- Berkas `.agents/rules/global/rujukan_skill.md` ditulis ulang: H1 `# Rujukan Skill (Global)` + 5 kelompok wajib (Riverpod; SQLite = `migrasi-skema-sqlite`, `penamaan-konstanta-snake-case`, `parsing-nullable-int`, `notifier-crud-database`; Freezed = `model-state-freezed-abstract`, `build-runner-codegen`; Testing = `pola-testing`, `build-runner-codegen`; UI gaya/tema = `gaya`, `theme-data-color-schema`, `tipografi`, `spacing`), format nested list, path skill dalam backtick.
- Catatan tumpang tindih: `model-state-freezed-abstract` dan `build-runner-codegen` muncul di lebih dari satu kelompok — sesuai pilihan pengguna.
- `AGENTS.md` tetap tidak diubah (penolakan sesi 77 tidak dicabut).
- Berkas sesi 78 berstatus `Sudah Sinkron` sehingga tidak diubah; tindak lanjut ini dicatat di berkas sesi ini.
- Tidak ada kode Dart yang diubah; belum ada commit.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/rujukan_skill.md` | Diubah | Kelompok wajib per teknologi (5 kelompok, beberapa skill per teknologi) |
| `MEMORI.md` | Diubah | Status kerja dan sumber kebenaran diperbarui (sesi 79) |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru (teratas) |
| `memori/sesi/sesi_79.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

Sinkronisasi selesai pada 2026-11-15 (sesi 79): bagian `Status Kerja` dan `Konvensi & Sumber Kebenaran` pada `MEMORI.md` diperbarui — `rujukan_skill.md` kini berupa 5 kelompok wajib per teknologi (Riverpod, SQLite, Freezed, Testing, UI gaya/tema) dengan beberapa skill per kelompok; header `MEMORI.md` → `Diperbarui: Sun Nov 15 2026 03:05 WIB (sesi 79)`. `memori/riwayat_perubahan.md` ditambah entri (teratas). `AGENTS.md` tidak diubah. Berkas sesi lama `Sudah Sinkron` tidak diubah.
