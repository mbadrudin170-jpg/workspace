# AGENTS.md — Aturan Proyek

> **Peringkat wajib dibaca sebelum bertindak.**
>
> **Skill adalah aturan.** Setiap `SKILL.md` yang ada di `.agents/skills/` **wajib diperlakukan sebagai aturan yang mengikat**, setara dengan aturan di `.agents/rules/`. Skill bukan sekadar referensi, dokumentasi pasif, atau saran opsional.
>
> - Saat trigger sebuah skill terpenuhi, AI **wajib** memuat skill tersebut melalui tool `skill` **sebelum** mengubah kode atau dokumen.
> - Setelah skill dimuat, AI **wajib** menjalankan seluruh `## Aturan` dan mematuhi seluruh `## Larangan` di dalamnya.
> - Mengabaikan skill yang trigger-nya terpenuhi diperlakukan sebagai pelanggaran aturan dengan bobot sama seperti mengabaikan `.agents/rules/`, dan **wajib** dilaporkan kepada pengguna.
>
> Rujukan: `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` (Skill sebagai Aturan yang Mengikat).

// ============================================================
// SKILL: .agents/skills/custom/aturan-pembuatan-skill/SKILL.md
// ============================================================

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
- Front matter YAML: `name` (maks 64 karakter, lowercase, angka, strip, harus cocok dengan nama folder), `description` (maks 1024 karakter, wajib diawali segmen trigger-only), `metadata.kategori`, `metadata.versi` (semver), dan `metadata.diperbarui` (format `TZ=Asia/Jakarta date`). Field opsional `license` dan `compatibility` boleh ditambahkan bila relevan.
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
7. Cantumkan front matter YAML di paling atas (dibungkus `---`) dengan field wajib: `name` (sama dengan nama folder), `description` (wajib diawali segmen trigger-only, lihat aturan 8), `metadata.kategori`, `metadata.versi` (semver), dan `metadata.diperbarui` (format `TZ=Asia/Jakarta date`). Field opsional `license` dan `compatibility` boleh ditambahkan bila relevan.
8. Tulis `description` diawali segmen trigger-only: diawali literal `Trigger:`, segmen trigger hanya berisi kondisi/tugas pemicu dalam bahasa Indonesia, dipisah dari segmen cakupan lain dengan `|` (spasi-pipe-spasi), dan berakhir pada `|` pertama atau akhir string. Setelah segmen trigger, `description` dan intro mencakup: apa yang di-cover, apa yang harus dihindari, langkah kerja (workflow), dan referensi ke file terkait.
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
- DILARANG menulis `description` tanpa segmen trigger-only di awal (literal `Trigger:`, lihat aturan 8 di skill ini).
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
```

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
---

!`git status --short`

DILARANG: shell command `!`command`` tidak dieksekusi di project skill (`.kilo/skills/`) atau remote URL (`skills.urls`); hanya diperbolehkan di lokasi terpercaya.
```

## Sumber Evaluasi

- File aturan sumber: skill ini (`.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`) — aturan 8 (segmen trigger-only)
- Skill referensi format UI: `.agents/skills/custom/pola-ux/SKILL.md`, `.agents/skills/custom/pola-ui/SKILL.md`, `.agents/skills/custom/gaya/SKILL.md`, `.agents/skills/custom/tipografi/SKILL.md`, `.agents/skills/custom/spacing/SKILL.md`, `.agents/skills/custom/widget-custom/SKILL.md`
- Skill referensi format non-UI: `.agents/skills/custom/bug-runtime/SKILL.md`
- Rujukan dokumen resmi Kilo (wajib dibaca): https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com (SKILL.md format, frontmatter fields, bundled resources, shell commands, skill locations, slash commands, mode-specific skills, name matching rule)
- Rujukan repositori skill Kilo (wajib dibaca): https://github.com/Kilo-Org/skills (struktur skill, installed via `npx skills add Kilo-Org/skills`, kompatibilitas lintas agen, panduan kontribusi dan distribusi)
- Commit rujukan: `85421c9fc058fc1af147fc29f7b2ab1721dec16b` (docs(agents): rombak panduan kerja dan pertegas aturan referensi skill), `413f7e4` (refactor(agents): restrukturisasi skill kustom dan ringkas aturan pembuatan SKILL.md), `3cbc5db` (docs(agents): tambah aturan pembuatan SKILL.md dan perbarui AGENTS.md)

