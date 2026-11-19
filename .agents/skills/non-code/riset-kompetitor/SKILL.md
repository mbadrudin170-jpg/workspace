---
name: riset-kompetitor
description: "Trigger: saat membuat atau memperbarui katalog aplikasi kompetitor proyek | Panduan riset kompetitor portabel lintas proyek: menentukan aplikasi sasaran dari dokumen proyek, format tabel apk_kompetitor.md, status analisa per listing, verifikasi tautan, alur satu run mencakup semua store, dan laporan refrensi_apk.md."
metadata:
  kategori: "custom"
  versi: "1.6.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Riset Kompetitor Aplikasi Mobile (Lintas Proyek)

Mengumpulkan dan mendokumentasikan daftar aplikasi mobile kompetitor untuk proyek Flutter atau proyek mobile apa pun. Skill ini **tidak mengasumsikan** nama aplikasi, domain, kategori fitur, atau model bisnis proyek. Konteks aplikasi sasaran wajib dibaca dari dokumen proyek (`README.md`, `AGENTS.md`, PRD, atau dokumen produk lain) sebelum riset dimulai.

Hasil riset disimpan dalam tabel standar di `apk_kompetitor.md`. Analisa lanjutan menghasilkan `refrensi_apk.md` yang memuat rekomendasi fitur, optimasi fitur eksisting, serta pola UI/UX/layout. Nama berkas tersebut adalah **default**; bila proyek memakai nama lain, sesuaikan dengan konvensi proyek dan catat pemetaannya di `README.md` atau dokumen proyek.

## Cakupan yang Di-Cover

- Package: `tidak ada` (dokumentasi non-kode; berlaku untuk proyek Flutter/mobile lintas domain)
- File default: `apk_kompetitor.md` (katalog aplikasi per store) dan `refrensi_apk.md` (laporan analisa)
- Perintah terkait bila tersedia di proyek: `.kilo/commands/cari_apk_kompetitor.md` untuk menambah listing; `.kilo/commands/riset_kompetitor.md` untuk analisa fitur
- File wajib dibaca sebelum riset: `README.md`, `AGENTS.md`, `apk_kompetitor.md` (bila ada), serta dokumen produk/PRD yang menjelaskan aplikasi sasaran
- Kolom tabel: `Nama Aplikasi`, `Ringkasan Singkat`, `Store`, `Link`, `Status Analisa`
- Struktur `refrensi_apk.md`: informasi riset + cara membaca → ringkasan temuan terbesar → kondisi fitur aktual proyek → A. Rekomendasi fitur baru → B. Optimasi fitur eksisting → C. UI/UX & Layout → D. Katalog listing → E. Prioritas gabungan → F. Verifikasi & keterbatasan → G. Sumber
- Store yang didukung: Google Play Store, Apple App Store, F-Droid, GitHub, Samsung Galaxy Store, Uptodown, IzzyOnDroid, Amazon Appstore, APKPure, Aptoide, SlideME, Mi/GetApps, Oppo App Market, Tencent MyApp, Huawei AppGallery
- Toko yang sering memblokir akses langsung (Xiaomi GetApps, Oppo App Market, Vivo App Store, Huawei AppGallery, Baidu Mobile Assistant): hanya sertakan aplikasi bila link halaman aplikasi spesifik dapat diverifikasi
- Kategori relevansi: **ditentukan dari dokumen produk proyek**, bukan dari skill. Contoh kategori umum: fitur inti, alur pengguna, UI/UX, monetisasi, integrasi, aksesibilitas, performa, privasi, dan mode offline

## Aturan

