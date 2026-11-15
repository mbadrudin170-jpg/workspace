# Sesi 128 — Riset Kompetitor (riset_kompetitor)

## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-15
- Topik: Command `riset_kompetitor` (parameter kosong) — analisa batch 8 atas 10 listing `Belum Dianalisa` dari `apk_kompetitor.md`, perbarui `apk_kompetitor.md` dan `refrensi_apk.md`.

## Catatan Sesi
- `MEMORI.md` telah dibaca (header: `Diperbarui: Sun Nov 15 2026 20:59 WIB (sesi 126)`).
- Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron$` pada `memori/sesi/` menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu — sudah dilaporkan berkali-kali sejak sesi 87), `sesi_122.md` (tindak lanjut `hasil_diskusi/diskusi_11.md`; berisi perubahan nyata tetapi sesi paralel/ambigua) dan `sesi_123.md` (audit command `kerjakan_prd.md`, Mode Diskusi; sesi paralel). Ketiganya **tidak disentuh** dan dilaporkan ke pengguna; tidak diputuskan sepihak. Tidak ada berkas yatim/kosong baru.
- Skill dimuat: `riset-kompetitor`, `memori-check`.
- Dokumen proyek dibaca: `README.md` (aplikasi sasaran `base_coc` — penyedia base/layout Clash of Clans), `AGENTS.md` (aturan proyek), `apk_kompetitor.md`, `refrensi_apk.md`.
- Pemilihan target: 10 listing `Belum Dianalisa` pertama sesuai urutan katalog (seluruhnya Google Play Store): `ClashRG Maps of Clash Of Clans`, `Clash Tracker`, `ClashBase: Bases & Armies`, `Maps Base For Clash of Clans`, `Clash Base Links – CoC Layouts`, `clash maps layout Base link`, `Village Tracker: CoC Upgrades`, `Clash Tracker: Upgrade Planner`, `CoC Base Layout Hub`, `WarBase Pro CoC Layouts`. Dua listing Play berikutnya (`Clash Companion`, `ClashGrid`) tetap `Belum Dianalisa` untuk batch berikutnya.
- Verifikasi tautan: 10 halaman Play Store HTTP 200 (`curl` dengan user agent Chrome); isi halaman dibaca via `webfetch` (deskripsi resmi + catatan rilis). Tidak ada pembacaan piksel tangkapan layar.
- Temuan yang diadopsi menjadi item baru: A56 saran base serupa (Maps Base For Clash of Clans), A57 impor level desa via OCR satu tangkapan layar (Village Tracker), A58 kalkulator ore equipment hero (Village Tracker); B19 pemeriksaan/penggantian tautan kedaluwarsa (ClashRG), B20 urutkan sisa upgrade termurah/tercepat (Upgrade Planner), B21 pelacakan tembok per level (Village Tracker), B22 persistensi tema/bahasa/filter (Maps Base For Clash of Clans); C41 layar statistik progres angka besar (Upgrade Planner + Village Tracker).
- Temuan yang tidak diadopsi sebagai item baru (dicatat sebagai penguat item lama): `ClashRG` copy army + glosarium + pencarian klan + "last seen time" (memperkuat A31/A40/A50; last seen butuh API), `Clash Tracker` daftar "coming soon" jujur (memperkuat B12), `Clash Base Links – CoC Layouts` indikator kualitas + rating per map (memperkuat A12/A36/C18/C27) dan attack planner (memperkuat A35), `clash maps layout Base link` data tidak terenkripsi (pola keamanan tidak ditiru).
- Status katalog `apk_kompetitor.md`: 10 baris diubah menjadi `Sudah Dianalisa`; hitung ulang = 70 sudah, 47 belum (total 117; Play 55/2, GitHub 7/3, Apple 8/30, APKPure 0/7, Aptoide 0/5).
- Inkonsistensi status lama tetap dibiarkan dan dilaporkan (menunggu keputusan pengguna): `Clash Trackers` (GitHub), `BaseVault` Apple, dan `Fanatic App for Clash of Clans` pada tabel utama bagian D `refrensi_apk.md`.
- Tidak ada kode Dart yang diubah; tidak ada commit/push.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `apk_kompetitor.md` | Diubah | 10 listing Google Play Store batch 8 menjadi `Sudah Dianalisa` |
| `refrensi_apk.md` | Diubah | Batch 8: ringkasan temuan 31–33, A56–A58, B19–B22, C41, katalog batch 8, prioritas gabungan baris 133–140, F, G sumber 61–70; jumlah referensi 70 → 80 APK |
| `MEMORI.md` | Diubah | Entri `Status Kerja` sesi 128 dan header `Diperbarui` |
| `memori/riwayat_perubahan.md` | Diubah | Entri kronologis sesi 128 |
| `memori/sesi/sesi_128.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md
- Header `Diperbarui` → `Sun Nov 15 2026 21:07 WIB (sesi 128)`.
- Bagian `Status Kerja`: entri baru sesi 128 (batch 8 riset kompetitor, 10 listing, item A56–A58/B19–B22/C41, hitungan 70 sudah/47 belum, catatan catch-up dan larangan commit) dengan provenance `(sesi 128)`.
- Entri lama sesi 125/126 dipertahankan; tidak ada kontradiksi baru. `MEMORI.md` 191 baris (di bawah batas ±200); konsolidasi belum diperlukan.
