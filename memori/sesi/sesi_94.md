# Sesi 94 — Tambah Kelompok Konstanta Model, Provider CRUD Wajib Notifier & Provider Wajib Riverpod pada kelompok_skill_wajib.md

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 04:15 WIB (perintah masuk 2026-11-14T21:14:40Z)
- Topik: Menambahkan tiga ketentuan pada `.agents/rules/global/kelompok_skill_wajib.md`: (1) "model jangan ditulis manual, wajib pakai konstanta"; (2) "provider yang bisa punya fungsi CRUD wajib dijadikan Notifier (bukan `Provider` biasa/read-only)"; (3) "semua provider wajib pakai riverpod".

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

- Permintaan lanjutan (verbatim): "tambahkan jika sebuah provider bisa punya fungsi crud maka jadikan notifier". Skill `riverpod-pola` dan `notifier-crud-database` dimuat sebelum mengubah berkas; lokasi penambahan diklarifikasi via `question` → "Kelompok baru (Recommended)".
- Kelompok baru "semua provider yang bisa punya fungsi CRUD wajib dijadikan notifier (bukan `Provider` biasa/read-only) maka gunakan skill: `riverpod-pola`, `notifier-crud-database`" ditambahkan sebelum kelompok Testing; `## Ringkasan` ditambah "provider dengan fungsi CRUD (wajib Notifier)".
- Permintaan lanjutan-2 (verbatim): "tambahkan semua provider wajib pakai riverpod". Skill `riverpod-pola` dimuat sebelum mengubah berkas; makna diklarifikasi via `question` → "Kelompok baru (Recommended)".
- Kelompok baru "semua provider (state) wajib dibuat dengan Riverpod (bukan package `provider`, `InheritedWidget` manual, atau setState murni) maka gunakan skill: `riverpod-pola`" ditambahkan tepat sebelum kelompok "semua provider yang bisa punya fungsi CRUD …"; `## Ringkasan` ditambah "Riverpod (semua provider wajib Riverpod)".
- Setelah semua permintaan lanjutan selesai, status sesi dikembalikan ke `Sudah Sinkron`.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/rules/global/kelompok_skill_wajib.md` | Diubah | Tiga kelompok baru ditambahkan di sesi ini: model database wajib konstanta (04:15), provider CRUD wajib Notifier (04:22), provider wajib Riverpod (04:23); Ringkasan diperbarui tiga kali |
| `MEMORI.md` | Diubah | Header `Diperbarui` → sesi 94 (04:23); entri kelompok_skill_wajib 6 → 9 kelompok (Status Kerja & Konvensi) |
| `memori/riwayat_perubahan.md` | Diubah | Entri sesi 94 (04:15, 04:22, 04:23 WIB) |
| `memori/sesi/sesi_94.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

- Header `MEMORI.md` → `Diperbarui: Sun Nov 15 2026 04:23 WIB (sesi 94)` (header sebelumnya di penyesuaian sesi 91 diubah oleh sesi paralel menjadi 04:30 WIB (sesi 93); dikembalikan penunjuk ke sesi 94 setelah sinkronisasi).
- Bagian `Status Kerja`: entri kelompok_skill_wajib diperbarui 7 → 9 kelompok (tambah "Provider wajib Riverpod …" dan "Provider CRUD wajib Notifier …", keduanya ditambahkan sesi 94 atas perintah pengguna); daftar rujukan sesi ditambah sesi 94.
- Bagian `Konvensi & Sumber Kebenaran`: "9 kelompok wajib/terikat (Riverpod, SQLite, Freezed, model/state wajib freezed, model database wajib konstanta nama tabel/kolom, provider wajib Riverpod, provider dengan fungsi CRUD wajib Notifier, Testing, UI gaya/tema)".
- `memori/riwayat_perubahan.md`: entri sesi 94 (04:15, 04:22, 04:23 WIB) ditambahkan (urutan terbaru di atas; berkas diubah juga oleh sesi paralel sesi 92/93 — entri mereka tidak disentuh).

Belum di-commit (working tree; berkas `.agents/rules/`, `MEMORI.md`, `memori/` hanya diubah di sesi ini).
