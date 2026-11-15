# Sesi 125 — Riset Kompetitor (Analisa 10 Listing Belum Dianalisa)

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 19:30 WIB (sesi 125)
- Topik: Command `riset_kompetitor` (parameter kosong) — analisa maksimal 10 listing `Belum Dianalisa` sesuai urutan katalog, perbarui `apk_kompetitor.md` dan `refrensi_apk.md`.

## Catatan Sesi

- Catch-up sync awal sesi: pemindaian `Status Sinkron: Belum Sinkron` pada `memori/sesi/` menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu — sudah dilaporkan berkali-kali sejak sesi 87) dan `sesi_122.md`, `sesi_123.md`, `sesi_124.md` (sesi paralel aktif — topik kerjakan_hasil_diskusi diskusi 11, Mode Diskusi, kerjakan_prd A8). Semuanya **tidak disentuh**, dilaporkan lagi ke pengguna; tidak diputuskan sepihak. Tidak ada berkas yatim/kosong baru yang dapat disinkronkan sendiri.
- Dokumen proyek dibaca: `README.md` (aplikasi sasaran = `base_coc`, penyedia base/layout Clash of Clans), `apk_kompetitor.md` (238 baris), `refrensi_apk.md` (1277 baris).
- Hitung listing `Belum Dianalisa` = 67 baris data: Google Play 22, GitHub 3, Apple App Store 30, APKPure 7, Aptoide 5 (konsisten dengan catatan sesi 121).
- Target 10 listing sesuai urutan katalog (seluruhnya Google Play Store):
  1. Clan Capital Bases for COC (`co.median.android.yadard`)
  2. Blueprint CoC - Clash of Clans (`com.blueprintcoc.com`)
  3. ClashVault – CoC Base Layouts (`com.clashvault.app`)
  4. COC Base Pro (`com.cocbase.appbase`)
  5. House of Clashers: Clash Guide (`com.frankeaplicativos.houseofclashers`)
  6. CCTimer: CoC Upgrade Timer (`com.jaehw.coctimer`)
  7. Keepwatch for Clash of Clans (`com.keepwatch.dev`)
  8. Clash layout - COC base design (`com.mycompany.clashlayout`)
  9. Base of Clash of Clans 2025 (`com.rabbit.baselayouts`)
  10. Pro Clash of Maps Base Layouts (`com.sb.promapsofcoc2020`)
- Verifikasi: 10 halaman Google Play Store HTTP 200 (curl, user agent Chrome) dan dibaca dengan `webfetch` (deskripsi resmi + ulasan). Tidak ada pembacaan piksel tangkapan layar.
- Temuan per listing:
  - `Clan Capital Bases for COC`: 100+ layout Clan Capital per distrik (Capital Peak, Barbarian Camp, Balloon Lagoon) level 1–10, copy satu ketuk, favorit, perang/CWL real-time, bookmark klan (auto-refresh 5 menit), fitur "Report Expired Bases" (v3.1.0, 2026-02); 10K+ unduhan; sebagian besar fitur perang butuh API (tidak diadopsi).
  - `Blueprint CoC`: toko pack base pro berbayar + coaching (Shopping; diperbarui 2023-09, usang); bukan galeri gratis — dicatat, tidak dijadikan dasar rekomendasi.
  - `ClashVault`: TH10–TH18, copy link, komunitas upload/"my uploads", profil tertaut (TH, trophies, clan, heroes via CoC API — tidak diadopsi), 7 bahasa, image caching "offline reopens are instant" (diadopsi → B18); diperbarui 2026-04 (v2 rebuilt); 500+ unduhan.
  - `COC Base Pro`: TH2–TH18 + Builder Hall + Clan Capital, copy link, preview HD, rating/views komunitas per base; konten web-based; diperbarui 2026-09; 5K+ unduhan.
  - `House of Clashers`: guide 1000+ halaman + 1 miliar statistik, copy link TH/BH, clash tracker, clan wars, gem guide; konten berhenti di TH16 (2024-04, usang); 5M+ unduhan, 4,4★ (49,8K ulasan); iklan + IAP; referensi pola untuk A8/A40 saja.
  - `CCTimer`: timer upgrade & builder tracker multi-akun satu layar (terurut sisa waktu), papan status builder/lab/pet (spot idle), pengingat lebih awal (set menit), widget hitung mundur per detik, Data Export paste tanpa login, 20 bahasa, tanpa iklan; diperbarui 2026-11; 1K+ unduhan.
  - `Keepwatch (Android)`: impor Data Export tanpa login; sisa upgrade semua item per level TH; progres per kategori HV + Builder Base; agregat "jarak ke max"; Gold Pass/event discounts/helpers; timeline day-by-day; sync desa & perangkat (akun opsional via email code — tidak diadopsi); pembaruan data game otomatis; 22 bahasa; diperbarui 2026-11; 100+ unduhan; counterpart Android dari Apple id6828926176 (batch 3).
  - `Clash layout - COC base design`: generik (TH4–TH16, pembaruan mingguan, smart filters); tidak ada pola baru.
  - `Base of Clash of Clans 2025`: Builder Base 2.0 (BH4–BH10), smart search per tag, base lucu, berbagi komunitas; TH4–TH17; diperbarui 2026-01; 1K+ unduhan; Builder Base 2.0 sudah tercakup A9.
  - `Pro Clash of Maps Base Layouts`: TH18 + layout World Finals; one-tap copy; ulasan meminta sub-kategori anti-E-Drag dan in-app replay; 1M+ unduhan, 4,4★ (12,8K ulasan); diperbarui 2026-08.
