# Hasil Diskusi 11 — Pembaruan Command kerjakan_hasil_diskusi: Verifikasi Implementasi Aktual Sebelum Eksekusi

## Status
- Dokumen: Final
- Implementasi: Belum Diimplementasikan
- Tanggal: 2026-11-15
- Topik: Penambahan langkah verifikasi implementasi aktual (pencarian kode sumber) pada command `.kilo/commands/kerjakan_hasil_diskusi.md` sebelum mengimplementasikan hasil diskusi, walaupun status PRD/diskusi masih `Belum Diimplementasikan`.

## Latar Belakang

- Perintah pengguna (sesi 118, 2026-11-15): "agar sebelum mengimplementasikan hasil diskusi cek dahulu apakah sudah diimplementasikan, walaupun status prd masih belum di implementasikan".
- Command `.kilo/commands/kerjakan_hasil_diskusi.md` saat ini hanya memvalidasi **status dokumen** (berkas diskusi wajib `Final`) sebelum memetakan dan mengeksekusi tindak lanjut (langkah 3–6). Tidak ada verifikasi terhadap **kondisi aktual kode**.
- Status dokumen dan kondisi implementasi dapat melenceng: entri MEMORI.md lama menyebut `diskusi_5`/`diskusi_6` "sudah diimplementasikan" padahal isi berkas berbeda (dikoreksi sesi 113); PRD dihapus setelah implementasi menyeluruh (preseden A2–A7); section `refrensi_apk.md` dihapus setelah implementasi menyeluruh.
- Risiko bila verifikasi absen: command menulis/mengeksekusi ulang tindak lanjut yang sebenarnya sudah diimplementasikan, atau menimpa pekerjaan yang sudah ada.

## Poin Diskusi

### 1. Sumber bukti verifikasi
- Tanya: bukti apa saja yang dipakai command untuk memverifikasi bahwa hasil diskusi sudah diimplementasikan?
- Kesimpulan: **pencarian kode sumber saja** (tool `glob`/`grep` di `lib/` submodule yang terlibat, mis. `base_coc`/`share_global_saya`). Berkas `prd/`, section `refrensi_apk.md`, `MEMORI.md`, dan `git log` submodule **tidak** dipakai sebagai bukti (menghindari klaim tanpa bukti kode; dokumen dapat usang).

### 2. Posisi langkah verifikasi dalam alur command
- Tanya: di tahap mana langkah verifikasi ditempatkan?
- Kesimpulan: **setelah validasi status Final (langkah 3–4) dan sebelum pemetaan tindak lanjut (langkah 6)**; menjadi langkah baru (mis. langkah 4a/5) berjudul "Verifikasi implementasi aktual".

### 3. Granul verifikasi
- Tanya: verifikasi dilakukan per item atau keseluruhan diskusi?
- Kesimpulan: **per item tindak lanjut** (per Keputusan/Tindak Lanjut yang konkret); hasil per item: `sudah` / `sebagian` / `belum`.

### 4. Kata kunci pencarian
- Tanya: apa dasar kata kunci pencarian kode sumber?
- Kesimpulan: **diekstrak dari konten berkas diskusi dan PRD terkait** — nama class/fitur/berkas yang disebut dipakai sebagai pola `glob`/`grep`; tidak ada daftar kata kunci tetap (hardcode).

### 5. Hasil verifikasi: seluruh item sudah diimplementasikan
- Tanya: apa tindakan command bila seluruh item tindak lanjut ternyata sudah diimplementasikan?
- Kesimpulan: **STOP + lapor** — command berhenti, tidak menulis/mengeksekusi apa pun; usul pembaruan status dokumen hanya atas konfirmasi eksplisit pengguna.

### 6. Hasil verifikasi: implementasi sebagian
- Tanya: apa tindakan command bila sebagian item sudah ada dan sebagian belum?
- Kesimpulan: **lapor rincian yang sudah/belum; command hanya mengerjakan sisa yang belum**, atas konfirmasi pengguna.

### 7. Status dokumen tidak sesuai kondisi aktual
- Tanya: apa yang dilakukan command bila dokumen menyatakan `Belum Diimplementasikan` padahal kodenya ditemukan ada?
- Kesimpulan: **lapor saja** — command tidak mengubah berkas diskusi/PRD (status, `## Pertanyaan Terbuka`, dsb.) tanpa konfirmasi eksplisit pengguna.

### 8. Cakupan pembaruan command
- Tanya: selain penambahan langkah, apa lagi yang diubah?
- Kesimpulan: frontmatter `description` diperbarui mencakup verifikasi implementasi aktual; Kriteria STOP ditambah kondisi "seluruh item tindak lanjut sudah diimplementasikan seluruhnya → STOP + lapor"; rujukan skill relevan (mis. `pembuatan-command-kilo`) dipertahankan/dipatuhi; tidak ada perubahan lain di luar tujuan diskusi.

