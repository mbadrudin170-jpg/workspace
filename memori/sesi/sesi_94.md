# Sesi 94 — Tambah Kelompok Konstanta Model pada kelompok_skill_wajib.md

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 04:15 WIB (perintah masuk 2026-11-14T21:14:40Z)
- Topik: Menambahkan ketentuan "model jangan ditulis manual, wajib pakai konstanta" pada `.agents/rules/global/kelompok_skill_wajib.md`.

## Catatan Sesi

- Membaca `MEMORI.md` (header saat itu `Diperbarui: Sun Nov 15 2026 04:05 WIB (sesi 91)`).
- Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron` menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu, tidak dapat diverifikasi sepihak), `sesi_92.md` (sesi paralel aktif, baru dibuat 2026-11-14T21:06:43Z), dan `sesi_93.md` (sesi paralel aktif, baru dibuat 2026-11-14T21:07:40Z). Ketiganya **tidak disentuh** dan dilaporkan ke pengguna; tidak diputuskan sepihak.
- Permintaan pengguna (verbatim): "tambahkan untuk model jangan di tulis manual wajib pakai constanta". Makna persis ambigu → klarifikasi via tool `question`; pengguna memilih "Konstanta nama tabel/kolom (Recommended)".
- Perubahan pada `.agents/rules/global/kelompok_skill_wajib.md`:
  - Bagian `## Ringkasan`: daftar teknologi ditambah "model database (konstanta nama tabel/kolom, bukan string literal manual)".
  - Kelompok baru ditambahkan sebelum kelompok Testing: "semua model database jangan ditulis manual (nama tabel/kolom) wajib pakai konstanta, bukan string literal, maka gunakan skill: `penamaan-konstanta-snake-case`, `migrasi-skema-sqlite`".
  - Skill `migrasi-skema-sqlite` disertakan karena konstanta wajib cocok persis dengan skema/migrasi (`onCreate`/`onUpgrade`) per aturan skill `penamaan-konstanta-snake-case`.
- Berkas sudah terdaftar pada `instructions` di `.kilo/kilo.jsonc` sejak sesi 84; tidak ada penambahan/penghapusan `instructions` yang diperlukan (perubahan isi berkas, bukan berkas baru).
- `AGENTS.md` tidak diubah (kelompok_skill_wajib.md memang belum didaftarkan di sana).
- `SKILLS_INDEX.md` tidak berubah (tidak ada skill baru/diubah).
- Tidak ada kode Dart yang diubah.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/kelompok_skill_wajib.md` | Diubah | Kelompok baru: model database wajib konstanta nama tabel/kolom (bukan string literal manual) → `penamaan-konstanta-snake-case`, `migrasi-skema-sqlite`; Ringkasan diperbarui |
| `MEMORI.md` | Diubah | Header `Diperbarui` → sesi 94; entri kelompok_skill_wajib (Status Kerja) 6 → 7 kelompok; entri `Konvensi & Sumber Kebenaran` idem |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru sesi 94 (2026-11-15 04:15 WIB) di atas entri sesi 91 |
| `memori/sesi/sesi_94.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

- Header `MEMORI.md` → `Diperbarui: Sun Nov 15 2026 04:15 WIB (sesi 94)`.
- Bagian `Status Kerja`: entri kelompok_skill_wajib diperbarui 6 → 7 kelompok (tambah "Model database wajib konstanta … ditambahkan sesi 94 atas perintah pengguna"); daftar rujukan sesi ditambah sesi 94.
- Bagian `Konvensi & Sumber Kebenaran`: "7 kelompok wajib/terikat (Riverpod, SQLite, Freezed, model/state wajib freezed, model database wajib konstanta nama tabel/kolom, Testing, UI gaya/tema)".
- `memori/riwayat_perubahan.md`: entri baru sesi 94 ditambahkan.

Belum di-commit (working tree; berkas `.agents/rules/`, `MEMORI.md`, `memori/` hanya diubah di sesi ini).