// ============================================================
// FILE: .agents/rules/global/format_hasil_diskusi.md
// ============================================================

# Format Berkas Hasil Diskusi

## 1. Tujuan

Aturan ini menetapkan format, lokasi, penamaan, status, dan kewajiban pencatatan berkas hasil diskusi (`diskusi_N.md`) agar setiap orang dan AI yang membuat atau memperbarui berkas tersebut menghasilkan isi yang konsisten.

## 2. Cakupan

- **Berkas yang diatur**: berkas hasil diskusi `diskusi_N.md` pada folder `hasil_diskusi/` di root proyek.
- **Mode terkait**: `.kilo/commands/mode/mode_diskusi.md` (aturan pelaksanaan mode diskusi) dan `.kilo/commands/kerjakan_hasil_diskusi.md` (tindak lanjut hasil diskusi).
- **Dokumen lain**: `MEMORI.md` (bagian `Lokasi Hasil Diskusi` dan `Riwayat Diskusi`) serta `memori/riwayat_perubahan.md` (riwayat perubahan proyek); sinkronisasi dicatat pada `memori/sesi/sesi_N.md` (lihat skill `memori-check`); pada awal sesi AI juga wajib melakukan catch-up sync (memindai `memori/sesi/*.md` `Belum Sinkron` dari sesi sebelumnya) sebelum membuat berkas sesi baru.

## 3. Perbedaan dengan Format PRD

1. Berkas hasil diskusi **BUKAN** dokumen PRD. Sifatnya catatan proses: latar belakang, poin diskusi, keputusan, rekomendasi, dan tindak lanjut.
2. `.agents/skills/custom/format-prd/SKILL.md` hanya berlaku untuk dokumen PRD dan **tidak** menjadi acuan struktur berkas hasil diskusi.
3. Perbedaan utama:

| Aspek | PRD (`format-prd`) | Hasil Diskusi (aturan ini) |
| ----- | --------------------- | -------------------------- |
| Sifat | Spesifikasi produk | Catatan proses/keputusan |
| Pembuka | H1 PRD, metadata status, pemisah `---` | H1 topik + metadata ringkas pada `## Status` |
| Bagian | 6 bagian PRD (Informasi Produk, Tujuan PRD, Daftar Fitur, Alur Pengguna, Steps, File-File Terdampak) | Latar Belakang, Poin Diskusi, Keputusan, Rekomendasi, Tindak Lanjut, File Terdampak, Pertanyaan Terbuka, Riwayat Perubahan |
| Pengulangan aturan | Tiap bagian memuat "Konteks penggunaan" dan "Aturan pengisian" | Tidak ada pengulangan; langsung isi |
| Kata kunci wajib | — | `## Status`, `## Keputusan`, `## Tindak Lanjut` (dipakai `kerjakan_hasil_diskusi.md`) |

## 4. Aturan Lokasi dan Penamaan

1. Seluruh berkas hasil diskusi **WAJIB** disimpan di folder `hasil_diskusi/` pada root proyek.
2. Nama berkas **WAJIB** berformat `diskusi_N.md` dengan `N` berupa bilangan bulat positif tanpa awalan nol (contoh: `diskusi_1.md`, `diskusi_12.md`).
3. Penentuan nomor:
   - Jika folder `hasil_diskusi/` kosong, gunakan nomor `1`.
   - Jika sudah ada berkas, gunakan **nomor tertinggi + 1**.
   - Nomor yang terlewat (gap) **tidak diisi**; tetap gunakan `tertinggi + 1`.
