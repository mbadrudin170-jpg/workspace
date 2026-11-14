# Sesi 103 — Riset Kompetitor (Analisa Batch 4)

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sun Nov 15 2026 05:20 WIB (sesi 103)
- Topik: Perintah pengguna command `riset_kompetitor.md` tanpa parameter — analisa maksimal 10 listing `Belum Dianalisa` pada `apk_kompetitor.md`, lalu perbarui `refrensi_apk.md`.

## Catatan Sesi

- `MEMORI.md` telah dibaca (header `Diperbarui: Sun Nov 15 2026 04:48 WIB (sesi 101)`); skill dimuat: `riset-kompetitor`, `memori-check`.
- Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron` menemukan `memori/sesi/sesi_102.md` (dibuat 05:16 WIB, 24 baris, berstatus `Belum Sinkron`, tampak sesi paralel yang baru berjalan/terhenti) dan `memori/sesi/sesi_81.md` (tabrakan penomoran sesi paralel dari sebelumnya). Keduanya **ambigu** → tidak ditandai, dilaporkan ke pengguna.
- Penomoran sesi: `sesi_102.md` sudah ada → sesi ini `sesi_103.md`.
- Target analisa (10 listing lintas store, dipilih karena paling relevan dengan `base_coc`: katalog base, tag strategi, tracker upgrade, offline):
  - Google Play Store (5): Cockit – Clash Base Layouts, Maps for Clash of Clans layout, COC BASES, Clash of Maps 2026:CoC Layouts, Cocbases (Clash of Clan Bases).
  - GitHub (2): coc-tracker (Clash Ledger), stats_for_clash_of_clans.
  - Apple App Store (3): Base Layouts: War & Farm Maps, Database for Clash of Clans™ (unofficial), Hall Editor: CoC Base Layouts.
- Listing `Clash Trackers` (GitHub) dan `BaseVault` (Apple) tidak diikutkan: sudah memiliki konten analisa batch 2 dan statusnya menunggu keputusan pengguna (skill aturan 30).
- Verifikasi: 5 halaman Google Play Store dan 2 repo GitHub `curl` HTTP 200; 3 Apple App Store via iTunes lookup `resultCount = 1` (id6804564319, id898757582, id6804436527).
- Temuan penting:
  - `Clash of Maps 2026:CoC Layouts` tampil di toko dengan judul "Maps for Clasher of Clans" (pengembang phuocly); package id sama.
  - `stats_for_clash_of_clans` tidak punya APK/rilis dan README-nya berupa spesifikasi desain.
  - `Database for Clash of Clans™` data 2015 (versi 1.2.1) — referensi struktur offline, bukan data terkini.
  - `Hall Editor` versi 1.0 dengan 1 rating.
- Hasil: `refrensi_apk.md` ditambah A35–A40, B8–B11, C26–C31, tabel katalog batch 4, baris prioritas gabungan 86–101, ringkasan temuan 17–20, serta pembaruan F dan G.
- `apk_kompetitor.md`: 10 status → `Sudah Dianalisa`. Hitung ulang katalog = 87 baris data (30 sudah, 57 belum; Play 32, GitHub 5, Apple 38, APKPure 7, Aptoide 5); angka 82/20/62 pada entri sesi 93 usang dan dikoreksi di `MEMORI.md`.
- Tidak ada kode Dart yang diubah; tidak ada commit/push.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `memori/sesi/sesi_103.md` | Dibuat | Berkas sesi ini |
| `apk_kompetitor.md` | Diubah | 10 baris `Belum Dianalisa` → `Sudah Dianalisa` (Cockit, Maps for Clash of Clans layout, COC BASES, Clash of Maps 2026:CoC Layouts, Cocbases, coc-tracker, stats_for_clash_of_clans, Base Layouts: War & Farm Maps, Database for Clash of Clans™, Hall Editor) |
| `refrensi_apk.md` | Diubah | Header/Informasi Riset (40 APK), ringkasan temuan 17–20, A35–A40, B8–B11, C26–C31, katalog batch 4, prioritas gabungan 86–101, F, G |
| `MEMORI.md` | Diubah | Header tanggal → sesi 103; bagian Riset Kompetitor: entri sesi 103, total 87 baris (30 sudah, 57 belum), sebaran per store, daftar listing dianalisa |
| `memori/riwayat_perubahan.md` | Diubah | Entri batch 4 sesi 103 |

## Sinkronisasi ke MEMORI.md

- Header `Diperbarui` diperbarui menjadi `Sun Nov 15 2026 05:20 WIB (sesi 103)`.
- Bagian `Riset Kompetitor` ditambah entri sesi 103 (batch 4, 10 listing, verifikasi, hasil, catatan inkonsistensi `Clash Trackers`/`BaseVault`, catch-up ambigu).
- Total listing dikoreksi: 87 baris data (30 `Sudah Dianalisa`, 57 `Belum Dianalisa`); sebaran Play 32 / GitHub 5 / Apple 38 / APKPure 7 / Aptoide 5; daftar listing dianalisa ditambah batch 4.
- `memori/riwayat_perubahan.md` ditambah entri batch 4.
- Tidak ada kode Dart yang diubah; perubahan hanya pada dokumentasi riset.
