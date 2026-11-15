# Hasil Diskusi 13 — Penguatan skill memori-check: setiap file sesi menyertakan info file yang diedit

## Status
- Dokumen: Final
- Implementasi: Sudah Diimplementasikan
- Tanggal: 2026-11-15
- Topik: Penguatan skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) agar setiap berkas sesi (`memori/sesi/sesi_N.md`) WAJIB menyertakan informasi file mana saja yang diedit selama sesi, termasuk perubahan di submodule, dengan verifikasi eksplisit sebelum berkas sesi ditandai `Sudah Sinkron`.

## Latar Belakang

Pada sesi 130 (2026-11-15) pengguna menyatakan keinginan agar "setiap file sesi sertakan info file mana saja yang di edit". Pemeriksaan kondisi aktual menunjukkan:

- Bagian `## Berkas Terdampak` dengan tabel `Lokasi File | Status Perubahan | Deskripsi` sudah diwajibkan oleh skill `memori-check` (Aturan 3, struktur berkas sesi) dan sudah ada pada **seluruh 129 berkas sesi** yang ada saat pemeriksaan (grep `^## Berkas Terdampak` → 129 kecocokan; grep `\| Lokasi File` → 129 kecocokan; `sesi_130.md` juga memuat bagian tersebut).
- Verifikasi akhir sesi (Step 6 skill `memori-check`) saat ini hanya menjalankan `git status -- memori/sesi/` dan `git diff -- memori/sesi/` untuk memastikan tidak ada berkas sesi `Sudah Sinkron` yang berubah — **tidak** mencocokkan isi tabel Berkas Terdampak dengan perubahan aktual (`git status --short` / `git diff --name-only`) yang terjadi selama sesi.
- Dengan demikian, struktur tabel sudah ada, tetapi **kelengkapan dan kebenaran isinya belum diverifikasi secara eksplisit** — celah inilah yang ingin ditutup oleh penguatan skill.

Pembatasan yang berlaku: berkas sesi ber-status `Sudah Sinkron` adalah **arsip permanen** dan DILARANG diubah dengan alasan apa pun (skill `memori-check`, aturan 13). Penguatan hanya berlaku untuk sesi ke depan dan (bila diperlukan) berkas sesi yang masih `Belum Sinkron`.

## Poin Diskusi

### 1. Apakah struktur pencatatan file yang diedit sudah ada?
- Tanya: Apakah skill `memori-check` sudah mewajibkan tabel file yang diedit?
- Kesimpulan: Ya — bagian `## Berkas Terdampak` (tabel `Lokasi File | Status Perubahan | Deskripsi`) wajib ada di setiap berkas sesi (Aturan 3); tabel diisi selama sesi berjalan (Aturan 4). Penguatan diperlukan pada **kelengkapan dan verifikasi**, bukan pada keberadaan struktur.

### 2. Bentuk penguatan yang diinginkan
- Tanya: Bentuk mana yang diinginkan pengguna untuk menjamin setiap file sesi menyertakan info file yang diedit?
- Kesimpulan: Pengguna memilih **perkuat skill `memori-check`** (opsi Recommended), bukan menambahkan info ke `MEMORI.md`, dan bukan audit sebagai deliverable utama.

### 3. Elemen penguatan yang dipilih
- Tanya: Elemen penguatan mana saja yang diinginkan (boleh lebih dari satu)?
- Kesimpulan: Pengguna memilih **seluruh empat elemen**:
  1. Aturan kelengkapan eksplisit — tabel Berkas Terdampak WAJIB mencantumkan seluruh berkas yang dibuat/diubah/dihapus selama sesi, termasuk di submodule; tidak boleh hanya berkas sesi bila ada perubahan lain.
  2. Verifikasi `git diff` eksplisit — Step 6 Verifikasi diperluas: sebelum menandai berkas sesi `Sudah Sinkron`, cocokkan tabel Berkas Terdampak dengan `git status --short` / `git diff --name-only` (root + submodule yang terlibat); selisih WAJIB diselesaikan atau dilaporkan.
  3. Cakupan submodule — perubahan di dalam submodule (mis. `base_coc/…`) dicatat dengan path relatif terhadap root workspace.
  4. Larangan menandai prematur — berkas sesi DILARANG ditandai `Sudah Sinkron` sebelum tabel Berkas Terdampak lengkap dan terverifikasi.

