---
name: pembuatan-command-kilo
description: "Trigger: saat membuat command Kilo baru atau memperbarui command Kilo | Panduan command `.kilo/commands/**.md`: lokasi rekursif, penamaan, frontmatter (`description`, `agent`, `model`, `variant`, `subtask`), variabel `$ARGUMENTS`/`$1`–`$N`/`@file`, pola subcommand + fallback `question`, konvensi bahasa, larangan, dan checklist verifikasi."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sat Nov 14 2026 17:35 WIB"
  sumber-terakhir: "perintah pengguna sesi 47: buat skill pembuatan commands"
  model: "kilo/kilo-auto/free"
---

# Membuat dan Memperbarui Command Kilo

Mengatur cara membuat command Kilo baru di `.kilo/commands/` agar pemuatan, penamaan, frontmatter, alur instruksi, dan larangan konsisten di seluruh proyek.

## Cakupan yang Di-Cover

- Package/direktori: `.kilo/commands/` beserta subdirektori (`mode/`, `prd/`, `fitur/`, `sinkronisasi/`)
- Berkas: satu berkas per command, ekstensi `.md`
- Frontmatter: `description`, `agent`, `model`, `variant`, `subtask`
- Variabel: `$ARGUMENTS`, `$1`–`$N`, `@file`, fallback tool `question`
- Aturan proyek: `.agents/rules/global/format_hasil_diskusi.md`, `.agents/rules/global/format_task.md`, `.agents/rules/global/format_PRD.md`, `.agents/rules/global/aturan_skill.md`
- Skill terkait: `konfigurasi-kilo-proyek` (prosedur & larangan konfigurasi Kilo), `pola-testing`, `bug-runtime`

## Aturan

1. Simpan command sebagai berkas `.md` di `.kilo/commands/` atau subdirektori mana pun di bawahnya; pemuatan bersifat rekursif dan nama berkas (minus `.md`) menjadi nama command.
2. Beri nama berkas dengan huruf kecil, angka, dan garis bawah; gunakan bahasa Indonesia deskriptif yang menyebut tujuan command.
3. Cantumkan frontmatter `description` satu baris yang menyebut tujuan command dalam bahasa Indonesia baku.
4. Tambahkan `agent: code` bila command perlu dijalankan oleh agent `code`; gunakan `model`, `variant`, dan `subtask` hanya bila override memang diperlukan.
5. Bila command menerima argumen, gunakan `$ARGUMENTS` untuk seluruh argumen atau `$1`–`$N` untuk argumen posisional; sediakan fallback berupa tool `question` saat argumen kosong atau tidak dikenali.
6. Jangan mengandalkan `@file` untuk menyuntik isi berkas; agen membaca berkas dengan tool `read` berdasarkan path yang ditulis di instruksi.
7. Susun isi berurutan: tujuan command, ketentuan umum, cakupan, langkah kerja bernomor, format laporan, dan larangan.
8. Nyatakan status akhir secara eksplisit, mis. kalimat penutup yang menandai hasil atau alasan command berhenti.
9. Cantumkan larangan eksplisit bila command tidak boleh menyentuh kode Dart, berkas hasil generate, arsip `hasil_diskusi/`, konfigurasi Kilo, atau melakukan commit/push.
10. Sesuaikan command dengan aturan format yang relevan (mis. `format_task.md` untuk `task.md`, `format_hasil_diskusi.md` untuk `diskusi_N.md`, `format_PRD.md` untuk PRD) alih-alih mendefinisikan format baru.
11. Muat konteks wajib di awal command: `AGENTS.md`, berkas yang ditunjuk argumen, dan aturan format yang relevan.
12. Jika command mengubah berkas, wajib meminta konfirmasi pengguna sebelum menulis, dan sebutkan berkas target pada laporan.
13. Setelah membuat atau memperbarui command, perbarui `MEMORI.md` dan `memori/riwayat_perubahan.md` melalui berkas sesi `memori/sesi/sesi_N.md`.
14. Jika command menjadi usang (mis. target yang dirujuk sudah tidak ada), laporkan kepada pengguna dan usulkan penghapusan atau penggantian; jangan membiarkan command usang tetap aktif.

## Steps

1. Tentukan tujuan command dan apakah sudah ada command sejenis (`ls .kilo/commands/` dan `grep` isi command).
2. Tentukan lokasi berkas: root `.kilo/commands/` atau subdirektori yang sesuai.
3. Tentukan nama berkas sesuai aturan 2.
4. Susun frontmatter dan isi berurutan sesuai aturan 3–11.
5. Tambahkan bagian larangan dan format laporan.
6. Tulis berkas command.
7. Verifikasi dengan membaca ulang berkas dan memastikan tidak ada rujukan usang.
8. Perbarui `MEMORI.md`, `memori/riwayat_perubahan.md`, dan berkas sesi.

## Larangan

- DILARANG menamai berkas command dengan spasi, huruf besar, atau karakter selain `a-z`, `0-9`, dan garis bawah.
- DILARANG mendaftarkan subcommand lewat frontmatter; gunakan `$ARGUMENTS`/`$1`–`$N` dengan fallback, atau satu berkas per subcommand.
- DILARANG memakai sintaks `` !`cmd` `` atau mengandalkan `@file` untuk menyuntik isi berkas.
- DILARANG menduplikasi isi command lain; rujuk path berkasnya.
- DILARANG mengubah kode Dart, berkas hasil generate, atau konfigurasi Kilo tanpa perintah eksplisit pengguna.
- DILARANG commit/push hasil pembuatan atau pembaruan command.
- DILARANG menyalin isi command ke skill atau dokumen lain; gunakan path berkas.

## Contoh Benar

```markdown
---
description: Memeriksa ketersediaan dan status dokumen perencanaan sebelum menjalankan analisa kesehatan kode, lalu melanjutkan ke analisa bila seluruh prasyarat lolos.
---

# Nama Command

## Tujuan

Jelaskan tujuan command dalam satu paragraf.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu.
2. Gunakan bahasa Indonesia baku.

## Alur Kerja

1. Periksa berkas atau folder yang ditentukan.
2. Bila prasyarat tidak terpenuhi, **STOP** dan laporkan alasannya.
3. Bila seluruh prasyarat lolos, lanjutkan ke tahap berikutnya.

## Format Laporan

Sampaikan ringkasan dalam tabel atau daftar berisi berkas, status, dan hasil pemeriksaan.

## Larangan

- DILARANG mengubah berkas apa pun sebelum pengguna menyetujui.
- DILARANG commit/push.
```

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

## Sumber Evaluasi

- Berkas command nyata di proyek: `.kilo/commands/tambah_log.md`, `.kilo/commands/analisa_log.md`, `.kilo/commands/kerjakan_hasil_diskusi.md`, `.kilo/commands/mode/mode_diskusi.md`, `.kilo/commands/analisa_kesehatan_kode_alur.md`, `.kilo/commands/evaluasi_aturan.md`, `.kilo/commands/evaluasi_aturan_khusus.md`, `.kilo/commands/salin_konfigurasi_ke_global.md`
- Skill terkait: `.agents/skills/custom/konfigurasi-kilo-proyek/SKILL.md`
- Aturan terkait: `.agents/rules/global/format_hasil_diskusi.md`, `.agents/rules/global/format_task.md`, `.agents/rules/global/format_PRD.md`
- Konvensi trigger: `.agents/rules/global/aturan_skill.md` §8
- Dokumentasi resmi Kilo: `https://kilo.ai/docs/customize/workflows`