# Referensi APK Kompetitor base_coc

Laporan referensi dari 10 APK kompetitor yang terdaftar di `apk_kompetitor.md` dan berstatus `Belum Dianalisa`. Fokus laporan: fitur yang dapat ditambahkan, arahan optimasi, serta pola UI/UX/layout yang dapat dijadikan pembanding. Seluruh rekomendasi dibatasi pada fitur yang dapat berjalan di mobile Android.

## Informasi Riset

- Tanggal riset: 2026-11-14 (WIB).
- Aplikasi sasaran: `base_coc`, aplikasi penyedia base/layout Clash of Clans (submodule Flutter pada repositori `workspace`).
- Lingkup: 10 APK dari `apk_kompetitor.md`; hanya baris `Status Analisa = Belum Dianalisa`.
- Catatan lingkup: `apk_serupa.md` tidak ditemukan di root proyek; lingkup mengikuti `apk_kompetitor.md`.
- Metode: verifikasi tautan dengan `curl` (HTTP 200), pembacaan deskripsi resmi Google Play Store, dan pembacaan ulasan pengguna pada halaman toko.
- Tingkat verifikasi: 10 dari 10 listing **terverifikasi** (halaman toko terbaca).
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

## Kondisi Fitur Aktual Proyek

Berdasarkan `base_coc/README.md` dan `base_coc/lib/main.dart` per 2026-11-14:

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

#### A1. Galeri base terfilter per Town Hall dan tipe base

- **Temuan:** Seluruh kompetitor utama menyediakan katalog base yang dikelompokkan berdasarkan Town Hall, Builder Hall, dan tujuan pertahanan (war, farming, trophy, hybrid, CWL).
- **Tujuan fitur:** memungkinkan pengguna menemukan base yang sesuai level dan strategi tanpa menelusuri ratusan gambar.
- **Referensi:** [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020), [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net), [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts)
- **Saran:** gunakan struktur data `TownHallLevel`, `BuilderHallLevel`, `TipeBase`, dan `GayaBase`; tampilkan filter sebagai chip horizontal di atas grid. Untuk MVP, batasi pada TH dan tipe base agar data awal tidak terlalu besar.
- **Prioritas:** Tinggi.

#### A2. Copy base link satu ketuk

- **Temuan:** Kompetitor menjadikan tombol copy sebagai aksi utama; deskripsi menekankan "one-tap copy" dan pembukaan otomatis ke game.
- **Tujuan fitur:** menghilangkan pekerjaan menyusun ulang layout secara manual, yang merupakan alasan utama pengguna memasang aplikasi sejenis.
- **Referensi:** [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps), [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [Map Layout Links Base for COC](https://play.google.com/store/apps/details?id=com.coc.layouts)
- **Saran:** salin tautan resmi ke clipboard, tampilkan konfirmasi berisi tombol "Buka Clash of Clans", dan tangani kasus game tidak terpasang. Uji tautan sebelum rilis karena tautan invalid adalah keluhan utama pada kompetitor.
- **Prioritas:** Tinggi.

#### A3. Preview base resolusi tinggi dengan pinch-to-zoom

- **Temuan:** Beberapa kompetitor menyebut preview HD, zoom, dan penanda trap sebagai pembeda; pengguna memakai preview untuk memeriksa jarak pertahanan sebelum menyalin.
- **Tujuan fitur:** meningkatkan keyakinan pengguna bahwa layout layak dipakai dan mengurangi kesalahan memilih base.
- **Referensi:** [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps), [COC Base Layouts Design links](https://play.google.com/store/apps/details?id=com.srsapps.new_clash_base_layouts_direct_link)
- **Saran:** simpan gambar base dalam dua ukuran (thumbnail dan detail), gunakan `InteractiveViewer` untuk zoom, dan sediakan tombol reset zoom.
- **Prioritas:** Tinggi.

#### A4. Katalog lokal yang tetap berfungsi tanpa internet

- **Temuan:** Notificlash menonjolkan akses offline tanpa login; aplikasi galeri lain bergantung pada pembaruan data daring setiap hari.
- **Tujuan fitur:** menjaga pengalaman dasar tetap berjalan saat jaringan buruk dan mengurangi ketergantungan backend pada tahap awal proyek.
- **Referensi:** [Notificlash: Tracker for CoC](https://play.google.com/store/apps/details?id=com.efertre.notificapp), [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net)
- **Saran:** mulai dengan katalog yang dibundel sebagai aset JSON dan gambar lokal; sediakan mekanisme pembaruan katalog versi berikutnya (unduh berkas atau repositori data) tanpa mengubah aplikasi.
- **Prioritas:** Tinggi.

### Prioritas Sedang

#### A5. Favorit dan koleksi base tersimpan

- **Temuan:** Tiga kompetitor menyediakan daftar favorit atau koleksi khusus untuk menyimpan base yang akan dipakai pada persiapan perang.
- **Tujuan fitur:** memungkinkan pengguna menyiapkan beberapa base untuk situasi berbeda tanpa mencari ulang.
- **Referensi:** [Map Layout Links Base for COC](https://play.google.com/store/apps/details?id=com.coc.layouts), [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps), [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop)
- **Saran:** simpan favorit secara lokal menggunakan penyimpanan kunci-nilai; beri nama koleksi (mis. "War TH12") agar relevan dengan alur perang klan.
- **Prioritas:** Sedang.

#### A6. Kategori strategi lanjutan (anti-3-star, anti-air, anti-ground, CWL)

- **Temuan:** Kompetitor menambahkan label strategi di luar tipe base dasar; label ini membantu pemain memilih pertahanan terhadap meta serangan tertentu.
- **Tujuan fitur:** mempercepat pemilihan base yang menjawab ancaman populer tanpa harus membaca deskripsi panjang.
- **Referensi:** [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [CoC Base Maps 2026](https://play.google.com/store/apps/details?id=com.m3android7s.projects.clashofclansbaselayouts), [COC Base Layouts:Clash of Maps](https://play.google.com/store/apps/details?id=com.sb.newclashmaps2020)
- **Saran:** jadikan label sebagai tag banyak-nilai pada setiap base, tampilkan sebagai badge pada kartu, dan biarkan filter memakai satu atau beberapa tag.
- **Prioritas:** Sedang.

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

## E. Prioritas Gabungan

| Urutan | Item | Jenis | Alasan |
| --- | --- | --- | --- |
| 1 | A1 Galeri base terfilter | Fitur | Fondasi seluruh pengalaman; tanpa katalog terstruktur fitur lain tidak berguna. |
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

## F. Verifikasi dan Keterbatasan

- Seluruh 10 tautan Google Play Store diperiksa dengan `curl` dan mengembalikan HTTP 200 pada 2026-11-14.
- Klaim fitur diambil dari deskripsi resmi pada halaman toko dan, untuk sebagian aplikasi, dari ulasan pengguna yang tampil di halaman tersebut.
- Halaman toko menyediakan tangkapan layar, tetapi laporan ini **tidak** melakukan pembacaan piksel atau pengujian langsung aplikasi. Pola UI/UX diidentifikasi dari label fitur, alur yang dijelaskan pada deskripsi, dan keluhan/ pujian pada ulasan, bukan dari pengamatan visual terperinci.
- Jumlah unduhan dan rating tidak dijadikan dasar prioritas; prioritas ditentukan oleh relevansi terhadap kebutuhan `base_coc`.
- Tidak ada aplikasi di luar 10 listing pada `apk_kompetitor.md` yang dianalisa.
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
