# Hasil Diskusi 14 — Pembuatan berkas `alur_kerja.md` (alur kerja pipeline riset kompetitor → PRD → implementasi → cek kesehatan kode → task → analisa commit skill)

## Status
- Dokumen: Final
- Implementasi: Belum Diimplementasikan
- Tanggal: 2026-11-15
- Topik: Pembuatan berkas `alur_kerja.md` di root workspace yang mendefinisikan alur kerja pipeline berurutan — cari APK kompetitor → riset kompetitor → buat PRD fitur → implementasikan PRD → cek kesehatan kode → implementasikan task → analisa commit skill — dengan file terdampak tertulis eksplisit per langkah ("tiap alur harus tahu dulu file mana saja yang terdampak") dan aturan anti-bentrok terhadap sesi paralel yang `Belum Sinkron`.

## Latar Belakang

Pada sesi 131–135 (2026-11-15), topik berkas ini berubah dua kali: awalnya (sesi 131) diusulkan command baru `deteksi_pekerjaan` agar AI dapat mendeteksi pekerjaan yang bisa dikerjakannya sekarang (read-only + laporan; tugas pertama = riset kompetitor; anti-bentrok sesi paralel). Pada sesi 135 pengguna mengubah topik penuh: **bukan command**, melainkan sebuah **berkas alur kerja** (`alur_kerja.md`, root workspace) yang mendefinisikan pipeline yang dipakai AI lintas sesi. Arahan pengguna: "jadi saya ingin membuat alur kerja, dari cari apk kompetitor, riset kompetitor, bautkan prd untuk fitur, impelemntasikan prd, cek kesehatan kode, implementasikan task, dan analisa skill commit", disambung "tiap alur harus tahu dulu file mana saja yang terdampak".

Pemetaan command (diverifikasi dari `.kilo/commands/` pada sesi 135, read-only):

| Langkah | Perintah/Command | Berkas yang boleh diubah (hasil verifikasi) |
|---|---|---|
| 1 | `.kilo/commands/cari_apk_kompetitor.md` | `apk_kompetitor.md` (baru/diubah) |
| 2 | `.kilo/commands/riset_kompetitor.md` | `apk_kompetitor.md` (status → `Sudah Dianalisa`), `refrensi_apk.md` |
| 3 | `.kilo/commands/fitur/diskusi_fitur_baru.md` | `prd/<fitur>.md`, `refrensi_apk.md` (tandai item sudah dibuatkan PRD); tidak mengubah kode |
| 4 | `.kilo/commands/prd/kerjakan_prd.md` | `prd/<fitur>.md` + seluruh berkas "File-File Terdampak" PRD; setelah selesai: status → `Sudah Diimplementasikan`, berkas PRD dihapus, section terkait pada `refrensi_apk.md` dihapus |
| 5 | `.kilo/commands/analisa/analisa_kesehatan_kode_alur.md` (gerbang, read-only) → `.kilo/commands/analisa/analisa_kesehatan_kode.md` | alur: read-only; analisa kesehatan: **hanya `catatan.md` dan `task.md`** |
| 6 | `.kilo/commands/kerjakan_task.md` | `task.md` + berkas pada kolom `file bermasalah` tiap task (kode; cadangan `.backup_task/<nama>.bak`) |
| 7 | `.kilo/commands/analisa/analisa_commit_skill.md` | folder `.agents/skills/custom/` (root) + `catatan.md` (tidak mengubah kode Dart; tidak mengubah repo submodule) |

Sifat pipeline: langkah 4 bergantung pada langkah 3; langkah 2 bergantung pada listing `Belum Dianalisa` dari langkah 1; langkah 5 mengevaluasi **commit Dart baru** (root + submodule) sejak terakhir dievaluasi — butuh commit baru yang tercatat di `catatan.md`; langkah 7 mengevaluasi commit baru untuk memperbarui/menambah skill custom. Tidak ada langkah yang melakukan commit/push otomatis — commit hanya atas perintah eksplisit pengguna (aturan proyek).

## Poin Diskusi
### 1. Topik diganti penuh dari command `deteksi_pekerjaan` ke berkas `alur_kerja.md`
- Tanya: Apakah command deteksi tetap dikerjakan?
- Kesimpulan: **Tidak — topik diganti penuh.** Keputusan K-1..K-13 (sesi 131–134) untuk command `deteksi_pekerjaan` ditandai **digantikan**; berkas ini tidak lagi merujuk command tersebut. Nomor command dan rancangan deteksi tidak berlaku; substansi yang tetap dipakai dimigrasikan ke alur kerja (anti-bentrok sesi paralel; riset kompetitor sebagai langkah awal; tanpa pertanyaan pemindaian).