4. **DILARANG** menyimpan berkas hasil diskusi di lokasi lain (mis. `prd/`, `docs/`, atau root tanpa folder).
5. **DILARANG** menimpa berkas hasil diskusi yang sudah ada. Diskusi baru selalu membuat berkas baru dengan nomor berikutnya.

## 5. Aturan Struktur Isi

1. Berkas **WAJIB** memuat bagian berikut **berurutan**, dengan teks judul **persis** seperti tertulis (tanpa penomoran):
   1. `# Hasil Diskusi <N> — <judul topik>`
   2. `## Status`
   3. `## Latar Belakang`
   4. `## Poin Diskusi`
   5. `## Keputusan`
   6. `## Rekomendasi`
   7. `## Tindak Lanjut`
   8. `## File Terdampak`
   9. `## Pertanyaan Terbuka`
   10. `## Riwayat Perubahan`
2. Isi tiap bagian:
   - `## Status` — memuat metadata: `Dokumen`, `Implementasi`, `Tanggal`, dan `Topik`.
   - `## Latar Belakang` — masalah, pemicu, atau konteks yang memunculkan diskusi.
   - `## Poin Diskusi` — poin-poin yang dibahas; setiap poin memuat pertanyaan dan kesimpulan singkat.
   - `## Keputusan` — daftar keputusan final, diberi kode `K-1`, `K-2`, dan seterusnya.
   - `## Rekomendasi` — daftar saran/tindakan yang dianjurkan, diberi kode `R-1`, `R-2`, dan seterusnya.
   - `## Tindak Lanjut` — tabel dengan kolom `No`, `Tindakan`, `File Terdampak`, `Status`.
   - `## File Terdampak` — tabel dengan kolom `Lokasi File`, `Status Perubahan`, `Deskripsi`.
   - `## Pertanyaan Terbuka` — hal yang masih menunggu jawaban/keputusan; tulis `Belum ada` bila tidak ada. **WAJIB diperbarui setiap kali status atau isi berkas berubah**: pertanyaan yang sudah terjawab WAJIB dihapus dari daftar dan dicatat sebagai jejak di `## Riwayat Perubahan` (mis. "Pertanyaan terbuka ditutup: <ringkasan pertanyaan> — <jawaban singkat> (<tanggal>)").
   - `## Riwayat Perubahan` — tabel dengan kolom `Tanggal`, `Perubahan`.
3. **Jumlah dan judul bagian DILARANG diubah** tanpa pembaruan aturan ini. Bila format perlu diperluas, ubah aturan ini terlebih dahulu.
4. Seluruh isi **WAJIB** menggunakan bahasa Indonesia, gaya teknis ringkas, tanpa pengalaman konversasi.
5. Seluruh isi **WAJIB** didasarkan pada hasil diskusi dan informasi proyek yang diketahui. **DILARANG mengarang informasi.**
6. Teks judul `## Status`, `## Keputusan`, dan `## Tindak Lanjut` **WAJIB** dipertahankan apa adanya karena menjadi titik baca `.kilo/commands/kerjakan_hasil_diskusi.md`.
7. **Pengecualian arsip.** Berkas hasil diskusi yang dibuat sebelum aturan ini berlaku (mis. `diskusi_1.md` sampai `diskusi_4.md`) dikecualikan dari kewajiban struktur di atas dan dipertahankan apa adanya sebagai arsip. **DILARANG** mengubah arsip tersebut tanpa persetujuan pengguna.

## 6. Aturan Status

1. `Dokumen` pada `## Status` **WAJIB** diisi salah satu dari:
   - `Draft` — masih dibahas atau belum disepakati.
   - `Final` — hasil diskusi sudah disepakati.
   - `Batal` — diskusi dibatalkan.
2. `Implementasi` pada `## Status` **WAJIB** diisi sesuai kondisi aktual, mis. `Belum Diimplementasikan`, `Sedang Diimplementasikan`, atau `Sudah Diimplementasikan`. Jika belum diketahui atau belum relevan, tulis secara eksplisit (mis. `Belum diketahui`) dan **DILARANG** mengarang.
3. Perubahan status **WAJIB** disertai penyesuaian isi bagian yang relevan agar dokumen tetap konsisten.

