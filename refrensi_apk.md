# Referensi APK Kompetitor Spektra

Laporan referensi dari 10 APK kompetitor yang terdaftar di `apk_kompetitor.md` dan berstatus `Belum Dianalisa`. Fokus laporan: fitur yang dapat ditambahkan, optimasi fitur yang sudah menjadi cakupan Spektra, serta pola UI/UX/layout yang dapat dijadikan pembanding. Seluruh rekomendasi dibatasi pada fitur yang dapat berjalan di mobile Android.

## Informasi Riset

- Tanggal riset: 2026-11-14 (WIB).
- Lingkup: 10 APK dari `apk_kompetitor.md`; hanya baris `Status Analisa = Belum Dianalisa`.
- Catatan lingkup: `apk_serupa.md` tidak ditemukan di root proyek; lingkup mengikuti `apk_kompetitor.md` sesuai poin 7 perintah pengguna.
- Metode: verifikasi tautan dengan `curl` (HTTP 200), pembacaan deskripsi resmi Play Store, dan pembacaan tangkapan layar resmi aplikasi.
- Tingkat verifikasi: 10 dari 10 listing **terverifikasi** (halaman toko terbaca dan tangkapan layar tersedia).
- Sifat dokumen: riset pembanding, bukan keputusan implementasi. Pengguna menyortir sendiri item yang akan dikerjakan.
- Kode item: `A` = rekomendasi fitur baru, `B` = optimasi fitur eksisting, `C` = UI/UX dan layout. Prioritas: `Tinggi`, `Sedang`, `Rendah`.

## Ringkasan Temuan Terbesar

1. Kompetitor memisahkan tiga lapisan pengalaman: **ringkasan dashboard**, **detail spesifikasi**, dan **diagnostik**. Pemisahan ini membuat aplikasi tetap cepat dipindai meskipun data sangat banyak.
2. **Kesehatan baterai** menjadi pembeda terbesar. Battery Guru dan AccuBattery tidak hanya menampilkan level, tetapi kapasitas aktual, siklus, laju pengisian, suhu, dan estimasi berbasis sesi pengisian.
3. **Diagnostik terpandu** lebih meyakinkan daripada sekadar daftar informasi. Test Your Android, DevCheck, dan Device Info menampilkan status uji, progres, serta ringkasan hasil.
4. **Workbench sensor** dengan grafik realtime dan detail per sensor menjadi nilai tambah yang jelas, terutama untuk pengguna teknis.
5. **Widget dan floating monitor** memperluas monitoring ke luar aplikasi; ini peluang diferensiasi yang ringan jika izin dan baterai dikelola baik.
6. Pola UI dominan: **tab + baris key-value**, **kartu dashboard dengan sparkline/ring**, **katalog uji berbentuk grid**, **layar uji penuh dengan gestur**, dan **grafik padat dengan kontrol rentang waktu**.
7. Sebagian besar kompetitor memakai iklan, langganan, atau data pihak ketiga. Spektra dapat mengambil posisi **lokal-first, tanpa akun, dan transparan soal izin** sebagai pembeda kepercayaan.
8. Fitur yang membutuhkan backend, akun, atau ranking publik ditempatkan pada prioritas rendah agar tidak mengganggu prinsip lokal-first.

## Kondisi Fitur Aktual Proyek

Berdasarkan dokumen proyek yang tersedia, Spektra adalah aplikasi Android berbasis Flutter untuk:

- **Info spesifikasi perangkat**: identitas perangkat, CPU/SoC, GPU, RAM, penyimpanan, layar, kamera, OS/kernel, jaringan.
- **Monitoring hardware**: penggunaan dan suhu CPU/GPU/RAM, baterai, termal, dan metrik realtime lain.
- **Diagnostik komponen perangkat**: layar, sentuh, audio, sensor, kamera, konektivitas, dan pengujian hardware.

Detail modul dan implementasi aktual tidak tersedia di workspace ini. Karena itu, bagian `A` diperlakukan sebagai **calon fitur**, sedangkan bagian `B` sebagai **arah optimasi** untuk tiga cakupan di atas, bukan klaim bahwa subfitur tertentu sudah ada atau belum ada.

## A. Rekomendasi Fitur Baru

### A.1 Prioritas Tinggi

#### A1. Laboratorium Kesehatan Baterai dan Pengisian

- **Temuan:** Battery Guru menampilkan kapasitas terukur (mAh) dibanding kapasitas desain, kesehatan persentase, siklus, arus/watt/voltase pengisian, suhu, dan label keyakinan data (`Verified`, `Estimated`, `Approximate`, `Learning`). AccuBattery menambahkan laju pengisian per charger/kabel, alarm pengisian, dan estimasi waktu pakai.
- **Tujuan fitur:** memberi pengguna gambaran nyata tentang kondisi baterai dan kualitas pengisian, bukan hanya persentase level.
- **Referensi:** [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru), [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64).
- **Saran implementasi:** sediakan halaman baterai dengan kartu kesehatan, kapasitas desain vs terukur, siklus, grafik suhu 24 jam, grafik arus pengisian, dan riwayat sesi. Tandai nilai yang masih estimasi. Tambahkan alarm level/suhu dan opsi ekspor riwayat.
- **Prioritas:** Tinggi.

#### A2. Diagnostik Hardware Terpandu dengan Laporan Hasil

- **Temuan:** Test Your Android menyediakan 35+ uji terstruktur (layar, sentuh, kamera, audio, konektivitas, sensor, biometrik, penyimpanan). DevCheck menyediakan uji flashlight, vibrator, tombol, multi-touch, layar, backlight, charging, speaker, headset, earpiece, mikrofon, dan biometrik. Device Info menampilkan progres uji (`9/115 Completed`).
- **Tujuan fitur:** memandu pengguna menemukan komponen bermasalah dengan langkah jelas dan hasil yang dapat disimpan.
- **Referensi:** [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo).
- **Saran implementasi:** buat katalog uji dengan status `Belum`, `Lulus`, `Gagal`, `Dilewati`; simpan waktu uji terakhir; tampilkan ringkasan di akhir sesi; sediakan ekspor teks/PDF. Mulai dari uji yang paling berdampak: layar, sentuh, speaker, mikrofon, getaran, tombol, sensor gerak, dan charging.
- **Prioritas:** Tinggi.

