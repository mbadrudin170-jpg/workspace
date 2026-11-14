---
name: pembuatan-command-kilo
description: "Trigger: saat membuat command Kilo baru atau memperbarui command Kilo | Panduan command `.kilo/commands/**.md`: lokasi rekursif, penamaan, frontmatter (`description`, `agent`, `model`, `variant`, `subtask`), parameter `$ARGUMENTS`/`$1`–`$N` dengan fallback `question`, struktur standar (Tujuan, Ketentuan Umum, Cakupan, Alur Kerja Analyze→Plan→Execute→Review, Format Laporan, Larangan, Kriteria Selesai/STOP), penanganan ambiguitas, rujukan wajib ke skill yang relevan, dan checklist verifikasi."
metadata:
  kategori: "custom"
  versi: "1.2.1"
  diperbarui: "Sun Nov 15 2026 01:44 WIB"
  sumber-terakhir: "perintah pengguna sesi 64: konversi penuh format_task.md menjadi skill format-task-md (rujukan diperbarui)"
---

# Membuat dan Memperbarui Command Kilo

Mengatur cara membuat dan memperbarui command Kilo di `.kilo/commands/` agar penamaan, frontmatter, parameter, struktur instruksi, penanganan ambiguitas, format laporan, rujukan skill yang relevan, dan larangan konsisten, dapat diprediksi, dan selaras dengan praktik Workflows serta Prompt Engineering Kilo.

## Cakupan yang Di-Cover

- Package/direktori: `.kilo/commands/` beserta subdirektori (mis. `analisa/`, `fitur/`, `mode/`, `prd/`, `sinkronisasi/`)
- Berkas: satu berkas per command, ekstensi `.md`
- Frontmatter: `description` (wajib), `agent`, `model`, `variant`, `subtask` (opsional, hanya bila override memang diperlukan)
- Parameter: `$ARGUMENTS`, `$1`–`$N`; fallback wajib via tool `question` saat argumen kosong/tidak valid/ambigu
- Pola kerja: Analyze → Plan → Execute → Review; kondisi STOP dan konfirmasi sebelum menulis berkas
- Format keluaran: laporan terstruktur (tabel/daftar) dengan status, temuan/bukti, dan tindakan/hasil
- Rujukan proyek: `.agents/rules/global/format_hasil_diskusi.md`, `.agents/skills/custom/format-task-md/SKILL.md`, `.agents/rules/global/format_PRD.md`, `AGENTS.md`
- Skill terkait: `konfigurasi-kilo-proyek`, `memori-check` (bila command mengubah state proyek yang memerlukan sinkronisasi memori)
- Rujukan skill di command: setiap command wajib mencantumkan rujukan ke skill yang relevan (nama/path skill) dan memerintahkan agen memuatnya melalui tool `skill` sebelum bekerja; skill relevan ditentukan dari `SKILLS_INDEX.md` berdasarkan kecocokan trigger dengan tujuan command

## Aturan

