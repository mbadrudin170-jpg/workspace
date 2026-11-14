# Sesi 101 — kelompok_skill_wajib.md: Kelompok Tipe Data Null

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 04:48 WIB (sesi 101)
- Topik: Perintah pengguna: menambahkan pada `.agents/rules/global/kelompok_skill_wajib.md` kewajiban melihat skill bila ada tipe data null.

## Catatan Sesi

- `MEMORI.md` telah dibaca (header `Diperbarui: Sun Nov 15 2026 04:42 WIB (sesi 100)`). Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron` pada `memori/sesi/` hanya menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu, tidak dapat diverifikasi sepihak) — tetap `Belum Sinkron`, tidak disentuh, dilaporkan lagi ke pengguna. Tidak ada berkas `Belum Sinkron` lain.
- Permintaan pengguna: "tambahkan jika ada tipe data yang null wajib lihat skill dulu" pada `.agents/rules/global/kelompok_skill_wajib.md`.
- Klarifikasi via `question`: (1) skill yang dimuat = hanya skill khusus null — `type-promotion-null-safety` (trigger: saat mengakses field nullable objek model) dan `parsing-nullable-int` (trigger: saat membaca field integer nullable dari database; keduanya satu-satunya skill dengan trigger spesifik null di `SKILLS_INDEX.md`); (2) formulasi mengikuti gaya kelompok lain di berkas tersebut.
- Perubahan: menambahkan satu kelompok baru pada `.agents/rules/global/kelompok_skill_wajib.md` dan memperbarui `## Ringkasan` (jumlah kelompok 9 → 10).
- Tidak ada kode Dart yang diubah; berkas aturan tidak di-commit; perubahan hanya di working tree.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/kelompok_skill_wajib.md` | Diubah | Menambahkan kelompok "tipe data null/nullable wajib merujuk skill type-promotion-null-safety dan parsing-nullable-int"; `## Ringkasan` diperbarui (9 → 10 kelompok) |
| `MEMORI.md` | Diubah | Header `Diperbarui` → sesi 101; entri Status Kerja baru (sesi 101); penyebutan "9 kelompok" pada bagian Konvensi diperbarui menjadi 10 |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru (teratas) sesi 101 |
| `memori/sesi/sesi_101.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

- `MEMORI.md`: header `Diperbarui` → `Sun Nov 15 2026 04:48 WIB (sesi 101)`; entri baru pada `## Status Kerja` (sesi 101) merangkum penambahan kelompok tipe data null/nullable; kalimat konvensi `kelompok_skill_wajib.md` diperbarui (9 → 10 kelompok, daftar memuat tipe data null/nullable).
- `memori/riwayat_perubahan.md`: entri baru (teratas) sesi 101 ditambahkan.
- Catatan catch-up tetap berlaku: `sesi_81.md` tetap `Belum Sinkron` (ambigu, tidak diputuskan sepihak).
- Tidak ada kode Dart yang diubah; berkas aturan tidak di-commit; perubahan hanya di working tree.