#### A3. Diagnostik Layar dan Sentuh

- **Temuan:** Display Tester menyediakan uji dead pixel, kontras, gradasi/banding, saturasi, gamma, viewing angle, wide gamut, multi-touch, dead spot sentuh, refresh rate, dan repair burn-in. Test Your Android menyediakan uji warna, sentuh, multi-touch, dead pixel, dan refresh rate.
- **Tujuan fitur:** mendeteksi cacat panel dan masalah sentuh tanpa aplikasi tambahan.
- **Referensi:** [Display Tester](https://play.google.com/store/apps/details?id=com.gombosdev.displaytester), [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid).
- **Saran implementasi:** gunakan layar penuh imersif dengan instruksi singkat, gestur geser untuk berpindah pola, dan tombol keluar yang jelas. Sediakan pola warna solid, gradasi, grid sentuh, penghitung multi-touch, serta mode repair burn-in dengan durasi yang dapat dihentikan.
- **Prioritas:** Tinggi.

#### A4. Workbench Sensor Lengkap

- **Temuan:** Sensors Toolbox menampilkan seluruh sensor yang tersedia, nilai realtime, grafik per sensor, detail vendor/daya/resolusi, serta alat tambahan seperti altimeter, kompas, dan sound meter. DevCheck menampilkan tipe, vendor, konsumsi daya, resolusi, dan grafik realtime untuk sensor utama.
- **Tujuan fitur:** membantu pengguna memverifikasi ketersediaan dan respons sensor, serta membaca nilai lingkungan secara realtime.
- **Referensi:** [Sensors Toolbox](https://play.google.com/store/apps/details?id=com.exatools.sensors), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid).
- **Saran implementasi:** tampilkan daftar sensor dengan status `Tersedia`/`Tidak tersedia`, kartu nilai realtime, grafik garis, dan detail teknis. Tambahkan uji sederhana per sensor (mis. goyangkan perangkat untuk akselerometer) dan ekspor bacaan.
- **Prioritas:** Tinggi.

#### A5. Monitoring Termal dan Indikator Throttling

- **Temuan:** DevCheck menampilkan suhu CPU/GPU/baterai/sistem dan status termal; Device Info HW menyediakan suhu per sensor termal; AIDA64 menampilkan clock realtime CPU/GPU.
- **Tujuan fitur:** mendeteksi penurunan performa akibat panas dan membantu pengguna memahami kondisi perangkat saat bermain atau menjalankan tugas berat.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64).
- **Saran implementasi:** tampilkan suhu per zona, grafik riwayat, dan indikator sederhana `Normal`/`Hangat`/`Throttling`. Jelaskan bahwa ambang batas berbeda per perangkat dan nilai adalah perkiraan.
- **Prioritas:** Tinggi.

#### A6. Diagnostik Jaringan Seluler dan WiFi

- **Temuan:** AIDA64 menampilkan info WiFi/seluler, kekuatan sinyal, dan SSID. DevCheck menampilkan IPv4/IPv6, operator, tipe jaringan, IP publik, dan dual SIM. Device Info menambahkan Wi-Fi Analyzer dan Network Mapper.
- **Tujuan fitur:** membantu pengguna mendiagnosis koneksi lambat, sinyal lemah, atau perangkat lain di jaringan.
- **Referensi:** [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo).
- **Saran implementasi:** sediakan tab jaringan berisi info koneksi aktif, kekuatan sinyal, IP lokal/publik, DNS, dan uji ping/speed test. Untuk WiFi, tambahkan daftar access point, kanal, dan tingkat sinyal. Hindari fitur yang memerlukan backend atau akun.
- **Prioritas:** Tinggi.

#### A7. Diagnostik Penyimpanan dan Memori

- **Temuan:** DevCheck menyediakan benchmark CPU, memori, penyimpanan, dan GPU. Device Info menampilkan penggunaan RAM/penyimpanan realtime serta rincian tipe dan frekuensi RAM. AIDA64 menampilkan utilisasi memori dan penyimpanan.
- **Tujuan fitur:** memberi gambaran performa baca/tulis dan tekanan memori yang memengaruhi kelancaran perangkat.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64).
- **Saran implementasi:** tampilkan penggunaan RAM/penyimpanan realtime, rincian partisi, dan uji baca/tulis berukuran kecil yang tidak mengganggu data pengguna. Sertakan penjelasan bahwa hasil dipengaruhi kondisi perangkat.
- **Prioritas:** Tinggi.

#### A8. Widget dan Floating Monitor

- **Temuan:** DevCheck menyediakan widget dan floating monitor yang dapat dipindah untuk CPU, suhu, baterai, dan jaringan. Device Info menyediakan widget Material You dan floating monitor RAM/baterai/suhu CPU. Battery Guru menyediakan 11 widget.
- **Tujuan fitur:** memantau metrik penting tanpa membuka aplikasi.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru).
- **Saran implementasi:** mulai dari widget ukuran 1x1, 2x1, dan 4x2 untuk baterai, RAM, suhu, dan penggunaan CPU. Floating monitor bersifat opsional dan harus meminta izin overlay secara jelas; sediakan tombol berhenti yang mudah diakses.
- **Prioritas:** Tinggi.

### A.2 Prioritas Sedang

#### A9. Benchmark Lokal dengan Riwayat Skor

- **Temuan:** DevCheck menyediakan benchmark CPU, memori, penyimpanan, dan GPU serta perbandingan skor. Test Your Android menyediakan uji kecepatan baca/tulis penyimpanan.
- **Tujuan fitur:** memberi angka performa yang dapat dibandingkan antarwaktu pada perangkat yang sama.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid).
- **Saran implementasi:** sediakan benchmark lokal yang singkat, simpan riwayat skor di perangkat, dan tampilkan grafik perubahan. Hindari ranking publik yang membutuhkan backend pada tahap awal.
- **Prioritas:** Sedang.

