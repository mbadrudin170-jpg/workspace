---
description: Mengeksekusi pipeline L1–L7 pada berkas alur_kerja.md (riset kompetitor → PRD → kerjakan PRD → cek kesehatan kode → kerjakan task → analisa commit skill) dengan konfirmasi pengguna per langkah.
agent: code
---

# Alur Kerja (Orkestrator)

## Tujuan

Menjalankan pipeline L1–L7 yang didefinisikan di `alur_kerja.md` (root) langkah demi langkah dengan konfirmasi pengguna per langkah. Dokumen root adalah sumber kebenaran pipeline; command ini eksekutornya.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja; sinkronisasi memori wajib setiap sesi yang menjalankan alur. Skill lain dimuat oleh command anak sesuai trigger masing-masing.
3. Gunakan bahasa Indonesia baku untuk seluruh laporan.
4. Tool bawaan lebih dahulu (`read`, `glob`, `grep`, `list`, `edit`, `write`, `webfetch`, `websearch`) sesuai `.agents/rules/global/prioritas_tool_bawaan.md`.
5. `alur_kerja.md` (root) adalah sumber kebenaran pipeline; command ini TIDAK menyalin isi command lain — instruksi per langkah menunjuk path command (baca lalu jalankan). Bila dokumen root berubah, ikuti dokumen root (bukan sebaliknya).

## Cakupan

- Pipeline L1–L7 pada `alur_kerja.md` (root) beserta file terdampak per langkah sebagaimana tercantum di dokumen root.

## Parameter

Tanpa parameter.

## Alur Kerja

1. **Analyze** — baca `AGENTS.md`, `alur_kerja.md` (root), dan tabel `## Berkas Terdampak` seluruh berkas sesi `Belum Sinkron` (kecualikan berkas meta-memori: `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/*.md`); susun daftar langkah L1–L7.
2. **Plan** — tampilkan rencana L1–L7: per langkah command + path, prasyarat, file terdampak; minta konfirmasi pengguna sebelum eksekusi dimulai.
3. **Execute** — untuk tiap langkah, urut L1 → L7:
   a. Verifikasi prasyarat langkah; gagal → **STOP & lapor** (alasan + tindakan yang disarankan).
   b. Anti-bentrok: cocokkan file terdampak langkah vs Berkas Terdampak sesi `Belum Sinkron`; beririsan → **STOP seluruh alur & lapor**; jangan lanjut ke langkah yang bergantung padanya; jangan putuskan sepihak.
   c. Minta konfirmasi pengguna per langkah (gunakan tool `question` bila keputusan diperlukan).
   d. Baca command langkah pada path yang tercantum di dokumen root, lalu jalankan alurnya sebagaimana tertulis di dalamnya.
   e. Verifikasi keluaran langkah sebelum lanjut (mis. status listing berubah di `apk_kompetitor.md`; PRD berstatus `Final` sebelum L4; `catatan.md` mencatat HEAD sebelum L6/L7).
   f. Lapor per langkah: dijalankan/dilewati/dihentikan + alasan.
4. **Review** — sampaikan laporan akhir (tabel per langkah) dan jalankan sinkronisasi memori (`MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_N.md`).

## Format Laporan

| Langkah | Command (path) | File Terdampak | Hasil | Alasan (bila STOP/dilewati) |
| --- | --- | --- | --- | --- |
| L1 | `cari_apk_kompetitor.md` | `apk_kompetitor.md` | dijalankan / dilewati / STOP | `<alasan>` |
| L2 | `riset_kompetitor.md` | `apk_kompetitor.md`, `refrensi_apk.md` | dijalankan / dilewati / STOP | `<alasan>` |
| L3 | `fitur/diskusi_fitur_baru.md` | `prd/<fitur>.md`, `refrensi_apk.md` | dijalankan / dilewati / STOP | `<alasan>` |
| L4 | `prd/kerjakan_prd.md` | `prd/<fitur>.md` + berkas PRD | dijalankan / dilewati / STOP | `<alasan>` |
| L5 | `analisa/analisa_kesehatan_kode_alur.md` | `catatan.md`, `task.md` | dijalankan / dilewati / STOP | `<alasan>` |
| L6 | `kerjakan_task.md` | `task.md` + berkas task | dijalankan / dilewati / STOP | `<alasan>` |
| L7 | `analisa/analisa_commit_skill.md` | `.agents/skills/custom/*`, `catatan.md` | dijalankan / dilewati / STOP | `<alasan>` |

Tutup laporan dengan status alur: `Selesai penuh` atau `Berhenti di langkah <N> — <alasan>`.

## Larangan

- DILARANG menjalankan langkah tanpa konfirmasi pengguna.
- DILARANG melanjutkan langkah yang bergantung pada langkah yang STOP/dihentikan/dilewati.
- DILARANG mengubah berkas di luar file terdampak langkah yang sedang berjalan.
- DILARANG commit/push tanpa perintah eksplisit pengguna.
- DILARANG menyalin isi command anak ke dalam command ini; rujuk path berkasnya.
- DILARANG memutuskan sepihak bila ada bentrok atau prasyarat yang gagal.

## Kriteria Selesai / STOP

- Selesai bila L1–L7 tereksekusi, atau terhenti dengan laporan lengkap per langkah ditambah sinkronisasi memori.
- STOP bila ada bentrok file terdampak, prasyarat langkah gagal, atau pengguna menolak — laporkan langkah, alasan, dan tindakan yang disarankan; tidak commit/push.
