# Sesi 38

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sat Nov 14 2026 16:02:12 WIB
- Topik: Riset APK kompetitor aplikasi sasaran `base_coc` (satu run mencakup semua store)

## Catatan Sesi

- Awal sesi: membaca `MEMORI.md`, `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan skill `riset-kompetitor` (v1.6.1).
- Catch-up sync: `grep "^- Status Sinkron:" memori/sesi/*.md` memastikan tidak ada berkas sesi berstatus `Belum Sinkron` milik sesi sebelumnya; tidak ada tindakan catch-up yang diperlukan.
- Acuan aplikasi sasaran (dari `README.md` root, `MEMORI.md`, dan `base_coc/README.md`): `base_coc` — aplikasi Android (Flutter) penyedia base/layout Clash of Clans; fitur inti: galeri base/layout dengan copy link langsung ke game, kategori per tipe/Town Hall, dsb.
- Perintah: `cari_apk_kompetitor.md` dijalankan penuh (satu run mencakup semua store), urutan: Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya.
- Berkas `apk_kompetitor.md` akan diperbarui per store; listing baru wajib `Status Analisa = Belum Dianalisa`.
- Google Play Store: 2 listing baru ditambahkan (`BaseVault for Clash of Clans` id `com.apphubnow.basedrop`, `Cockit – Clash Base Layouts` id `com.heyisoft.cockit`); keduanya diverifikasi HTTP 200. Katalog Play Store kini 30 listing. `com.phuocly.coc.layouts.link` ternyata sama dengan listing `Clash of Maps 2026:CoC Layouts` yang sudah ada → tidak ditambah.
- Store lainnya (sesi 38):
  - Aptoide: 5 listing baru ditambahkan (`Clash Base Layout | Quick Copy` clash-maps-autocopy, `Cocbases` cocbases, `Clash of Maps - Base, Layouts` clash-of-maps, `Pro Clash of Maps Base Layouts` pro-maps-of-coc-2020, `Maps of Clash of Clans 2026` moonstudios-coc-maps); curl 403 anti-bot, verifikasi via hasil pencarian yang memuat metadata halaman resmi.
  - APKPure: 4 listing baru ditambahkan (`Hall Base Layouts for Clash` com.hall.editor, `COC Base Layouts Clash of Maps` com.sb.newclashmaps2020, `Clash of Maps - Base, Layouts` com.akstudio.clashofmaps, `Maps of Clash of Clans 2026` com.moonstudio.mapcoc); 403 anti-bot, verifikasi via hasil pencarian. Nama/package id duplikat lintas store dicolok sesuai aturan duplikat lintas store yang diperbolehkan.
  - Uptodown: HTTP 410 berulang → nihil temuan.
  - IzzyOnDroid: index repo terunduh (200, ~4,6 MB), tidak ada paket `clash` relevan → nihil temuan.
  - Amazon Appstore: hasil pencarian campuran tanpa aplikasi base/layout spesifik → nihil temuan.
  - SlideME: HTTP 403 anti-bot, tanpa halaman aplikasi spesifik → nihil temuan.
  - Huawei AppGallery: HTTP 503 → nihil temuan.
  - Tencent MyApp: hanya halaman game resmi CoC, tidak ada aplikasi base/layout spesifik → nihil temuan.
- Samsung Galaxy Store: `galaxy.store` tidak dapat diakses (curl `000`/`Transport error`); tidak ada halaman aplikasi spesifik yang dapat diverifikasi → nihil temuan, dicatat di `apk_kompetitor.md`.
- Mi/GetApps: halaman pencarian mengembalikan HTTP 200 tetapi konten dirender JavaScript (tanpa id aplikasi spesifik di HTML) → tidak ada link yang dapat diverifikasi → nihil temuan, dicatat di `apk_kompetitor.md`.
- Oppo App Market: pencarian web tidak menemukan halaman aplikasi spesifik; hanya halaman informasi platform developer → nihil temuan, dicatat di `apk_kompetitor.md`.
- Apple App Store: 6 listing baru ditambahkan (terverifikasi via `https://itunes.apple.com/lookup?id=<id>`, seluruh `resultCount > 0`): `COC Baselinks` (6790808297), `Cockit – Clash Base Layouts` (6760241444), `Clash of Helper` (6636552878), `Keepwatch for Clash of Clans` (6828926176), `Database for Clash of Clans™ (unofficial)` (898757582), `House of Clashers: Clash Guide` (653987498). Ditolak: `Clash Mi` (6744321968, klien proxy mirip Clash Meta), `Stats & Tools for Clash` (1434767560, konten Clash Royale), `CastleLink2` (6743709203, remote ESC), `BS Companion` (1533473030, base station Bluetooth), `Gems Calc` (1441882558, kalkulator gem).
- F-Droid: penc "clash"/"clash of clans" tidak mengembalikan aplikasi mobile relevan (klien VPN/proxy Clash tidak relevan). API `/api/v1/search` dan halaman `/search/?query=clash` mengembalikan NOT_FOUND/404; halaman `/en/packages/?q=clash` hanya menampilkan katalog kategori umum tanpa hit spesifik CoC base. Nihil temuan; catatan di `apk_kompetitor.md` (F-Droid) masih berlaku.
- GitHub: 1 listing baru ditambahkan (`Clash Trackers`, https://github.com/Killersparrow1/clash-Trackers; aplikasi Android Kotlin pelacak timer upgrade CoC, pelengkap non-galeri sejenis Notificlash; APK `ClashTrackers-CT2.8.apk` terverifikasi HTTP 200). Kandidat lain ditolak: `official-abhishek/COC-BASE-LAYOUT` (HTML statis), `vichea69/clash-of-clans-Frontend` (web/TypeScript), `gamelyx0-sys/gamely` (kosong), `cocbaselayouts/Clash-of-Clans-Bases` (situs HTML), `danielholmes/coc-base-analyser` & `Peter537/clash-of-clans-base-validator` (CLI/analisa, bukan aplikasi mobile pengguna akhir).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `memori/sesi/sesi_38.md` | Dibuat | Berkas sesi aktif. |
| `apk_kompetitor.md` | Diubah | 18 listing baru (`Belum Dianalisa`): Play Store 2, GitHub 1, Apple App Store 6, APKPure 4, Aptoide 5; section F-Droid/Samsung Galaxy Store/Mi/GetApps/Oppo App Market/Store Lainnya memuat catatan nihil temuan. |
| `MEMORI.md` | Diubah | Bagian Riset Kompetitor diperbarui (82 listing; sebaran per store); header `Diperbarui` → sesi 38 (menimpa catatan header sesi 39 yang berjalan paralel pada 16:05). |
| `memori/riwayat_perubahan.md` | Diubah | Entri sesi 38 ditambahkan di atas. |

## Sinkronisasi ke MEMORI.md

- Bagian `Riset Kompetitor` pada `MEMORI.md` diperbarui: status sesi 38, total 82 listing (10 `Sudah Dianalisa`, 72 `Belum Dianalisa`), sebaran per store (Google Play 30, GitHub 2, Apple App Store 38, APKPure 7, Aptoide 5), daftar listing baru, dan store nihil temuan.
- Header `Diperbarui` diubah menjadi `Sat Nov 14 2026 16:35 WIB (sesi 38)` (menimpa `16:05 (sesi 39)` — sesi paralel yang sempat menyentuh header).
- `memori/riwayat_perubahan.md` ditambahkan entri sesi 38 di atas entri sesi 39.
- `MEMORI.md` dan `memori/riwayat_perubahan.md` konsisten dengan isi berkas sesi ini.
- Catatan: sesi 39 (sesi paralel) sempat tidak melakukan catch-up sync terhadap `sesi_38.md` karena menduga sesi ini berjalan; setelah sesi 38 selesai, status ini tidak lagi ambigu — sinkronisasi dilakukan pada sesi ini sendiri.