#### A10. Ekspor dan Bagikan Laporan Perangkat

- **Temuan:** Device Info HW dapat membuat laporan HTML/PDF dan menyalin teks dengan long press. Device Info menyediakan ekspor teks/PDF dan tautan berbagi.
- **Tujuan fitur:** memudahkan pengguna mengirim spesifikasi atau hasil diagnostik ke teknisi atau forum.
- **Referensi:** [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo).
- **Saran implementasi:** sediakan aksi `Ekspor` pada layar ringkasan dan hasil uji; format teks, JSON, dan PDF ringkas. Sertakan opsi menyembunyikan data sensitif seperti nomor seri dan IMEI.
- **Prioritas:** Sedang.

#### A11. Inspektur Kemampuan Kamera

- **Temuan:** DevCheck menampilkan aperture, focal length, rentang ISO, RAW, ekuivalen 35mm, crop factor, field of view, mode fokus, flash, dan format gambar. Device Info menampilkan spesifikasi kamera yang serupa.
- **Tujuan fitur:** memberi informasi kamera yang tidak terlihat di aplikasi kamera bawaan.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64).
- **Saran implementasi:** tampilkan daftar kamera depan/belakang, resolusi, ukuran sensor, aperture, ISO, dan dukungan RAW. Beri catatan bahwa sebagian nilai bergantung pada API perangkat.
- **Prioritas:** Sedang.

#### A12. Info Codec, DRM, dan Keamanan Sistem

- **Temuan:** AIDA64 menampilkan codec, Vulkan/OpenCL, dan properti sistem. Device Info menampilkan codec audio/video (AV1, HEVC, VP9) serta status keamanan. Test Your Android menampilkan root checker, security patch, dan detail DRM.
- **Tujuan fitur:** membantu pengguna memeriksa dukungan multimedia dan status keamanan perangkat.
- **Referensi:** [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid).
- **Saran implementasi:** sediakan daftar codec dekode/encode, dukungan Widevine/DRM, security patch, dan status root. Tandai informasi yang hanya tersedia pada API tertentu.
- **Prioritas:** Sedang.

#### A13. Inventaris Konektivitas Perangkat

- **Temuan:** Device Info menampilkan Bluetooth, NFC, UWB, USB, dan OTG. Device Info HW menampilkan fitur Bluetooth, USB OTG, NFC, dan input devices. AIDA64 menampilkan daftar perangkat PCI/USB.
- **Tujuan fitur:** memberi informasi kapabilitas konektivitas yang tidak selalu jelas di pengaturan sistem.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64).
- **Saran implementasi:** tampilkan status dukungan, versi protokol, perangkat yang terhubung, dan info OTG. Hindari pemindaian yang berjalan terus-menerus tanpa aksi pengguna.
- **Prioritas:** Sedang.

#### A14. Analisis Aplikasi dan Ekstraksi APK

- **Temuan:** Device Info menyediakan daftar aplikasi, izin, activity, service, provider, receiver, signature, min/target SDK, ekstraksi APK, dan grafik analisis. DevCheck menyediakan manajemen aplikasi dan permission explorer.
- **Tujuan fitur:** membantu pengguna teknis memahami aplikasi terpasang dan mengambil APK untuk keperluan cadangan.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck).
- **Saran implementasi:** sediakan daftar aplikasi dengan pencarian, filter sistem/pengguna, detail izin, dan aksi ekstraksi APK. Batasi agar tidak mengarah ke fitur manajemen proses yang memerlukan root.
- **Prioritas:** Sedang.

#### A15. Perbaikan Burn-in Layar

- **Temuan:** Display Tester menyediakan mode repair burn-in dengan scrolling black & white bars dan noise berwarna. Ulasan pengguna melaporkan mode ini membantu mengurangi bekas burn-in.
- **Tujuan fitur:** memberi alat bantu opsional untuk mengurangi sisa gambar pada panel OLED.
- **Referensi:** [Display Tester](https://play.google.com/store/apps/details?id=com.gombosdev.displaytester).
- **Saran implementasi:** sediakan mode dengan durasi, intensitas, dan tombol berhenti; beri peringatan bahwa hasil bervariasi dan bukan perbaikan permanen. Jangan menjalankan otomatis tanpa persetujuan.
- **Prioritas:** Sedang.

### A.3 Prioritas Rendah

#### A16. Diagnostik Lanjutan Root/Shizuku

- **Temuan:** DevCheck mendukung root/Shizuku untuk informasi tambahan. Device Info HW dapat membaca informasi lebih banyak dengan root. AIDA64 menyediakan daftar perangkat PCI/USB.
- **Tujuan fitur:** memberi data hardware yang lebih dalam bagi pengguna teknis.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw).
- **Saran implementasi:** jadikan fitur opsional dan terpisah; jelaskan risiko dan batasan. Jangan menjadikan root sebagai ketergantungan fitur inti.
- **Prioritas:** Rendah.

#### A17. Toolkit Utilitas (QR, Waterpass, Sound Meter, Kompas)