## Keputusan

- K-1: Command `kerjakan_hasil_diskusi.md` ditambah langkah baru "Verifikasi implementasi aktual" setelah validasi status `Final` (langkah 3–4) dan sebelum pemetaan tindak lanjut (langkah 6).
- K-2: Sumber bukti verifikasi tunggal adalah **pencarian kode sumber** (tool `glob`/`grep`) di `lib/` submodule yang terlibat; `prd/`, `refrensi_apk.md`, `MEMORI.md`, dan `git log` **tidak** dipakai sebagai bukti.
- K-3: Verifikasi dilakukan **per item tindak lanjut** (Keputusan/Tindak Lanjut yang konkret), bukan keseluruhan diskusi.
- K-4: Kata kunci pencarian **diekstrak dari konteks berkas diskusi dan PRD terkait** (nama class/fitur/berkas yang disebut); tidak ada daftar kata kunci tetap.
- K-5: Bila per item ditemukan **sudah diimplementasikan seluruhnya** → **STOP + lapor**; tidak menulis/mengeksekusi apa pun; pembaruan status dokumen hanya atas konfirmasi eksplisit pengguna.
- K-6: Bila per item ditemukan **sebagian** → **lapor rincian yang sudah/belum; kerjakan hanya sisa yang belum**, atas konfirmasi pengguna.
- K-7: Bila **status dokumen tidak sesuai kondisi aktual** (dokumen `Belum Diimplementasikan` padahal kodenya ada) → **lapor saja**; command tidak mengubah berkas apa pun tanpa konfirmasi eksplisit pengguna.
- K-8: Frontmatter `description` command diperbarui mencakup verifikasi implementasi aktual; Kriteria STOP ditambah kondisi "seluruh item tindak lanjut sudah diimplementasikan seluruhnya → STOP + lapor"; penomoran langkah disesuaikan.
- K-9: Command diperbarui dengan mematuhi skill `pembuatan-command-kilo` (rujukan skill relevan, tool bawaan lebih dahulu, konfirmasi sebelum menulis); mode diskusi ini **tidak** mengubah command — implementasi dilakukan pada tindak lanjut terpisah atas persetujuan pengguna.

## Rekomendasi

- R-1: Susun draf perubahan command (teks langkah baru + penomoran ulang + `description` + Kriteria STOP) dan konfirmasikan ke pengguna sebelum menulis berkas, sesuai skill `pembuatan-command-kilo` (konfirmasi sebelum menulis).
- R-2: Setelah command ditulis, verifikasi dengan membaca ulang berkas (frontmatter valid, rujukan skill tercantum, tidak ada rujukan usang, tool bawaan dipakai) sesuai Steps 10 skill `pembuatan-command-kilo`; jangan commit/push tanpa perintah eksplisit pengguna.
- R-3: Saat command yang diperbarui dijalankan, tampilkan hasil verifikasi per item (tabel: item | kata kunci | ditemukan/tidak | status) sebelum menyusun draf tindak lanjut.

## Tindak Lanjut

| No | Tindakan | File Terdampak | Status |
|----|----------|----------------|--------|
| 1 | Perbarui command `kerjakan_hasil_diskusi.md`: tambah langkah "Verifikasi implementasi aktual" setelah validasi status `Final` (K-1), penomoran ulang, perbarui `description` dan Kriteria STOP (K-8), sumber bukti kode sumber saja (K-2), granul per item (K-3), kata kunci dari konten diskusi/PRD (K-4), STOP+lapor bila seluruh item sudah diimplementasikan (K-5), lapor+kerjakan sisa bila sebagian (K-6), lapor saja bila dokumen tidak sesuai kondisi aktual (K-7) | `.kilo/commands/kerjakan_hasil_diskusi.md` | belum |
| 2 | Konfirmasi pengguna sebelum menulis command; jalankan verifikasi sesuai skill `pembuatan-command-kilo` (R-1, R-2) | `.kilo/commands/kerjakan_hasil_diskusi.md` | belum |
| 3 | Uji command yang diperbarui dengan `/kerjakan_hasil_diskusi` pada diskusi yang sudah diimplementasikan (bila ada kandidat) (R-3) | — | belum |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `hasil_diskusi/diskusi_11.md` | Dibuat | Berkas hasil diskusi ini |
| `.kilo/commands/kerjakan_hasil_diskusi.md` | Belum diubah | Target pembaruan (lihat Tindak Lanjut) |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan

| Tanggal | Perubahan |
|---------|-----------|
| 2026-11-15 | Berkas dibuat dari hasil diskusi (sesi 118); status `Final`. |