1. Tentukan aplikasi sasaran dan fitur intinya dari `README.md`, `AGENTS.md`, PRD, atau dokumen produk proyek. Jika dokumen tidak tersedia atau saling bertentangan, tanyakan kepada pengguna; **jangan menebak** dari nama repositori.
2. Setiap aplikasi **wajib** memiliki nama, ringkasan singkat (maks 2-3 kalimat), nama store/sumber, link yang valid, dan **kolom `Status Analisa`** (nilai: `Belum Dianalisa` atau `Sudah Dianalisa`).
3. Ringkasan singkat **wajib** menyebutkan fitur utama yang relevan dengan aplikasi sasaran proyek, bukan deskripsi umum dari store. Fitur yang disebut harus berasal dari kategori yang sudah ditentukan pada langkah 1.
4. Format tabel **wajib** mengikuti standar Markdown pipe (`| Kolom 1 | Kolom 2 | ... |`) dengan header dan separator baris kedua (`| --- | --- | ... |`).
5. Aplikasi dari store yang sama **dikelompokkan** secara berurutan. Urutan default: Google Play → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya.
6. Duplikat nama aplikasi di store berbeda **diperbolehkan** (mis. aplikasi sama di Play Store dan App Store) dengan baris terpisah.
7. Link **wajib** mengarah ke halaman resmi store/repositori (bukan pencarian umum), gunakan format `[Buka Aplikasi](url)`, `[Buka Repositori](url)`, `[Unduh APK](url)`, atau `[Cari Aplikasi](url)` sesuai jenis store.
8. Setiap penambahan/perubahan **wajib** di-commit dengan pesan `docs: ...` dan referensi ke skill ini, kecuali pengguna melarang commit.
9. **Wajib** verifikasi link masih aktif sebelum commit (cek manual atau otomatis).
10. **Satu run mencakup semua store.** Mulai dari Google Play Store; riset dikerjakan store demi store dalam satu run dengan urutan: Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya. Setelah seluruh kandidat suatu store terverifikasi independen dan `apk_kompetitor.md` diperbarui, baru lanjut ke store berikutnya. DILARANG melewati store tanpa mencatat hasilnya (termasuk nihil temuan) ke `apk_kompetitor.md` atau laporan.
11. Verifikasi otomatis dengan: `curl -s -o /dev/null -w "%{http_code}" -A "Mozilla/5.0 (X11; Linux x86_64) Chrome/120.0" -L <url>`. HTTP **200** = valid; HTTP **404** = buang entri; HTTP **403** dari APKPure/Aptoide/SlideME = anti-bot (bukan link mati) — verifikasi via websearch/webfetch.
12. Untuk id aplikasi Apple App Store, gunakan lookup `https://itunes.apple.com/lookup?id=<id>`; `resultCount: 0` berarti aplikasi tidak ada dan **tidak boleh** disertakan.
13. Aplikasi Tionghoa/regional tanpa link halaman aplikasi spesifik yang terverifikasi **tidak boleh** disertakan; keberadaan di store saja (dari sumber sekunder) tidak cukup.
14. Periksa duplikat exact berdasarkan `package id` sebelum menambah baris. Dua varian dengan package id berbeda tetap dicatat terpisah bila memang dua aplikasi.
15. Untuk batch besar, tambahkan section `# Tambahan Riset (YYYY-MM-DD)` dengan sub-section `## <Store>`; setiap tabel tetap wajib punya header + separator.
16. Untuk tugas "mencarikan referensi dari seluruh APK di katalog": baca dokumen proyek dan `apk_kompetitor.md` lebih dulu; **lingkup hanya APK yang terdaftar di katalog** — jangan menambah aplikasi baru tanpa perintah eksplisit. Hasil ditulis ke `refrensi_apk.md`.
17. `refrensi_apk.md` wajib memuat: link referensi pada tiap rekomendasi, pengelompokan per fitur (A), optimasi fitur eksisting (B), dan UI/UX/layout (C), penjelasan **tujuan** tiap item, serta **prioritas** (Tinggi/Sedang/Rendah) untuk penyortiran pengguna.
18. Untuk `refrensi_apk.md`: hanya rekomendasikan fitur yang dapat berjalan di mobile. Fitur khusus iOS (Apple Watch, Live Activities, WidgetKit, Wear-only tanpa padanan Android) dicatat sebagai referensi pola saja, bukan rekomendasi. Fitur yang butuh backend/akun ditandai jelas dan ditempatkan pada prioritas rendah; jika proyek bersifat lokal-first, pertahankan prinsip itu.
19. Klasifikasikan status verifikasi listing: **terverifikasi** (halaman/README/mirror terbaca, iTunes `resultCount > 0`, atau curl 200 dengan isi terbaca), **verifikasi ringan** (Galaxy Store 200 dengan judul halaman saja, atau Amazon Appstore tanpa detail), **tidak terverifikasi** (404, 403 tanpa sumber alternatif, halaman kosong, atau listing tidak ditemukan). Listing tidak terverifikasi tidak dijadikan dasar rekomendasi.
20. Uptodown dapat berputar antara HTTP 410 dan 404 untuk URL yang sama — perlakukan sebagai flaky/rotasi; tandai tidak terverifikasi kecuali ada mirror resmi yang menyebut package id sama.
21. Temuan cacat kode yang ditemukan saat riset didokumentasikan di `refrensi_apk.md` dengan prioritas dan path file, **tidak diperbaiki** sebagai bagian dari tugas riset.
22. Sebelum memperbarui `refrensi_apk.md`, periksa `git diff` working tree/staged — jangan menimpa, membangkitkan kembali, atau menggabungkan ulang bagian yang sudah dihapus pengguna; hilangkan tautan ke dokumen yang sudah dihapus.
23. Amazon Appstore dan Samsung Galaxy Store dapat mengembalikan HTTP 200 pada curl dengan user agent Chrome; Galaxy Store tetap diklasifikasi **verifikasi ringan**.
24. Untuk perintah analisa: **hanya boleh menganalisa APK yang `Status Analisa = Belum Dianalisa`**. APK `Sudah Dianalisa` wajib dilewati kecuali pengguna meminta analisa ulang secara eksplisit (kembalikan status ke `Belum Dianalisa` terlebih dahulu). Setelah analisa selesai **per APK**, ubah status baris tersebut menjadi `Sudah Dianalisa`.
25. Listing baru dari perintah `cari_apk_kompetitor.md` **wajib** diberi `Status Analisa = Belum Dianalisa`; perintah itu **tidak boleh** menandai `Sudah Dianalisa`.
26. Saat menjalankan analisa, filter dan proses hanya baris `Belum Dianalisa`; jangan memperluas lingkup ke sumber lain. `refrensi_apk.md` tetap memuat katalog lengkap (seksi D) — perbarui hanya bagian yang terdampak, jangan tulis ulang dari nol kecuali diminta.
27. **Section `# Status Analisa Fitur` di akhir file TIDAK DIPERLUKAN** — penandaan status dilakukan per baris tabel via kolom `Status Analisa`.
28. **Aturan portabilitas:** DILARANG menulis nama aplikasi, domain, kategori fitur, atau istilah khas satu proyek ke dalam skill ini. Konvensi khusus proyek (nama berkas, daftar store prioritas, kategori relevansi) disimpan di `README.md`, `AGENTS.md`, command proyek, atau dokumen produk proyek.
29. Jika aplikasi sasaran berubah, katalog lama **tidak boleh** langsung dipakai ulang. Verifikasi ulang relevansi setiap listing atau buat katalog baru sesuai perintah pengguna.
30. Jika pengguna membatasi jumlah APK yang dianalisa (mis. 10), pilih lintas kategori/fitur yang paling relevan, catat alasan pemilihan di `refrensi_apk.md`, dan jangan menandai listing di luar jumlah tersebut sebagai `Sudah Dianalisa`.
31. Catat tanggal pembaruan (mis. `diperbarui: YYYY-MM-DD`) pada `apk_kompetitor.md` dan `refrensi_apk.md` setiap kali berkas diperbarui.