## 7. Aturan Bagian yang Belum Dibahas

1. Bagian yang belum dibahas, belum diputuskan, atau belum tersedia datanya **WAJIB** diisi keterangan eksplisit, mis. `Belum dibahas` atau `Belum diketahui`.
2. **DILARANG** menebak, mengisi contoh fiktif, atau mengosongkan bagian tanpa keterangan.
3. Bagian `## Pertanyaan Terbuka` **WAJIB** diperbarui setiap kali status atau isi berkas berubah: pertanyaan yang sudah terjawab WAJIB dihapus dari daftar, dan dicatat sebagai jejak di `## Riwayat Perubahan` (mis. "Pertanyaan terbuka ditutup: <ringkasan pertanyaan> — <jawaban singkat> (<tanggal>)"). Bila tidak ada pertanyaan terbuka, tulis `Belum ada`.

## 8. Aturan Pencatatan di `MEMORI.md` dan `memori/riwayat_perubahan.md`

1. Setelah berkas hasil diskusi dibuat, diperbarui, atau dihapus, **WAJIB** perbarui `MEMORI.md` pada bagian yang relevan, sekurang-kurangnya:
   - `Lokasi Hasil Diskusi` — lokasi folder, daftar berkas, dan nomor tertinggi.
   - `Riwayat Diskusi` — topik, status PRD, dan tindak lanjut.
2. Tambahkan entri riwayat perubahan pada `memori/riwayat_perubahan.md` — ringkasan perubahan berkas (sebagai pengganti bagian `Riwayat Perubahan` yang sebelumnya berada di `MEMORI.md`).
3. **DILARANG** membiarkan `MEMORI.md` memuat nomor tertinggi atau daftar berkas yang sudah usang.
4. Sinkronisasi `MEMORI.md` wajib dilakukan melalui alur berkas sesi (`memori/sesi/sesi_N.md`, status `Belum Sinkron` → `Sudah Sinkron`) sesuai skill `memori-check`: catat sesi ke berkas sesi sebelum/selama pembaruan, lalu tandai `Sudah Sinkron` setelah `MEMORI.md` dan `memori/riwayat_perubahan.md` diperbarui. Berkas `sesi_N.md` **tidak boleh dihapus** (diarsipkan permanen). Pada setiap **awal sesi**, setelah membaca `MEMORI.md` dan sebelum membuat berkas sesi baru, AI wajib melakukan **catch-up sync**: pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya; yatim/kosong tanpa perubahan nyata → ditandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan"; berisi perubahan nyata → disinkronkan dengan prosedur yang sama seperti akhir sesi (`MEMORI.md` + `memori/riwayat_perubahan.md` → isi `## Sinkronisasi ke MEMORI.md` → `Sudah Sinkron`); berkas sesi yang sedang aktif di sesi ini tidak ditandai; bila ambigu → dilaporkan ke pengguna, jangan diputuskan sendiri. Pemindaian dibatasi pada berkas `Belum Sinkron` saja; alur akhir sesi tetap dipertahankan (catch-up hanya jaring pengaman).

## 9. Larangan

- **DILARANG** membuat berkas hasil diskusi di luar `hasil_diskusi/`.
- **DILARANG** mengisi gap penomoran atau menimpa berkas yang sudah ada.
- **DILARANG** mengubah berkas hasil diskusi berstatus `Final` tanpa alasan yang disepakati pengguna.
- **DILARANG** mengubah kode sumber implementasi (`.dart` atau kode lain) sebagai bagian dari pembuatan berkas hasil diskusi; mode diskusi hanya menghasilkan dokumen.
- **DILARANG** memakai struktur PRD (bagian "Konteks penggunaan", "Aturan pengisian", atau 6 bagian PRD) untuk berkas hasil diskusi.
- **DILARANG** mengubah teks judul `## Status`, `## Keputusan`, atau `## Tindak Lanjut`.
- **DILARANG** menggunakan bahasa selain Indonesia, kecuali mengutip istilah teknis atau konten asing yang relevan.
- **DILARANG** mencantumkan informasi yang bukan pertanyaan (mis. catatan status/implementasi) pada `## Pertanyaan Terbuka`.
- **DILARANG** membiarkan pertanyaan yang sudah terjawab tetap tercantum pada `## Pertanyaan Terbuka`; pertanyaan terjawab WAJIB dihapus dan dicatat sebagai jejak di `## Riwayat Perubahan`.

