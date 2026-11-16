# Hasil Diskusi 2 — Sistem Kerja Global: Alur Git & Commit

## Status

- Dokumen: Final
- Implementasi: Belum Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Sistem kerja global (lintas proyek) untuk alur Git & commit, berupa aturan dan konvensi yang ditempatkan di repositori `workspace`.

## Latar Belakang

Pengguna ingin sistem kerja yang bersifat global (tidak khusus satu proyek) untuk alur Git & commit, agar konvensi konsisten lintas proyek. Repositori `workspace` berfungsi sebagai pengumpul konfigurasi lintas-proyek (aturan AI agent, skill, snippet, alias), sehingga menjadi tempat yang tepat untuk menempatkan aturan & konvensi global ini. Saat ini belum ada standar tertulis untuk format commit, strategi branch, penamaan branch, merge, dan rilis yang berlaku lintas proyek.

## Poin Diskusi

### 1. Ruang lingkup sistem kerja global

- Tanya: Komponen apa yang dicakup sistem kerja global?
- Kesimpulan: Aturan & konvensi (bukan skill/command atau template), dengan fokus awal pada alur Git & commit.

### 2. Lokasi penempatan

- Tanya: Di mana sistem kerja global ditempatkan?
- Kesimpulan: Repositori `workspace` (pengumpul konfigurasi lintas-proyek), bukan folder konfigurasi global terpisah.

### 3. Format commit message

- Tanya: Format commit message yang diinginkan?
- Kesimpulan: Conventional Commits — tipe `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `perf`, `build`, `ci`, `style`, `revert`, dengan scope opsional (mis. `feat(galeri): tambah filter Town Hall`).

### 4. Strategi branching

- Tanya: Strategi branching yang diinginkan?
- Kesimpulan: Trunk-based — `main` selalu deployable; fitur dikembangkan via short-lived branch + Pull Request.

### 5. Penamaan branch

- Tanya: Aturan penamaan branch dan apakah wajib prefix?
- Kesimpulan: Prefix wajib sesuai tipe commit (`feat/`, `fix/`, `docs/`, `chore/`, `refactor/`, `test/`, `perf/`, `build/`, `ci/`, `style/`), nama singkat kebab-case, satu topik per branch.

### 6. Strategi merge

- Tanya: Strategi merge PR yang diinginkan?
- Kesimpulan: Squash merge — satu commit per PR; commit message diambil dari judul/deskripsi PR.

### 7. Rilis dan versi

- Tanya: Apakah rilis (tag/version) perlu aturan khusus?
- Kesimpulan: Semver (`vX.Y.Z`) + changelog otomatis/manual dari Conventional Commits.

### 8. Finalisasi draft

- Tanya: Apakah draft cukup untuk dibuatkan berkas hasil diskusi, atau perlu tambahan (PR/review/tag/changelog)?
- Kesimpulan: Cukup; detail PR/review/tag/changelog ditunda sebagai pertanyaan terbuka untuk diskusi lanjutan.

## Keputusan

- K-1: Sistem kerja global yang dibuat mencakup aturan & konvensi, dengan fokus awal pada alur Git & commit, ditempatkan di repositori `workspace`.
- K-2: Format commit message wajib mengikuti Conventional Commits dengan tipe: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `perf`, `build`, `ci`, `style`, `revert`, dan scope opsional.
- K-3: Strategi branching menggunakan Trunk-based: `main` selalu deployable; pengembangan fitur/fix via short-lived branch + Pull Request.
- K-4: Penamaan branch wajib memakai prefix sesuai tipe commit (mis. `feat/<topik>`, `fix/<topik>`), nama singkat kebab-case, satu topik per branch.
- K-5: Merge PR menggunakan Squash merge (satu commit per PR; commit message dari PR).
- K-6: Rilis mengikuti Semantic Versioning (`vX.Y.Z`) disertai changelog yang disusun dari Conventional Commits (otomatis atau manual).

## Rekomendasi

- R-1: Buat berkas aturan global baru (mis. `.agents/rules/global/alur_git_commit.md`) yang memuat K-2 s.d. K-6, lalu rujuk dari `AGENTS.md` dan/atau buat skill portabel agar aturan dapat dimuat lintas proyek.
- R-2: Tambahkan aturan pengecualian secara eksplisit (mis. commit langsung ke `main` untuk `docs`/`chore` kecil) pada diskusi lanjutan agar tidak ambigu.
- R-3: Standarkan template PR (deskripsi, checklist, referensi issue) dan aturan review (minimal reviewer, auto-merge) pada diskusi lanjutan.
- R-4: Standarkan prosedur tag & changelog (siapa membuat tag, kapan rilis dilakukan) pada diskusi lanjutan.
- R-5: Setelah aturan disepakati, perbarui `MEMORI.md` (bagian konvensi & sumber kebenaran) dan `memori/riwayat_perubahan.md` melalui alur sesi.

## Tindak Lanjut

| No  | Tindakan                                                                    | File Terdampak                                   | Status |
| --- | --------------------------------------------------------------------------- | ------------------------------------------------ | ------ |
| 1   | Buat berkas aturan global alur Git & commit (K-2 s.d. K-6)                  | `.agents/rules/global/alur_git_commit.md` (baru) | belum  |
| 2   | Rujuk aturan baru dari `AGENTS.md` dan/atau buat skill portabel             | `AGENTS.md`, `.agents/skills/...`                | belum  |
| 3   | Diskusikan aturan PR, review, tag, changelog, dan pengecualian              | `hasil_diskusi/diskusi_N.md` (lanjutan)          | belum  |
| 4   | Perbarui `MEMORI.md` dan `memori/riwayat_perubahan.md` setelah implementasi | `MEMORI.md`, `memori/riwayat_perubahan.md`       | belum  |

## File Terdampak

| Lokasi File                               | Status Perubahan | Deskripsi                                              |
| ----------------------------------------- | ---------------- | ------------------------------------------------------ |
| `hasil_diskusi/diskusi_2.md`              | Dibuat           | Berkas hasil diskusi ini                               |
| `.agents/rules/global/alur_git_commit.md` | Belum dibuat     | Aturan global alur Git & commit (tindak lanjut)        |
| `AGENTS.md`                               | Belum diubah     | Rujukan aturan baru (tindak lanjut)                    |
| `MEMORI.md`                               | Belum diubah     | Pencatatan konvensi & sumber kebenaran (tindak lanjut) |
| `memori/riwayat_perubahan.md`             | Belum diubah     | Entri riwayat perubahan (tindak lanjut)                |

## Pertanyaan Terbuka

- Apakah commit langsung ke `main` diperbolehkan untuk `docs`/`chore` kecil, atau semua perubahan wajib PR?
- Apakah ada template PR standar (deskripsi, checklist, referensi issue) yang wajib dipakai?
- Berapa minimal reviewer yang diperlukan sebelum merge, dan apakah auto-merge diizinkan?
- Siapa yang membuat tag rilis dan kapan rilis dilakukan (per fitur, per sprint, atau manual)?
- Format changelog (Keep a Changelog, Conventional Changelog, atau custom) dan apakah wajib di-commit?
- Apakah aturan ini berlaku juga untuk submodule (`base_coc`, `share_global_saya`) atau hanya repo root?

## Riwayat Perubahan

| Tanggal    | Perubahan                                                                                                                     |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------- |
| 2026-11-14 | Berkas hasil diskusi dibuat (Draft → Final) dengan keputusan K-1 s.d. K-6; pertanyaan terbuka dicatat untuk diskusi lanjutan. |