- **Temuan:** Test Your Android menyediakan barcode/QR scanner, level tool, sound meter, flashlight, dan daftar aplikasi. Sensors Toolbox menyediakan altimeter, metal detector, NFC reader, kompas, termometer, dan step counter.
- **Tujuan fitur:** menambah nilai harian di luar diagnostik inti.
- **Referensi:** [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid), [Sensors Toolbox](https://play.google.com/store/apps/details?id=com.exatools.sensors).
- **Saran implementasi:** jika diadopsi, letakkan di area `Alat` terpisah agar tidak mengganggu alur info/diagnostik. Prioritaskan kompas, level, dan sound meter yang memakai sensor yang sudah ada.
- **Prioritas:** Rendah.

#### A18. Basis Data Perbandingan Perangkat

- **Temuan:** CPU-Z memiliki online validation dan database spesifikasi. Device Info HW memiliki database perangkat untuk membandingkan driver. DevCheck memiliki ranking benchmark.
- **Tujuan fitur:** membandingkan spesifikasi perangkat dengan model lain.
- **Referensi:** [CPU-Z](https://play.google.com/store/apps/details?id=com.cpuid.cpu_z), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck).
- **Saran implementasi:** tunda sampai ada backend dan kebijakan privasi yang jelas. Untuk tahap lokal-first, cukup sediakan perbandingan manual antarperangkat yang datanya diimpor pengguna.
- **Prioritas:** Rendah.

#### A19. Layar Pengisian dan Ikon Status Bar

- **Temuan:** Battery Guru menyediakan charging screen dengan jam dan nilai live, serta ikon status bar berisi persentase/suhu. AccuBattery menyediakan notifikasi berjalan berisi statistik baterai.
- **Tujuan fitur:** memberi akses cepat ke status pengisian tanpa membuka aplikasi.
- **Referensi:** [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru), [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery).
- **Saran implementasi:** sediakan sebagai opsi, bukan default. Notifikasi harus dapat dimatikan dan tidak mengganggu penghematan baterai.
- **Prioritas:** Rendah.

#### A20. Analisis Izin, Data, dan Waktu Layar

- **Temuan:** Device Info menyediakan permission analyzer, data usage monitor, screen time, dan public IP lookup. DevCheck menyediakan permissions explorer dan usage stats (Pro).
- **Tujuan fitur:** memberi wawasan privasi dan pemakaian perangkat.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck).
- **Saran implementasi:** tampilkan daftar izin sensitif dan pemakaian data/waktu layar dengan izin `Usage Access`. Jelaskan tujuan izin dan sediakan opsi hapus data lokal.
- **Prioritas:** Rendah.

## B. Optimasi Fitur Eksisting

Bagian ini berlaku untuk tiga cakupan Spektra: info spesifikasi, monitoring hardware, dan diagnostik perangkat.

#### B1. Dashboard Ringkas Sebelum Detail Panjang

- **Temuan:** DevCheck, Device Info, dan Battery Guru menempatkan ringkasan di depan: kartu CPU/RAM/baterai, grafik singkat, dan pintasan tindakan. Detail panjang berada di tab terpisah.
- **Tujuan perbaikan:** pengguna mendapat jawaban cepat tanpa menggulir daftar spesifikasi yang panjang.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru).
- **Saran:** jadikan dashboard sebagai layar awal; tampilkan 4-6 kartu metrik utama dan pintasan ke detail. Simpan data mentah di tab `Perangkat`, `CPU`, `Baterai`, dan `Jaringan`.
- **Prioritas:** Tinggi.

#### B2. Nilai Realtime dengan Sparkline dan Ring

- **Temuan:** DevCheck menampilkan grafik sparkline frekuensi CPU dan ring penggunaan RAM. Device Info menampilkan ring RAM serta grafik penggunaan. Battery Guru menampilkan grafik arus pengisian dan suhu.
- **Tujuan perbaikan:** angka statis sulit dimaknai; grafik pendek memberi konteks perubahan.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru).
- **Saran:** tambahkan sparkline 30-60 detik dan ring persentase pada kartu monitoring. Gunakan interval pembaruan yang dapat dikonfigurasi agar baterai tidak boros.
- **Prioritas:** Tinggi.

#### B3. Pencarian, Salin, dan Navigasi Cepat pada Daftar Spesifikasi

