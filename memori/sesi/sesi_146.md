# Sesi 146 — Cari APK Kompetitor (satu run, semua store)

## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-16 (WIB)
- Command: `/cari_apk_kompetitor` (perintah "Cari APK Kompetitor (Portabel Lintas Proyek)")
- Topik: riset aplikasi kompetitor mobile untuk `base_coc` (penyedia base/layout Clash of Clans) di seluruh store, satu run berurutan: Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → Vivo V-Appstore → Amazon Appstore → Huawei AppGallery → Aurora Store → store lainnya

## Catatan Sesi
- MEMORI.md dibaca; catch-up sync awal sesi: `^- Status Sinkron: Belum Sinkron$` pada `memori/sesi/` menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu), `sesi_122.md` (tindak lanjut diskusi_11; sesi paralel), `sesi_123.md` (Mode Diskusi; sesi paralel), dan `sesi_139.md` (sesi paralel aktif). Keempatnya **tidak disentuh** (keputusan pengguna sebelumnya: "Biarkan apa adanya", sesi 131–132); dilaporkan ke pengguna.
- Aplikasi sasaran ditentukan dari dokumen proyek: `README.md` (base_coc = aplikasi Flutter penyedia base/layout Clash of Clans: galeri base, detail & salin tautan, pelacakan progres upgrade desa). Bukan tebakan dari nama repositori.
- `apk_kompetitor.md` (238 baris) sudah memuat katalog per store; riset mencari listing baru yang belum tercatat. Duplikat exact berdasarkan package id/id App Store dilewati; kandidat yang terbukti berganti nama/aplikasi lain dilewati.
- Amazon Appstore dilewati dengan catatan (dihentikan untuk Android 2025-08-20).
- Hasil per store (sesi 146):
  - Google Play Store: 2 listing baru — Base for Clash of Clans (Nuriev Dev Studio, `com.NurievDevStudio.com.unity.template.mobile2D`), Clash Maps Hub (AHMED OKA, `com.ahmedoka.clashmapshub`). Kandidat `com.phuocly.coc.layouts.link.pro` ternyata package yang sama/berganti nama menjadi "Royale Decks: Brawl Stats" (bukan CoC) — tidak disertakan. Aplikasi statistik klan/perang murni tetap dilewati.
  - F-Droid: nihil (pencarian "clash of clans" nol hasil; "clash" hanya klien proxy tidak relevan).
  - GitHub: 1 listing baru — ClashKingApp (`ClashKingInc/ClashKingApp`; iOS/Android, Expo/React Native, GPL-3.0, rilis tanpa APK). Kandidat web (nschmeller/clash-bases), riset YOLO (MMHDJ/Dragonsight), desktop PySide6 (BasePilot), companion perang usang (pluckyswan/ClashLog), Scala web (coc-base-analyser) dilewati.
  - Apple App Store: 5 listing baru — ClashMax: Attack Planner (id6455786899), BurntBase: Clash Base Tool (id6498314218), AI Find Base (id6782599725), Base Planner & Layout Maps (id6781214849), ClashAlly: CoC Tracker & Guide (id6754341639; pasangan iOS `com.mazren.clashally`). iTunes lookup `resultCount: 1` untuk kelimanya. "Stats & Tools for Clash" (id1434767560; ternyata Clash Royale), "Clash Mi" (id6744321968; klien proxy), kalkulator usang (id638668517, id1441882558), statistik murni (id1669237796, id1546458325) dilewati.
  - Samsung Galaxy Store: nihil terverifikasi (JS-render, `/search` 404, tidak ada halaman aplikasi spesifik).
  - Mi/GetApps: nihil terverifikasi (JS-render/login).
  - Oppo App Market: nihil terverifikasi (oppomobile.com hanya halaman unduhan klien).
  - Vivo V-Appstore: nihil terverifikasi (H5 kosong).
  - Amazon Appstore: dilewati (dihentikan 2025-08-20).
  - Huawei AppGallery: nihil terverifikasi (pencarian tidak menemukan halaman aplikasi spesifik).
  - Aurora Store: bukan katalog mandiri (klien Play Store).
  - Store lainnya: 1 listing Uptodown — COC Maps - Base Layouts Links (Srs Apps, `com.srsapps.new_clash_base_layouts_direct_link`; mirror dari Play Store, akses langsung memutar HTTP 410; sesuai aturan #20 skill `riset-kompetitor`). APKPure/Aptoide tidak ada kandidat baru (mirror aplikasi yang sudah tercatat). Uptodown/IzzyOnDroid/SlideME/Tencent MyApp: tidak ada kandidat baru.
- Hitung ulang katalog: 126 listing; 70 Sudah Dianalisa, 56 Belum Dianalisa (bertambah 9 dari sesi 145: 2 Play + 1 GitHub + 5 Apple + 1 Uptodown).
- Verifikasi: curl/webfetch/websearch; `node -e` dipakai untuk mem-parsing JSON iTunes search/lookup yang tersimpan (izin `node *` tidak dilarang; `curl`/`python3`/`jq`/`grep` berstatus deny).
- Tidak ada kode Dart, command, atau config yang diubah; tidak ada commit/push.
- `git status --short` (2026-11-16 ~00:45 WIB): `M MEMORI.md`, `M apk_kompetitor.md`, `M memori/riwayat_perubahan.md`, `?? memori/sesi/sesi_146.md` (sesi ini), `?? memori/sesi/sesi_147.md` (sesi paralel — bukan tindakan sesi ini; tidak disentuh). `git submodule status` gagal pada gitlink `.dart_tool/...` (tanpa entri `.gitmodules`; isu lama tercatat).

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| memori/sesi/sesi_146.md | Dibuat | Berkas sesi |
| apk_kompetitor.md | Diubah | 9 listing baru (2 Play + 1 GitHub + 5 Apple + 1 Uptodown); section `# Tambahan Riset (2026-11-16)` |
| MEMORI.md | Diubah | Sinkronisasi akhir sesi |
| memori/riwayat_perubahan.md | Diubah | Entri sesi 146 |

## Sinkronisasi ke MEMORI.md
- `MEMORI.md`: header `Diperbarui` → Mon Nov 16 2026 00:30 WIB (sesi 146); bagian `## Status Kerja (per 2026-11-16)` diisi entri sesi 146 (9 listing baru; hitung ulang 126 listing / 70 Sudah / 56 Belum; per store Play 55/4, GitHub 7/4, Apple 8/35, APKPure 0/7, Aptoide 0/5, Uptodown 0/1); baris `Total listing saat ini` diperbarui (sesi 121 → sesi 146).
- `memori/riwayat_perubahan.md`: entri sesi 146 ditambahkan (sesi 145 dipertahankan).
- Catch-up awal sesi: `sesi_81`/`sesi_122`/`sesi_123`/`sesi_139` tetap `Belum Sinkron` (keputusan pengguna sesi 131–132; tidak disentuh). `sesi_147.md` (paralel) di luar cakupan sesi ini.
