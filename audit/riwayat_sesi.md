# Audit Riwayat Sesi — Catatan Berjalan

Berkas berjalan hasil audit riwayat sesi (`memori/sesi/sesi_*.md`) untuk proyek ini. Diperbarui dengan pola **append per audit**: setiap audit menambahkan satu section baru bernomor berurutan (mis. `## Audit YYYY-MM-DD (sesi N)`); section lama dipertahankan sebagai jejak tren dan **tidak boleh dihapus atau ditimpa**.

- Command: `.kilo/commands/audit_riwayat_sesi.md`
- Skill: `.agents/skills/custom/audit-riwayat-sesi/SKILL.md`
- Sumber perencanaan: `hasil_diskusi/diskusi_10.md` (K-1 s.d. K-13)

## Konvensi dan Format

1. **Sumber data**: hanya berkas memori — `memori/sesi/sesi_*.md` (diproses), `MEMORI.md` dan `memori/riwayat_perubahan.md` (konteks agregasi yang selalu dibaca). Git log **tidak** digunakan.
2. **Penanda "sudah diaudit"** disimpan hanya di ledger (tabel `## Ledger` di dalam tiap section atau gabungan antar section) — bukan di dalam berkas sesi; berkas sesi tidak diubah oleh audit.
3. **Deteksi perubahan** (K-12): berkas dilewati penuh hanya bila `mtime` **dan** `Jumlah baris` sama dengan ledger; jika salah satunya berbeda, berkas diproses ulang.
4. **mtime dapat berubah tanpa konten berubah**; bila meragukan, baca ulang berkas untuk verifikasi sebelum melewatinya (lihat skill `audit-riwayat-sesi` R-6).
5. **Berkas hilang**: berkas yang tercatat di ledger tetapi tidak ada di folder dicatat sebagai temuan `berkas hilang` (bukan "sudah diaudit").
6. **Ambang "sering terulang"** (K-5): minimal 3 sesi berbeda; dihitung dari gabungan catatan audit lama + temuan baru.
7. **Klasifikasi**: (A) kesalahan insidental sekali jadi; (B) pola berulang (≥3 sesi) → kandidat perbaikan sistem; (C) kerusakan arsip/rujukan yatim.
8. **Tindak lanjut**: hanya rekomendasi tertulis; perbaikan dieksekusi lewat sesi terpisah atas persetujuan pengguna (K-7). Audit bersifat read-only selain append ke berkas ini (K-6).
9. **Berkas sesi yang sudah diaudit tetap diarsipkan permanen** (K-13); tidak dihapus, tidak dikompresi, tidak diubah.
10. Bila `mtime` tidak dapat diperoleh, isi `tidak tersedia` dan sampaikan sebagai keterbatasan; jangan mengarang nilai.

### Format Section (append per audit)

```markdown
## Audit YYYY-MM-DD (sesi N)

### Ringkasan
- Berkas diproses: <n>; dilewati: <n>; berkas hilang: <n>.

### Tabel Pola
| Masalah | Sesi kemunculan | Frekuensi | Klasifikasi | Rekomendasi |
|---------|-----------------|-----------|-------------|-------------|

### Daftar Berkas yang Diaudit
| Sesi | Tanggal audit | mtime | Jumlah baris |
|------|---------------|-------|--------------|
```

### Format Ledger

```markdown
| Sesi | Tanggal audit | mtime | Jumlah baris |
|------|---------------|-------|--------------|
| sesi_1 | YYYY-MM-DD | <mtime atau tidak tersedia> | <n> |
```

## Ledger

Belum ada berkas yang diaudit. Baris akan ditambahkan pada section audit pertama.