- **Temuan:** Device Info HW menyediakan navigasi cepat, tab, panel navigasi, dan salin teks dengan long press. AIDA64 memakai breadcrumb dan baris key-value. CPU-Z memakai tab kategori.
- **Tujuan perbaikan:** daftar spesifikasi yang panjang menjadi sulit dipindai tanpa pencarian dan struktur yang jelas.
- **Referensi:** [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [CPU-Z](https://play.google.com/store/apps/details?id=com.cpuid.cpu_z).
- **Saran:** tambahkan kolom pencarian, header seksi lengket, tab kategori, dan aksi salin per baris. Pertahankan format key-value yang mudah dibaca.
- **Prioritas:** Tinggi.

#### B4. Label Keyakinan dan Metodologi untuk Nilai Estimasi

- **Temuan:** Battery Guru menandai setiap pembacaan kesehatan sebagai `Verified`, `Estimated`, `Approximate`, atau `Learning`. AccuBattery menjelaskan metodologi perhitungan kesehatan baterai.
- **Tujuan perbaikan:** nilai estimasi dapat disalahartikan sebagai nilai pasti; transparansi meningkatkan kepercayaan.
- **Referensi:** [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru), [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery).
- **Saran:** beri badge keyakinan pada kapasitas baterai, suhu, dan estimasi waktu. Sediakan halaman `Cara dihitung` yang ringkas.
- **Prioritas:** Tinggi.

#### B5. Status Uji yang Konsisten dan Ringkasan Hasil

- **Temuan:** Test Your Android dan DevCheck menyusun uji sebagai daftar tugas; Device Info menampilkan progres uji. Namun tidak semua kompetitor menyimpan hasil atau menampilkan ringkasan akhir.
- **Tujuan perbaikan:** pengguna perlu tahu apa yang sudah diuji, apa yang gagal, dan apa langkah berikutnya.
- **Referensi:** [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo).
- **Saran:** gunakan status `Belum`/`Lulus`/`Gagal`/`Dilewati`, simpan waktu terakhir, dan tampilkan ringkasan `x dari y uji selesai` di dashboard diagnostik.
- **Prioritas:** Tinggi.

#### B6. Uji Sensor Langsung dari Daftar Sensor

- **Temuan:** Sensors Toolbox dan DevCheck menampilkan nilai realtime dan grafik per sensor; pengguna dapat langsung menilai respons sensor.
- **Tujuan perbaikan:** daftar sensor tanpa pengujian kurang memberi kepastian bahwa sensor benar-benar berfungsi.
- **Referensi:** [Sensors Toolbox](https://play.google.com/store/apps/details?id=com.exatools.sensors), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck).
- **Saran:** tambahkan tombol `Uji` pada setiap sensor yang membuka layar nilai realtime dan instruksi singkat.
- **Prioritas:** Tinggi.

#### B7. Mode Tema Terang, Gelap, dan AMOLED

- **Temuan:** Device Info menawarkan tema Material You terang/gelap. AIDA64 memiliki tema biru dan hitam. Device Info HW mendukung terang, gelap, dan hitam. AccuBattery menyediakan tema gelap dan AMOLED hitam.
- **Tujuan perbaikan:** aplikasi info perangkat sering dipakai dalam waktu lama; tema gelap/AMOLED mengurangi kelelahan mata dan konsumsi daya OLED.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery).
- **Saran:** ikuti tema sistem sebagai default, lalu sediakan opsi `Terang`, `Gelap`, dan `Hitam`. Pastikan kontras teks dan warna grafik tetap terbaca.
- **Prioritas:** Sedang.

#### B8. Kontrol Refresh dan Penanda Waktu Data

- **Temuan:** Sensors Toolbox (Premium) menyediakan pengaturan interval refresh. DevCheck menampilkan data realtime dengan grafik yang terus diperbarui.
- **Tujuan perbaikan:** data monitoring cepat usang; pengguna perlu tahu kapan terakhir diperbarui dan dapat mengatur frekuensi.
- **Referensi:** [Sensors Toolbox](https://play.google.com/store/apps/details?id=com.exatools.sensors), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck).
- **Saran:** tampilkan `Diperbarui x detik lalu`, tombol refresh manual, dan pilihan interval (`1 dtk`, `2 dtk`, `5 dtk`). Hentikan pembaruan saat layar tidak aktif.
- **Prioritas:** Sedang.

#### B9. Aksi Ekspor dari Setiap Layar Detail

- **Temuan:** Device Info menempatkan aksi ekspor sebagai FAB; Device Info HW menyediakan menu laporan. Pengguna dapat membagikan hasil tanpa menyalin manual.
- **Tujuan perbaikan:** hasil info/diagnostik lebih berguna jika mudah dibagikan ke teknisi.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw).
- **Saran:** sediakan aksi ekspor konsisten di app bar atau FAB; format teks/PDF/JSON; sertakan opsi menyembunyikan data sensitif.
- **Prioritas:** Sedang.

#### B10. Privasi Lokal-first dan Transparansi Izin

- **Temuan:** AIDA64 menyatakan tidak mengumpulkan data; DevCheck bebas iklan; AccuBattery menyatakan tidak mengakses informasi sensitif. Sebaliknya, beberapa kompetitor memakai iklan agresif dan langganan.
- **Tujuan perbaikan:** aplikasi info perangkat dipercaya karena mengakses banyak data; transparansi menjadi pembeda.
- **Referensi:** [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery).
- **Saran:** tampilkan halaman `Izin & Privasi` yang menjelaskan setiap izin, sediakan opsi hapus data lokal, dan jangan mengirim data tanpa persetujuan eksplisit.
- **Prioritas:** Tinggi.

## C. UI, UX, dan Layout

### C1. Inspektur Key-Value dengan Tab Kategori

- **Pola yang ditemukan:** CPU-Z memakai tab horizontal `SOC`, `DEVICE`, `SYSTEM`, `BATTERY`; baris key-value dengan nilai berwarna. AIDA64 memakai breadcrumb `AIDA64 / System` dan baris zebra. Device Info HW memakai app bar, tab yang dapat digulir, dan panel navigasi.
- **Tujuan pola:** memindai ratusan spesifikasi tanpa kehilangan konteks kategori.
- **Referensi:** [CPU-Z](https://play.google.com/store/apps/details?id=com.cpuid.cpu_z), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw).
- **Saran:** gunakan tab kategori untuk info perangkat; pertahankan baris key-value; tambahkan pencarian dan salin per baris. Untuk data bertingkat, gunakan breadcrumb atau judul seksi lengket.
- **Prioritas:** Tinggi.

### C2. Dashboard Kartu dengan Grafik Ringkas

- **Pola yang ditemukan:** DevCheck menampilkan kartu CPU dengan sparkline dan kartu RAM dengan ring; Device Info menampilkan ring RAM, grafik, grid frekuensi per core, kartu progres storage/baterai, dan pintasan aksi; Battery Guru menampilkan kartu kesehatan baterai, grafik arus, dan skor.
- **Tujuan pola:** memberi gambaran kondisi perangkat dalam sekali pandang.
- **Referensi:** [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru).
- **Saran:** susun dashboard dalam grid 2 kolom; setiap kartu memuat judul, nilai utama, grafik/ring, dan aksi `Lihat detail`. Batasi jumlah kartu agar tidak menjadi dinding data.
- **Prioritas:** Tinggi.

### C3. Katalog Uji dengan Pinned dan Kategori

- **Pola yang ditemukan:** Test Your Android menampilkan bagian `Pinned` berisi kartu uji favorit, lalu `Utilities & Tools` dalam grid kartu berikon. Detail uji menampilkan kartu key-value terpisah.
- **Tujuan pola:** pengguna sering mengulang uji tertentu; pinned mempercepat akses.
- **Referensi:** [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid).
- **Saran:** buat halaman `Diagnostik` dengan uji yang dipin di atas, kategori di bawah, dan status terakhir per uji. Gunakan ikon sederhana dan label singkat.
- **Prioritas:** Tinggi.

### C4. Layar Uji Penuh dengan Gestur

- **Pola yang ditemukan:** Display Tester menjalankan uji dalam layar penuh; geser kiri/kanan untuk ganti pola, geser atas/bawah untuk kecerahan, long press untuk keluar/masuk mode penuh. Aplikasi juga menyediakan bottom navigation untuk kategori `Basics` dan `Developer tools`.
- **Tujuan pola:** uji layar harus imersif dan tidak terganggu elemen UI.
- **Referensi:** [Display Tester](https://play.google.com/store/apps/details?id=com.gombosdev.displaytester).
- **Saran:** sembunyikan app bar saat uji berjalan; tampilkan instruksi singkat yang memudar; sediakan tombol `Selesai` yang selalu dapat diakses; jelaskan gestur sebelum uji dimulai.
- **Prioritas:** Tinggi.

### C5. Grafik Padat dengan Kontrol Rentang Waktu

- **Pola yang ditemukan:** AccuBattery memakai segmented control `Daily`/`Weekly`/`Monthly`, grafik batang, kartu statistik, dan tombol `Show sessions`. Battery Guru memakai segmented control `Week`/`Month`, kartu skor, dan ringkasan periode.
- **Tujuan pola:** data historis baterai/termal lebih bermakna jika dapat dilihat per rentang waktu.
- **Referensi:** [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery), [Battery Guru](https://play.google.com/store/apps/details?id=com.paget96.batteryguru).
- **Saran:** gunakan segmented control untuk `Harian`/`Mingguan`/`Bulanan`; tampilkan satu grafik utama dan kartu ringkasan; sediakan detail sesi di bawah.
- **Prioritas:** Sedang.

### C6. Kartu Sensor dengan Grafik per Sensor

- **Pola yang ditemukan:** Sensors Toolbox menampilkan setiap sensor sebagai kartu berisi nama, nilai X/Y/Z, detail vendor/daya, dan grafik garis. Ikon grafik membuka tampilan yang lebih besar.
- **Tujuan pola:** pengguna dapat membandingkan beberapa sensor sekaligus dan membuka detail yang diperlukan.
- **Referensi:** [Sensors Toolbox](https://play.google.com/store/apps/details?id=com.exatools.sensors).
- **Saran:** gunakan kartu yang dapat diperluas; tampilkan nilai realtime dan grafik mini; sediakan tombol `Detail` untuk metadata dan `Uji` untuk verifikasi.
- **Prioritas:** Tinggi.

### C7. Material You, Tema Gelap, dan Warna Dinamis

- **Pola yang ditemukan:** Device Info memakai tema Material You dengan warna dinamis, mendukung terang/gelap. AIDA64 memiliki tema biru/hitam. Device Info HW mendukung terang/gelap/hitam. AccuBattery mendukung gelap/AMOLED.
- **Tujuan pola:** aplikasi teknis tetap nyaman dipakai lama dan menyatu dengan tema sistem.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [AIDA64](https://play.google.com/store/apps/details?id=com.finalwire.aida64), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw), [AccuBattery](https://play.google.com/store/apps/details?id=com.digibites.accubattery).
- **Saran:** jadikan `ThemeMode.system` default; sediakan opsi tema; gunakan warna dari `ColorScheme` untuk kartu dan grafik; uji kontras di mode gelap.
- **Prioritas:** Sedang.

### C8. Model Navigasi: Bottom Navigation untuk Area Utama

- **Pola yang ditemukan:** Display Tester memakai bottom navigation untuk kategori; DevCheck memakai tab atas dan grid pintasan; Device Info HW memakai drawer + tab.
- **Tujuan pola:** aplikasi dengan banyak alat perlu hierarki navigasi yang konsisten.
- **Referensi:** [Display Tester](https://play.google.com/store/apps/details?id=com.gombosdev.displaytester), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw).
- **Saran:** gunakan bottom navigation 4-5 area utama (`Dashboard`, `Perangkat`, `Monitor`, `Diagnostik`, `Alat`); gunakan tab di dalam area yang membutuhkan subkategori. Hindari menggabungkan drawer dan bottom navigation sekaligus.
- **Prioritas:** Sedang.

### C9. Aksi Ekspor dan Bagikan yang Mudah Ditemukan

- **Pola yang ditemukan:** Device Info menempatkan FAB ekspor; Device Info HW menyediakan menu laporan; beberapa aplikasi menyediakan tombol share di app bar.
- **Tujuan pola:** hasil info/diagnostik sering perlu dikirim ke pihak lain.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Device Info HW](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw).
- **Saran:** tempatkan aksi ekspor pada app bar atau FAB dengan label yang jelas; sediakan pratinjau sebelum berbagi; izinkan memilih bagian data yang disertakan.
- **Prioritas:** Sedang.

### C10. Progres dan Status Terakhir pada Diagnostik

- **Pola yang ditemukan:** Device Info menampilkan kartu `Tests 9/115 Completed`; Test Your Android memisahkan pinned dan kategori; DevCheck menampilkan pintasan `Tests`.
- **Tujuan pola:** pengguna tahu sejauh mana pemeriksaan dilakukan dan apa yang perlu diulang.
- **Referensi:** [Device Info: System & CPU Info](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo), [Test Your Android](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid), [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck).
- **Saran:** tampilkan ringkasan `x/y uji selesai`, status terakhir per uji, dan tombol `Lanjutkan` atau `Uji ulang yang gagal`.
- **Prioritas:** Tinggi.

### Peta Pola per Aplikasi

| Aplikasi | Pola UI/UX utama | Kekuatan yang dapat ditiru |
| --- | --- | --- |
| CPU-Z | Tab kategori + baris key-value | Struktur info ringkas, nilai mudah dipindai |
| AIDA64 | Breadcrumb + baris zebra + tema gelap | Navigasi hierarkis untuk data dalam |
| Device Info HW | Tab scrollable + panel navigasi + laporan | Navigasi cepat, salin teks, ekspor HTML/PDF |
| DevCheck | Dashboard kartu + sparkline + ring + tab | Ringkasan realtime dan pintasan alat |
| Device Info: System & CPU Info | Dashboard Material You + grid metrik + FAB ekspor | Dashboard kaya metrik dan ekspor mudah |
| Test Your Android | Katalog uji pinned + grid kartu | Uji terstruktur dan favorit |
| Display Tester | Layar penuh + gestur + bottom navigation | Uji layar imersif |
| Battery Guru | Kartu besar + grafik + segmented control | Narasi kesehatan baterai yang jelas |
| AccuBattery | Grafik historis + segmented control + kartu statistik | Analisis baterai berbasis data |
| Sensors Toolbox | Kartu sensor + grafik per sensor | Workbench sensor yang lengkap |

## D. Katalog Listing yang Dianalisa

Sepuluh listing berikut telah dianalisa dan statusnya diubah menjadi `Sudah Dianalisa` di `apk_kompetitor.md`. Katalog lengkap 159 listing tetap berada di `apk_kompetitor.md`.

| Nama Aplikasi | Store | Link | Fokus Fitur | Pola UI/UX | Status |
| --- | --- | --- | --- | --- | --- |
| CPU-Z | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.cpuid.cpu_z) | SoC, per core clock, perangkat, sistem, baterai, sensor | Tab kategori + baris key-value | Sudah Dianalisa |
| AIDA64 | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.finalwire.aida64) | CPU/GPU realtime, layar, kamera, baterai, jaringan, sensor, codec | Breadcrumb + baris zebra + tema gelap | Sudah Dianalisa |
| Device Info HW | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw) | Deteksi komponen, termal, partisi, PMIC, laporan | Tab scrollable + panel navigasi + laporan | Sudah Dianalisa |
| DevCheck Device & System Info | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=flar2.devcheck) | Dashboard, hardware, sistem, baterai, jaringan, sensor, benchmark, uji | Dashboard kartu + sparkline + tab | Sudah Dianalisa |
| Device Info: System & CPU Info | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo) | Dashboard, spesifikasi, CPU/GPU, baterai, jaringan, uji, widget, ekspor | Dashboard Material You + grid metrik + FAB | Sudah Dianalisa |
| Test Your Android | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid) | 35+ uji hardware, utilitas, info sistem, keamanan | Katalog uji pinned + grid kartu | Sudah Dianalisa |
| Display Tester | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.gombosdev.displaytester) | Uji layar, sentuh, warna, gamma, burn-in, DPI | Layar penuh + gestur + bottom navigation | Sudah Dianalisa |
| Battery Guru: Battery Health | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.paget96.batteryguru) | Kesehatan baterai, pengisian, riwayat, alarm, widget | Kartu besar + grafik + segmented control | Sudah Dianalisa |
| AccuBattery | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.digibites.accubattery) | Kesehatan baterai, laju pengisian, pemakaian per aplikasi | Grafik historis + segmented control + kartu | Sudah Dianalisa |
| Sensors Toolbox | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.exatools.sensors) | Semua sensor, grafik realtime, alat sensor | Kartu sensor + grafik per sensor | Sudah Dianalisa |

