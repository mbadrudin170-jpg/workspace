# Alur Kerja — Pipeline Riset Kompetitor → PRD → Implementasi → Cek Kesehatan Kode → Task

> Dokumen pedoman kerja AI proyek ini (bukan dokumen portabel, skill, atau command). Sumber kebenaran pipeline L1–L6. Command eksekutor: `.kilo/commands/alur_kerja.md`.

Diperbarui: 2026-11-15 (sesi 138)

## Tujuan

Mendefinisikan pipeline berurutan lintas sesi untuk proyek ini, dengan file terdampak eksplisit per langkah dan aturan anti-bentrok terhadap sesi paralel yang `Belum Sinkron`.

## Prinsip Esensial

**Tidak ada dua sesi yang mengedit file yang sama** (K-13). Cakupannya hanya eksekusi pipeline L1–L6. Mekanismenya tetap cek tabel `## Berkas Terdampak` berkas sesi `Belum Sinkron` + STOP & lapor (berkas meta-memori dikecualikan; tanpa mekanisme registry/lock lintas sesi).

## Aturan Umum

1. Anti-bentrok per langkah (K-5): sebelum mengeksekusi suatu langkah, seluruh file terdampaknya dicocokkan dengan tabel `## Berkas Terdampak` berkas sesi `Belum Sinkron`; beririsan → **STOP alur dan lapor**; jangan lanjut ke langkah yang bergantung padanya; jangan putuskan sepihak. Verifikasi dilakukan per langkah, bukan hanya di awal alur.
2. Berkas meta-memori dikecualikan dari anti-bentrok (K-6): `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/*.md`.
3. Bentrok di tengah alur → **hentikan seluruh alur** (bukan lewati langkah); laporkan langkah yang berhenti, alasan, dan tindakan yang disarankan pengguna (K-7).
4. Commit/push hanya atas perintah eksplisit pengguna; tidak ada langkah yang commit otomatis (K-8). Setelah langkah implementasi (L4, L6) selesai, pengguna menentukan apakah perubahan di-commit.
5. Langkah implementasi (L4, L6) dapat mengubah kode di submodule (`base_coc`, `share_global_saya`) bila file terdampak ada di sana; pointer submodule tidak boleh diubah; berkas submodule yang diubah dicatat pada berkas sesi (K-9).
6. Setiap sesi yang mengeksekusi alur wajib sinkronisasi memori (`MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_N.md`) (K-10).
7. Berkas ini netral terhadap model/agent; instruksi per langkah ringkas dan mengacu ke path command aktual (bukan salinan isi command). Bila command berubah, berkas ini yang diperbarui mengikuti (bukan sebaliknya) (K-12).
8. Laporan per langkah (dijalankan/dilewati + alasan) wajib disampaikan (K-5, K-16).

## Pipeline Berurutan L1 → L6

### L1 — Cari APK Kompetitor
- Tujuan: menambah kandidat listing kompetitor baru dari seluruh store (satu run).
- Command: `.kilo/commands/cari_apk_kompetitor.md`
- Prasyarat (STOP bila gagal): dokumen proyek (`README.md`/`AGENTS.md`/PRD) tersedia dan aplikasi sasaran jelas.
- Keluaran: listing baru di `apk_kompetitor.md` berstatus `Belum Dianalisa`.
- File terdampak: `apk_kompetitor.md`

### L2 — Riset Kompetitor
- Tujuan: menganalisis maksimal 10 listing `Belum Dianalisa`.
- Command: `.kilo/commands/riset_kompetitor.md`
- Prasyarat: ada listing `Belum Dianalisa` di `apk_kompetitor.md`.
- Keluaran: status listing → `Sudah Dianalisa`; `refrensi_apk.md` diperbarui (referensi per fitur/UI/UX + prioritas).
- File terdampak: `apk_kompetitor.md`, `refrensi_apk.md`

### L3 — Buat PRD Fitur
- Tujuan: membuat PRD satu item fitur dari `refrensi_apk.md` hingga final.
- Command: `.kilo/commands/fitur/diskusi_fitur_baru.md`
- Prasyarat: item ada pada `refrensi_apk.md` dan tidak tumpang tindih dengan PRD lain.
- Keluaran: `prd/<fitur>.md` (Draft → Final); item ditandai sudah dibuatkan PRD di `refrensi_apk.md`.
- File terdampak: `prd/<fitur>.md` (baru), `refrensi_apk.md`

### L4 — Implementasikan PRD
- Tujuan: mengimplementasikan PRD hingga `Sudah Diimplementasikan`.
- Command: `.kilo/commands/prd/kerjakan_prd.md`
- Prasyarat: PRD berstatus `Final`.
- Keluaran: implementasi seluruh "File-File Terdampak" PRD; status PRD → `Sudah Diimplementasikan`; berkas PRD dihapus; section terkait pada `refrensi_apk.md` dihapus.
- File terdampak: `prd/<fitur>.md` + seluruh berkas "File-File Terdampak" PRD (kode; mungkin di submodule); `refrensi_apk.md` (hapus section, bila ada penanda nama berkas PRD)

### L5 — Cek Kesehatan Kode (gerbang, read-only)
- Tujuan: pemeriksaan prasyarat berantai, lalu analisa kesehatan kode bila seluruh prasyarat lolos.
- Command: `.kilo/commands/analisa/analisa_kesehatan_kode_alur.md` → (bila lolos) `.kilo/commands/analisa/analisa_kesehatan_kode.md`
- Catatan: `analisa_kesehatan_kode_alur.md` baris 78 merujuk path usang `.kilo/commands/analisa_kesehatan_kode.md` (tidak ada); path aktual = `.kilo/commands/analisa/analisa_kesehatan_kode.md` (tercatat pada MEMORI sesi 126; tidak diubah atas alur ini).
- Prasyarat: commit Dart baru sejak `catatan.md` terakhir mengevaluasi.
- Keluaran: `catatan.md` (commit terakhir dievaluasi) dan `task.md` (temuan baru) diperbarui menurut aturan `.kilo/commands/analisa/analisa_kesehatan_kode.md`.
- File terdampak: `catatan.md`, `task.md`

### L6 — Implementasikan Task
- Tujuan: mengerjakan seluruh task berstatus `kerjakan` pada `task.md`.
- Command: `.kilo/commands/kerjakan_task.md`
- Prasyarat: ada task berstatus `kerjakan` pada `task.md`.
- Keluaran: task → `selesai`/`dilewati` dengan alasan; cadangan `.backup_task/<nama>.bak`; verifikasi `flutter analyze` bersih.
- File terdampak: `task.md` + berkas `file bermasalah` tiap task (kode; mungkin di submodule); `.backup_task/<nama>.bak`

## Urutan Eksekusi dan Ketergantungan

Berurutan L1 → L6. L2 bergantung pada listing `Belum Dianalisa` dari L1; L3 bergantung pada hasil L2; L4 bergantung pada PRD Final dari L3; L5 bergantung pada commit Dart baru sejak terakhir dievaluasi; L6 bergantung pada task `kerjakan` hasil L5. Bila prasyarat suatu langkah tidak terpenuhi → laporkan sebagai STOP dengan alasan, bukan menebak.

## Commit dan Penutup

Tidak ada langkah yang melakukan commit/push otomatis. Setelah implementasi (L4 dan L6), pengguna menentukan apakah perubahan di-commit. Setiap sesi yang mengeksekusi alur wajib sinkronisasi memori (`MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_N.md`) — berkas meta-memori dikecualikan dari anti-bentrok (K-6).
