# Sesi 148 — Cari APK Kompetitor (satu run, semua store)

## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-16 (WIB)
- Command: `/cari_apk_kompetitor` (perintah "Cari APK Kompetitor (Portabel Lintas Proyek)")
- Topik: riset aplikasi mobile kompetitor untuk `base_coc` (penyedia base/layout Clash of Clans) di seluruh store, satu run berurutan: Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → Vivo V-Appstore → Amazon Appstore → Huawei AppGallery → Aurora Store → store lainnya

## Catatan Sesi
- MEMORI.md dibaca; catch-up sync awal sesi: `^- Status Sinkron: Belum Sinkron$` pada `memori/sesi/` menemukan `sesi_81.md` (tabrakan penomoran sesi paralel; ambigu), `sesi_122.md` (tindak lanjut diskusi_11), `sesi_123.md` (Mode Diskusi; hanya berisi laporan audit), `sesi_139.md` (sesi paralel; pipeline L1–L7), dan `sesi_147.md` (Mode Diskusi paralel; hanya berisi berkas sesi sendiri). Seluruhnya **tidak disentuh** (keputusan pengguna sebelumnya: "Biarkan apa adanya", sesi 131–132); dilaporkan ke pengguna. Berkas `sesi_146.md` sudah `Sudah Sinkron` (diarsipkan; tidak diubah).
- Anti-bentrok (target berkas `apk_kompetitor.md`): `git status --short` dan tabel `## Berkas Terdampak` lima berkas `Belum Sinkron` diverifikasi — tidak ada yang menyentuh `apk_kompetitor.md`; tidak ada bentrok.
- Aplikasi sasaran ditentukan dari dokumen proyek: `README.md` (base_coc = aplikasi Flutter penyedia base/layout Clash of Clans) dan `apk_kompetitor.md` (katalog kompetitor `base_coc`). Bukan tebakan dari nama repositori.
- Amazon Appstore dilewati dengan catatan (dihentikan untuk Android 2025-08-20).
- Riset dikerjakan store demi store dalam satu run; `apk_kompetitor.md` diperbarui sebelum lanjut ke store berikutnya.
- **Google Play Store**: 2 listing baru — Coc Studio - Base Layout (`Poppy Tech`, `com.fksoft.cocmapstudio`), Maps of Clash of Clans (`MoonApp Studios`, `com.topappstudios.cocmap`; usang 2018). Kandidat ditolak: Clash of Mash (`com.clash.mash`; Play 404 — mirror APKPure dicatat), Base Master (`com.clshofmapslatest.clashofmaps`; removed 2026-03-07), FiniteGamer (`com.finitegamer.clashofclansbaselayouts`; 404), coc builder base copy layout (`com.builderbasemaps`; 404), COC Map Layouts - Base Links (`com.asim.battleofmaps`; removed Dec 2025), Maps of COC - Base Layouts (`com.hivefiveapps.new_maps_of_coc`; Play 404; mirror APKPure sudah tercatat), Ultimate Base Layouts (`com.coc.bases`; sama dengan `Ultimate Pro Base Layouts`), aplikasi kecil tanpa package id terverifikasi (dilewati). `curl` berstatus deny pada lingkungan ini; verifikasi memakai webfetch/websearch.
- **F-Droid**: nihil temuan per 2026-11-16. Pencarian via mesin pencari hanya mengembalikan Clash Meta For Android (klien proxy, tidak relevan). Halaman pencarian resmi mengembalikan HTTP 404 dari lingkungan ini.
- **GitHub**: nihil temuan baru per 2026-11-16. Semua repositori CoC mobile yang muncul sudah tercatat atau bukan mobile (`nschmeller/clash-bases` webapp; `ClashKingInc/DevKit` dev tools).
- **Apple App Store**: nihil temuan baru per 2026-11-16. iTunes search API (3 kueri, `entity=software&country=us`): seluruh CoC app sudah tercatat; `Clash Mi` = klien proxy Clash Meta; `Base Layouts: War & Farm Maps` (id6804564319) promosi DEV Community — sudah tercatat. Dua kandidat yang muncul dari hasil pencarian web (`BasePedia` id1471563287, `Top layouts for CoC` id774328390) ditolak karena iTunes lookup `resultCount: 0`.
- **Samsung Galaxy Store**: nihil (pencarian `/search/COC Base Layouts` HTTP 404; etalase dirender JavaScript).
- **Mi/GetApps**: nihil terverifikasi (hanya CoC resmi Tencent dan tautan Play/App Store yang sudah tercatat).
- **Oppo App Market**: nihil terverifikasi (juga dicoba kueri Mandarin 部落冲突 阵型; hanya artikel web dan tautan store yang sudah tercatat).
- **Vivo V-Appstore**: nihil terverifikasi (beranda H5 terbaca generik; hasil web hanya Play/App Store yang sudah tercatat).
- **Amazon Appstore**: dilewati (dihentikan untuk Android 2025-08-20; historis).
- **Huawei AppGallery**: nihil terverifikasi (halaman pencarian kosong; web hanya tautan Play Store yang sudah tercatat).
- **Aurora Store**: bukan katalog mandiri (klien Play Store).
- **Store lainnya — Batch 2**: 1 listing APKPure tercatat — Clash of Mash: COC Base Layout (`com.clash.mash`, v2.4, 14 Jun 2026; Play 404; mirror APKPure, HTTP 403 → verifikasi via cuplikan pencarian). Uptodown/IzzyOnDroid/SlideME/Tencent MyApp/Aptoide: nihil kandidat baru. Situs web (`clashbuilder.com`, `cocwiki.com`, `coclayout.com`, `basescoc.com`) bukan aplikasi mobile — tidak disertakan.
- **Hasil akhir**: 3 listing baru (2 Google Play Store: Coc Studio - Base Layout `com.fksoft.cocmapstudio`; Maps of Clash of Clans `com.topappstudios.cocmap`; 1 APKPure: Clash of Mash `com.clash.mash`). Hitung ulang katalog: **129 listing; 70 Sudah Dianalisa, 59 Belum Dianalisa** (naik dari 126; sesi 146). Semua listing baru `Status Analisa = Belum Dianalisa`.
- Tidak ada kode Dart/command/config yang diubah pada run ini; tidak ada commit/push.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| memori/sesi/sesi_148.md | Dibuat | Berkas sesi ini |
| apk_kompetitor.md | Diubah | Batch 2 (sesi 148): 3 listing baru (2 Google Play: Coc Studio - Base Layout `com.fksoft.cocmapstudio`, Maps of Clash of Clans `com.topappstudios.cocmap`; 1 APKPure: Clash of Mash `com.clash.mash`); catatan `## <Store> — Batch 2 (sesi 148)` per store (F-Droid, GitHub, Apple App Store, Samsung Galaxy Store, Mi/GetApps, Oppo App Market, Vivo V-Appstore, Amazon Appstore, Huawei AppGallery, Aurora Store, Store lainnya) — seluruhnya nihil terverifikasi; section `# Tambahan Riset (2026-11-16)` diperluas |
| memori/riwayat_perubahan.md | Diubah | Entri sesi 148 (command /cari_apk_kompetitor; 3 listing baru; hitung ulang 129 listing / 70/59; catatan per store) |
| MEMORI.md | Diubah | Header `Diperbarui` → Mon Nov 16 2026 01:17 WIB (sesi 148); `## Status Kerja (per 2026-11-16)` ditambah entri sesi 148; baris `Total listing saat ini` diperbarui (sesi 146 → sesi 148; 129 listing: 70 Sudah / 59 Belum) |

## Sinkronisasi ke MEMORI.md
- `MEMORI.md`: header `Diperbarui` → Mon Nov 16 2026 01:17 WIB (sesi 148); `## Status Kerja (per 2026-11-16)` ditambah entri sesi 148; baris `Total listing saat ini` (sesi 146 → sesi 148; 129 listing / 70 Sudah / 59 Belum; rincian per store dikoreksi dengan hitungan terverifikasi via `node`).
- `memori/riwayat_perubahan.md`: entri sesi 148 ditambahkan di atas entri sesi 146.
- Verifikasi `git status --short`: `M MEMORI.md`, `M apk_kompetitor.md`, `M memori/riwayat_perubahan.md`, `?? memori/sesi/sesi_148.md` — cocok dengan tabel `## Berkas Terdampak` (tabel mencantumkan keempat berkas).
- `git status -- memori/sesi/` pada akhir sesi harus menunjukkan hanya berkas `sesi_148.md` yang berubah (diverifikasi sebelum penandaan `Sudah Sinkron`).
