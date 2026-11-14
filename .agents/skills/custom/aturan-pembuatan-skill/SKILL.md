---
name: aturan-pembuatan-skill
description: "Trigger: saat membuat skill baru atau memperbarui skill | Panduan SKILL.md di .agents/skills: lokasi, struktur, penamaan kebab-case bahasa Indonesia, sumber isi dari riwayat commit, front matter YAML, segmen trigger-only, section wajib, dan checklist verifikasi. Termasuk referensi dokumen resmi Kilo (kilo.ai/docs/customize/skills) dan repositori skill Kilo (github.com/Kilo-Org/skills) sebagai pedoman lokasi tambahan, bundled resources, dan shell command di skill."
metadata:
  kategori: "custom"
  versi: "1.0.5"
  diperbarui: "Sat Nov 14 2026 23:46 WIB"
  sumber-terakhir: "perintah pengguna: tambahkan temuan dari kilo.ai/docs/customize/skills dan github.com/Kilo-Org/skills"
---

# Aturan Pembuatan dan Pembaruan SKILL.md

Mengatur cara **membuat** dan **memperbarui** file `SKILL.md` di `.agents/skills/` agar format, sumber isi, dan penamaan konsisten. Skill yang dibuat sebisa mungkin portabel dan dapat digunakan lintas-proyek Flutter.

## Cakupan yang Di-Cover

- Lokasi: `.agents/skills/<kategori>/<nama-skill>/SKILL.md` (proyek) dan `.kilo/skills/<nama-skill>/SKILL.md` (project-level, prioritas lebih tinggi)
- Lokasi global kompatibilitas: `~/.kilo/skills/`, `~/.agents/skills/`, `~/.claude/skills/` (dipuat bersama dalam satu pool)
- Kategori default: `custom`
- Struktur: satu folder per skill berisi `SKILL.md` (wajib)
- Bundled resources opsional: `scripts/`, `references/`, `assets/`, `examples/`
- Referensi format UI: `pola-ux/SKILL.md`, `pola-ui/SKILL.md`, `gaya/SKILL.md`, `tipografi/SKILL.md`, `spacing/SKILL.md`, `widget-custom/SKILL.md`
- Referensi format non-UI: `bug-runtime/SKILL.md`
- Front matter YAML: `name` (maks 64 karakter, lowercase, angka, strip, harus cocok dengan nama folder), `description` (maks 1024 karakter, wajib diawali segmen trigger-only), `metadata.kategori`, `metadata.versi` (semver), `metadata.diperbarui` (format `TZ=Asia/Jakarta date`), dan `metadata.sumber-terakhir` (hash commit atau perintah/hasil eksplisit pengguna). Field opsional `license` dan `compatibility` boleh ditambahkan bila relevan.
- Section wajib: Judul/Intro, `## Cakupan yang Di-Cover`, `## Aturan`, `## Larangan`, `## Contoh Benar`, `## Contoh Salah`, `## Sumber Evaluasi`
- Sumber isi: riwayat commit (`git log`, `git show`, `git diff`)
- Shell command di skill: syntax `` !`command` `` (hanya dieksekusi di lokasi terpercaya: global skill, built-in, atau path absolut di global config; project skill dan remote URL tidak dieksekusi)
- Slash command: setiap skill tersedia sebagai `/<nama>:skill` di menu `/`
- Penemuan skill: saat session dimulai; gunakan `/reload` untuk memindai ulang tanpa memulai session baru
- Mode-specific skill: tidak ada direktori terpisah per mode; semua skill dalam satu pool, agent memilih berdasarkan `description`

## Aturan