### 2. Bentuk dan lokasi berkas
- Tanya: Apa bentuk dan lokasi file alur kerja?
- Kesimpulan: Berkas Markdown `alur_kerja.md` di **root workspace** (sama seperti `MEMORI.md`/`task.md`); **pedoman kerja AI** untuk proyek ini (bukan dokumen portabel, bukan skill, bukan command Kilo); berisi path dan command spesifik proyek.

### 3. Setiap alur harus tahu dulu file mana saja yang terdampak
- Tanya: Informasi apa yang wajib ada per langkah?
- Kesimpulan: Setiap langkah memuat **file terdampak eksplisit** (daftar di tabel Latar Belakang) sebagai bahan cek anti-bentrok *sebelum* eksekusi. Alur tidak boleh dimulai bila AI belum tahu file mana yang akan diubah pada langkah tersebut.

### 4. Aturan anti-bentrok lintas langkah
- Tanya: Bagaimana mekanisme anti-bentrok di dalam alur?
- Kesimpulan: Per langkah — sebelum eksekusi, seluruh berkas terdampak langkah dibandingkan dengan tabel `## Berkas Terdampak` berkas sesi `Belum Sinkron`. Bila beririsan → **STOP alur dan lapor**; jangan lanjut ke langkah yang bergantung padanya; jangan putuskan sepihak. Berkas **meta-memori dikecualikan**: `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/*.md` (keputusan pengguna sesi 134 — tidak dihitung sebagai bentrok). Verifikasi per langkah (bukan hanya di awal alur); hasil per langkah dilaporkan (dijalankan/dilewati + alasan).

### 5. Urutan eksekusi dan ketergantungan
- Tanya: Apakah urutan bebas atau berurutan?
- Kesimpulan: **Berurutan** 1 → 7 sesuai arahan pengguna. Langkah 4 (implementasikan PRD) bergantung pada PRD Final dari langkah 3; langkah 5 dan 7 bergantung pada **commit baru** yang tersedia sejak terakhir dievaluasi (commit hanya atas perintah eksplisit pengguna); langkah 2 bergantung pada listing pada langkah 1. Bila prasyarat langkah tidak terpenuhi (mis. tidak ada listing `Belum Dianalisa`, tidak ada task `kerjakan`, tidak ada commit baru) → laporkan sebagai STOP dengan alasan, bukan menebak.

### 6. Commit dan analisa commit skill
- Tanya: Kapan commit dan analisa_commit_skill dijalankan?
- Kesimpulan: Tidak ada langkah yang commit/push otomatis. Setelah langkah implementasi (4 dan 6) selesai, **pengguna** menentukan apakah perubahan di-commit (perintah eksplisit). Setelah commit tersedia, langkah 7 (`analisa/analisa_commit_skill.md`) mengevaluasi commit baru sejak terakhir tercatat di `catatan.md` dan memperbarui/menambah skill custom (hanya root; tidak menyentuh pointer submodule; tidak mengubah kode Dart). Langkah 7 bersifat opsional sesuai kondisi commit — dilaporkan, bukan dipaksa.

### 7. Kapan berkas `alur_kerja.md` dibuat
- Tanya: Apakah `alur_kerja.md` dibuat sesi ini?
- Kesimpulan: **Tidak.** Sesi diskusi ini hanya menghasilkan dokumen hasil diskusi; `alur_kerja.md` dibuat pada **sesi terpisah** atas perintah eksplisit pengguna (tindak lanjut; mis. melalui perintah eksplisit atau `/kerjakan_hasil_diskusi diskusi 14`).

### 8. Esensi prinsip: tidak ada dua sesi mengedit file yang sama
- Tanya: Apa esensi dari seluruh aturan anti-bentrok yang dibahas?
- Kesimpulan: Esensinya adalah **tidak ada dua sesi yang mengedit file yang sama**. Prinsip ini ditegaskan pengguna sebagai inti desain; cakupannya **hanya untuk eksekusi alur pipeline** (bukan seluruh sesi di luar pipeline), dan mekanismenya tetap **cek tabel `## Berkas Terdampak` berkas sesi `Belum Sinkron` + STOP & lapor** (berkas meta-memori dikecualikan; tanpa mekanisme registry/lock lintas sesi). Artinya: selama alur (L1–L7) berjalan, setiap langkah yang file terdampaknya beririsan dengan sesi `Belum Sinkron` wajib dihentikan — tidak ada langkah yang boleh mulai, dan dua sesi tidak boleh mengedit file yang sama. (Arahan pengguna sesi 136: "yang pada intinya saya ingin tiap sesi tidak mengedit file yang sama"; keputusan cakupan/mekanisme via `question`.)