1. Simpan command sebagai berkas `.md` di `.kilo/commands/` atau subdirektori mana pun di bawahnya; pemuatan bersifat rekursif dan nama berkas (minus `.md`) menjadi nama command.
2. Beri nama berkas dengan huruf kecil, angka, dan garis bawah; gunakan bahasa Indonesia deskriptif yang menyebut tujuan command.
3. Cantumkan frontmatter `description` satu baris yang menyebut tujuan command dalam bahasa Indonesia baku.
4. Tambahkan `agent: code` bila command perlu dijalankan oleh agent `code`; gunakan `model`, `variant`, dan `subtask` hanya bila override memang diperlukan.
5. Bila command menerima argumen, sediakan bagian `## Parameter` yang mendokumentasikan `$ARGUMENTS` (seluruh argumen) atau `$1`–`$N` (argumen posisional) beserta nilai yang diterima dan perilaku bila kosong/tidak valid.
6. Wajib menyediakan fallback tool `question` saat argumen kosong, tidak valid, ambigu, atau ketika keputusan pengguna diperlukan; DILARANG menebak maksud pengguna.
7. Jangan mengandalkan `@file` untuk menyuntik isi berkas; agen membaca berkas dengan tool `read` berdasarkan path yang ditulis di instruksi.
8. Susun isi berurutan: Tujuan, Ketentuan Umum, Cakupan, Parameter (bila ada), Alur Kerja bernomor, Format Laporan, Larangan, dan Kriteria Selesai/STOP.
9. Alur Kerja wajib memakai pola Analyze → Plan → Execute → Review: analisis konteks, susun rencana singkat, eksekusi bertahap, lalu verifikasi hasil sebelum menyatakan selesai.
10. Tetapkan kondisi STOP eksplisit: kapan command harus berhenti dan melapor (prasyarat gagal, argumen tidak valid, cakupan di luar izin, verifikasi gagal) tanpa melanjutkan tahap berikutnya.
11. Tentukan format keluaran/laporan secara eksplisit (tabel atau daftar dengan kolom/field tetap) agar hasil konsisten dan dapat ditindaklanjuti.
12. Nyatakan kriteria selesai secara eksplisit, mis. kalimat penutup yang menandai hasil, bukti verifikasi, atau alasan command berhenti.
13. Cantumkan larangan eksplisit bila command tidak boleh menyentuh kode Dart, berkas hasil generate, arsip `hasil_diskusi/`, konfigurasi Kilo, atau melakukan commit/push.
14. Sesuaikan command dengan aturan format yang relevan (mis. `format-task-md` untuk `task.md`, `format_hasil_diskusi.md` untuk `diskusi_N.md`, `format_PRD.md` untuk PRD) alih-alih mendefinisikan format baru.
15. Muat konteks wajib di awal command: `AGENTS.md`, berkas yang ditunjuk argumen, dan aturan format yang relevan.
16. Setiap command wajib menyertakan rujukan ke skill yang relevan dengan tujuan command — mis. di bagian Ketentuan Umum atau Analyze — berupa nama/path skill (mis. `.agents/skills/custom/<nama>/SKILL.md`) beserta perintah eksplisit agar agen memuat skill tersebut melalui tool `skill` sebelum bekerja. Skill yang relevan ditentukan dari `SKILLS_INDEX.md` dengan mencocokkan trigger skill terhadap tujuan command; bila beberapa skill cocok, cantumkan semuanya; bila tidak ada skill yang trigger-nya terpenuhi, nyatakan secara eksplisit bahwa tidak ada skill terkait. Jangan menyalin isi skill ke dalam command; cukup rujuk path/namanya.
17. Jika command mengubah berkas, wajib meminta konfirmasi pengguna sebelum menulis, dan sebutkan berkas target pada laporan.
18. Setelah membuat atau memperbarui command, perbarui `MEMORI.md` dan `memori/riwayat_perubahan.md` melalui berkas sesi `memori/sesi/sesi_N.md`.
19. Jika command menjadi usang (mis. target yang dirujuk sudah tidak ada), laporkan kepada pengguna dan usulkan penghapusan atau penggantian; jangan membiarkan command usang tetap aktif.

## Steps

1. Tentukan tujuan command dan periksa apakah sudah ada command sejenis (`ls .kilo/commands/` dan `rg` isi command).
2. Tentukan lokasi berkas: root `.kilo/commands/` atau subdirektori yang sesuai.
3. Tentukan nama berkas sesuai aturan 2.
4. Susun frontmatter sesuai aturan 3–4.
5. Identifikasi parameter command dan siapkan fallback `question` (aturan 5–6).
6. Identifikasi skill yang relevan dari `SKILLS_INDEX.md` (cocokkan trigger skill dengan tujuan command) dan cantumkan rujukannya di command beserta perintah memuatnya via tool `skill` (aturan 16).
7. Susun isi berurutan sesuai aturan 8–12: Tujuan, Ketentuan Umum, Cakupan, Parameter, Alur Kerja (Analyze → Plan → Execute → Review), Format Laporan, Larangan, Kriteria Selesai/STOP.
8. Tambahkan kondisi STOP, kriteria selesai, dan format laporan yang eksplisit.
9. Tulis berkas command.
10. Verifikasi dengan membaca ulang berkas: frontmatter valid, rujukan skill yang relevan tercantum (atau dinyatakan eksplisit tidak ada), tidak ada rujukan usang, tidak ada subcommand di frontmatter, tidak memakai `@file`/`` !`cmd` ``.
11. Perbarui `MEMORI.md`, `memori/riwayat_perubahan.md`, dan berkas sesi.

## Larangan