### 4. Retroaktivitas
- Tanya: Apakah berkas sesi lama (`Sudah Sinkron`) harus dilengkapi/diperbaiki?
- Kesimpulan: Tidak. Berkas sesi `Sudah Sinkron` adalah arsip permanen dan DILARANG diubah. Penguatan berlaku untuk sesi ke depan; berkas `Belum Sinkron` (mis. `sesi_81.md`, `sesi_122.md`, `sesi_123.md`) tetap di tangan pembuatnya dan tidak diputuskan sepihak.

### 5. Kapan implementasi dilakukan
- Tanya: Apakah perubahan skill diterapkan sekarang atau setelahnya?
- Kesimpulan: **Setelah diskusi ini Final**, melalui sesi terpisah (mis. command `kerjakan_hasil_diskusi` atau permintaan eksplisit pengguna). Mode Diskusi hanya menghasilkan dokumen; perubahan kode/skill bukan bagian dari mode ini.

### 6. Penanganan catch-up `Belum Sinkron` (sesi 130)
- Tanya: Bagaimana penanganan `sesi_122.md` dan `sesi_123.md` (sesi paralel, `Belum Sinkron`)?
- Kesimpulan: Pengguna menjawab "tanpa jawaban" — keputusan tidak diberikan. Keduanya (dan `sesi_81.md`) **tidak disentuh** dan dilaporkan ke pengguna; tidak diputuskan sepihak. `sesi_127.md` terverifikasi sudah `Sudah Sinkron` saat pemeriksaan.

## Keputusan

- K-1: Bentuk penguatan yang dipilih adalah **perkuat skill `.agents/skills/custom/memori-check/SKILL.md`**; informasi file yang diedit tetap dicatat di berkas sesi (`## Berkas Terdampak`), bukan di `MEMORI.md`.
- K-2: Elemen penguatan yang disepakati (seluruh empat): (a) aturan kelengkapan eksplisit untuk tabel Berkas Terdampak (termasuk cakupan submodule); (b) Step 6 Verifikasi diperluas dengan pencocokan `git status --short` / `git diff --name-only` (root + submodule yang terlibat) sebelum menandai `Sudah Sinkron`; (c) path perubahan submodule dicatat relatif terhadap root workspace; (d) larangan menandai berkas sesi `Sudah Sinkron` sebelum tabel Berkas Terdampak lengkap dan terverifikasi.
- K-3: Berkas sesi `Sudah Sinkron` **tidak diubah retroaktif**; penguatan berlaku sejak diskusi ini (sesi 130) dan seterusnya.
- K-4: Implementasi perubahan skill dilakukan **setelah diskusi ini Final**, pada sesi terpisah (mis. `kerjakan_hasil_diskusi`) atau atas permintaan eksplisit pengguna; tidak diterapkan dalam Mode Diskusi.
- K-5: Saat implementasi, aturan `aturan-pembuatan-skill` berlaku: bump semver skill `memori-check` (minor, mis. ke v1.9.0), perbarui field `metadata.diperbarui` (format `TZ=Asia/Jakarta date`), dan perbarui `SKILLS_INDEX.md` (entri skill `memori-check`).
- K-6: `sesi_81.md`, `sesi_122.md`, dan `sesi_123.md` tetap `Belum Sinkron` (pengguna tidak memberi keputusan; "tanpa jawaban"); tidak disentuh dan tetap dilaporkan.
- K-7: `Dokumen` hasil diskusi ini `Final`; `Implementasi` `Belum Diimplementasikan` sampai sesi implementasi dijalankan dan memverifikasi berkas skill aktual.

## Rekomendasi