## Keputusan
- K-1: Topik `diskusi_14.md` diganti penuh; command `deteksi_pekerjaan` (rancangan K-1..K-13 sesi 131–134) **tidak jadi dibuat** dan ditandai digantikan; substansi anti-bentrok dan tugas pertama dimigrasikan ke alur kerja (K-5, K-6).
- K-2: Berkas target `alur_kerja.md` di **root workspace**; format Markdown; pedoman kerja AI proyek ini; bukan dokumen portabel/skill/command.
- K-3: Pipeline berurutan 1 → 7: `cari_apk_kompetitor.md` → `riset_kompetitor.md` → `fitur/diskusi_fitur_baru.md` → `prd/kerjakan_prd.md` → `analisa/analisa_kesehatan_kode_alur.md` → `analisa/analisa_kesehatan_kode.md` → `kerjakan_task.md` → `analisa/analisa_commit_skill.md`.
- K-4: Per langkah wajib termuat: tujuan, command + path, prasyarat, keluaran, **file terdampak eksplisit** (lihat R-1), aturan anti-bentrok & STOP (K-5, K-6), dan penutup (commit hanya perintah eksplisit + sinkronisasi memori setiap sesi).
- K-5: Anti-bentrok per langkah: cocokkan file terdampak langkah vs tabel `## Berkas Terdampak` berkas sesi `Belum Sinkron`; beririsan → **STOP alur dan lapor**; jangan lanjut ke langkah bergantung; jangan putuskan sepihak; verifikasi per langkah; laporkan per langkah (dijalankan/dilewati + alasan).
- K-6: Berkas meta-memori dikecualikan dari anti-bentrok: `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/*.md` (keputusan pengguna sesi 134).
- K-7: Bentrok di tengah alur → **hentikan seluruh alur** (bukan lewati langkah dan lanjut); laporkan langkah yang berhenti, alasan, dan tindakan yang disarankan pengguna.
- K-8: Commit/push hanya atas perintah eksplisit pengguna; tidak ada langkah yang commit otomatis; `analisa/analisa_commit_skill.md` dijalankan setelah commit tersedia dan mengevaluasi commit baru sejak terakhir dievaluasi di `catatan.md`; tidak mengubah pointer submodule; tidak mengubah kode Dart.
- K-9: Langkah implementasi (4 dan 6) dapat mengubah kode di **submodule** (`base_coc`, `share_global_saya`) bila berkas terdampak ada di sana; pointer submodule tidak boleh diubah; berkas submodule yang diubah tetap dicatat pada berkas sesi.
- K-10: Setiap sesi yang mengeksekusi alur wajib sinkronisasi memori (`MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_N.md`) — berkas meta dikecualikan anti-bentrok.
- K-11: `alur_kerja.md` tidak dibuat pada sesi diskusi ini; pembuatan dilakukan sesi terpisah atas perintah eksplisit pengguna; jangan commit tanpa perintah eksplisit.
- K-12: Isi `alur_kerja.md` bersifat netral terhadap model/agent; instruksi per langkah ringkas, mengacu ke path command aktual (bukan salinan isi command); bila command berubah, `alur_kerja.md` diperbarui mengikuti (bukan sebaliknya).
- K-13: **Prinsip esensial desain `alur_kerja.md`: tidak ada dua sesi yang mengedit file yang sama.** Cakupannya **hanya untuk eksekusi alur pipeline** (L1–L7); mekanismenya tetap **cek tabel `## Berkas Terdampak` berkas sesi `Belum Sinkron` + STOP & lapor** (berkas meta-memori dikecualikan; tanpa registry/lock lintas sesi). Setiap langkah wajib memverifikasi file terdampaknya sebelum eksekusi; beririsan → **STOP alur**; dua sesi tidak boleh mengedit file yang sama selama alur berjalan (sesi 136).

## Rekomendasi
- R-1: Tabel file terdampak per langkah (diverifikasi sesi 135):
  - L1 → `apk_kompetitor.md`
  - L2 → `apk_kompetitor.md`, `refrensi_apk.md`
  - L3 → `prd/<fitur>.md`, `refrensi_apk.md`
  - L4 → `prd/<fitur>.md` + seluruh berkas "File-File Terdampak" PRD (kode; mungkin di submodule); setelah selesai PRD dihapus + section terkait `refrensi_apk.md` dihapus
  - L5 → (gerbang read-only) → `catatan.md`, `task.md`
  - L6 → `task.md` + berkas `file bermasalah` tiap task (kode), `.backup_task/<nama>.bak`
  - L7 → `.agents/skills/custom/*`, `catatan.md`