## Steps

1. Baca `README.md`, `AGENTS.md`, dokumen produk/PRD, dan `apk_kompetitor.md`; tentukan aplikasi sasaran, fitur inti, serta kategori relevansi.
2. Periksa katalog yang ada: store yang sudah tercakup, listing `Belum Dianalisa`, dan duplikat.
3. Riset kandidat per store; verifikasi setiap link secara independen (curl/iTunes/webfetch).
4. Perbarui `apk_kompetitor.md` setelah tiap store selesai; beri `Belum Dianalisa` pada listing baru.
5. Untuk analisa, filter hanya listing `Belum Dianalisa`; pilih APK sesuai batas jumlah pengguna; kumpulkan bukti fitur dan tangkapan layar resmi.
6. Tulis/perbarui `refrensi_apk.md` dengan bagian A–G; sertakan link, tujuan, dan prioritas.
7. Ubah status APK yang benar-benar dianalisa menjadi `Sudah Dianalisa`; perbarui dokumentasi/memori proyek bila ada konvensinya.
8. Verifikasi: jumlah status konsisten, tautan aktif, tabel memiliki header, dan tidak ada nama aplikasi proyek yang di-hardcode ke skill.

## Larangan

- DILARANG meng-hardcode nama aplikasi, domain, atau fitur spesifik proyek ke dalam `SKILL.md`.
- DILARANG menganggap katalog dari proyek lain otomatis relevan tanpa verifikasi ulang.
- DILARANG menambah aplikasi tanpa ringkasan fitur yang relevan dengan aplikasi sasaran.
- DILARANG menggunakan format tabel non-standar (daftar bullet, JSON, CSV).
- DILARANG mengubah urutan kolom tabel yang sudah ditetapkan.
- DILARANG menghapus aplikasi yang sudah tercatat kecuali benar-benar tidak lagi tersedia di store resmi.
- DILARANG menyalin deskripsi store tanpa disesuaikan dengan konteks proyek.
- DILARANG menambah kolom baru selain `Status Analisa` tanpa memperbarui skill dan seluruh baris tabel.
- DILARANG mempercayai link hasil subagen tanpa verifikasi independen.
- DILARANG menyertakan aplikasi hanya dari sumber agregator tanpa link halaman resmi yang terverifikasi.
- DILARANG menganggap HTTP 403 dari APKPure/Aptoide/SlideME sebagai link mati.
- DILARANG menyertakan link HTTP 404 atau id App Store dengan `resultCount: 0`.
- DILARANG menambah tabel tanpa header/separator.
- DILARANG melewati store dari urutan riset dalam satu run tanpa mencatat hasilnya (termasuk nihil temuan).
- DILARANG merekomendasikan fitur non-mobile sebagai rekomendasi utama.
- DILARANG menganggap Galaxy Store HTTP 200 + judul halaman sebagai verifikasi penuh.
- DILARANG memperluas lingkup di luar katalog tanpa perintah eksplisit.
- DILARANG menimpa bagian `refrensi_apk.md` yang sudah dihapus pengguna.
- DILARANG memperbaiki kode sebagai bagian dari tugas riset.
- DILARANG memindai ulang link APK yang cacat atau tidak dapat ditemukan; tandai sebagai tidak terverifikasi atau tidak disertakan.
- DILARANG menandai `Sudah Dianalisa` sebelum analisa dijalankan dan didokumentasikan.
- DILARANG menandai listing baru dari `cari_apk_kompetitor.md` sebagai `Sudah Dianalisa`.
- DILARANG membuat section `# Status Analisa Fitur` di akhir file.
- DILARANG menebak aplikasi sasaran ketika dokumen proyek tidak tersedia; tanyakan kepada pengguna.

