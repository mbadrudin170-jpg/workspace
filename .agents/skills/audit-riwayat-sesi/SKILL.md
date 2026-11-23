---
name: audit-riwayat-sesi
description: "Gunakan ini saat mengaudit riwayat sesi | Panduan audit manual dan inkremental terhadap `memori/sesi/`, `MEMORI.md`, dan `memori/riwayat_perubahan.md`: inventarisasi berkas sesi + ledger, ekstraksi sinyal, agregasi frekuensi, klasifikasi A/B/C, rekomendasi perbaikan sistem tertulis."
---

# Audit Riwayat Sesi

Prosedur audit portabel lintas proyek dengan `MEMORI.md` untuk mendeteksi kesalahan/kegagalan yang sering terulang pada riwayat sesi (`memori/sesi/sesi_*.md`), mengklasifikasikan kebutuhan perbaikannya, dan mencatat hasil ke `audit/riwayat_sesi.md`. Audit bersifat **read-only** dengan satu pengecualian: append section baru ke `audit/riwayat_sesi.md`. Audit bersifat **inkremental** (berdasarkan ledger) dan **tidak memperbaiki otomatis** - tindak lanjut hanya rekomendasi tertulis.

## Cakupan yang Di-Cover

- Berkas yang diproses: `memori/sesi/sesi_*.md` yang belum tercatat di ledger atau yang berubah (mtime/jumlah baris).
- Konteks agregasi (selalu dibaca): `MEMORI.md`, `memori/riwayat_perubahan.md`.
- Berkas yang boleh ditulis: `audit/riwayat_sesi.md` (append section baru; section lama dipertahankan).
- Sumber data: hanya berkas memori; git log **tidak** digunakan.
- Referensi: `.kilo/commands/audit_riwayat_sesi.md`, `hasil_diskusi/diskusi_10.md` (K-1 s.d. K-13, R-1 s.d. R-6), `.agents/skills/cek-kesehatan-sistem-kerja/SKILL.md` (pola skill read-only), `.agents/skills/memori-check/SKILL.md` (alur sesi).
- Sumber perencanaan: `hasil_diskusi/diskusi_10.md`.

## Aturan

