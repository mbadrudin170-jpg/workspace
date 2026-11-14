# Sesi 104

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-15 (WIB)
- Topik: Riset APK kompetitor lintas store (command `cari_apk_kompetitor.md`) untuk aplikasi sasaran `base_coc`

## Catatan Sesi

- Catch-up sync: `sesi_102.md` dan `sesi_81.md` berstatus `Belum Sinkron` (sesi paralel/ambigu, sudah dilaporkan pada sesi 103 dan 105) — tidak diputuskan sendiri, dilaporkan ulang ke pengguna.
- Aplikasi sasaran ditentukan dari `base_coc/README.md`: aplikasi Android Flutter penyedia base/layout Clash of Clans (galeri base terfilter TH/tipe, detail + salin tautan, favorit, tag strategi, pelacakan progres upgrade desa via Data Export, SQLite lokal).
- Riset dijalankan store demi store dalam satu run sesuai urutan command: Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → Vivo V-Appstore → Amazon Appstore → Huawei AppGallery → Aurora Store → store lainnya.
- Google Play Store: 25 listing baru terverifikasi HTTP 200 dan ditambahkan dengan `Status Analisa = Belum Dianalisa` — Clash Base Layouts: Copy Links (`cloud.projectyard.baselayouts`), Clan Capital Bases for COC (`co.median.android.yadard`), Clash Companion: Base Layouts (`codes.zidan.clashcompanion`), Blueprint CoC (`com.blueprintcoc.com`), ClashVault (`com.clashvault.app`), COC Base Pro (`com.cocbase.appbase`), House of Clashers Android (`com.frankeaplicativos.houseofclashers`), CCTimer (`com.jaehw.coctimer`), Keepwatch Android (`com.keepwatch.dev`), ClashAlly (`com.mazren.clashally`), Clash layout - COC base design (`com.mycompany.clashlayout`), Base of Clash of Clans 2025 (`com.rabbit.baselayouts`), Pro Clash of Maps (`com.sb.promapsofcoc2020`), ClashRG Maps (`com.socialbytes.mapsofcoc`), Clash Tracker (`com.vinmai.clashtracker`), ClashBase (`com.zinasolution.clashbase`), Maps Base For Clash of Clans (`hamidsoft.mapsbaseforcoc`), Clash Base Links – CoC Layouts (`ir.ghaderi.clashbaz`), clash maps layout Base link (`map.clash.coc.clans.base.layout.link`), Village Tracker (`uz.suhrob.village_tracker`), Clash Tracker: Upgrade Planner (`de.appcombine.app.gry6tm`), CoC Base Layout Hub (`com.aarzee.utili.cocbases`), WarBase Pro CoC Layouts (`com.moonedgestudio.warbasepro2027`), Clash Companion (`com.clashcompanion.com`), ClashGrid (`com.coc_widgets`). Aplikasi statistik klan/perang murni (Clash of Stats, ClanScope, War Report) tidak disertakan karena tidak relevan dengan fitur inti.
- F-Droid: nihil (`search.f-droid.org` untuk "clash of clans" nol hasil; "clash" hanya klien proxy).
- GitHub: 5 repositori baru terverifikasi rilis + aset APK — Clash-Manager (`madu011/Clash-Manager`, APK v1.0.0), Clash Timers (`memehammad/clash-timers`, v1.2.2), Clash Timers (`Kuswaa/clash-timers`, v1.0.2), Clash Tracker (`rahulkhatri137/coc-tracker`, v7.3), Clash Command (`AmruthLP12/clash-command`, v1.0.9).
- Apple App Store: dua kandidat baru (`CoC Base & Armies` id6753968147, `Clash Layout - COC Base Design` id6753753256) tidak disertakan karena iTunes lookup `resultCount: 0` dan halaman App Store HTTP 404.
- Samsung Galaxy Store, Mi/GetApps, Oppo App Market, Vivo V-Appstore, Huawei AppGallery: nihil temuan yang dapat diverifikasi. Amazon Appstore dilewati (Android dihentikan 2025-08-20). Aurora Store bukan katalog mandiri. APKPure 403 anti-bot; Aptoide tanpa hasil terverifikasi; Uptodown/IzzyOnDroid/SlideME/Tencent MyApp nihil.
- Hasil: `apk_kompetitor.md` kini memuat 117 baris data (30 `Sudah Dianalisa`, 87 `Belum Dianalisa`); sebaran Play 57 (20/37), GitHub 10 (4/6), Apple 38 (6/32), APKPure 7, Aptoide 5. Tidak ada status `Sudah Dianalisa` yang diubah.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `apk_kompetitor.md` | Diubah | Menambahkan 25 listing Google Play Store + 5 GitHub (`Belum Dianalisa`) dan section `# Tambahan Riset (2026-11-15)` berisi catatan hasil per store |
| `MEMORI.md` | Diubah | Header `Diperbarui` dan bagian `## Riset Kompetitor` (status sesi 104, total listing, sebaran, daftar listing baru) |
| `memori/riwayat_perubahan.md` | Diubah | Entri kronologis sesi 104 |
| `memori/sesi/sesi_104.md` | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md

`MEMORI.md` diperbarui pada header `Diperbarui` dan bagian `## Riset Kompetitor`: status pencarian lintas store sesi 104 (25 Play + 5 GitHub, store lain nihil/dilewati), total listing 117 baris (30 sudah, 87 belum), sebaran per store, dan daftar listing baru sesi 104. Entri lama sesi 38 yang berlabel "Status terbaru" diganti status sesi 104; riwayat sesi 38 tetap tersimpan pada daftar listing baru. Provenance `sesi 104` dicantumkan. Tidak ada kode Dart yang diubah dan belum di-commit.