### Sisa Listing per Store

| Store | Total Listing | Sudah Dianalisa | Belum Dianalisa |
| --- | --- | --- | --- |
| Google Play Store | 53 | 10 | 43 |
| F-Droid | 21 | 0 | 21 |
| GitHub | 16 | 0 | 16 |
| Apple App Store | 39 | 0 | 39 |
| Samsung Galaxy Store | 14 | 0 | 14 |
| Mi/GetApps | 9 | 0 | 9 |
| APKPure | 3 | 0 | 3 |
| Aptoide | 4 | 0 | 4 |
| **Total** | **159** | **10** | **149** |

## E. Prioritas Gabungan

Tabel berikut merangkum seluruh rekomendasi untuk memudahkan penyortiran. Urutan sudah disusun dari prioritas tertinggi.

| Kode | Rekomendasi | Jenis | Prioritas | Sumber Utama |
| --- | --- | --- | --- | --- |
| A1 | Laboratorium kesehatan baterai dan pengisian | Fitur baru | Tinggi | Battery Guru, AccuBattery |
| A2 | Diagnostik hardware terpandu dengan laporan | Fitur baru | Tinggi | Test Your Android, DevCheck |
| A3 | Diagnostik layar dan sentuh | Fitur baru | Tinggi | Display Tester |
| A4 | Workbench sensor lengkap | Fitur baru | Tinggi | Sensors Toolbox, DevCheck |
| B1 | Dashboard ringkas sebelum detail panjang | Optimasi | Tinggi | DevCheck, Device Info |
| B2 | Nilai realtime dengan sparkline dan ring | Optimasi | Tinggi | DevCheck, Device Info |
| B3 | Pencarian, salin, dan navigasi cepat | Optimasi | Tinggi | Device Info HW, AIDA64 |
| B4 | Label keyakinan dan metodologi nilai estimasi | Optimasi | Tinggi | Battery Guru, AccuBattery |
| B5 | Status uji konsisten dan ringkasan hasil | Optimasi | Tinggi | Test Your Android, DevCheck |
| B6 | Uji sensor langsung dari daftar sensor | Optimasi | Tinggi | Sensors Toolbox, DevCheck |
| B10 | Privasi lokal-first dan transparansi izin | Optimasi | Tinggi | AIDA64, DevCheck, AccuBattery |
| C1 | Inspektur key-value dengan tab kategori | UI/UX | Tinggi | CPU-Z, AIDA64, Device Info HW |
| C2 | Dashboard kartu dengan grafik ringkas | UI/UX | Tinggi | DevCheck, Device Info, Battery Guru |
| C3 | Katalog uji dengan pinned dan kategori | UI/UX | Tinggi | Test Your Android |
| C4 | Layar uji penuh dengan gestur | UI/UX | Tinggi | Display Tester |
| C6 | Kartu sensor dengan grafik per sensor | UI/UX | Tinggi | Sensors Toolbox |
| C10 | Progres dan status terakhir pada diagnostik | UI/UX | Tinggi | Device Info, Test Your Android |
| A5 | Monitoring termal dan indikator throttling | Fitur baru | Tinggi | DevCheck, Device Info HW |
| A6 | Diagnostik jaringan seluler dan WiFi | Fitur baru | Tinggi | AIDA64, DevCheck, Device Info |
| A7 | Diagnostik penyimpanan dan memori | Fitur baru | Tinggi | DevCheck, Device Info |
| A8 | Widget dan floating monitor | Fitur baru | Tinggi | DevCheck, Device Info, Battery Guru |
| A9 | Benchmark lokal dengan riwayat skor | Fitur baru | Sedang | DevCheck |
| A10 | Ekspor dan bagikan laporan perangkat | Fitur baru | Sedang | Device Info HW, Device Info |
| A11 | Inspektur kemampuan kamera | Fitur baru | Sedang | DevCheck, Device Info |
| A12 | Info codec, DRM, dan keamanan sistem | Fitur baru | Sedang | AIDA64, Device Info, Test Your Android |
| A13 | Inventaris konektivitas perangkat | Fitur baru | Sedang | Device Info, Device Info HW |
| A14 | Analisis aplikasi dan ekstraksi APK | Fitur baru | Sedang | Device Info, DevCheck |
| A15 | Perbaikan burn-in layar | Fitur baru | Sedang | Display Tester |
| B7 | Mode tema terang, gelap, dan AMOLED | Optimasi | Sedang | Device Info, AIDA64, AccuBattery |
| B8 | Kontrol refresh dan penanda waktu data | Optimasi | Sedang | Sensors Toolbox, DevCheck |
| B9 | Aksi ekspor dari setiap layar detail | Optimasi | Sedang | Device Info, Device Info HW |
| C5 | Grafik padat dengan kontrol rentang waktu | UI/UX | Sedang | AccuBattery, Battery Guru |
| C7 | Material You, tema gelap, dan warna dinamis | UI/UX | Sedang | Device Info, AIDA64, AccuBattery |
| C8 | Bottom navigation untuk area utama | UI/UX | Sedang | Display Tester, DevCheck |
| C9 | Aksi ekspor dan bagikan mudah ditemukan | UI/UX | Sedang | Device Info, Device Info HW |
| A16 | Diagnostik lanjutan root/Shizuku | Fitur baru | Rendah | DevCheck, Device Info HW |
| A17 | Toolkit utilitas (QR, waterpass, sound meter, kompas) | Fitur baru | Rendah | Test Your Android, Sensors Toolbox |
| A18 | Basis data perbandingan perangkat | Fitur baru | Rendah | CPU-Z, Device Info HW, DevCheck |
| A19 | Layar pengisian dan ikon status bar | Fitur baru | Rendah | Battery Guru, AccuBattery |
| A20 | Analisis izin, data, dan waktu layar | Fitur baru | Rendah | Device Info, DevCheck |