1. Gunakan path `.agents/skills/<kategori>/<nama-skill>/SKILL.md` dengan folder `skills` (jamak), bukan `skill`; kategori default `custom`.
2. Jika ingin skill dengan prioritas lebih tinggi di proyek ini, tambahkan di `.kilo/skills/<nama-skill>/SKILL.md` dan daftarkan path di `kilo.jsonc` under `"skills": { "paths": [...] }`.
3. Beri nama folder skill dalam **bahasa Indonesia**, **deskriptif**, dan **kebab-case**: hanya `a-z`, `0-9`, dan strip `-`; tidak diawali angka.
4. Field `name` di frontmatter **harus sama persis** dengan nama parent directory (Name Matching Rule).
5. Susun isi `SKILL.md` hanya dari **commit yang berkaitan** (commit yang menyentuh file/folder terkait topik skill) menggunakan `git log`, `git show <commit>`, atau `git diff <commit>`.
6. Jika ada beberapa commit relevan dengan pola berbeda, pilih pola dari **commit terbaru yang relevan** kecuali pengguna menentukan lain.
7. Cantumkan front matter YAML di paling atas (dibungkus `---`) dengan field wajib: `name` (sama dengan nama folder), `description` (wajib diawali segmen trigger-only, lihat aturan 8), `metadata.kategori`, `metadata.versi` (semver), `metadata.diperbarui` (format `TZ=Asia/Jakarta date`), dan `metadata.sumber-terakhir` (hash commit atau perintah/hasil eksplisit pengguna). Field opsional `license` dan `compatibility` boleh ditambahkan bila relevan.
8. Tulis `description` diawali segmen trigger-only sesuai `.agents/rules/global/aturan_skill.md` §8: diawali literal `Trigger:`, segmen trigger hanya berisi kondisi/tugas pemicu dalam bahasa Indonesia, dipisah dari segmen cakupan lain dengan `|` (spasi-pipe-spasi), dan berakhir pada `|` pertama atau akhir string. Setelah segmen trigger, `description` dan intro mencakup: apa yang di-cover, apa yang harus dihindari, langkah kerja (workflow), dan referensi ke file terkait.
9. Sertakan semua section wajib: Judul dan intro, `## Cakupan yang Di-Cover`, `## Aturan`, `## Larangan`, `## Contoh Benar`, `## Contoh Salah`, dan `## Sumber Evaluasi`. Contoh kode ditulis langsung di `SKILL.md` (tanpa folder `examples` terpisah).
10. Bundled resources (`scripts/`, `references/`, `assets/`, `examples/`) boleh ditambahkan sebagai pendukung, tetapi `SKILL.md` tetap menjadi berkas tunggal yang wajib ada di root folder skill.
11. Gunakan bahasa Indonesia, gaya teknis ringkas, tanpa pengalaman konversasi. Gunakan backtick `` ` `` untuk nama class, properti, method, dan package.
12. Ikuti standar format dan penulisan dari skill referensi sesuai topik (UI atau non-UI) sebagai acuan tata letak section, gaya bahasa, dan penggunaan backtick.
13. Jika menemukan skill lama yang melanggar aturan, laporkan kepada pengguna dan usulkan perbaikan sebelum melakukan rename atau restructure; jangan membiarkan pelanggaran tanpa tindak lanjut.
14. Sebelum selesai, verifikasi checklist: lokasi benar, nama folder valid, front matter lengkap, semua section ada, isi berbasis commit relevan, `description` diawali segmen trigger-only, dan pelanggaran skill lama telah dilaporkan bila ada.
15. Patuhi konvensi segmen trigger: literal `Trigger:` di posisi paling awal, trigger hanya memuat kondisi/tugas pemicu (bahasa Indonesia), tanpa cakupan/larangan/workflow/referensi file, dan ekstraksi trigger membaca dari setelah `Trigger:` sampai `|` pertama atau akhir string.
16. Shell command di `SKILL.md` (syntax `` !`command` ``) hanya diizinkan di lokasi terpercaya (global skill, built-in, atau path absolut di global config). Project skill (`.kilo/skills/`) dan remote URL (`skills.urls`) **DILARANG** mengeksekusi shell command; placeholder diganti dengan marker untrusted.
17. Setiap skill otomatis tersedia sebagai slash command `/<nama>:skill`; pastikan nama tidak bentrok dengan custom command atau MCP prompt yang sudah ada.
18. Skill ditemukan saat session dimulai; untuk memindai ulang skill yang baru ditambahkan atau diubah tanpa memulai session baru, gunakan `/reload`.

## Larangan

- DILARANG menggunakan folder `skill` (tunggal); wajib `skills`.
- DILARANG menamai folder skill dengan garis bawah (`_`), spasi, huruf besar, angka di awal, atau karakter selain `a-z`, `0-9`, dan `-`.
- DILARANG field `name` di frontmatter tidak sama dengan nama parent directory.
- DILARANG mengambil isi `SKILL.md` dari file yang belum di-commit (working directory/working tree), perubahan staging (`git diff --cached`), atau file untracked.
- DILARANG mengarang pola, gaya, atau contoh bila **tidak ada** commit yang berkaitan; wajib berhenti dan menanyakan kepada pengguna cara melanjutkan.
- DILARANG mengubah atau restructure skill lama yang melanggar aturan tanpa melaporkan dan menunggu arahan pengguna.
- DILARANG menghilangkan section wajib atau memindahkan contoh ke folder `examples` terpisah.
- DILARANG menulis deskripsi yang tidak mencakup trigger, cakupan, larangan penggunaan, langkah kerja, dan referensi file terkait.
- DILARANG menulis `description` tanpa segmen trigger-only di awal (literal `Trigger:`, lihat `.agents/rules/global/aturan_skill.md` §8.2).
- DILARANG mengeksekusi shell command (`!`command``) di project skill (`.kilo/skills/`) atau remote URL (`skills.urls`); hanya diperbolehkan di lokasi terpercaya.
- DILARANG menambahkan bundled resources (`scripts/`, `references/`, `assets/`, `examples/`) tanpa `SKILL.md` di root folder skill.

## Contoh Benar

````markdown
---
name: material-app-tema-lokalisasi
description: Trigger: saat mengonfigurasi MaterialApp dan WidgetsApp | Panduan tema (theme, darkTheme, themeMode), lokalisasi (locale, supportedLocales, localizationsDelegates), serta ScrollBehavior.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Wed Nov 11 2026 23:30:00 WIB"
  sumber-terakhir: "perintah pengguna: perbarui skill index"
  license: MIT
  compatibility:
    product: "Kilo Code"
    systemPackages: ["flutter"]
---

# Konfigurasi MaterialApp, Tema, dan Lokalisasi

Mengatur `MaterialApp` / `WidgetsApp` dengan tema gelap/terang dan lokalisasi.

## Cakupan yang Di-Cover

- Package: `package:flutter`
- Class: `MaterialApp`, `WidgetsApp`

## Aturan

1. Sertakan `home`, `routes`, `onGenerateRoute`, atau `builder` pada `MaterialApp`.

## Larangan

- DILARANG `supportedLocales` kosong.

## Contoh Benar

```dart
MaterialApp(home: HomePage());
```
````

## Contoh Salah

```dart
MaterialApp(supportedLocales: []); // DILARANG
```

```markdown
---
name: Integration_Test
description: panduan test
metadata:
  kategori: "custom"
  versi: "1.0"