1. Perlakukan audit sebagai pemeriksaan **read-only**: kumpulkan bukti dari berkas aktual; jangan membuat, mengubah, atau menghapus berkas apa pun selain append section baru ke `audit/riwayat_sesi.md`.
2. Simpan penanda "sudah diaudit" **hanya** di ledger `audit/riwayat_sesi.md` - bukan di dalam berkas sesi; berkas sesi tidak diubah oleh audit.
3. Lewati penuh berkas sesi yang cocok dengan ledger **dan** mtime **serta** jumlah baris-nya sama; proses berkas yang belum tercatat di ledger atau yang mtime/jumlah barisnya berbeda.
4. Catat mtime dan jumlah baris **pada saat audit** ke ledger; berkas dilewati hanya bila keduanya sama.
5. mtime dapat berubah tanpa konten berubah (mis. berkas tersentuh); bila meragukan, baca ulang berkas untuk verifikasi sebelum melewatinya - tetapi berkas yang sudah diaudit tidak boleh dianalisis ulang sepenuhnya tanpa alasan.
6. Berkas yang tercatat di ledger tetapi sudah tidak ada di folder → catat sebagai temuan `berkas hilang`, bukan sebagai "sudah diaudit".
7. Sumber data hanya berkas memori (`memori/sesi/`, `MEMORI.md`, `memori/riwayat_perubahan.md`); jangan memakai git log.
8. Ekstraksi sinyal hanya untuk berkas yang diproses; pindai kata kunci (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`) lalu verifikasi manual dengan membaca berkas (mencegah false positive).
9. Agregasi frekuensi lintas **sesi berbeda** (bukan jumlah baris/kemunculan dalam satu sesi). Untuk berkas yang dilewati, kemunculan dihitung dari catatan audit sebelumnya di `audit/riwayat_sesi.md`; ambang "sering terulang" (≥3 sesi) dihitung dari gabungan catatan lama + temuan baru.
10. Klasifikasikan setiap pola ke: **(A)** kesalahan insidental sekali jadi; **(B)** pola berulang (≥3 sesi) → kandidat perbaikan sistem (aturan/skill/command/instruksi); **(C)** kerusakan arsip/rujukan yatim.
11. Rekomendasikan tindakan konkret per pola kategori B/C; tindak lanjut hanya rekomendasi tertulis di sesi; perbaikan dieksekusi lewat sesi terpisah atas persetujuan pengguna.
12. Perbarui `audit/riwayat_sesi.md` dengan pola **append per audit**: setiap audit menambahkan section baru bernomor berurutan (mis. `## Audit 2026-11-15 (sesi 117)`) berisi ringkasan, tabel pola, klasifikasi A/B/C, rekomendasi, dan daftar berkas yang diaudit beserta mtime + jumlah baris; section lama tidak dihapus/ditimpa.
13. Berkas sesi yang sudah diaudit **tetap diarsipkan permanen** di `memori/sesi/`; tidak dihapus, tidak dikompresi, dan tidak diubah; ukuran berkas kecil sehingga penghematan ruang tidak berarti.
14. Bila mtime tidak dapat diperoleh, catat `tidak tersedia` pada kolom mtime dan sampaikan sebagai keterbatasan; jangan mengarang nilai.
15. Jangan mengarang frekuensi/temuan; setiap temuan wajib didukung bukti dari berkas yang diproses atau catatan audit sebelumnya.
16. Gunakan tool baca yang sesuai (`read`, `glob`, `grep`) dan hindari operasi yang mengubah state.

### Format Ledger dan Section (presisi)

`audit/riwayat_sesi.md` memuat: (1) H1 + pengantar singkat; (2) format header/konvensi; (3) section-section audit (satu per run); di dalam section terdapat ledger tabel:

```markdown
| Sesi    | Tanggal audit | mtime                        | Jumlah baris |
| ------- | ------------- | ---------------------------- | ------------ |
| sesi_81 | 2026-11-15    | Sun Nov 14 2026 09:12:33 WIB | 128          |
```

Kolom wajib:

- `Sesi` - nama berkas tanpa `.md` (mis. `sesi_81`).
- `Tanggal audit` - tanggal Jakarta audit dijalankan (`YYYY-MM-DD`).
- `mtime` - waktu modifikasi berkas sesi (atau `tidak tersedia`).
- `Jumlah baris` - jumlah baris berkas sesi pada saat audit.

Deteksi perubahan: berkas dilewati hanya bila `mtime` **dan** `Jumlah baris` identik dengan ledger; jika salah satunya berbeda, berkas diproses ulang.

Contoh section append:

```markdown
## Audit 2026-11-15 (sesi 117)

### Ringkasan

- Berkas diproses: 2; dilewati: 115; berkas hilang: 0.

### Tabel Pola

| Masalah                                   | Sesi kemunculan    | Frekuensi | Klasifikasi | Rekomendasi                                                   |
| ----------------------------------------- | ------------------ | --------- | ----------- | ------------------------------------------------------------- |
| Tabrakan penomoran sesi paralel (sesi_81) | sesi 87, 89, 90, … | ≥3 sesi   | B           | Usulkan aturan eskalasi + keputusan pengguna di sesi terpisah |

### Daftar Berkas yang Diaudit

| Sesi    | Tanggal audit | mtime | Jumlah baris |
| ------- | ------------- | ----- | ------------ |
| sesi_81 | 2026-11-15    | …     | …            |
```

## Steps

1. **Muat konteks**: baca `AGENTS.md`, `MEMORI.md`, dan `memori/riwayat_perubahan.md`; muat skill `memori-check`.
2. **Inventarisasi**: baca `audit/riwayat_sesi.md` (ledger); kumpulkan daftar `memori/sesi/sesi_*.md`; peroleh mtime + jumlah baris tiap berkas.
3. **Tentukan diproses vs dilewati** (aturan 3-6).
4. **Ekstraksi sinyal** untuk berkas yang diproses (aturan 8); verifikasi manual.
5. **Agregasi frekuensi** (aturan 9): gabungkan catatan audit lama dari `audit/riwayat_sesi.md` dengan temuan baru.
6. **Klasifikasikan** setiap pola (A/B/C) dan susun **rekomendasi** untuk kategori B/C (aturan 10-11).
7. **Append section** ke `audit/riwayat_sesi.md` (format pada bagian Aturan) dan sampaikan laporan di sesi.
8. **Verifikasi akhir**: section baru terbaca; tidak ada berkas lain yang berubah.

## Larangan

- DILARANG mengubah berkas apa pun selain append ke `audit/riwayat_sesi.md`.
- DILARANG memperbaiki temuan audit secara otomatis.
- DILARANG mengubah berkas `memori/sesi/*.md` (termasuk penandaan di dalamnya), `MEMORI.md`, `memori/riwayat_perubahan.md`, indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), skill, command, aturan, `task.md`, atau kode sumber.
- DILARANG menghapus, mengompres, atau mengubah sesi yang sudah diaudit.
- DILARANG menganalisis ulang penuh berkas yang dilewati tanpa alasan (mis. keraguan mtime harus diselesaikan dengan membaca ulang untuk verifikasi, bukan analisis ulang).
- DILARANG memakai git log sebagai sumber data audit.
- DILARANG mengarang frekuensi/temuan; temuan tanpa bukti tidak boleh dilaporkan.
- DILARANG commit/push.

## Contoh Benar

```text
Ledger dibaca: 114 sesi tercatat. Inventarisasi: 117 berkas.
Dilewati (mtime + baris sama): 115 berkas.
Diproses: sesi_116 (baru), sesi_117 (baru).
Agregasi: pola "tabrakan penomoran sesi (sesi_81)" muncul di ≥20 sesi → Klasifikasi B → rekomendasi: keputusan pengguna di sesi terpisah.
Append section "## Audit 2026-11-15 (sesi 117)" ke audit/riwayat_sesi.md.
Laporan di sesi; tidak ada berkas lain yang berubah.
```

```text
Berkas tercatat di ledger tetapi hilang dari memori/sesi/ → temuan "berkas hilang: sesi_70" → klasifikasi C → rekomendasi investigasi di sesi terpisah.
```

## Contoh Salah

```text
Saya menemukan sesi_81 bermasalah, jadi langsung saya hapus dari memori/sesi/.
```

```text
Saya analisis ulang seluruh 117 sesi dari nol meski ledger mencatat 115 berkas sudah diaudit dan tidak berubah.
```

```text
Saya memakai git log untuk menghitung frekuensi pola.
```

```text
Saya perbaiki rujukan yatim di MEMORI.md dan skill memori-check saat audit.
```

```text
## Audit 2026-11-15 (sesi 117)
(menghapus section audit lama karena kepanjangan - section lama wajib dipertahankan)
```
