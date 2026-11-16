---
name: pembuatan-command-kilo
description: Trigger: saat membuat command Kilo baru atau memperbarui command Kilo | Panduan command `.kilo/commands/**/*.md`: setiap command wajib memiliki frontmatter, description, agent, dan variant; penamaan berkas, variabel, fallback tool question, larangan, dan checklist verifikasi.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Mon Nov 16 2026 00:06:00 WIB"
---

# Membuat dan Memperbarui Command Kilo

Mengatur cara membuat command Kilo baru di `.kilo/commands/` agar frontmatter, penamaan, alur instruksi, dan larangan konsisten di seluruh proyek.

## Cakupan yang Di-Cover

- Berkas: `.kilo/commands/**/*.md` (satu berkas per command)
- Frontmatter: `description`, `agent`, `variant` (wajib); `model` dan `subtask` (opsional)
- Variabel: `$ARGUMENTS`, `$1`–`$N`, fallback tool `question`

## Aturan

1. Simpan command sebagai berkas `.md` di `.kilo/commands/` atau subdirektori mana pun di bawahnya; pemuatan bersifat rekursif dan nama berkas (minus `.md`) menjadi nama command.
2. Beri nama berkas dengan huruf kecil, angka, dan garis bawah; gunakan bahasa Indonesia deskriptif yang menyebut tujuan command.
3. Setiap command wajib memiliki frontmatter yang memuat `description`, `agent`, dan `variant`.
4. `description` wajib satu baris, bahasa Indonesia baku, yang menyebut tujuan command.
5. `agent` wajib diisi (mis. `code`); `variant` wajib diisi (gunakan nilai default bila tidak ada override).
6. Bila command menerima argumen, gunakan `$ARGUMENTS` untuk seluruh argumen atau `$1`–`$N` untuk argumen posisional; sediakan fallback berupa tool `question` saat argumen kosong atau tidak dikenali.
7. Jangan mengandalkan `@file` untuk menyuntik isi berkas; agen membaca berkas dengan tool `read` berdasarkan path yang ditulis di instruksi.
8. Susun isi berurutan: tujuan command, ketentuan umum, cakupan, langkah kerja bernomor, format laporan, dan larangan.
9. Nyatakan status akhir secara eksplisit, mis. kalimat penutup yang menandai hasil atau alasan command berhenti.
10. Cantumkan larangan eksplisit bila command tidak boleh menyentuh kode Dart, berkas hasil generate, arsip `hasil_diskusi/`, konfigurasi Kilo, atau melakukan commit/push.
11. Muat konteks wajib di awal command: `AGENTS.md`, berkas yang ditunjuk argumen, dan aturan format yang relevan.
12. Jika command mengubah berkas, wajib meminta konfirmasi pengguna sebelum menulis, dan sebutkan berkas target pada laporan.
13. Periksa typo, ambiguitas, dan diksi yang kurang profesional sebelum menyelesaikan command.
14. Setelah membuat atau memperbarui command, perbarui `MEMORI.md` dan `memori/riwayat_perubahan.md` melalui berkas sesi `memori/sesi/sesi_N.md`.
15. Jika command menjadi usang (mis. target yang dirujuk sudah tidak ada), laporkan kepada pengguna dan usulkan penghapusan atau penggantian; jangan membiarkan command usang tetap aktif.

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
description: Memeriksa ketersediaan dokumen perencanaan sebelum analisa kesehatan kode.
agent: code
variant: default
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
---
description: analisa
---

apa saja yang harus diperiksa
```

```markdown
---
description: analisa
subcommands: [satu, dua]
---

Baca @prd/contoh.md lalu kerjakan.
```

## Sumber Evaluasi

- Berkas command nyata di proyek: `.kilo/commands/tambah_log.md`, `.kilo/commands/analisa_log.md`, `.kilo/commands/kerjakan_hasil_diskusi.md`, `.kilo/commands/mode/mode_diskusi.md`
- Skill terkait: `.agents/skills/custom/konfigurasi-kilo-proyek/SKILL.md`
- Aturan terkait: `.agents/rules/global/format_hasil_diskusi.md`, `.agents/rules/global/format_task.md`, `.agents/rules/global/format_PRD.md`
- Dokumentasi resmi Kilo: `https://kilo.ai/docs/customize/workflows`
