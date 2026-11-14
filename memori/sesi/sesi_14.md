# Sesi 14 — Analisa 10 APK Kompetitor dan Pembaruan `refrensi_apk.md`

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-14 (WIB)
- Topik: Analisa fitur, UI, UX, dan layout 10 APK kompetitor berstatus `Belum Dianalisa`; pembuatan `refrensi_apk.md`; generalisasi skill `riset-kompetitor` agar portabel lintas proyek.

## Catatan Sesi

- Membaca `MEMORI.md`, `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan command `riset_kompetitor.md`; memuat skill `riset-kompetitor` dan `memori-check`.
- Catch-up sync: `sesi_1.md` s.d. `sesi_12.md` berstatus `Sudah Sinkron`. `sesi_13.md` berstatus `Belum Sinkron` dan merupakan sesi paralel (instalasi `riverpod_lint`) yang masih berjalan; tidak ditandai dan tidak diubah.
- Catatan koordinasi: percobaan awal membuat berkas sesi sempat memakai nomor 12 yang ternyata dipakai sesi paralel; berkas tersebut sudah dipulihkan oleh sesi pemiliknya. Sesi ini memakai nomor tertinggi saat ini (13) + 1 = 14.
- `apk_serupa.md` tidak ditemukan di root proyek; lingkup mengikuti `apk_kompetitor.md` sesuai poin 7 perintah pengguna.
- `refrensi_apk.md` belum ada di root proyek; dibuat baru.
- 10 APK yang dianalisa (seluruhnya Google Play Store, seluruh tautan HTTP 200):
  1. CPU-Z
  2. AIDA64
  3. Device Info HW
  4. DevCheck Device & System Info
  5. Device Info: System & CPU Info
  6. Test Your Android
  7. Display Tester
  8. Battery Guru: Battery Health
  9. AccuBattery
  10. Sensors Toolbox
- Metode: verifikasi tautan dengan `curl`; membaca deskripsi halaman Play Store; mengunduh dan membaca tangkapan layar resmi untuk mengidentifikasi pola UI/UX/layout.
- Batasan: detail implementasi internal Spektra tidak tersedia di workspace ini; rekomendasi disusun sebagai pembanding, bukan klaim kondisi kode. Pola UI dapat berubah antarversi/perangkat.
- Pengguna menanyakan asal konteks Spektra. Penelusuran menunjukkan skill `riset-kompetitor` v1.5.0 memuat `sumber-terakhir` yang menyebut perubahan konteks dari "berhenti merokok" ke Spektra; `diskusi_3.md` yang dirujuk tidak ada di repo.
- Pengguna meminta skill `riset-kompetitor` bersifat global, bukan spesifik satu proyek. Skill ditulis ulang menjadi v1.6.0: konteks aplikasi sasaran dibaca dari `README.md`/`AGENTS.md`/PRD, kategori relevansi tidak di-hardcode, dan ditambahkan aturan portabilitas.
- `SKILLS_INDEX.md` diperbarui: trigger menjadi "saat membuat atau memperbarui katalog aplikasi kompetitor proyek" dan status pembaruan `Sat Nov 14 2026 06:50 WIB`.
- Tidak ada kode Dart yang diubah dan tidak ada commit yang dibuat (menunggu perintah pengguna).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `refrensi_apk.md` | Dibuat | Laporan referensi fitur, optimasi, UI/UX, katalog, prioritas, verifikasi, dan sumber. |
| `apk_kompetitor.md` | Diubah | Sepuluh baris APK yang dianalisa diubah menjadi `Sudah Dianalisa`. |
| `MEMORI.md` | Diubah | Memperbarui status riset kompetitor dan jumlah listing yang sudah dianalisa. |
| `memori/riwayat_perubahan.md` | Diubah | Entri riwayat analisa 10 APK, pembuatan `refrensi_apk.md`, dan generalisasi skill. |
| `.agents/skills/custom/riset-kompetitor/SKILL.md` | Diubah | Skill digeneralisasi ke v1.6.0; konteks proyek dibaca dari dokumen proyek, bukan di-hardcode. |
| `SKILLS_INDEX.md` | Diubah | Trigger dan status pembaruan skill `riset-kompetitor` diperbarui. |
| `memori/sesi/sesi_14.md` | Dibuat | Berkas sesi aktif. |

## Sinkronisasi ke MEMORI.md

- `Status Kerja`: menambahkan catatan `refrensi_apk.md` hasil analisa 10 APK.
- `Riset Kompetitor`: memperbarui jumlah listing (10 sudah dianalisa, 149 belum) dan menyebut `refrensi_apk.md`.
- `Konvensi & Sumber Kebenaran`: menambahkan catatan skill `riset-kompetitor` v1.6.0 bersifat portabel lintas proyek.
- `memori/riwayat_perubahan.md`: entri analisa 10 APK dan entri generalisasi skill.