- DILARANG menamai berkas command dengan spasi, huruf besar, atau karakter selain `a-z`, `0-9`, dan garis bawah.
- DILARANG membuat command tanpa frontmatter `description`.
- DILARANG mendaftarkan subcommand lewat frontmatter; gunakan `$ARGUMENTS`/`$1`–`$N` dengan fallback, atau satu berkas per subcommand.
- DILARANG memakai sintaks `` !`cmd` `` atau mengandalkan `@file` untuk menyuntik isi berkas.
- DILARANG menulis instruksi ambigu tanpa fallback `question` atau tanpa kondisi STOP yang jelas.
- DILARANG membuat atau memperbarui command tanpa menyertakan rujukan ke skill yang relevan (bila ada skill yang trigger-nya terpenuhi oleh tujuan command); jika tidak ada, nyatakan eksplisit bahwa tidak ada skill terkait.
- DILARANG membuat alur yang hanya berisi daftar langkah tanpa tujuan, kriteria selesai, dan format laporan.
- DILARANG menduplikasi isi command lain; rujuk path berkasnya.
- DILARANG mengubah kode Dart, berkas hasil generate, atau konfigurasi Kilo tanpa perintah eksplisit pengguna.
- DILARANG commit/push hasil pembuatan atau pembaruan command.
- DILARANG menyalin isi command ke skill atau dokumen lain; gunakan path berkas.

## Contoh Benar

````markdown
---
description: Memeriksa ketersediaan dan status dokumen perencanaan sebelum menjalankan analisa kesehatan kode, lalu melanjutkan ke analisa bila seluruh prasyarat lolos.
---

# Nama Command

## Tujuan

Jelaskan tujuan command dalam satu paragraf.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja; muat juga skill lain yang trigger-nya terpenuhi.
3. Gunakan bahasa Indonesia baku untuk seluruh laporan.
4. Jangan menggunakan terminal untuk membaca berkas; gunakan tool `read`/`glob`/`rg`.

## Cakupan

- Berkas/folder yang diperiksa beserta batasannya.

## Parameter

- `$ARGUMENTS` atau `$1`: path berkas yang akan diperiksa.
- Jika kosong atau tidak valid: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca konteks wajib dan periksa prasyarat.
2. **Plan** — susun rencana singkat dan tampilkan kepada pengguna bila mengubah berkas.
3. **Execute** — jalankan pemeriksaan/tindakan sesuai rencana.
4. **Review** — verifikasi hasil dan pastikan tidak ada rujukan usang.
5. Bila prasyarat tidak terpenuhi, **STOP** dan laporkan alasannya.

## Format Laporan

| Tahap | Objek | Status | Hasil |
| --- | --- | --- | --- |
| 1 | `<path>` | Ditemukan/Tidak | Lolos / STOP |

## Larangan

- DILARANG mengubah berkas apa pun sebelum pengguna menyetujui.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila seluruh tahap lolos dan laporan disampaikan.
- STOP bila prasyarat gagal atau argumen tidak valid; sebutkan alasan dan tindakan yang disarankan.
````

## Contoh Salah

```markdown
Subcommand: analisa

apa saja yang harus diperiksa
```

```markdown
---
description: analisa
subcommands: [satu, dua]
---
```

```markdown
Baca @prd/contoh.md lalu kerjakan.
```

```markdown
## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
```

Command di atas DILARANG bila ada skill yang trigger-nya terpenuhi oleh tujuan command (mis. command berbasis SQLite tanpa merujuk `migrasi-skema-sqlite`); jika memang tidak ada skill terkait, command wajib menyatakan eksplisit "tidak ada skill terkait".

## Sumber Evaluasi

- Berkas command nyata di proyek: `.kilo/commands/tambah_log.md`, `.kilo/commands/analisa_log.md`, `.kilo/commands/kerjakan_hasil_diskusi.md`, `.kilo/commands/mode/mode_diskusi.md`, `.kilo/commands/analisa/analisa_kesehatan_kode_alur.md`, `.kilo/commands/evaluasi_aturan.md`, `.kilo/commands/evaluasi_aturan_khusus.md`, `.kilo/commands/salin_konfigurasi_ke_global.md`
- Skill terkait: `.agents/skills/custom/konfigurasi-kilo-proyek/SKILL.md`
- Aturan terkait: `.agents/rules/global/format_hasil_diskusi.md`, `.agents/skills/custom/format-task-md/SKILL.md`, `.agents/rules/global/format_PRD.md`
- Konvensi trigger: `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` (aturan 8)
- Dokumentasi resmi Kilo (wajib dibaca): `https://kilo.ai/docs/customize/workflows` (frontmatter, parameter, model/variant, kapabilitas tool, reserved name `goal`) dan `https://kilo.ai/docs/customize/prompt-engineering` (spesifik, konteks, pemecahan tugas, contoh, format keluaran, Analyze → Plan → Execute → Review, penanganan ambiguitas)
- Perintah pengguna rujukan: sesi 61 (2026-11-15) — optimasi command berdasarkan kedua dokumen resmi di atas; sesi 63 (2026-11-15) — setiap command wajib menyertakan skill yang relevan (aturan 16, v1.2.0)