---

# Skill

Contoh diambil dari perubahan yang belum di-commit.
````

```dart
// DILARANG: nama folder pakai huruf besar/underscore, front matter tidak lengkap,
// section wajib tidak ada, dan isi diambil dari working directory (bukan commit).
```

Contoh pelanggaran shell command di project skill:

```markdown
---
name: repo-status
description: Trigger: saat mengecek status repository | Ringkasan working tree.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Wed Nov 11 2026 23:30:00 WIB"
  sumber-terakhir: "perintah pengguna"
---

!`git status --short`

DILARANG: shell command `!`command`` tidak dieksekusi di project skill (`.kilo/skills/`) atau remote URL (`skills.urls`); hanya diperbolehkan di lokasi terpercaya.
```

## Sumber Evaluasi

- File aturan sumber: `.agents/rules/global/aturan_skill.md` (§8 Definisi dan Konvensi Trigger)
- Skill referensi format UI: `.agents/skills/custom/pola-ux/SKILL.md`, `.agents/skills/custom/pola-ui/SKILL.md`, `.agents/skills/custom/gaya/SKILL.md`, `.agents/skills/custom/tipografi/SKILL.md`, `.agents/skills/custom/spacing/SKILL.md`, `.agents/skills/custom/widget-custom/SKILL.md`
- Skill referensi format non-UI: `.agents/skills/custom/bug-runtime/SKILL.md`
- Rujukan dokumen resmi Kilo (wajib dibaca): https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com (SKILL.md format, frontmatter fields, bundled resources, shell commands, skill locations, slash commands, mode-specific skills, name matching rule)
- Rujukan repositori skill Kilo (wajib dibaca): https://github.com/Kilo-Org/skills (struktur skill, installed via `npx skills add Kilo-Org/skills`, kompatibilitas lintas agen, panduan kontribusi dan distribusi)
- Commit rujukan: `85421c9fc058fc1af147fc29f7b2ab1721dec16b` (docs(agents): rombak panduan kerja dan pertegas aturan referensi skill), `413f7e4` (refactor(agents): restrukturisasi skill kustom dan ringkas aturan pembuatan SKILL.md), `3cbc5db` (docs(agents): tambah aturan pembuatan SKILL.md dan perbarui AGENTS.md)