## F. Verifikasi dan Keterbatasan

### Verifikasi Tautan

Seluruh tautan diperiksa dengan `curl` dan menghasilkan HTTP 200 pada 2026-11-14.

| Aplikasi | URL | HTTP |
| --- | --- | --- |
| CPU-Z | `https://play.google.com/store/apps/details?id=com.cpuid.cpu_z` | 200 |
| AIDA64 | `https://play.google.com/store/apps/details?id=com.finalwire.aida64` | 200 |
| Device Info HW | `https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw` | 200 |
| DevCheck | `https://play.google.com/store/apps/details?id=flar2.devcheck` | 200 |
| Device Info: System & CPU Info | `https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo` | 200 |
| Test Your Android | `https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid` | 200 |
| Display Tester | `https://play.google.com/store/apps/details?id=com.gombosdev.displaytester` | 200 |
| Battery Guru | `https://play.google.com/store/apps/details?id=com.paget96.batteryguru` | 200 |
| AccuBattery | `https://play.google.com/store/apps/details?id=com.digibites.accubattery` | 200 |
| Sensors Toolbox | `https://play.google.com/store/apps/details?id=com.exatools.sensors` | 200 |

### Keterbatasan

- `apk_serupa.md` tidak ditemukan; lingkup mengikuti `apk_kompetitor.md`.
- Detail implementasi Spektra tidak tersedia di workspace ini; bagian `B` adalah arah optimasi, bukan audit kode.
- Pola UI/UX dibaca dari tangkapan layar resmi Play Store. Tampilan dapat berbeda pada versi aplikasi atau perangkat lain.
- Beberapa fitur kompetitor memerlukan izin khusus (`Usage Access`, overlay, notifikasi, akses jaringan) atau root/Shizuku. Fitur tersebut ditandai opsional.
- Fitur yang membutuhkan backend/akun (database perbandingan, ranking publik) ditempatkan pada prioritas rendah agar sesuai prinsip lokal-first.
- Fitur khusus iOS, Wear OS, atau Google Cast tidak dijadikan rekomendasi utama karena di luar target mobile Android.
- Angka prioritas bersifat rekomendasi riset, bukan keputusan produk.