- R-2: Prasyarat per langkah (STOP bila gagal): L1 — dokumen proyek (`README.md`/`AGENTS.md`/PRD) tersedia & aplikasi sasaran jelas; L2 — ada listing `Belum Dianalisa`; L3 — item ada pada `refrensi_apk.md` & tidak tumpang tindih PRD/fitur lain; L4 — PRD berstatus `Final`; L5 — commit Dart baru sejak `catatan.md` terakhir mengevaluasi; L6 — ada task berstatus `kerjakan`; L7 — commit baru belum dievaluasi di `catatan.md`.
- R-3: Uji coba anti-bentrok aktual sebelum menjalankan alur pada sesi nyata; berkas sesi `Belum Sinkron` saat ini (`sesi_81`, `sesi_122`, `sesi_123`) hanya memuat berkas meta — tidak ada bentrok dengan target L1–L7.
- R-4: Saat pembuatan `alur_kerja.md`, verifikasi ulang path dan isi command (bisa berubah, mis. `analisa_kesehatan_kode_alur.md` merujuk path usang yang tercatat di MEMORI) — jangan menyalin mentah; rujuk path saja.
- R-5: Verifikasi pasca-pembuatan `alur_kerja.md` (konsistensi langkah/command/file terdampak); laporkan; tidak commit tanpa perintah.
- R-6: Pertahankan pembeda status implementasi di PRD (`Belum Diimplementasikan` → `Sudah Diimplementasikan` + penghapusan PRD di langkah 4) agar tidak ada PRD yatim.

## Tindak Lanjut
| No | Tindakan | File Terdampak | Status |
|----|----------|----------------|--------|
| 1 | Buat `alur_kerja.md` di root sesuai K-1..K-13 dan R-1..R-6 (sesi terpisah, atas perintah eksplisit; K-13 sebagai prinsip esensial — tidak ada dua sesi mengedit file yang sama saat alur berjalan) | `alur_kerja.md` | belum |
| 2 | Verifikasi pasca-pembuatan (konsistensi path command, file terdampak, anti-bentrok) | `alur_kerja.md` | belum |
| 3 | Commit `alur_kerja.md` hanya atas perintah eksplisit pengguna | `alur_kerja.md` | belum |

## File Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `hasil_diskusi/diskusi_14.md` | Diubah | Topik diganti penuh menjadi pembuatan `alur_kerja.md`; isi command ditandai digantikan (Riwayat Perubahan) |
| `memori/sesi/sesi_135.md` | Dibuat | Berkas sesi Mode Diskusi sesi 135 |
| `MEMORI.md` | Diubah | Entri `Status Kerja` sesi 135 + entri `Hasil Diskusi` `diskusi_14.md` diganti + header `Diperbarui` |
| `memori/riwayat_perubahan.md` | Diubah | Entri kronologis sesi 135 |

## Pertanyaan Terbuka
Belum ada

## Riwayat Perubahan
| Tanggal | Perubahan |
|---------|-----------|
| 2026-11-15 | Berkas dibuat dari sesi 131 (topik: command `deteksi_pekerjaan`); keputusan K-1 s.d. K-13 dan R-1 s.d. R-6 disepakati via `question`. |
| 2026-11-15 | Amandemen sesi 133 (K-12 — tugas pertama riset kompetitor; tanpa pertanyaan pemindaian) dan sesi 134 (K-13 — aturan eksekusi anti-bentrok; meta-memori dikecualikan). |
| 2026-11-15 | Topik diganti penuh (sesi 135, atas arahan pengguna): berkas tidak lagi membahas command `deteksi_pekerjaan`; seluruh keputusan lama (K-1 s.d. K-13/R-1 s.d. R-6) **digantikan/dibatalkan**; topik baru = pembuatan `alur_kerja.md` (root) yang mendefinisikan pipeline cari APK kompetitor → riset kompetitor → buat PRD fitur (`fitur/diskusi_fitur_baru.md`) → implementasikan PRD (`prd/kerjakan_prd.md`) → cek kesehatan kode (`analisa/analisa_kesehatan_kode_alur.md` + `analisa/analisa_kesehatan_kode.md`) → implementasikan task (`kerjakan_task.md`) → analisa commit skill (`analisa/analisa_commit_skill.md`); setiap langkah memuat file terdampak eksplisit ("tiap alur harus tahu dulu file mana saja yang terdampak"); anti-bentrok per langkah + STOP alur (K-5, K-7); meta-memori dikecualikan (K-6); commit hanya perintah eksplisit (K-8); `alur_kerja.md` dibuat sesi terpisah (K-11); status Dokumen tetap `Final` (adalah permintaan eksplisit pengguna via `question`). |
| 2026-11-15 | Amandemen sesi 136 atas arahan pengguna ("yang pada intinya saya ingin tiap sesi tidak mengedit file yang sama"): ditambah Poin Diskusi 8 dan K-13 — prinsip esensial desain `alur_kerja.md`: tidak ada dua sesi mengedit file yang sama; cakupan **hanya untuk eksekusi alur pipeline**; mekanisme tetap cek Berkas Terdampak sesi `Belum Sinkron` + STOP & lapor (tanpa registry/lock); Tindak Lanjut 1 → K-1..K-13; status Dokumen tetap `Final`. |
