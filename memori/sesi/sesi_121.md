# Sesi 121 — Riset Kompetitor (Analisa 10 Listing Belum Dianalisa)

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 19:01 WIB (sesi 121)
- Topik: Analisa 10 listing kompetitor `Belum Dianalisa` untuk `base_coc`; pembaruan `apk_kompetitor.md` dan `refrensi_apk.md`.

## Catatan Sesi

- Membaca `MEMORI.md`, `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan memuat skill `riset-kompetitor` serta `memori-check`.
- Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron$` pada `memori/sesi/` menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu — sudah dilaporkan berkali-kali sejak sesi 87), `sesi_117.md` dan `sesi_118.md` (sesi paralel aktif; `git status` mencatat `M memori/sesi/sesi_118.md`). Ketiganya **tidak disentuh**, dilaporkan lagi ke pengguna; tidak diputuskan sepihak.
- Aplikasi sasaran: `base_coc` — aplikasi Android Flutter penyedia base/layout Clash of Clans.
- Parameter command kosong → maksimal 10 listing `Belum Dianalisa` sesuai urutan katalog (Google Play Store lebih dahulu menurut urutan default skill `riset-kompetitor`).
- 10 sasaran terpilih (baris katalog): Maps of Clash of Clans 2026 (26), Clash of Maps - Base, Layouts (29), Map guide for COC(base layout) (30), ClashLy for Clash of Clans (31), Clashtasia - Base Layout link (32), COC Base Layouts - TH & BH (34), COC Base Link Finder (37), ClashCodes: Clash Base Layouts (39), COC Layout (40), BaseVault for Clash of Clans Android (41).
- Verifikasi link (curl, Chrome UA): seluruh 10 URL `play.google.com` mengembalikan HTTP 200 sebelum analisa dijalankan. Halaman dibaca via `webfetch` (deskripsi resmi + ulasan). Tidak ada pembacaan piksel tangkapan layar.
- Analisa menghasilkan (batch 6): kecocokan `BaseVault` Android ↔ Apple id6774403569 (batch 2) dicatat agar tidak menduplikasi A26/A27; item baru: A51 (unduh gambar base ke galeri), A52 (random base dengan filter TH/BH), A53 (kalkulator rampasan); B16 (pratinjau base utuh — penguat A3 yang sudah diimplementasikan); C38 (sorter Baru/Populer/Pilihan), C39 (dynamic color). Penguatan temuan: kompetitor batch 6 sudah mendukung Town Hall 19 (ClashLy, BaseVault); iklan tetap keluhan utama; listing usang teridentifikasi (Map guide 2024, COC Base Link Finder 2021, COC Layout 2023).
- `apk_kompetitor.md`: 10 baris status diubah menjadi `Sudah Dianalisa`; hitung ulang = 50 sudah, 67 belum (Play 35/22, GitHub 7/3, Apple 8/30, APKPure 0/7, Aptoide 0/5).
- `refrensi_apk.md`: diperbarui (bukan ditulis ulang) — header (50 → 60 APK), Informasi Riset (tanggal, lingkup, alasan pemilihan batch 6, metode, tingkat verifikasi 60/60), Ringkasan Temuan Terbesar +24–26, A batch 6 (A51–A53), B batch 6 (B16), C batch 6 (C38–C39), D (flip 1 baris `Maps of Clash of Clans 2026` → `Sudah Dianalisa` + subseksi katalog batch 6), E (baris 122–127), F (batch 6 verifikasi/keterbatasan + inkonsistensi `Fanatic App for Clash of Clans` pada tabel utama D masih `Belum Dianalisa` — menunggu keputusan pengguna), G (sumber 41–50).
- Inkonsistensi yang tersisa (dicatat, tidak diubah): `Fanatic App for Clash of Clans` pada tabel utama bagian D (`refrensi_apk.md`) masih bertuliskan `Belum Dianalisa` padahal batch 5 sudah menganalisanya; `Clash Trackers` (GitHub) dan `BaseVault` (Apple id6774403569) di `apk_kompetitor.md` tetap `Belum Dianalisa` meski memiliki konten analisa batch 2 (menunggu keputusan pengguna, skill aturan 30); keduanya di luar 10 sasaran batch 6.
- Tidak ada kode Dart yang diubah; tidak ada berkas di luar `apk_kompetitor.md`, `refrensi_apk.md`, `MEMORI.md`, `memori/riwayat_perubahan.md`, dan `memori/sesi/sesi_121.md` yang disentuh. Tidak ada commit/push.
- Catatan ukuran: `MEMORI.md` berkembang menjadi ±188 baris (menjadi perhatian audit sesi 117 — mendekati batas ±200 aturan 20 `memori-check`); konsolidasi belum dilakukan pada sesi ini (ada sesi paralel aktif yang ikut menulis `MEMORI.md`).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `memori/sesi/sesi_121.md` | Dibuat | Berkas sesi ini |
| `apk_kompetitor.md` | Diubah | 10 baris status `Belum Dianalisa` → `Sudah Dianalisa` (batch 6) |
| `refrensi_apk.md` | Diubah | Penambahan batch 6: header 60 APK, Informasi Riset, Ringkasan Temuan +24–26, A51–A53, B16, C38–C39, katalog batch 6, prioritas gabungan 122–127, F, G |
| `MEMORI.md` | Diubah | Entri Status Kerja sesi 121; bagian Riset Kompetitor (batch 6 + hitung ulang 50/67); header `Diperbarui` |
| `memori/riwayat_perubahan.md` | Diubah | Entri sesi 121 ditambahkan di atas |

## Sinkronisasi ke MEMORI.md

- Header `MEMORI.md`: `Diperbarui: Sun Nov 15 2026 19:15 WIB (sesi 121)`.
- `## Status Kerja`: entri baru sesi 121 di atas daftar (Command `riset_kompetitor`, parameter kosong, batch 6).
- `## Riset Kompetitor`: entri batch 6 baru di atas entri batch 5; total = 117 baris data, 50 `Sudah Dianalisa` / 67 `Belum Dianalisa`; sebaran Play 35/22, GitHub 7/3, Apple 8/30, APKPure 7 belum, Aptoide 5 belum; daftar aplikasi yang sudah dianalisa bertambah 10 (sesi 121, batch 6).
- `memori/riwayat_perubahan.md`: entri sesi 121 ditambahkan.
- Provenance: seluruh klaim baru merujuk sesi 121. Kontradiksi: tidak ada; entri sesi 107 dibiarkan sebagai arsip (mencatat hitung ulang saat itu; angka kini diperbarui di entri sesi 121 dan bagian Total). Entri volatil (hitung ulang status) diberi tanggal eksplisit. Tidak ada entri `dipatok pengguna` yang disentuh.