## G. Sumber

### Sumber Listing

1. [CPU-Z — Google Play Store](https://play.google.com/store/apps/details?id=com.cpuid.cpu_z)
2. [AIDA64 — Google Play Store](https://play.google.com/store/apps/details?id=com.finalwire.aida64)
3. [Device Info HW — Google Play Store](https://play.google.com/store/apps/details?id=ru.andr7e.deviceinfohw)
4. [DevCheck Device & System Info — Google Play Store](https://play.google.com/store/apps/details?id=flar2.devcheck)
5. [Device Info: System & CPU Info — Google Play Store](https://play.google.com/store/apps/details?id=com.ytheekshana.deviceinfo)
6. [Test Your Android — Google Play Store](https://play.google.com/store/apps/details?id=hibernate.v2.testyourandroid)
7. [Display Tester — Google Play Store](https://play.google.com/store/apps/details?id=com.gombosdev.displaytester)
8. [Battery Guru: Battery Health — Google Play Store](https://play.google.com/store/apps/details?id=com.paget96.batteryguru)
9. [AccuBattery — Google Play Store](https://play.google.com/store/apps/details?id=com.digibites.accubattery)
10. [Sensors Toolbox — Google Play Store](https://play.google.com/store/apps/details?id=com.exatools.sensors)

### Sumber Internal

- `apk_kompetitor.md` — katalog 159 listing dan status analisa per baris.
- `README.md` — konteks repositori dan proyek.
- `AGENTS.md` — aturan kerja dan larangan.
- `.agents/skills/custom/riset-kompetitor/SKILL.md` — metode dan batasan riset.
- `.kilo/commands/riset_kompetitor.md` — perintah dan format laporan.

### Tanggal Akses

- 2026-11-14 (WIB).
