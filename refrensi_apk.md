# Referensi APK Kompetitor base_coc

Laporan referensi dari 30 APK kompetitor yang terdaftar di `apk_kompetitor.md` dan berstatus `Belum Dianalisa`/`Sudah Dianalisa`. Fokus laporan: fitur yang dapat ditambahkan, arahan optimasi, serta pola UI/UX/layout yang dapat dijadikan pembanding. Seluruh rekomendasi dibatasi pada fitur yang dapat berjalan di mobile Android. Batch 1 (10 APK) dilaporkan sebelumnya; batch 2 (10 APK tambahan) ditambahkan pada pembaruan yang sama; batch 3 (10 APK terverifikasi ulang/dianalisa 2026-11-14) ditambahkan pada pembaruan ini.

## Informasi Riset

- Tanggal riset: 2026-11-14 (WIB); batch 2 ditambahkan pada pembaruan yang sama; batch 3 (10 APK sesi 93, 2026-11-14) diverifikasi dan dianalisa pada pembaruan ini.
- Aplikasi sasaran: `base_coc`, aplikasi penyedia base/layout Clash of Clans (submodule Flutter pada repositori `workspace`).
- Lingkup: 30 APK dari `apk_kompetitor.md`; 10 APK batch 1 + 10 APK batch 2 + 10 APK batch 3 (hanya baris `Status Analisa = Belum Dianalisa` saat dianalisa).
- Alasan pemilihan 10 listing batch 3 (lintas store dan fitur, mengikuti aturan skill `riset-kompetitor` #30): `COC Base Links – Clash Layouts` (katalog + army links + kalkulator), `Clash Champs: Pro Base Layouts` (base pro juara dunia + ARMY IQ), `Clash Base Pedia` (komunitas + tag anti), `Clashlayout` (komunitas rewards), `Ultimate Pro Base Layouts` (akses offline bookmark), `ClashPrime` (open source, Base Library), `Coc-Base-Layout` (open source), `Base Atlas` (gamifikasi kreator + moderasi otomatis), `Keepwatch` (impor Data Export + timeline), `Clash of Helper` (multi-akun + grid/list + smart search). Listing APKPure/Aptoide dilewati karena merupakan mirror package id listing Google Play yang sudah tercantum (`com.sb.newclashmaps2020`, `com.akstudio.clashofmaps`, `com.moonstudio.mapcoc`, `com.hall.editor`, `com.coc.cocbases`). `COC Baselinks` (Apple App Store id6790808297) tidak dipilih terpisah karena package id (`com.rpekka.cocbaselinks`) sama dengan `COC Base Links – Clash Layouts` yang sudah direpresentasikan batch 3.
- Catatan lingkup: `apk_serupa.md` tidak ditemukan di root proyek; lingkup mengikuti `apk_kompetitor.md`.
- Metode: batch 3 diverifikasi dengan `webfetch` (halaman toko/repositori terbaca; App Store via iTunes lookup, seluruh `resultCount = 1`; GitHub terbaca penuh) dan pembacaan deskripsi resmi serta ulasan pengguna pada halaman tersebut; tidak ada `curl` dan tidak ada upload tangkapan layar pada batch 3.
- Tingkat verifikasi: 30 dari 30 listing (batch 1–3) terverifikasi (halaman toko/repositori terbaca). Listing APKPure/Aptoide (403 anti-bot) tidak dijadikan dasar rekomendasi.
- Sifat dokumen: riset pembanding, bukan keputusan implementasi. Pengguna menyortir sendiri item yang akan dikerjakan.
- Kode item: `A` = rekomendasi fitur baru, `B` = optimasi/pra-implementasi fitur, `C` = UI/UX dan layout. Prioritas: `Tinggi`, `Sedang`, `Rendah`.

## Cara Membaca

1. Baca `Ringkasan Temuan Terbesar` untuk gambaran pola kompetitor.
2. Pilih item pada bagian A (fitur), B (optimasi), atau C (UI/UX) sesuai kebutuhan.
3. Setiap item memuat referensi aplikasi, tujuan, saran penerapan, dan prioritas.
4. Bagian E merangkum urutan pengerjaan yang disarankan; bagian F mencatat keterbatasan bukti.

## Ringkasan Temuan Terbesar

1. Pola inti seluruh kompetitor galeri adalah **satu alur pendek: pilih Town Hall → pilih tipe base → lihat preview → tekan Copy Base**. Tidak ada kompetitor yang memaksa pengguna menyusun base manual.
2. **Copy base link** menjadi nilai jual utama. Aplikasi yang gagal menjalankan copy dengan andal mendapat keluhan keras di ulasan, sedangkan aplikasi yang andal menempatkan tombol copy sebagai aksi utama di layar detail.
3. **Taksonomi base** sudah menjadi standar: TH/BH, war, farming, trophy, hybrid, CWL, ring/box/island, anti-3-star, anti-air, dan anti-ground. Sebagian menambahkan Clan Capital dan base lucu.
4. **Preview berkualitas tinggi dengan zoom** dipakai untuk meyakinkan pengguna sebelum menyalin layout; sebagian menambahkan penanda trap.
5. Diferensiasi bergerak ke arah **komunitas dan personalisasi**: favorit, rating, unggah base, berbagi ke clan, riwayat, dan sinkron cloud.
6. Aplikasi yang agresif menampilkan iklan dan menyajikan tautan copy invalid mendapat ulasan negatif; kualitas eksekusi copy lebih menentukan reputasi daripada jumlah koleksi.
7. Fitur di luar galeri yang terbukti bernilai adalah **pengingat upgrade builder** (Notificlash) yang bekerja lokal, tanpa login, dan memakai widget layar utama.
8. Kompetitor matang (ClashPrime, Clash Trackers, Keepwatch) memperlakukan aplikasi sebagai **pendamping progres**: pelacakan upgrade, perencanaan builder, dan widget layar utama menjadi alasan kembali harian, bukan sekadar galeri base.
9. **Multi-akun** dan **pelacakan perang klan real-time** menjadi fitur pembeda bagi aplikasi all-in-one; pengguna dengan banyak desa mengharapkan satu dashboard.
10. **Offline-first** dan **tanpa login** (Clash Trackers, Keepwatch) mendapat apresiasi; aplikasi yang memaksa akun/iklan agresif mendapat keluhan.
11. **AI analisis base** (BaseVault) dan **vault klan privat** muncul sebagai diferensiasi premium, tetapi bergantung backend dan moderasi.
12. **Army links per Town Hall** muncul sebagai pelengkap galeri base yang langsung relevan: kompetitor matang menyajikan komposisi pasukan yang disalin ke game, bukan hanya base.
13. **Impor dari clipboard satu tap** (Keepwatch) menurunkan gesekan impor Data Export menjadi satu ketukan setelah pengguna menyalin export dari game, tanpa login dan tanpa mengetik level manual.
14. **Gamifikasi kontribusi komunitas** (Base Atlas: profil pembangun publik, follow, Trending, Top Builders, Creator Pulse, founder slots; Clashlayout: community rewards) terbukti dipakai aplikasi galeri/komunitas untuk menumbuhkan konten; seluruhnya bergantung backend.
15. **Akses offline untuk bookmark** (Ultimate Pro Base Layouts) memperkuat prinsip offline-first: koleksi tersimpan tetap terbaca tanpa jaringan.
16. **Moderasi otomatis unggahan** (Base Atlas: screen gambar+teks sebelum tayang + tombol lapor) menjadi prasyarat komunitas yang aman sebelum fitur kontribusi dibuka.

## Kondisi Fitur Aktual Proyek

Berdasarkan `base_coc/README.md` dan `base_coc/lib/main.dart` per 2026-11-14:

> Catatan pembaruan batch 3 (2026-11-14, sesi 93; diperbarui setelah sesi paralel menyelesaikan A6): kondisi proyek di atas adalah snapshot batch 1–2 dan sudah basi. Fitur yang sudah diimplementasikan di submodule `base_coc` sejak itu: galeri base + filter, detail base + copy tautan satu ketuk, pelacakan progres upgrade desa (impor Data Export), favorit base (skema SQLite v2), dan kategori strategi lanjutan/tag strategi base (A6; PRD dihapus setelah implementasi oleh sesi paralel, mengikuti preseden A5). Bagian ini dipertahankan sebagai konteks batch 1–2; rujukan terbaru: `MEMORI.md` bagian `Status Kerja` dan `Riwayat Perubahan`.

| Aspek | Kondisi |
| --- | --- |
| Fitur produk | Belum ada; `lib/main.dart` masih aplikasi counter bawaan `flutter create` |
| Data base | Belum ada model, sumber data, atau aset base |
| Pencarian/filter | Belum ada |
| Copy base link | Belum ada |
| Penyimpanan/favorit | Belum ada |
| Tema/identitas | Belum ada; Material Design bawaan |
| Pengujian | Hanya widget test bawaan untuk counter |

Implikasi: seluruh rekomendasi fitur pada bagian A bersifat **fitur baru dari nol**, bukan penambahan ke fitur yang sudah berjalan. Bagian B karena itu tidak dapat menilai optimasi fitur eksisting dan hanya memuat arahan kualitas pra-implementasi.

## A. Rekomendasi Fitur Baru

### Prioritas Tinggi

#### A3. Preview base resolusi tinggi dengan pinch-to-zoom

- **Temuan:** Beberapa kompetitor menyebut preview HD, zoom, dan penanda trap sebagai pembeda; pengguna memakai preview untuk memeriksa jarak pertahanan sebelum menyalin.
- **Tujuan fitur:** meningkatkan keyakinan pengguna bahwa layout layak dipakai dan mengurangi kesalahan memilih base.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps), [COC Base Layouts Design links](https://play.google.com/store/apps/details?id=com.srsapps.new_clash_base_layouts_direct_link)
- **Saran:** simpan gambar base dalam dua ukuran (thumbnail dan detail), gunakan `InteractiveViewer` untuk zoom, dan sediakan tombol reset zoom.
- **Prioritas:** Tinggi.
- **Status PRD:** Sudah diimplementasikan.

#### A4. Katalog lokal yang tetap berfungsi tanpa internet

- **Temuan:** Notificlash menonjolkan akses offline tanpa login; aplikasi galeri lain bergantung pada pembaruan data daring setiap hari.
- **Tujuan fitur:** menjaga pengalaman dasar tetap berjalan saat jaringan buruk dan mengurangi ketergantungan backend pada tahap awal proyek.
- **Referensi:** [Notificlash: Tracker for CoC](https://play.google.com/store/apps/details?id=com.efertre.notificapp), [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net)
- **Saran:** mulai dengan katalog yang dibundel sebagai aset JSON dan gambar lokal; sediakan mekanisme pembaruan katalog versi berikutnya (unduh berkas atau repositori data) tanpa mengubah aplikasi.
- **Prioritas:** Tinggi.
- **Status PRD:** Sudah diimplementasikan.

### Prioritas Sedang

#### A7. Berbagi base ke anggota klan

- **Temuan:** ClasherPro dan Base Drop menyediakan berbagi base/link ke pengguna lain atau media sosial.
- **Tujuan fitur:** mendukung koordinasi perang klan ketika pemimpin perlu membagikan layout ke anggota.
- **Referensi:** [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster), [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop)
- **Saran:** gunakan `share_plus` untuk membagikan tautan dan nama base; hindari membuat tautan internal yang tidak dapat dibuka penerima.
- **Prioritas:** Sedang.

#### A8. Panduan singkat dan alasan pemilihan layout

- **Temuan:** clashOFbase menyediakan video strategi, sedangkan CoC Base Maps menambahkan tips penempatan trap dan penyesuaian base setelah scouting.
- **Tujuan fitur:** membantu pengguna memahami mengapa suatu base kuat, bukan hanya menyalin gambar.
- **Referensi:** [clashOFbase](https://play.google.com/store/apps/details?id=com.namaari.clashofbase), [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts)
- **Saran:** mulai dari catatan teks pendek per base (kekuatan, kelemahan, saran trap) yang disimpan bersama data base; video dapat ditunda karena membutuhkan hosting.
- **Prioritas:** Sedang.

#### A9. Kategori Clan Capital dan Builder Base 2.0

- **Temuan:** CoC Base Maps mencakup seluruh distrik Clan Capital, sedangkan aplikasi lain membatasi diri pada home village dan builder base.
- **Tujuan fitur:** memperluas cakupan ke mode yang belum banyak dilayani aplikasi pesaing.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020)
- **Saran:** tambahkan `DistrikCapital` sebagai kategori terpisah setelah katalog inti stabil; jangan memaksakan data jika sumber layout belum tersedia.
- **Prioritas:** Sedang.

#### A10. Pengingat waktu upgrade builder dan laboratorium

- **Temuan:** Notificlash mengelola timer builder, laboratorium, hewan peliharaan, dan hero, dengan widget dan notifikasi tanpa login.
- **Tujuan fitur:** menambah alasan pengguna membuka aplikasi setiap hari di luar kebutuhan mencari base.
- **Referensi:** [Notificlash: Tracker for CoC](https://play.google.com/store/apps/details?id=com.efertre.notificapp), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps)
- **Saran:** tawarkan sebagai fitur pelengkap opsional; simpan timer lokal, gunakan notifikasi lokal, dan jangan mewajibkan akun.
- **Prioritas:** Sedang.

### Prioritas Rendah

#### A11. Base lucu/troll dan progress base

- **Temuan:** Beberapa aplikasi menyediakan kategori base lucu dan progress base sebagai pelengkap kategori pertahanan.
- **Tujuan fitur:** menambah variasi konten dan daya tarik bagi pengguna kasual.
- **Referensi:** [COC Base Layouts Design links](https://play.google.com/store/apps/details?id=com.srsapps.new_clash_base_layouts_direct_link), [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop)
- **Saran:** masukkan sebagai kategori tambahan setelah kategori pertahanan utama terisi.
- **Prioritas:** Rendah.

#### A12. Rating dan komentar base dari komunitas

- **Temuan:** CocbaseNet, ClasherPro, dan CoC Base Maps menampilkan rating/komentar atau layout pilihan komunitas.
- **Tujuan fitur:** membantu penyaringan kualitas base ketika koleksi bertambah besar.
- **Referensi:** [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net), [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster)
- **Saran:** tunda sampai ada backend dan moderasi; untuk versi lokal, cukup sediakan penanda "pilihan editor".
- **Prioritas:** Rendah (butuh backend/akun).

#### A13. Unggah base komunitas dan sinkron cloud

- **Temuan:** Base Drop menyebut sinkron cloud, sedangkan Map Layout Links dan CocbaseNet meminta akun untuk mengunggah base.
- **Tujuan fitur:** membangun koleksi dari kontribusi pengguna dan menjaga data lintas perangkat.
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [Map Layout Links Base for COC](https://play.google.com/store/apps/details?id=com.coc.layouts), [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net)
- **Saran:** tempatkan di fase lanjutan; proyek saat ini belum memiliki autentikasi, backend, atau kebijakan moderasi.
- **Prioritas:** Rendah (butuh backend/akun).

#### A14. Pencarian base dari tangkapan layar (AI base finder)

- **Temuan:** Base Drop memungkinkan unggah tangkapan layar untuk menemukan layout yang mirip.
- **Tujuan fitur:** mempercepat pencarian base yang terlihat di video atau perang klan.
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop)
- **Saran:** jangan dijadikan fitur MVP karena membutuhkan model pencocokan gambar dan backend; catat sebagai ide diferensiasi jangka panjang.
- **Prioritas:** Rendah (butuh backend/ML).

#### A15. Video replay pertahanan

- **Temuan:** Base Drop menampilkan video replay pertahanan sebelum pengguna menyalin base.
- **Tujuan fitur:** memberikan bukti performa base pada pertempuran nyata.
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop)
- **Saran:** tunda karena membutuhkan hosting video, moderasi, dan biaya penyimpanan; catatan teks per base lebih murah untuk tahap awal.
- **Prioritas:** Rendah.

### Batch 2 — temuan dari 10 APK tambahan

#### A16. Pelacakan progres upgrade desa (sisa waktu dan sumber daya)

- **Temuan:** Keepwatch menampilkan sisa upgrade per bangunan, hero, pet, pasukan, mantra, equipment, dan tembok per level Town Hall dengan estimasi waktu dan sumber daya; ClashPrime dan Clash of Helper memvisualisasikan progres upgrade terhadap batas Town Hall/Builder Hall.
- **Tujuan fitur:** memberi alasan harian pengguna membuka aplikasi dan membantu perencanaan jangka panjang.
- **Referensi:** [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** mulai dari impor data export game (JSON) yang sudah ada di proyek pembanding; simpan progres lokal dan tampilkan persentase per kategori.
- **Prioritas:** Tinggi.

#### A17. Perencanaan builder dan timeline upgrade

- **Temuan:** Keepwatch menyusun antrian upgrade builder/hero/Laboratorium dan menghitung kapan builder bebas; ClashPrime menyediakan "Time to Max" dengan simulasi rantai upgrade.
- **Tujuan fitur:** mengurangi waktu idle builder dan membantu pengguna menentukan urutan upgrade.
- **Referensi:** [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** tawarkan sebagai fitur pelengkap setelah katalog base stabil; simpan antrian lokal tanpa backend.
- **Prioritas:** Sedang.

#### A18. Widget layar utama untuk timer upgrade

- **Temuan:** Clash Trackers dan Keepwatch menyediakan widget layar utama dengan hitung mundur per detik; Clash Trackers menawarkan tiga gaya (List, Grid, Minimal) dan tema per widget.
- **Tujuan fitur:** memberi akses cepat ke status upgrade tanpa membuka aplikasi.
- **Referensi:** [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers), [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
- **Saran:** tunda sampai fitur timer upgrade berjalan; gunakan notifikasi lokal sebagai langkah awal yang lebih murah.
- **Prioritas:** Sedang.

#### A19. Notifikasi selesai upgrade

- **Temuan:** Clash Trackers mengirim notifikasi saat builder/Laboratorium/pet selesai dengan suara game; Keepwatch menyediakan pengingat yang dapat dimatikan.
- **Tujuan fitur:** mencegah builder idle dan meningkatkan retensi harian.
- **Referensi:** [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers), [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
- **Saran:** gunakan notifikasi lokal; hormati Do Not Disturb; jangan minta akun.
- **Prioritas:** Sedang.

#### A20. Manajemen multi-akun

- **Temuan:** ClashPrime, Clash Trackers, dan Clash of Helper mendukung banyak akun dengan data terpisah (level, favorit, waktu sinkron terakhir) dan widget per akun.
- **Tujuan fitur:** mendukung pengguna dengan beberapa desa tanpa kehilangan konteks.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers), [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** tunda sampai ada kebutuhan nyata; simpan akun lokal dengan tag pemain; jangan wajibkan login.
- **Prioritas:** Rendah (membutuhkan model data dan UI tambahan).

#### A21. Pelacakan perang klan real-time

- **Temuan:** ClashPrime dan Clash of Helper menyediakan pelacakan perang klan (serangan, pertahanan, CWL round, riwayat) dan statistik klan.
- **Tujuan fitur:** mendukung koordinasi klan dan analisis performa.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** tunda; membutuhkan API Clash of Clans dan autentikasi (token pengguna). Catat sebagai diferensiasi jangka menengah.
- **Prioritas:** Rendah (membutuhkan backend/API).

#### A22. Kalender event resmi dan pengingat

- **Temuan:** Clash of Helper dan ClashPrime menyediakan kalender event, hitung mundur, dan pengingat event.
- **Tujuan fitur:** menambah alasan harian pengguna membuka aplikasi.
- **Referensi:** [Clash of Helper](https://apps.apple.com/us/app/id6636552878), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** tunda sampai ada sumber data event yang stabil; mulai dari tautan ke halaman event resmi.
- **Prioritas:** Rendah.

#### A23. Kalkulator medali CWL

- **Temuan:** Clash of Helper menyediakan kalkulator medali Clan War League berdasarkan ukuran pertempuran, peringkat grup, kemenangan, dan bintang individu.
- **Tujuan fitur:** membantu klan memperkirakan hadiah sebelum perang.
- **Referensi:** [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** tunda; bergantung data CWL yang akurat. Catat sebagai fitur niche.
- **Prioritas:** Rendah.

#### A24. Berbagi base/pasukan sebagai tautan dan kartu

- **Temuan:** BaseVault menyediakan tautan pendek dengan gambar base; Clash of Helper mengekspor kartu pemain dan poster rekrutmen; ClashPrime menyediakan share card pasukan.
- **Tujuan fitur:** mendukung koordinasi klan dan promosi.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569), [Clash of Helper](https://apps.apple.com/us/app/id6636552878), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** mulai dari berbagi tautan layout yang sudah ada (skill A7); kartu visual dapat ditunda.
- **Prioritas:** Sedang.

#### A25. Koleksi komunitas dan rating base

- **Temuan:** Clash Base Pedia menyediakan bookmark cloud, riwayat unduhan, rating/komentar, dan unggah layout; BaseVault menyediakan "Top" (base paling banyak disalin) dan "Picks".
- **Tujuan fitur:** membantu penyaringan kualitas ketika koleksi besar.
- **Referensi:** [Clash Base Pedia](https://play.google.com/store/apps/details?id=com.clashbasepedia) (listing), [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569)
- **Saran:** tunda sampai ada backend dan moderasi; untuk versi lokal cukup "pilihan editor".
- **Prioritas:** Rendah (membutuhkan backend/akun).

#### A26. Analisis base berbasis AI (screenshot → strategi)

- **Temuan:** BaseVault menyediakan analisis layout dari tangkapan layar (titik lemah, laporan coach, strategi serangan, jalur upgrade) dengan kredit AI.
- **Tujuan fitur:** diferensiasi jangka panjang bagi pengguna yang ingin memahami base, bukan hanya menyalin.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569)
- **Saran:** jangan dijadikan MVP; butuh model ML dan backend. Catat sebagai ide jangka panjang.
- **Prioritas:** Rendah (membutuhkan backend/ML).

#### A27. Vault klan privat

- **Temuan:** BaseVault menyediakan "Clan Vault" privat untuk menyimpan dan membagikan base/pasukan ke anggota klan via kode vault.
- **Tujuan fitur:** mendukung koordinasi klan tanpa backend publik.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569)
- **Saran:** tunda; membutuhkan backend dan autentikasi. Untuk versi lokal, cukup ekspor/impor berkas.
- **Prioritas:** Rendah (membutuhkan backend/akun).

#### A28. Panduan strategi dan ensiklopedia game offline

- **Temuan:** Database for Clash of Clans dan House of Clashers menyediakan database offline bangunan, pasukan, mantra, statistik, walkthrough, strategi serangan, dan desain base.
- **Tujuan fitur:** menambah nilai edukasi dan mengurangi ketergantungan jaringan.
- **Referensi:** [Database for Clash of Clans™ (unofficial)](https://apps.apple.com/us/app/id898757582), [House of Clashers: Clash Guide](https://apps.apple.com/us/app/id653987498)
- **Saran:** pertimbangkan sebagai fitur pelengkap setelah katalog base stabil; data dapat dibundel sebagai aset JSON.
- **Prioritas:** Sedang.

#### A29. Kalkulator Zap + Quake dan Giant Arrow

- **Temuan:** ClashPrime menyediakan kalkulator Zap+Quake per bangunan dan perencana Giant Arrow (panah Ratu Pemanah) pada tangkapan layar base.
- **Tujuan fitur:** alat bantu niche bagi pengguna yang menyusun serangan.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** tunda; niche dan membutuhkan data game. Catat sebagai diferensiasi jangka panjang.
- **Prioritas:** Rendah.

#### A30. Onboarding dengan penjelasan sumber data

- **Temuan:** ClashPrime menyediakan onboarding terpandu (konfirmasi profil, pilih Town Hall, slide Data & Kredit yang menjelaskan sumber data) sebelum masuk aplikasi.
- **Tujuan fitur:** membangun kepercayaan dan transparansi sumber data.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** terapkan versi sederhana pada rilis pertama: layar sambutan + penjelasan sumber base.
- **Prioritas:** Sedang.

### Batch 3 — temuan dari 10 APK (2026-11-14, sesi 93)

#### A31. Army links (komposisi pasukan) per Town Hall

- **Temuan:** COC Base Links menyediakan Pro Army Links untuk setiap level TH (mis. e-drag spam, Queen Walk Hybrid); Clash Champs (update "ARMY IQ", Nov 2026) menampilkan top armies, community attacks, dan Master Classes langkah demi langkah.
- **Tujuan fitur:** melengkapi galeri base dengan rekomendasi serangan; membantu pemain memasangkan base dengan komposisi pasukan yang benar.
- **Referensi:** [COC Base Links – Clash Layouts](https://play.google.com/store/apps/details?id=com.rpekka.cocbaselinks), [Clash Champs: Pro Base Layouts](https://play.google.com/store/apps/details?id=com.clash.champs)
- **Saran:** mulai dari tautan/teks komposisi pasukan per base (field opsional, mis. `armyLinks`), tampilkan pada layar detail, dan sediakan copy komposisi pasukan seperti copy base. Jangan klaim AI pada versi awal.
- **Prioritas:** Sedang.

#### A32. Pengingat sebelum serangan perang habis dan shield drop

- **Temuan:** COC Base Links menyediakan notifikasi pintar sebelum serangan perang kedaluwarsa dan saat shield hampir habis; Clash of Helper menyediakan "daily timers" (6 hitung mundur reset termasuk Raid Weekend, Clan Games, dan Season Bank).
- **Tujuan fitur:** mencegah kehilangan serangan perang dan melindungi sumber daya saat shield habis.
- **Referensi:** [COC Base Links – Clash Layouts](https://play.google.com/store/apps/details?id=com.rpekka.cocbaselinks), [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** pengingat lokal opsional dengan preferensi per jenis (perang/shield/reset); simpan lokal; jangan wajibkan akun; kerjakan setelah fitur pengingat upgrade stabil.
- **Prioritas:** Sedang.

#### A33. Coaching komposisi pasukan berbasis AI ("ARMY IQ")

- **Temuan:** Clash Champs menampilkan ARMY IQ: analisis serangan dan rekomendasi pasukan dengan AI, Master Classes, dan langganan "pro" berbayar. Ulasan pengguna memuat keluhan tentang langganan ("scam") sehingga kepercayaan terhadap monetisasi pro rapuh.
- **Tujuan fitur:** diferensiasi belajar serangan jangka panjang.
- **Referensi:** [Clash Champs: Pro Base Layouts](https://play.google.com/store/apps/details?id=com.clash.champs)
- **Saran:** jangan dijadikan fitur MVP; membutuhkan backend/ML dan moderasi kualitas. Catatan anti-pola: jangan kunci konten dasar di balik langganan.
- **Prioritas:** Rendah (butuh backend/ML).

#### A34. Akses offline untuk base yang di-bookmark

- **Temuan:** Ultimate Pro Base Layouts menyediakan akses offline untuk base yang di-bookmark (lihat tanpa koneksi).
- **Tujuan fitur:** pengguna tetap dapat melihat base tersimpan tanpa jaringan (mis. sebelum war atau di tempat tanpa sinyal), melengkapi PRD katalog lokal/offline (A4) dan favorit (A5).
- **Referensi:** [Ultimate Pro Base Layouts](https://play.google.com/store/apps/details?id=com.coc.bases)
- **Saran:** unduh/simpan gambar (thumbnail + detail) base favorit ke storage lokal saat ditandai; tampilkan indikator "tersedia offline" pada favorit; tetap hormati batas penyimpanan.
- **Prioritas:** Sedang.

## B. Optimasi Fitur Eksisting

Kondisi aktual proyek: **belum ada fitur inti** (hanya halaman counter bawaan). Karena itu tidak ada fitur sejenis yang dapat dibandingkan secara langsung dengan kompetitor. Bagian ini memuat arahan kualitas pra-implementasi agar fitur yang nanti dibangun tidak mengulang kelemahan kompetitor.

#### B1. Standar keandalan aksi "Copy Base" (belum diimplementasikan)

- **Fitur pada proyek:** belum ada; direncanakan sebagai fitur inti.
- **Referensi:** [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster), [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts)
- **Perbandingan:** ulasan ClasherPro memuat keluhan "cannot copy base into coc game", dan ulasan CoC Base Maps menyebut tautan tidak valid setelah iklan ditonton. Kompetitor yang lebih matang memvalidasi tautan dan memberi instruksi lanjutan.
- **Potensi peningkatan:** validasi format tautan saat data dimuat, sediakan fallback salin manual, tampilkan status berhasil/gagal yang jelas, dan uji pada perangkat tanpa game terpasang.
- **Tujuan peningkatan:** mencegah kekecewaan pada aksi yang menjadi alasan utama pemasangan aplikasi.
- **Prioritas:** Tinggi (prasyarat kualitas).

#### B2. Standar kualitas katalog (belum diimplementasikan)

- **Fitur pada proyek:** belum ada; direncanakan sebagai galeri base.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps)
- **Perbandingan:** ulasan CoC Base Maps mengeluhkan iklan pada setiap klik kategori dan desain; kompetitor lain menonjolkan filter, thumbnail konsisten, dan pembaruan berkala.
- **Potensi peningkatan:** batasi iklan, pastikan setiap base memiliki metadata lengkap (TH/BH, tipe, gaya, status tautan), dan jaga konsistensi rasio thumbnail.
- **Tujuan peningkatan:** menjaga kenyamanan penelusuran dan kepercayaan pada kualitas data.
- **Prioritas:** Tinggi (prasyarat kualitas).

### Batch 2 — arahan pra-implementasi tambahan

#### B3. Standar keandalan widget dan notifikasi lokal (belum diimplementasikan)

- **Fitur pada proyek:** belum ada; direncanakan sebagai widget/timer upgrade.
- **Referensi:** [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers), [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
- **Perbandingan:** Clash Trackers menawarkan tema per widget dan tampilan waktu yang dapat dipilih; Keepwatch menyediakan pilihan tampilan waktu per widget. Aplikasi yang gagal memperbarui widget mendapat keluhan.
- **Potensi peningkatan:** uji widget pada berbagai ukuran dan tema; sediakan fallback notifikasi lokal jika widget tidak tersedia; hindari ketergantungan jaringan.
- **Tujuan peningkatan:** menjaga keandalan fitur harian dan mengurangi keluhan.
- **Prioritas:** Sedang (prasyarat kualitas).

#### B4. Standar data lokal dan impor game (belum diimplementasikan)

- **Fitur pada proyek:** belum ada; direncanakan impor data export game.
- **Referensi:** [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers)
- **Perbandingan:** Keepwatch mengimpor data export tanpa login; Clash Trackers membaca clipboard otomatis saat sync; ClashPrime mengimpor JSON dengan validasi.
- **Potensi peningkatan:** validasi format impor, tangani teks panjang/rusak, simpan data per akun, dan sediakan ekspor cadangan.
- **Tujuan peningkatan:** menjaga integritas data lokal dan mengurangi kesalahan pengguna.
- **Prioritas:** Tinggi (prasyarat kualitas).

### Batch 3 — arahan pra-implementasi/optimasi tambahan

#### B5. Standar impor clipboard satu tap (Clipboard → Terapkan)

- **Fitur pada proyek:** sudah ada — impor Data Export dan pelacakan progres upgrade desa (diimplementasikan sesi 51, `prd/prd_upgrade_progress_desa.md`).
- **Referensi:** [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
- **Perbandingan:** Keepwatch menurunkan impor menjadi "copy export di game → satu tap Import village", menangani teks yang sangat panjang/rusak, mempertahankan end time upgrade yang sedang berjalan dari export, memuat gambar kategori secara lazy, dan mengunci TH18 sampai Inferno Artillery level 5 (mengikuti game).
- **Potensi peningkatan:** dukung tempel langsung dari clipboard (periksa clipboard saat layar impor dibuka + tombol "Tempel & Terapkan"), toleransi teks panjang/rusak lebih baik, pertahankan `endTime` upgrade berjalan dari export, lazy-load gambar per kategori, dan terapkan kunci level TH sesuai game.
- **Tujuan peningkatan:** menurunkan gesekan pada fitur progres upgrade yang sudah berjalan dan mengurangi kesalahan impor.
- **Prioritas:** Tinggi (prasyarat kualitas).

#### B6. Perhitungan diskon (Gold Pass, event, potion, helper) pada kalkulator progres

- **Fitur pada proyek:** kalkulator progres upgrade sudah ada (`progres_calculator.dart`); belum memperhitungkan diskon/potion.
- **Referensi:** [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176), [COC Base Links – Clash Layouts](https://play.google.com/store/apps/details?id=com.rpekka.cocbaselinks)
- **Perbandingan:** Keepwatch menghitung Gold Pass, diskon event, dan helpers ke dalam estimasi; COC Base Links menyediakan Potion Calculator (kapan upgrade selesai jika potion dipakai) dan Hero & Equipment Calculator (biaya ore, milestone level).
- **Potensi peningkatan:** tambahkan faktor diskon/potion sebagai input opsional pada kalkulator progres; tampilkan dua skenario (dengan dan tanpa diskon); dokumentasikan sumber diskon.
- **Tujuan peningkatan:** estimasi waktu/biaya lebih akurat bagi pengguna yang memakai Gold Pass/potion.
- **Prioritas:** Sedang.

#### B7. Cache-first dengan TTL dan refresh latar untuk katalog unduhan

- **Fitur pada proyek:** katalog lokal offline (PRD A4); mekanisme pembaruan katalog belum ditetapkan bila kelak mengunduh dari sumber daring.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Perbandingan:** ClashPrime memuat Base Library dari snapshot on-device lebih dulu (TTL 3 hari) lalu refresh di latar belakang; tab kembali instan. Katalog digabung dari dua sumber (ClashLy API + clash-bases statis), dedup berdasarkan layout link, di-interleave (3:2), dan dikelompokkan per tahun dengan urutan popularitas.
- **Potensi peningkatan:** jika `base_coc` kelak mengunduh pembaruan katalog, pakai pola cache-first + TTL + refresh latar; tentukan strategi dedup bila multi-sumber; jangan blokir UI; hormati prinsip offline-first.
- **Tujuan peningkatan:** pembaruan katalog tanpa mengorbankan kecepatan dan offline-first.
- **Prioritas:** Rendah.

## C. Referensi UI, UX, dan Layout

### Prioritas Tinggi

#### C1. Beranda berbasis kartu kategori

- **Pola yang diamati:** kompetitor membuka aplikasi dengan pilihan level Town Hall/Builder Hall dan tujuan base sebelum menampilkan daftar panjang; deskripsi menyebut "smart search & discovery" dan filter level/tipe.
- **Tujuan UI/UX:** memberi orientasi cepat dan mengurangi beban kognitif saat koleksi base besar.
- **Referensi:** [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net), [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020)
- **Saran:** susun beranda sebagai grid kartu kategori (TH, BH, Strategi) dengan label besar dan jumlah base; hindari menampilkan seluruh koleksi di beranda.
- **Prioritas:** Tinggi.

#### C2. Grid thumbnail dua kolom dengan badge level dan tipe

- **Pola yang diamati:** aplikasi galeri menampilkan kumpulan gambar base sebagai daftar visual; beberapa menyebut HD preview, filter, dan favorit pada kartu.
- **Tujuan UI/UX:** memungkinkan pemindaian cepat banyak layout tanpa membuka satu per satu.
- **Referensi:** [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps), [Map Layout Links Base for COC](https://play.google.com/store/apps/details?id=com.coc.layouts)
- **Saran:** gunakan `GridView` dua kolom dengan rasio gambar seragam, badge TH/BH di kiri atas, label tipe di bawah, dan tombol favorit di kanan atas.
- **Prioritas:** Tinggi.

#### C3. Layar detail dengan tombol aksi utama yang menetap

- **Pola yang diamati:** alur yang ditekankan kompetitor adalah preview besar lalu tindakan copy; tombol copy menjadi aksi utama, bukan aksi tersembunyi.
- **Tujuan UI/UX:** memastikan pengguna dapat menyelesaikan tugas utama dalam satu layar tanpa menggulir mencari tombol.
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [COC Base Layouts Design links](https://play.google.com/store/apps/details?id=com.srsapps.new_clash_base_layouts_direct_link)
- **Saran:** tempatkan gambar base di area utama, metadata ringkas di bawahnya, dan tombol "Copy Base" pada `bottomNavigationBar` atau `SafeArea` bawah agar selalu terlihat.
- **Prioritas:** Tinggi.

#### C4. Filter ringkas berupa chip atau bottom sheet

- **Pola yang diamati:** kompetitor menyediakan filter TH/BH/tipe/gaya; sebagian menyebut "powerful filters" dan "smart filters" tanpa meninggalkan halaman daftar.
- **Tujuan UI/UX:** mempersempit hasil tanpa memaksa pengguna berpindah halaman dan kehilangan konteks.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop)
- **Saran:** tampilkan chip filter aktif di atas grid dan buka pilihan lengkap melalui `showModalBottomSheet`; sertakan tombol "Reset".
- **Prioritas:** Tinggi.

#### C5. State kosong, memuat, dan gagal yang eksplisit

- **Pola yang diamati:** tidak semua kompetitor menangani kondisi ini dengan baik; keluhan tautan invalid dan hasil pencarian kosong muncul pada ulasan.
- **Tujuan UI/UX:** menghindari kebingungan saat data untuk level tertentu belum tersedia atau pemuatan gagal.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster)
- **Saran:** sediakan `EmptyStateView` dengan saran mengubah filter, indikator loading pada grid, dan tombol "Coba lagi" pada error.
- **Prioritas:** Tinggi.

#### C6. Umpan balik jelas setelah menyalin base

- **Pola yang diamati:** alur kompetitor berakhir dengan pengguna membuka Clash of Clans dan menempelkan layout; tanpa instruksi, pengguna bingung ketika game tidak terbuka otomatis.
- **Tujuan UI/UX:** memastikan pengguna tahu langkah berikutnya dan menurunkan persepsi "copy gagal".
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster)
- **Saran:** tampilkan `SnackBar` atau dialog singkat berisi status salin, tombol "Buka Clash of Clans", dan petunjuk satu langkah.
- **Prioritas:** Tinggi.

### Prioritas Sedang

#### C7. Navigasi bawah tiga sampai empat tab

- **Pola yang diamati:** aplikasi sejenis memisahkan beranda, kategori, favorit, dan pengaturan; pemisahan ini konsisten dengan fitur yang mereka tonjolkan.
- **Tujuan UI/UX:** memberi akses tetap ke area utama tanpa menu tersembunyi.
- **Referensi:** [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps)
- **Saran:** gunakan `NavigationBar` dengan tab Beranda, Favorit, dan Pengaturan pada MVP; tambahkan tab Kategori bila koleksi bertambah.
- **Prioritas:** Sedang.

#### C8. Mode gelap dan terang yang konsisten

- **Pola yang diamati:** Base Drop dan Maps For COC menyebut mode gelap/terang sebagai fitur kenyamanan; kompetitor lain menonjolkan tampilan modern.
- **Tujuan UI/UX:** kenyamanan membaca dalam durasi lama, terutama saat membandingkan banyak gambar base.
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps)
- **Saran:** gunakan `ThemeData` terang dan gelap berbasis `ColorScheme` yang sama, hormati `themeMode` sistem, dan uji kontras badge pada kedua mode.
- **Prioritas:** Sedang.

#### C9. Iklan minimal dan tidak mengganggu alur copy

- **Pola yang diamati:** ulasan CoC Base Maps mengeluhkan iklan pada setiap klik kategori dan desain; aplikasi dengan keluhan serupa mendapat rating lebih rendah.
- **Tujuan UI/UX:** menjaga alur utama tetap cepat dan mengurangi risiko pengguna meninggalkan aplikasi.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net)
- **Saran:** jika monetisasi diperlukan, hindari interstitial pada aksi copy dan batasi penempatan pada layar yang tidak menghambat tugas utama.
- **Prioritas:** Sedang.

### Prioritas Rendah

#### C10. Penanda trap dan legenda pada preview

- **Pola yang diamati:** CoC Base Maps menyebut penanda trap pada preview HD apabila disediakan pembuat layout.
- **Tujuan UI/UX:** membantu pengguna teknis memahami detail pertahanan tanpa membuka game.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts)
- **Saran:** sediakan legenda opsional yang dapat dimatikan; tunda sampai data trap tersedia dan akurat.
- **Prioritas:** Rendah.

### Batch 2 — pola UI/UX/layout tambahan

#### C11. Onboarding terpandu dengan penjelasan sumber data

- **Pola yang diamati:** ClashPrime menyediakan onboarding terpandu (konfirmasi profil, pilih Town Hall, slide Data & Kredit) sebelum masuk aplikasi; House of Clashers menyediakan panduan pemula.
- **Tujuan UI/UX:** membangun kepercayaan dan mengurangi kebingungan pada rilis pertama.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [House of Clashers: Clash Guide](https://apps.apple.com/us/app/id653987498)
- **Saran:** terapkan versi sederhana: layar sambutan + penjelasan sumber base + tombol lewati.
- **Prioritas:** Sedang.

#### C12. Navigasi bawah dengan tab yang dapat di-scroll/grup

- **Pola yang diamati:** ClashPrime menggunakan icon-only bottom navigation dengan grup tab yang dapat digeser (prev/next) saat tab meluap; Clash Trackers menggunakan short navigation bar.
- **Tujuan UI/UX:** menjaga akses ke area utama tanpa menyembunyikan menu.
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers)
- **Saran:** mulai dari 3-4 tab tetap (Beranda, Favorit, Pengaturan); tambahkan grup saat fitur bertambah.
- **Prioritas:** Sedang.

#### C13. Filter yang collapse saat scroll

- **Pola yang diamati:** Clash Trackers membuat chip filter memudar dan collapse saat pengguna menggulir daftar, lalu muncul kembali di atas.
- **Tujuan UI/UX:** memberi ruang lebih untuk konten tanpa kehilangan akses filter.
- **Referensi:** [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers)
- **Saran:** terapkan pada daftar base yang panjang; pastikan filter tetap dapat diakses via tombol.
- **Prioritas:** Rendah.

#### C14. Tipografi khas untuk heading dan angka

- **Pola yang diamati:** Clash Trackers memakai font Lilita One untuk heading/angka/badge dan tabular system font untuk body; BaseVault memakai desain modern dengan badge level.
- **Tujuan UI/UX:** memperkuat identitas visual dan keterbacaan angka (timer, statistik).
- **Referensi:** [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers), [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569)
- **Saran:** gunakan `FontFeature.tabularFigures()` untuk angka timer; pertimbangkan satu font display kustom.
- **Prioritas:** Rendah.

#### C15. Tema widget yang dapat dipilih per widget

- **Pola yang diamati:** Clash Trackers menyediakan 5 tema widget (Material You, Clash, Dark, Material pitch dark, Light) dengan override per widget; Keepwatch menyediakan pilihan tampilan waktu per widget.
- **Tujuan UI/UX:** personalisasi tampilan widget sesuai preferensi pengguna.
- **Referensi:** [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers), [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
- **Saran:** tunda sampai widget tersedia; mulai dari tema sistem + mode gelap.
- **Prioritas:** Rendah.

#### C16. Mode gelap sebagai default dengan toggle

- **Pola yang diamati:** BaseVault menjadikan mode gelap sebagai default (dapat diubah di pengaturan); House of Clashers menambahkan mode gelap pada versi 2.1.20.
- **Tujuan UI/UX:** kenyamanan membaca pada durasi lama dan estetika modern.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569), [House of Clashers: Clash Guide](https://apps.apple.com/us/app/id653987498)
- **Saran:** hormati `themeMode` sistem; sediakan toggle manual; uji kontras badge pada kedua mode.
- **Prioritas:** Sedang.

#### C17. Grid responsif untuk tablet

- **Pola yang diamati:** BaseVault menampilkan 2 kolom portrait / 3 kolom landscape pada iPad; Clash of Helper mengoptimasi layout untuk iPad dan layar besar.
- **Tujuan UI/UX:** memanfaatkan ruang layar besar tanpa mengorbankan keterbacaan.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569), [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** gunakan `LayoutBuilder`/`MediaQuery` untuk menentukan jumlah kolom; uji pada ponsel dan tablet.
- **Prioritas:** Rendah.

#### C18. Badge kualitas map dan rating pengguna pada kartu

- **Pola yang diamati:** Quick Copy menambahkan indikator kualitas map dan sistem rating pengguna pada versi 10.0.5; BaseVault menampilkan nomor dan tanggal publikasi pada kartu base.
- **Tujuan UI/UX:** membantu pengguna memilih base berkualitas tanpa membuka detail.
- **Referensi:** [Clash Base Layout | Quick Copy](https://clash-maps-autocopy.en.aptoide.com/app) (listing), [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569)
- **Saran:** mulai dari badge sederhana (TH/BH, tipe, tanggal); rating komunitas tunda sampai ada backend.
- **Prioritas:** Sedang.

#### C19. Kartu base dengan nomor dan tanggal publikasi

- **Pola yang diamati:** BaseVault menampilkan nomor base pada gambar dan tanggal publikasi agar pengguna cepat menemukan base baru.
- **Tujuan UI/UX:** memberi orientasi pada koleksi yang besar.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569)
- **Saran:** tambahkan metadata tanggal pada model base; tampilkan sebagai badge kecil pada kartu.
- **Prioritas:** Rendah.

#### C20. Empty state dengan saran mengubah filter

- **Pola yang diamati:** BaseVault dan ClashPrime menampilkan state kosong dengan saran (ubah filter, pilih Town Hall lain); Keepwatch menampilkan panduan pada layar kosong.
- **Tujuan UI/UX:** mencegah kebingungan saat data untuk level tertentu belum tersedia.
- **Referensi:** [BaseVault for Clash of Clans](https://apps.apple.com/us/app/id6774403569), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime), [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
- **Saran:** sediakan `EmptyStateView` dengan saran mengubah filter dan tombol "Coba lagi".
- **Prioritas:** Tinggi.

### Batch 3 — pola UI/UX/layout tambahan

#### C21. Toggle Grid/List view untuk koleksi base

- **Pola yang diamati:** Clash of Helper menyediakan "Grid and List views" untuk 20.000+ layout dengan copy satu ketuk; brankas: daftar panjang dapat dibaca sebagai teks atau sebagai visual.
- **Tujuan UI/UX:** fleksibilitas pemindaian (grid) versus pembacaan cepat metadata (list) tanpa mengganti layar.
- **Referensi:** [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
- **Saran:** toggle ikon grid/list pada `AppBar` daftar base; simpan preferensi pengguna (`SharedPreferences`); layout list memuat thumbnail kecil + metadata teks.
- **Prioritas:** Rendah.

#### C22. Badge "Populer"/"Trending" pada kartu base

- **Pola yang diamati:** Base Atlas menonjolkan Trending feed, Top Builders leaderboard, dan Creator Pulse (melacak likes/copies); Ultimate Pro Base Layouts menampilkan base pro kurasi.
- **Tujuan UI/UX:** membantu pengguna memilih base berkualitas tanpa membuka detail (melengkapi C18 badge kualitas/rating).
- **Referensi:** [Base Atlas](https://apps.apple.com/us/app/id6765773332), [Ultimate Pro Base Layouts](https://play.google.com/store/apps/details?id=com.coc.bases)
- **Saran:** untuk versi lokal, pakai copy count lokal (tanpa backend) sebagai dasar badge "Populer" atau "Pilihan editor"; trending komunitas dan leaderboard kreator membutuhkan backend — tunda.
- **Prioritas:** Sedang.

#### C23. Penempatan iklan sebagai rewarded video opsional

- **Pola yang diamati:** Base Atlas menyatakan satu-satunya iklan adalah rewarded video yang dipilih pengguna — tidak pernah dipaksa dan tidak mengganggu penelusuran.
- **Tujuan UI/UX:** monetisasi tanpa merusak alur utama (sejalan C9) dan tanpa keluhan rating.
- **Referensi:** [Base Atlas](https://apps.apple.com/us/app/id6765773332)
- **Saran:** jika monetisasi dibutuhkan, gunakan rewarded video opsional; jangan interstitial pada aksi copy; jangan blokir konten dengan iklan.
- **Prioritas:** Rendah.

#### C24. Empty state edukatif dengan panduan langkah

- **Pola yang diamati:** Keepwatch menampilkan panduan pada layar kosong; Base Atlas menekankan "no account or personal info required — jump in with a single tap"; ClashPrime menyediakan slide Data & Credits pada onboarding.
- **Tujuan UI/UX:** mengurangi kebingungan pengguna pertama pada fitur berbasis impor/Data Export (memperkuat C20/C5/C11).
- **Referensi:** [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176), [Base Atlas](https://apps.apple.com/us/app/id6765773332), [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** empty state berisi 2–3 langkah konkret (mis. "1. Salin Data Export di game → 2. Tempel di sini → 3. Tekan Terapkan") plus tombol langsung ke aksi utama.
- **Prioritas:** Sedang.

#### C25. Token desain konsisten dan skeleton loader

- **Pola yang diamati:** ClashPrime memakai palet monochrome dengan langkah 8pt, icon-only bottom navigation dengan grup tab yang dapat digeser saat tab meluap, dynamic theme engine (StyleSheet proxy), dan theme-aware skeleton loaders.
- **Tujuan UI/UX:** identitas visual konsisten dan pemuatan yang terasa cepat (memperkuat C8 mode gelap/terang dan C12).
- **Referensi:** [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime)
- **Saran:** pertahankan `ColorScheme`/token Material 3; pertimbangkan skala spacing 8pt dan skeleton loader pada grid; jangan menyalin palet atau identitas mentah kompetitor.
- **Prioritas:** Rendah.

## D. Katalog Listing

| Nama Aplikasi | Ringkasan Singkat | Store | Link | Status Analisa |
| --- | --- | --- | --- | --- |
| COC Base Layouts Design links | Galeri base TH4–TH16 dan BH4–BH10 dengan copy langsung ke game dan kategori war/farming/trophy/hybrid/lucu. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.srsapps.new_clash_base_layouts_direct_link) | Sudah Dianalisa |
| COC Base Layouts:Clash of Maps | Ribuan base TH4–TH18 dan BH4–BH10, copy satu klik, kategori CWL dan ring base. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020) | Sudah Dianalisa |
| Coc Base Layout 2026 | Katalog TH3–TH18 dan BH3–BH10 dengan pencarian, filter, preview, favorit, rating, dan unggah komunitas. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.cocbase.net) | Sudah Dianalisa |
| clashOFbase - COC Base Layouts | Galeri TH4–TH16 dan BH4–BH9 dengan one-click copy, video strategi, dan konten komunitas. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.namaari.clashofbase) | Sudah Dianalisa |
| Maps For COC Base Layouts 2026 | 5000+ base TH4–TH18 dan BH4–BH10, preview HD, favorit, tema gelap, tracker dan planner upgrade. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps) | Sudah Dianalisa |
| Base Drop - Clash Base Layouts | Katalog TH4–TH18 dengan AI base finder, replay pertahanan, filter, favorit, berbagi, dan cloud sync. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.cocbasedrop) | Sudah Dianalisa |
| Map Layout Links Base for COC | Galeri TH1–TH17 dan BH1–BH10 dengan copy satu klik, zoom, favorit, dan unggah base via akun. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.coc.layouts) | Sudah Dianalisa |
| ClasherPro - Base Layout Map | Katalog home village dan builder base dengan copy link, komentar/rating, berbagi, berita, dan panduan. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster) | Sudah Dianalisa |
| CoC Base Maps 2026 – Fan App | Katalog TH4–TH17, BH4–BH10, dan Clan Capital dengan preview HD, filter, favorit, dan riwayat. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts) | Sudah Dianalisa |
| Notificlash: Tracker for CoC | Pengingat upgrade builder, laboratorium, pet, dan hero dengan widget, impor JSON, dan akses offline. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.efertre.notificapp) | Sudah Dianalisa |
| COC Base Links – Clash Layouts | Katalog base TH4–TH17 dan BH4–BH10 dengan copy link, filter, kalkulator upgrade, statistik pemain, dan pengingat perang. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.rpekka.cocbaselinks) | Sudah Dianalisa |
| Fanatic App for Clash of Clans | Galeri base TH4–TH18 dan BH4–BH10 untuk farming, ranked, clan war, progress, dan base artistik; copy link dan copy komposisi pasukan. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=clashfanatic.tips.guide.clashofclans) | Belum Dianalisa |
| Clash Champs: Pro Base Layouts | Koleksi base pro per Town Hall, clan war, dan farming—termasuk layout dari juara dunia—dengan favorit dan berita. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.clash.champs) | Sudah Dianalisa |
| Maps of Clash of Clans 2026 | Katalog map TH1–TH18 dan BH1–BH10 untuk war, farming, trophy, hybrid dengan zoom, like/bagikan, dan unduh peta. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.moonstudio.mapcoc) | Belum Dianalisa |
| Clash Base Pedia | Komunitas 10.000+ base link dengan filter TH/BH, tipe, dan tag pertahanan; bookmark cloud, riwayat unduhan, rating/komentar, unggah layout, direktori clan dan pemain. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.clashbasepedia) | Sudah Dianalisa |
| ClashPrime | Companion all-in-one: progress tracker, army, buildings, war, events, base library, army library, hero journey, saved, zapquaker, giant arrow, BOB planner, multi-akun, onboarding, timers, version checker. | GitHub | [Buka Repositori](https://github.com/FarhanZafarr-9/ClashPrime) | Sudah Dianalisa |
| Clash Trackers | Pelacakan timer upgrade Home Village dan Builder Base, widget layar utama (List/Grid/Minimal), boost, multi-akun, notifikasi, Material 3 Expressive, adaptive layout, i18n, offline. | GitHub | [Buka Repositori](https://github.com/Killersparrow1/clash-Trackers) | Sudah Dianalisa |
| BaseVault for Clash of Clans | Katalog base harian 10.000+, AI analisis base dari tangkapan layar, Clan Vault, upgrade planner, Top/Picks, berbagi base, multi-bahasa. | Apple App Store | [Buka Aplikasi](https://apps.apple.com/us/app/id6774403569) | Sudah Dianalisa |
| Clash of Helper | Multi-akun, pelacakan perang real-time, kalender event, progress upgrade, 20.000+ base layout, kalkulator CWL, share cards/poster, leaderboards, smart search, 17 bahasa. | Apple App Store | [Buka Aplikasi](https://apps.apple.com/us/app/id6636552878) | Sudah Dianalisa |
| Keepwatch for Clash of Clans | Pelacakan upgrade (sisa waktu/sumber daya per kategori), perencanaan builder, timeline, pengingat, widget, sync multi-perangkat, pembaruan data game otomatis. | Apple App Store | [Buka Aplikasi](https://apps.apple.com/us/app/id6828926176) | Sudah Dianalisa |

### Batch 3 — katalog listing (2026-11-14, sesi 93; 10 APK terverifikasi ulang/dianalisa)

| Nama Aplikasi | Ringkasan Singkat | Store | Link | Status Analisa |
| --- | --- | --- | --- | --- |
| COC Base Links – Clash Layouts | Katalog base TH4–TH17 dan BH4–BH10 (farming, trophy, war, turnamen, artistik), army links pro per TH, Clash Stats (trophy/war/donasi), kalkulator (upgrade time, CWL medal, hero & equipment, potion), notifikasi perang/shield, dark mode otomatis, multi-bahasa. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.rpekka.cocbaselinks) | Sudah Dianalisa |
| Clash Base Pedia (with links) | Komunitas 50.000+ base link, copy resmi via CoC API, filter TH4–TH14 dan BH, tag pertahanan (anti-2/3 star, E-Drag, Peka smash, Bowlers, Lava-Loons), bookmark cloud, riwayat unduhan, rating/komentar, upload layout, clan/player CV, 1M+ unduhan. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.clashbasepedia) | Sudah Dianalisa |
| Clash Champs: Pro Base Layouts | Koleksi base pro per TH termasuk layout juara dunia 2023, favorit, berita; update "ARMY IQ" (Nov 2026): top armies, community attacks, AI coaching, Master Classes; model berbayar/berlangganan (ulasan memuat keluhan "scam"). | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.clash.champs) | Sudah Dianalisa |
| Clashlayout | Komunitas-driven mobile-first: TH layouts, one-tap copy, upload base sendiri, favorit, community rewards, UI sederhana & modern; 500+ unduhan; peringatan keamanan data (data tidak terenkripsi saat transit). | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.algorithmnp.clashlayout) | Sudah Dianalisa |
| Ultimate Pro Base Layouts | Ribuan base TH–BH18/CWL/Legend/Ring/Funny, copy satu klik, search & filter (TH, tipe, strategi), bookmark & bagikan, akses offline untuk base favorit, strategy guides. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.coc.bases) | Sudah Dianalisa |
| ClashPrime | Companion open source (MIT, React Native/Expo): Base Library gabungan ClashLy API + clash-bases static (dedup by layout link, interleave 3:2, grouped by year, popularitas, snapshot 3 hari cache-first, refresh latar), Saved/favorit, Import/Export CoC JSON, Time to Max (chain-scheduled), multi-akun, zapquaker, giant arrow, onboarding Data & Credits, Obtanium + version checker. | GitHub | [Buka Repositori](https://github.com/FarhanZafarr-9/ClashPrime) | Sudah Dianalisa |
| Coc-Base-Layout | Aplikasi Android (Java/Kotlin) penyedia base layout; repositori minimal: 2 commit, tanpa README, tanpa deskripsi, tanpa APK di releases; tidak ada fitur referensi yang dapat diambil. | GitHub | [Buka Repositori](https://github.com/mhmdmydn/Coc-Base-Layout) | Sudah Dianalisa |
| Base Atlas | Community base library: satu ketuk copy, filter TH/BH, kategori Progress & Art & Funny; profil pembangun publik (avatar, badge, galeri), follow builder, Trending feed, Top Builders leaderboard, Creator Pulse (likes/copies), pin base terbaik & simpan pencarian, moderasi otomatis unggahan (screen gambar+teks) + lapor, iklan rewarded opsional, tanpa akun, founder slots (100 pertama ad-free permanen). | Apple App Store | [Buka Aplikasi](https://apps.apple.com/us/app/id6765773332) | Sudah Dianalisa |
| Keepwatch for Clash of Clans | Impor Data Export tanpa login (copy di game → satu tap Import village), sisa upgrade per kategori (HV+BB) dengan estimasi waktu/sumber daya, gold pass/event/helper discounts, plan builders (kapan builder bebas), timeline day-by-day, pengingat selesai upgrade, widget time display, game data auto-update, 22 bahasa. | Apple App Store | [Buka Aplikasi](https://apps.apple.com/us/app/id6828926176) | Sudah Dianalisa |
| Clash of Helper | Assistant all-in-one: events & calendar hub, multi-account hub (2–20 desa), live war & daily timers (6 reset countdowns), progress upgrade TH4–18/BH4–10 (level-capped), 20.000+ base layouts (Grid/List view, copy satu ketuk), CWL medal calculator, share cards/poster rekrutmen, leaderboards 200+ negara + arsip season, smart search keyboard (validasi tag, # auto-complete), 17 bahasa. | Apple App Store | [Buka Aplikasi](https://apps.apple.com/us/app/id6636552878) | Sudah Dianalisa |

## E. Prioritas Gabungan

| Urutan | Item | Jenis | Alasan |
| --- | --- | --- | --- |
| 2 | A2 Copy base link satu ketuk | Fitur | Inti nilai aplikasi dan alasan utama pengguna memasang aplikasi sejenis. |
| 3 | C3 Tombol aksi utama menetap | UI/UX | Menjamin fitur inti dapat diselesaikan tanpa hambatan navigasi. |
| 4 | C6 Umpan balik setelah menyalin | UI/UX | Mengurangi persepsi gagal copy yang dikeluhkan pada kompetitor. |
| 5 | A3 Preview HD dan zoom | Fitur | Meningkatkan keyakinan sebelum menyalin layout. |
| 6 | A4 Katalog lokal/offline-first | Fitur | Menjaga aplikasi tetap berguna dan menunda kebutuhan backend. |
| 7 | C2 Grid thumbnail dengan badge | UI/UX | Mempercepat pemindaian koleksi base. |
| 8 | C5 State kosong, memuat, gagal | UI/UX | Mencegah kebingungan saat data belum tersedia. |
| 9 | A5 Favorit lokal | Fitur | Retensi dan persiapan perang klan. |
| 10 | A6 Tag strategi lanjutan | Fitur | Membedakan base sesuai meta serangan. |
| 11 | C4 Filter chip/bottom sheet | UI/UX | Menjaga konteks saat mempersempit hasil. |
| 12 | A7 Berbagi base ke klan | Fitur | Mendukung koordinasi klan. |
| 13 | A8 Panduan singkat per base | Fitur | Menambah pemahaman, bukan sekadar menyalin. |
| 14 | A9 Kategori Clan Capital | Fitur | Perluasan cakupan setelah katalog inti stabil. |
| 15 | A10 Pengingat upgrade | Fitur | Nilai harian tambahan; bersifat opsional. |
| 16 | C7 Navigasi bawah | UI/UX | Struktur navigasi jangka menengah. |
| 17 | C8 Mode gelap/terang | UI/UX | Kenyamanan membaca. |
| 18 | C9 Iklan minimal | UI/UX | Menjaga kualitas pengalaman dan rating. |
| 19 | A11 Base lucu/progress | Fitur | Variasi konten pelengkap. |
| 20 | A12 Rating/komentar komunitas | Fitur | Butuh backend dan moderasi. |
| 21 | A13 Unggah base/cloud sync | Fitur | Butuh autentikasi dan backend. |
| 22 | A14 AI base finder | Fitur | Butuh model dan backend; diferensiasi jangka panjang. |
| 23 | A15 Video replay | Fitur | Butuh hosting video dan moderasi. |
| 24 | C10 Penanda trap | UI/UX | Bergantung ketersediaan data trap yang akurat. |
| 25 | A16 Pelacakan progres upgrade desa | Fitur | Alasan harian membuka aplikasi; membutuhkan impor data game. |
| 26 | B4 Standar data lokal dan impor game | Optimasi | Prasyarat kualitas untuk impor data export. |
| 27 | A3 Preview HD dan zoom | Fitur | Meningkatkan keyakinan sebelum menyalin layout. |
| 28 | A4 Katalog lokal/offline-first | Fitur | Menjaga aplikasi tetap berguna dan menunda backend. |
| 29 | C20 Empty state dengan saran filter | UI/UX | Mencegah kebingungan saat data belum tersedia. |
| 30 | C2 Grid thumbnail dengan badge | UI/UX | Mempercepat pemindaian koleksi base. |
| 31 | C5 State kosong, memuat, gagal | UI/UX | Mencegah kebingungan saat data belum tersedia. |
| 32 | C4 Filter chip/bottom sheet | UI/UX | Menjaga konteks saat mempersempit hasil. |
| 33 | A5 Favorit lokal | Fitur | Retensi dan persiapan perang klan. |
| 34 | A6 Tag strategi lanjutan | Fitur | Membedakan base sesuai meta serangan. |
| 35 | A7 Berbagi base ke klan | Fitur | Mendukung koordinasi klan. |
| 36 | A8 Panduan singkat per base | Fitur | Menambah pemahaman, bukan sekadar menyalin. |
| 37 | A9 Kategori Clan Capital | Fitur | Perluasan cakupan setelah katalog inti stabil. |
| 38 | A10 Pengingat upgrade | Fitur | Nilai harian tambahan; bersifat opsional. |
| 39 | A17 Perencanaan builder dan timeline | Fitur | Mengurangi idle builder; pelengkap. |
| 40 | A18 Widget layar utama timer upgrade | Fitur | Akses cepat status upgrade. |
| 41 | A19 Notifikasi selesai upgrade | Fitur | Mencegah builder idle. |
| 42 | A24 Berbagi base/pasukan sebagai tautan | Fitur | Mendukung koordinasi klan. |
| 43 | A28 Panduan strategi offline | Fitur | Nilai edukasi; katalog stabil dulu. |
| 44 | A30 Onboarding dengan sumber data | Fitur | Membangun kepercayaan. |
| 45 | A11 Base lucu/progress | Fitur | Variasi konten pelengkap. |
| 46 | C1 Beranda berbasis kartu kategori | UI/UX | Orientasi cepat. |
| 47 | C3 Tombol aksi utama menetap | UI/UX | Menjamin fitur inti tanpa hambatan. |
| 48 | C6 Umpan balik setelah menyalin | UI/UX | Mengurangi persepsi gagal copy. |
| 49 | C7 Navigasi bawah | UI/UX | Struktur navigasi jangka menengah. |
| 50 | C8 Mode gelap/terang | UI/UX | Kenyamanan membaca. |
| 51 | C9 Iklan minimal | UI/UX | Menjaga kualitas pengalaman. |
| 52 | C11 Onboarding terpandu | UI/UX | Membangun kepercayaan. |
| 53 | C12 Navigasi bawah scroll/grup | UI/UX | Akses area utama. |
| 54 | C16 Mode gelap default | UI/UX | Estetika modern. |
| 55 | C18 Badge kualitas map | UI/UX | Membantu pilih base. |
| 56 | A12 Rating/komentar komunitas | Fitur | Butuh backend dan moderasi. |
| 57 | A13 Unggah base/cloud sync | Fitur | Butuh autentikasi dan backend. |
| 58 | A14 AI base finder | Fitur | Butuh model dan backend. |
| 59 | A15 Video replay | Fitur | Butuh hosting video. |
| 60 | A20 Manajemen multi-akun | Fitur | Butuh model data/UI. |
| 61 | A21 Pelacakan perang real-time | Fitur | Butuh API/autentikasi. |
| 62 | A22 Kalender event | Fitur | Butuh sumber data stabil. |
| 63 | A23 Kalkulator medali CWL | Fitur | Fitur niche. |
| 64 | A25 Koleksi komunitas | Fitur | Butuh backend/moderasi. |
| 65 | A26 Analisis base AI | Fitur | Butuh ML/backend. |
| 66 | A27 Vault klan privat | Fitur | Butuh backend/autentikasi. |
| 67 | A29 Kalkulator Zap/Quake | Fitur | Niche. |
| 68 | C10 Penanda trap | UI/UX | Bergantung data trap. |
| 69 | C13 Filter collapse saat scroll | UI/UX | Ruang konten. |
| 70 | C14 Tipografi khas | UI/UX | Identitas visual. |
| 71 | C15 Tema widget per widget | UI/UX | Personalisasi. |
| 72 | C17 Grid responsif tablet | UI/UX | Layar besar. |
| 73 | C19 Kartu base nomor/tanggal | UI/UX | Orientasi koleksi. |
| 74 | B5 Standar impor clipboard satu tap | Optimasi | Prasyarat kualitas fitur progres upgrade yang sudah berjalan. |
| 75 | A31 Army links per Town Hall | Fitur | Melengkapi galeri base dengan rekomendasi serangan. |
| 76 | A32 Pengingat serangan perang/shield | Fitur | Mencegah kehilangan serangan perang. |
| 77 | A34 Akses offline base bookmark | Fitur | Memperkuat offline-first untuk koleksi tersimpan. |
| 78 | B6 Diskon Gold Pass/event/potion pada kalkulator | Optimasi | Estimasi progres lebih akurat. |
| 79 | C22 Badge populer/trending lokal | UI/UX | Bantu pemilihan base berkualitas. |
| 80 | C24 Empty state edukatif | UI/UX | Kurangi kebingungan pengguna pertama (alur impor Data Export). |
| 81 | A33 Coaching AI ("ARMY IQ") | Fitur | Butuh backend/ML dan monetisasi; diferensiasi jangka panjang. |
| 82 | B7 Cache-first TTL katalog unduhan | Optimasi | Relevan bila katalog diperbarui dari sumber daring. |
| 83 | C21 Toggle Grid/List view | UI/UX | Fleksibilitas pemindaian daftar panjang. |
| 84 | C23 Iklan rewarded video opsional | UI/UX | Monetisasi tanpa hambatan; bila monetisasi dipilih. |
| 85 | C25 Token desain & skeleton loader | UI/UX | Identitas visual konsisten; muat terasa cepat. |

## F. Verifikasi dan Keterbatasan

- 10 tautan batch 1 (Google Play Store) diperiksa dengan `curl` dan mengembalikan HTTP 200 pada 2026-11-14.
- Batch 2 (10 APK) diverifikasi: 2 repositori GitHub (HTTP 200), 3 aplikasi Apple App Store (`resultCount = 1` via iTunes lookup), 5 aplikasi Google Play Store (HTTP 200). Listing APKPure/Aptoide (HTTP 403 anti-bot) tidak dijadikan dasar rekomendasi.
- Batch 3 (10 APK, sesi 93, 2026-11-14) diverifikasi dengan `webfetch`: 5 halaman Google Play Store terbaca (`com.rpekka.cocbaselinks`, `com.clashbasepedia`, `com.clash.champs`, `com.algorithmnp.clashlayout`, `com.coc.bases`); 2 repositori GitHub terbaca (`FarhanZafarr-9/ClashPrime` — README lengkap; `mhmdmydn/Coc-Base-Layout` — repositori ada, 2 commit, tanpa README, tanpa APK); 3 Apple App Store via iTunes lookup (`resultCount = 1`: id6765773332, id6828926176, id6636552878). Tidak ada `curl` dan tidak ada pembacaan piksel pada batch 3.
- `COC Baselinks` (Apple id6790808297, package id `com.rpekka.cocbaselinks`) adalah aplikasi yang sama dengan `COC Base Links – Clash Layouts`; tidak dianalisa terpisah untuk menghindari duplikasi.
- Inkonsistensi legacy diperbaiki pada batch 3: bagian D sebelumnya menandai `Fanatic App for Clash of Clans` dan `Maps of Clash of Clans 2026` sebagai `Sudah Dianalisa` tanpa konten analisa; keduanya dikoreksi menjadi `Belum Dianalisa` agar konsisten dengan `apk_kompetitor.md` dan skill `riset-kompetitor` aturan 24.
- Inkonsistensi tersisa (menunggu keputusan pengguna): `Clash Trackers` (GitHub, `Killersparrow1/clash-Trackers`) dan `BaseVault for Clash of Clans` (Apple, id6774403569) memiliki konten analisa batch 2 (mis. A17–A24, B3, C12–C15) tetapi `apk_kompetitor.md` masih menandai keduanya `Belum Dianalisa` karena batas 10 listing per analisa (skill aturan 30); skill melarang menandai listing di luar jumlah tersebut.
- `Clash Champs` (`com.clash.champs`) dipakai sebagai referensi pola (curated base juara dunia + "ARMY IQ"), bukan contoh kepercayaan: ulasan pengguna memuat keluhan langganan ("scam") dan pengembang mengubah model berbayar; catat sebagai risiko monetisasi.
- `Clashlayout` (`com.algorithmnp.clashlayout`) menampilkan peringatan keamanan data (data tidak dienkripsi saat transit; personal info dikumpulkan) — jangan ditiru apa adanya.
- `Coc-Base-Layout` tidak memiliki APK, README, maupun deskripsi; tidak dapat dijadikan dasar rekomendasi fitur.
- `Clash Base Pedia` dan `ClashPrime` bergantung pada layanan pihak ketiga (CoC API resmi, ClashLy API) untuk konten komunitas; adopsi memerlukan keputusan backend.
- Klaim fitur diambil dari deskripsi resmi pada halaman toko/repositori dan, untuk sebagian aplikasi, dari ulasan pengguna yang tampil di halaman tersebut.
- Halaman toko menyediakan tangkapan layar, tetapi laporan ini **tidak** melakukan pembacaan piksel atau pengujian langsung aplikasi. Pola UI/UX diidentifikasi dari label fitur, alur yang dijelaskan pada deskripsi, dan keluhan/pujian pada ulasan, bukan dari pengamatan visual terperinci.
- Jumlah unduhan dan rating tidak dijadikan dasar prioritas; prioritas ditentukan oleh relevansi terhadap kebutuhan `base_coc`.
- Tidak ada aplikasi di luar 10 listing batch 3 (dan 20 listing batch 1–2) pada `apk_kompetitor.md` yang dianalisa pada pembaruan ini; listing lain tetap berstatus `Belum Dianalisa`.
- `apk_serupa.md` tidak tersedia di root proyek; jika berkas itu muncul kemudian, katalog perlu ditinjau ulang.

## G. Sumber

1. [COC Base Layouts Design links](https://play.google.com/store/apps/details?id=com.srsapps.new_clash_base_layouts_direct_link)
2. [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020)
3. [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net)
4. [clashOFbase - COC Base Layouts](https://play.google.com/store/apps/details?id=com.namaari.clashofbase)
5. [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps)
6. [Base Drop - Clash Base Layouts](https://play.google.com/store/apps/details?id=com.cocbasedrop)
7. [Map Layout Links Base for COC](https://play.google.com/store/apps/details?id=com.coc.layouts)
8. [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster)
9. [CoC Base Maps 2026 – Fan App](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts)
10. [Notificlash: Tracker for CoC](https://play.google.com/store/apps/details?id=com.efertre.notificapp)

Batch 2 (sumber tercantum inline pada item A16–A30, B3–B4, C11–C20): ClashPrime, Clash Trackers, BaseVault, Clash of Helper, Keepwatch, Clash Base Pedia, Database for Clash of Clans™ (unofficial), House of Clashers.

Batch 3 (sesi 93, 2026-11-14):

11. [COC Base Links – Clash Layouts](https://play.google.com/store/apps/details?id=com.rpekka.cocbaselinks)
12. [Clash Base Pedia (with links)](https://play.google.com/store/apps/details?id=com.clashbasepedia)
13. [Clash Champs: Pro Base Layouts](https://play.google.com/store/apps/details?id=com.clash.champs)
14. [Clashlayout](https://play.google.com/store/apps/details?id=com.algorithmnp.clashlayout)
15. [Ultimate Pro Base Layouts](https://play.google.com/store/apps/details?id=com.coc.bases)
16. [ClashPrime (GitHub, MIT)](https://github.com/FarhanZafarr-9/ClashPrime)
17. [Coc-Base-Layout (GitHub)](https://github.com/mhmdmydn/Coc-Base-Layout)
18. [Base Atlas](https://apps.apple.com/us/app/id6765773332)
19. [Keepwatch for Clash of Clans](https://apps.apple.com/us/app/id6828926176)
20. [Clash of Helper](https://apps.apple.com/us/app/id6636552878)