## Contoh Benar

Katalog generik untuk proyek apa pun (nama aplikasi dan fitur mengikuti dokumen proyek):

```markdown
| Nama Aplikasi | Ringkasan Singkat                                                                                      | Store             | Link                                                                           | Status Analisa  |
| ------------- | ------------------------------------------------------------------------------------------------------ | ----------------- | ------------------------------------------------------------------------------ | --------------- |
| Aplikasi A    | Menyediakan fitur inti yang relevan dengan aplikasi sasaran, termasuk alur utama dan pengaturan lokal. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.contoh.appa) | Belum Dianalisa |
| Aplikasi B    | Menawarkan fitur pembanding pada kategori yang sama dengan pendekatan UI yang berbeda.                 | F-Droid           | [Buka Aplikasi](https://f-droid.org/packages/com.contoh.appb/)                 | Belum Dianalisa |
```

Item referensi generik:

```markdown
#### A1. Fitur Pembanding yang Relevan

- **Temuan:** Aplikasi kompetitor menyediakan fitur yang belum tercatat pada dokumen produk proyek.
- **Tujuan fitur:** menjelaskan manfaat fitur bagi pengguna aplikasi sasaran.
- **Referensi:** [Aplikasi A](https://play.google.com/store/apps/details?id=com.contoh.appa)
- **Saran:** sesuaikan fitur dengan arsitektur dan batasan platform proyek.
- **Prioritas:** Sedang.
```

## Contoh Salah

```markdown
# DILARANG: skill mengunci satu aplikasi/domain tertentu

# Riset Kompetitor Aplikasi NamaAplikasiTertentu

Skill ini hanya untuk aplikasi NamaAplikasiTertentu dengan fitur X, Y, dan Z.
```

```markdown
# DILARANG: katalog tanpa status analisa

| Nama Aplikasi | Ringkasan Singkat | Store             | Link                                                                  |
| ------------- | ----------------- | ----------------- | --------------------------------------------------------------------- |
| Aplikasi A    | Aplikasi sejenis. | Google Play Store | [Buka](https://play.google.com/store/apps/details?id=com.contoh.appa) |
```

```markdown
# DILARANG: menandai Sudah Dianalisa tanpa analisa

| Aplikasi A | ... | Google Play Store | [Buka](https://play.google.com/store/apps/details?id=com.contoh.appa) | Sudah Dianalisa |
```