- Item baru di `refrensi_apk.md`: A54 (filter distrik/level Clan Capital), A55 (tag kontra-pertahanan anti-E-Drag/Yeti/Lava-Loon — memperluas TagStrategi A6), B17 (agregat "jarak ke max" HV+BB), B18 (cache gambar reopen offline), C40 (papan status builder/lab/pet lintas desa); ringkasan temuan 27–30; katalog batch 7; prioritas gabungan baris 128–132; F (keterbatasan: verifikasi terbatas pada deskripsi toko; Blueprint CoC tidak diadopsi; Keepwatch Android hanya B17 baru; angka katalog 60/117 sudah, 57 belum); G sumber 51–60; jumlah referensi 60 → 70 APK.
- Item yang sengaja tidak diduplikasi (sudah ada): laporan tautan kedaluwarsa (A37), rating/views komunitas (A12/A36), war tracking real-time (A21), unggah base komunitas (A13), Guide/tips offline (A8/A40), Builder Base 2.0 (A9), base lucu (A11), widget/upgrade reminder (A10/A18/A19), diskon Gold Pass/event/helper (B6/B8), perencanaan builder + timeline (A17), sorter New/Hot/Top (C38), dynamic color (C39), anti-2/3-star tag (A6).
- `apk_kompetitor.md`: 10 status diubah `Belum Dianalisa` → `Sudah Dianalisa`; hitung ulang = 60 sudah, 57 belum (Play 45/12, GitHub 7/3, Apple 8/30, APKPure 0/7, Aptoide 0/5).
- Inkonsistensi status lama (`Clash Trackers` GitHub; `BaseVault` Apple id6774403569; `Fanatic App for Clash of Clans` pada tabel utama D refrensi) tetap menunggu keputusan pengguna — tidak diubah pada sesi ini (di luar 10 sasaran).
- Tidak ada kode Dart yang diubah; tidak ada commit/push; `apk_kompetitor.md` dan `refrensi_apk.md` diperbarui; `memori/riwayat_perubahan.md` dan `MEMORI.md` diperbarui; berkas sesi paralel (`sesi_122`/`sesi_123`/`sesi_124`/`sesi_117`) tidak disentuh.
- Catatan `prd/prd_panduan_singkat_base.md` terhapus dari working tree oleh sesi paralel 124 — di luar sesi ini; tidak ditindaklanjuti.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `memori/sesi/sesi_125.md` | Dibuat | Berkas sesi ini |
| `apk_kompetitor.md` | Diubah | 10 status `Belum Dianalisa` → `Sudah Dianalisa` (batch 7) |
| `refrensi_apk.md` | Diubah | Batch 7: ringkasan temuan 27–30, A54–A55, B17–B18, C40, katalog batch 7, prioritas gabungan 128–132, F, G 51–60 |
| `memori/riwayat_perubahan.md` | Diubah | Entri baru (sesi 125) di atas |
| `MEMORI.md` | Diubah | Header Diperbarui → sesi 125; Status Kerja: entri sesi 125 ditambahkan di atas |

## Sinkronisasi ke MEMORI.md

`MEMORI.md` diperbarui pada akhir sesi 125: header `Diperbarui` diset ke sesi 125, entri `Status Kerja` (ringkasan batch 7) ditambahkan di atas entri sesi 124. `memori/riwayat_perubahan.md` mendapat entri baru (sesi 125) di atas. Tidak ada kontradiksi yang ditemukan dengan isi `MEMORI.md` (entri sesi 125 konsisten dengan entri sesi 121). Tidak ada entri volatil yang usang pada bagian yang disentuh. Tidak ada kode Dart yang diubah; tidak ada commit/push.
