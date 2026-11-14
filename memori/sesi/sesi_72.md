# Sesi 72

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 02:02 WIB
- Topik: Pertanyaan pengguna — mengapa model AI tidak membaca skill `migrasi-skema-sqlite` saat menulis `onCreate`/`onUpgrade` di `base_coc`

## Catatan Sesi

- Membaca `MEMORI.md`; memuat skill `memori-check`. Sesi paralel masih berjalan (sesi 70: diskusi fitur baru/PRD; sesi 71: sapaan, sudah sinkron). Sesi ini dicatat sebagai sesi 72.
- Pertanyaan pengguna bersifat analisis (read-only); tidak ada berkas proyek yang diubah.
- Bukti yang dikumpulkan:
  - `db_helper.dart` dibuat pada commit submodule `base_coc` `2297549` (2026-11-14 12:44 UTC, pesan "z", implementasi PRD `prd_upgrade_progress_desa`, sesi 51). `memori/sesi/sesi_51.md` baris 11 mencatat skill dibaca: `memori-check`, `struktur-folder-lib`, `model-state-freezed-abstract`, `migrasi-skema-sqlite`, `riverpod-pola`, `pola-testing`, `import-ordering`, `penamaan-konvensi`, dll. — tetapi DDL tetap memakai string literal (aturan 5 tidak dipatuhi).
  - `favorit_base` (v2) ditulis sesi 67 (`memori/sesi/sesi_67.md` baris 16–17): berkas `db_helper.dart` versi 2 dan `favorit_dao.dart` ada di *working tree* submodule `base_coc` (belum di-commit; `git status` root menampilkan `m base_coc`). Catatan sesi 67 tidak menyebut pemuatan skill `migrasi-skema-sqlite`; sesi 67 menyebut hanya skill `notifier-crud-database` (aturan 8) dan rujukan `format-prd`.
  - PRD `prd/prd_favorit_base.md` (sesi 62, Final) mendikte skema (`id_base TEXT PRIMARY KEY, dibuat TEXT NOT NULL`); sesi 67 menyalinnya — kemungkinan tanpa memuat skill migrasi-skema-sqlite.
  - Skill `migrasi-skema-sqlite` berasal dari riwayat commit proyek `berhenti_merokok` (`## Sumber Evaluasi`: `lib/shared/db/sqflite/sqflite.dart`, `lib/shared/konstanta/nama_tabel.dart`, dst.); `base_coc` punya set konstanta sendiri (`nama_tabel_progres.dart`, `favorit_dao.dart`) yang tidak dirujuk skill.
  - `base_coc` tidak memiliki `AGENTS.md`/rules/skills sendiri — konteks skill tersedia hanya bila agen memuatnya secara eksplisit di sesi.
- Jawaban diberikan di sesi (analisis + bukti); tidak ada perubahan kode/dokumen proyek.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `memori/sesi/sesi_72.md` | Dibuat | Catatan sesi ini |

## Sinkronisasi ke MEMORI.md

- Interaksi hanya analisis; tidak ada perubahan berkas proyek. Entri singkat ditambahkan pada `memori/riwayat_perubahan.md`. Tidak ada fakta durable baru yang layak dipromosikan ke `MEMORI.md`.