## 10. Kerangka Berkas

```markdown
# Hasil Diskusi <N> — <judul topik>

## Status
- Dokumen: Draft | Final | Batal
- Implementasi: Belum Diimplementasikan | Sedang Diimplementasikan | Sudah Diimplementasikan
- Tanggal: YYYY-MM-DD
- Topik: <ringkasan topik>

## Latar Belakang
<masalah, pemicu, atau konteks diskusi>

## Poin Diskusi
### 1. <poin>
- Tanya: <pertanyaan>
- Kesimpulan: <kesimpulan singkat>

## Keputusan
- K-1: <keputusan>

## Rekomendasi
- R-1: <rekomendasi>

## Tindak Lanjut
| No | Tindakan | File Terdampak | Status |
|----|----------|----------------|--------|
| 1  | <tindakan> | <file> | belum |

## File Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| <file> | Dibuat / Diubah / Dihapus | <deskripsi> |

## Pertanyaan Terbuka
- <pertanyaan> / Belum ada

## Riwayat Perubahan
| Tanggal | Perubahan |
|---------|-----------|
| YYYY-MM-DD | <perubahan> |
```

## 11. Checklist Sebelum Menyelesaikan Berkas

- [ ] Berkas berada di `hasil_diskusi/diskusi_N.md` dengan nomor `tertinggi + 1`.
- [ ] Seluruh bagian pada §5 tersedia dan berurutan, dengan judul persis.
- [ ] `Dokumen` dan `Implementasi` pada `## Status` terisi dan konsisten dengan isi.
- [ ] Keputusan diberi kode `K-N` dan rekomendasi diberi kode `R-N`.
- [ ] Bagian yang belum dibahas diberi keterangan eksplisit.
- [ ] `## Pertanyaan Terbuka` diperbarui: pertanyaan terjawab dihapus dan dicatat sebagai jejak di `## Riwayat Perubahan`; bila tidak ada, berisi `Belum ada`.
- [ ] Tidak memakai struktur PRD.
- [ ] Bahasa Indonesia dan tidak ada informasi yang dikarang.
- [ ] `MEMORI.md` diperbarui pada bagian `Lokasi Hasil Diskusi` dan `Riwayat Diskusi`, serta `memori/riwayat_perubahan.md` diperbarui (riwayat perubahan) — sinkronisasi dicatat/ditandai pada `memori/sesi/sesi_N.md` (status `Sudah Sinkron`); awal sesi melakukan catch-up sync (`memori/sesi/*.md` `Belum Sinkron` dipindai; yatim/kosong ditandai `Sudah Sinkron` + catatan eksplisit; ambigu dilaporkan ke pengguna); berkas sesi tidak boleh dihapus.

// Format PRD (`.agents/rules/global/format_PRD.md`) telah dijadikan skill `.agents/skills/custom/format-prd/SKILL.md` (konversi penuh, sesi 66, 2026-11-15). Aturan format PRD kini mengikat melalui skill tersebut (skill adalah aturan; lihat `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` §12).
// Format task.md (`.agents/rules/global/format_task.md`) telah dijadikan skill `.agents/skills/custom/format-task-md/SKILL.md` (konversi penuh, sesi 64, 2026-11-15). Aturan format task.md kini mengikat melalui skill tersebut (skill adalah aturan; lihat `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` §12).