- R-1: Rancang perubahan skill sesuai empat elemen K-2: sisipkan aturan kelengkapan eksplisit (mis. aturan baru setelah Aturan 4), tegaskan cakupan submodule, perluas Step 6 Verifikasi dengan pencocokan tabel vs `git status --short`/`git diff --name-only` (root + submodule yang terlibat), dan tambahkan larangan menandai `Sudah Sinkron` sebelum tabel lengkap/terverifikasi. Jaga gaya bahasa dan struktur skill yang ada (bahasa Indonesia, backtick untuk nama class/perintah, tanpa menghapus aturan lama).
- R-2: Selama pengisian tabel Berkas Terdampak di sesi berjalan, biasakan membandingkan dengan `git status --short` (root + submodule) pada setiap titik perubahan substantif — bukan hanya di akhir sesi — agar selisih terdeteksi lebih dini (selaras dengan Aturan 4 "catat ke berkas sesi selama sesi berlangsung").
- R-3: Audit kepatuhan retroaktif (read-only) terhadap berkas sesi lama sebagai langkah terpisah opsional setelah penguatan diimplementasikan; sesi `Sudah Sinkron` tidak disentuh; ambiguitas dilaporkan ke pengguna.
- R-4: Pada sesi implementasi, perbarui `SKILLS_INDEX.md` (entri `memori-check`: status pembaruan) dan cantumkan provenance `sesi 130`/sesi implementasi di `MEMORI.md`; jangan mempromosikan butir insidental ke `MEMORI.md` (aturan 14 `memori-check`).
- R-5: Verifikasi implementasi berbasis baca berkas (frontmatter skill valid, `name` = nama folder, semua section wajib tetap ada, `SKILLS_INDEX.md` sinkron); tidak ada build/test Dart yang relevan untuk perubahan skill Markdown.

## Tindak Lanjut

| No | Tindakan | File Terdampak | Status |
|----|----------|----------------|--------|
| 1 | Susun draf perubahan skill `memori-check`: aturan kelengkapan (+ cakupan submodule), perluasan Step 6 Verifikasi (git status --short / git diff --name-only, root + submodule), larangan menandai `Sudah Sinkron` sebelum tabel terverifikasi | `.agents/skills/custom/memori-check/SKILL.md` | selesai |
| 2 | Bump versi `memori-check` (minor, mis. v1.9.0) + perbarui `metadata.diperbarui` | `.agents/skills/custom/memori-check/SKILL.md` | selesai |
| 3 | Perbarui `SKILLS_INDEX.md` (entri skill `memori-check` — status pembaruan) | `SKILLS_INDEX.md` | selesai |
| 4 | Sinkronisasi akhir sesi implementasi: `MEMORI.md` + `memori/riwayat_perubahan.md` + berkas sesi baru (provenance sesi 130) | `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_<N>.md` | selesai |
| 5 | Verifikasi pasca-implementasi: frontmatter valid, section wajib tetap ada, `name` = nama folder, indeks skill sinkron | `.agents/skills/custom/memori-check/SKILL.md`, `SKILLS_INDEX.md` | selesai |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `hasil_diskusi/diskusi_13.md` | Dibuat | Berkas hasil diskusi ini |
| `memori/sesi/sesi_130.md` | Dibuat/Diubah | Berkas sesi sesi 130 (Mode Diskusi) |
| `MEMORI.md` | Diubah | Entri `Status Kerja` sesi 130 + `Hasil Diskusi` (nomor tertinggi 13) + header `Diperbarui` (pada penyelesaian sesi) |
| `memori/riwayat_perubahan.md` | Diubah | Entri kronologis sesi 130 |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan
| Tanggal | Perubahan |
|---------|-----------|
| 2026-11-15 | Berkas dibuat dari Mode Diskusi sesi 130: topik penguatan skill `memori-check` agar setiap file sesi menyertakan info file yang diedit; empat elemen penguatan disepakati; implementasi ditunda hingga diskusi Final dan sesi terpisah. |
| 2026-11-15 | Implementasi dijalankan (sesi 132; `kerjakan_hasil_diskusi`): penguatan skill `memori-check` v1.8.0 → v1.9.0 (Aturan 22/23 baru, Aturan 3/4/Step 6/Larangan diperluas); `SKILLS_INDEX.md` entri 21 diperbarui; Tindak Lanjut 1–3 dan 5 selesai. |
| 2026-11-15 | Pertanyaan terbuka ditutup: apakah audit kepatuhan retroaktif diinginkan sebagai tindak lanjut terpisah — jawaban "tidak"; daftar Pertanyaan Terbuka menjadi `Belum ada`; sesi `Sudah Sinkron` tidak diubah retroaktif. |
