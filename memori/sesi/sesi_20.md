# Sesi 20

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-14
- Topik: Pencarian APK kompetitor baru per store untuk `base_coc` (lanjutan katalog `apk_kompetitor.md`)

## Catatan Sesi

- Membaca `MEMORI.md`, `README.md`, `AGENTS.md`, `apk_kompetitor.md`, skill `riset-kompetitor`, dan skill `memori-check`.
- Catch-up sync: seluruh berkas `memori/sesi/*.md` berstatus `Sudah Sinkron`; tidak ada yang perlu disinkronkan.
- Aplikasi sasaran: `base_coc` — aplikasi Android Flutter penyedia base/layout Clash of Clans (katalog base, copy link layout, filter tipe base).
- Katalog awal: 10 listing Google Play Store, semuanya `Sudah Dianalisa`.
- Riset dilakukan store demi store; katalog diperbarui setelah tiap store selesai.
- Google Play Store: menemukan dan menambahkan 18 listing baru (`Belum Dianalisa`); seluruh halaman package diverifikasi HTTP 200 tanpa soft 404.
- F-Droid: tidak ditemukan aplikasi base layout Clash of Clans; tidak ada listing ditambahkan.
- GitHub: menambahkan `ClashPrime` (APK Android tersedia pada rilis GitHub v7.5.0).
- Apple App Store: menambahkan 32 listing hasil pencarian iTunes; seluruh ID diverifikasi melalui `itunes.apple.com/lookup` (`resultCount: 32`).
- Samsung Galaxy Store: tidak ditemukan aplikasi relevan; halaman detail untuk package Google Play yang diuji mengembalikan HTTP 404.
- Mi/GetApps dan Oppo App Market: tidak ditemukan halaman aplikasi base layout Clash of Clans yang spesifik; tidak ada listing ditambahkan.
- APKPure: menambahkan 3 listing yang tidak tersedia di Google Play; halaman APKPure mengembalikan HTTP 403 (anti-bot) dan diverifikasi melalui hasil webfetch/websearch.
- Uptodown: dua kandidat unik mengembalikan HTTP 410 berulang sesuai aturan flaky; tidak dijadikan listing karena tidak ada mirror resmi dengan package id sama.
- `refrensi_apk.md` tidak diubah karena sesi ini hanya menambah katalog.
- Tidak ada kode Dart yang diubah.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `memori/sesi/sesi_20.md` | Dibuat | Berkas sesi ini |
| `apk_kompetitor.md` | Diubah | Menambahkan 54 listing baru per store dengan status `Belum Dianalisa` (Google Play 18, GitHub 1, Apple App Store 32, APKPure 3) |
| `MEMORI.md` | Diubah | Memperbarui `Status Kerja` dan bagian `Riset Kompetitor` (total 64 listing; 10 sudah, 54 belum) |
| `memori/riwayat_perubahan.md` | Diubah | Menambahkan entri riwayat sesi ini |

## Sinkronisasi ke MEMORI.md

- Memperbarui bagian `Status Kerja` dengan ringkasan katalog `apk_kompetitor.md` terbaru.
- Memperbarui bagian `Riset Kompetitor`: status sesi 20, total 64 listing (10 `Sudah Dianalisa`, 54 `Belum Dianalisa`), sebaran per store, dan daftar store tanpa listing terverifikasi.
