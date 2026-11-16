# Hasil Diskusi 3 — Lanjutan Sistem Kerja Global: PR, Review, Tag, Changelog, Pengecualian, Submodule

## Status

- Dokumen: Final
- Implementasi: Sebagian Diimplementasikan (aturan global `alur_git_commit.md` akan diperbarui pada tindak lanjut)
- Tanggal: 2026-11-14
- Topik: Lanjutan `diskusi_2.md` — aturan PR, review, tag & changelog, pengecualian commit langsung ke `main`, dan penerapan ke submodule.

## Latar Belakang

`diskusi_2.md` menetapkan sistem kerja global (Conventional Commits, Trunk-based, penamaan branch, Squash merge, Semver + changelog) dan menyisakan pertanyaan terbuka terkait aturan PR, review, tag/changelog, pengecualian, dan penerapan ke submodule. Diskusi ini melengkapi pertanyaan terbuka tersebut agar aturan global dapat diterapkan secara utuh lintas proyek (root dan submodule).

## Poin Diskusi

### 1. Pengecualian commit langsung ke `main`

- Tanya: Apakah commit langsung ke `main` diperbolehkan untuk `docs`/`chore` kecil, atau semua perubahan wajib PR?
- Kesimpulan: Semua perubahan (termasuk `docs`/`chore` kecil) wajib melalui branch + PR; tidak ada commit langsung ke `main`.

### 2. Template PR

- Tanya: Apakah ada template PR standar yang wajib dipakai?
- Kesimpulan: Wajib memakai template PR dengan field: ringkasan, perubahan, checklist (lint/test), referensi issue.

### 3. Review dan auto-merge

- Tanya: Berapa minimal reviewer dan apakah auto-merge diizinkan?
- Kesimpulan: Minimal 1 approval sebelum merge; auto-merge tidak diizinkan.

### 4. Tag & rilis

- Tanya: Siapa yang membuat tag dan kapan rilis dilakukan?
- Kesimpulan: Tag dibuat oleh maintainer/pengelola repo setelah fitur/fix terkumpul; rilis dilakukan manual.

### 5. Changelog

- Tanya: Format changelog dan apakah wajib di-commit?
- Kesimpulan: Format Keep a Changelog (Added/Changed/Fixed/Removed); file `CHANGELOG.md` wajib diperbarui dan di-commit bersama rilis.

### 6. Penerapan ke submodule

- Tanya: Apakah aturan berlaku juga untuk submodule?
- Kesimpulan: Berlaku untuk repo root dan submodule (`base_coc`, `share_global_saya`); konsisten lintas repo.

## Keputusan

- K-1: Semua perubahan (termasuk `docs`/`chore` kecil) wajib melalui branch + PR; tidak ada commit langsung ke `main`.
- K-2: PR wajib memakai template dengan field: ringkasan, perubahan, checklist (lint/test), dan referensi issue.
- K-3: Minimal 1 approval sebelum merge; auto-merge tidak diizinkan.
- K-4: Tag rilis dibuat oleh maintainer/pengelola repo setelah fitur/fix terkumpul; rilis dilakukan manual.
- K-5: Changelog mengikuti format Keep a Changelog (Added/Changed/Fixed/Removed); file `CHANGELOG.md` wajib diperbarui dan di-commit bersama rilis.
- K-6: Aturan berlaku untuk repo root dan submodule (`base_coc`, `share_global_saya`); konsisten lintas repo.

## Rekomendasi

- R-1: Perbarui `.agents/rules/global/alur_git_commit.md` dengan section PR, review, tag & changelog, pengecualian, dan penerapan submodule (K-1 s.d. K-6), serta ubah bagian "Pertanyaan Terbuka" menjadi "Aturan yang Telah Diputuskan" atau hapus yang sudah terjawab.
- R-2: Sediakan template PR di `.github/pull_request_template.md` (atau ekuivalen) untuk repo root dan submodule bila diinginkan.
- R-3: Tambahkan `CHANGELOG.md` (format Keep a Changelog) di repo root dan submodule saat rilis pertama.
- R-4: Perbarui `MEMORI.md` (bagian konvensi) dan `memori/riwayat_perubahan.md` setelah aturan diperbarui.

## Tindak Lanjut

| No  | Tindakan                                                                                                         | File Terdampak                                        | Status |
| --- | ---------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- | ------ |
| 1   | Perbarui `.agents/rules/global/alur_git_commit.md` (section PR, review, tag, changelog, pengecualian, submodule) | `.agents/rules/global/alur_git_commit.md`             | belum  |
| 2   | Sediakan template PR (opsional)                                                                                  | `.github/pull_request_template.md` (root & submodule) | belum  |
| 3   | Tambahkan `CHANGELOG.md` (opsional, saat rilis pertama)                                                          | `CHANGELOG.md` (root & submodule)                     | belum  |
| 4   | Perbarui `MEMORI.md` dan `memori/riwayat_perubahan.md`                                                           | `MEMORI.md`, `memori/riwayat_perubahan.md`            | belum  |

## File Terdampak

| Lokasi File                               | Status Perubahan | Deskripsi                               |
| ----------------------------------------- | ---------------- | --------------------------------------- |
| `hasil_diskusi/diskusi_3.md`              | Dibuat           | Berkas hasil diskusi ini                |
| `.agents/rules/global/alur_git_commit.md` | Belum diubah     | Perbarui section (tindak lanjut)        |
| `MEMORI.md`                               | Belum diubah     | Pencatatan konvensi (tindak lanjut)     |
| `memori/riwayat_perubahan.md`             | Belum diubah     | Entri riwayat perubahan (tindak lanjut) |

## Pertanyaan Terbuka

- Belum ada pertanyaan terbuka yang tersisa dari diskusi ini; detail implementasi (template PR, `CHANGELOG.md`) ditunda sebagai tindak lanjut opsional.

## Riwayat Perubahan

| Tanggal    | Perubahan                                                                                                                                                  |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-11-14 | Berkas hasil diskusi dibuat (Final) dengan keputusan K-1 s.d. K-6; pertanyaan terbuka diskusi_2 (PR/review/tag/changelog/pengecualian/submodule) terjawab. |
