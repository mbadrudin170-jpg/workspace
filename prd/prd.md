# PRD — Pengembangan LAN Device Discovery & Device Detail

**Proyek:** admin_wifi  
**Modul:** WiFi Analyzer  
**Platform:** Flutter Android  
**Status:** Draft — Siap untuk evaluasi dan implementasi  
**Dasar pemeriksaan:** Commit `d826ca904978f890b6901d32fb90b70f47e48530`

---

## 1. Latar Belakang

Modul WiFi Analyzer pada admin_wifi sudah memiliki fondasi untuk menemukan perangkat lain dalam jaringan Wi-Fi lokal.

Implementasi yang tersedia meliputi:

- Subnet scanning menggunakan `network_tools`.
- Discovery layanan menggunakan `bonsoir`.
- Pengambilan informasi jaringan menggunakan `network_info_plus`.
- Pengukuran ICMP menggunakan `dart_ping`.
- Pengelolaan permission menggunakan `permission_handler`.
- Pemindaian access point menggunakan `wifi_scan`.

Namun, sistem belum sepenuhnya mampu mengidentifikasi perangkat dan menyajikan informasi detail seperti MAC Address, manufacturer, jenis perangkat, packet loss, serta open ports.

Pengembangan ini bertujuan menyempurnakan fitur yang sudah tersedia tanpa membuat ulang sistem discovery.

## 2. Tujuan

1. Menemukan perangkat sebanyak mungkin dalam jaringan Wi-Fi lokal.
2. Mendukung berbagai merek router.
3. Meningkatkan akurasi identifikasi perangkat.
4. Menampilkan informasi detail setiap perangkat.
5. Memantau konektivitas setiap perangkat.
6. Menyediakan pemeriksaan port TCP.
7. Mempertahankan kompatibilitas dan arsitektur proyek yang sudah ada.

## 3. Kondisi Implementasi Saat Ini

| Fitur | Kondisi |
|---|---|
| Membaca IP lokal | Sudah tersedia |
| Membaca subnet | Sudah tersedia |
| Subnet scanning | Sudah tersedia |
| mDNS / Bonjour | Sudah tersedia |
| Hostname | Sebagian tersedia |
| Manufacturer | Sebagian tersedia |
| MAC Address pada model | Belum tersedia |
| Klasifikasi perangkat | Belum tersedia |
| Daftar perangkat | Sudah tersedia |
| Detail perangkat | Belum tersedia |
| Ping gateway | Sudah tersedia |
| Ping per perangkat | Belum lengkap |
| Packet Loss per perangkat | Belum tersedia |
| TCP Port Scanner | Belum tersedia |

Pengembangan wajib mempertahankan implementasi yang masih relevan dan menghindari duplikasi.

## 4. Ruang Lingkup Pengembangan

### Tahap 1 — Penyempurnaan Network Discovery

**Tujuan:** meningkatkan kemampuan menemukan perangkat dalam jaringan lokal.

Pekerjaan:

1. Evaluasi dan perbaikan subnet calculation.
2. Mendukung berbagai ukuran subnet berdasarkan konfigurasi aktual.
3. Menggabungkan hasil `network_tools` dan `bonsoir`.
4. Mencegah duplikasi perangkat.
5. Menambahkan informasi sumber discovery.
6. Menangani perubahan jaringan Wi-Fi.
7. Menangani timeout dan pembatalan scanning.
8. Memperbaiki permission akses jaringan lokal sesuai target SDK.

Ketentuan:bantu s

- Jangan mengasumsikan seluruh jaringan menggunakan `/24`.
- Jangan memindai alamat di luar subnet aktif.
- Kegagalan satu metode tidak boleh menghentikan metode lainnya.
- Perangkat yang tidak merespons ICMP tetap dapat ditemukan melalui metode lain.

### Tahap 2 — Device Identification

**Tujuan:** memperoleh identitas perangkat secara lebih akurat.

Informasi yang dikumpulkan:

| Informasi | Sumber |
|---|---|
| IP Address | Network discovery |
| MAC Address | ARP / Neighbor / Router API |
| Hostname | Hostname resolution |
| Manufacturer | Database OUI |
| Device Type | Device fingerprint |
| Service | mDNS / SSDP |
| Last Seen | Waktu discovery |

Ketentuan:

- Manufacturer tidak boleh diambil dari header HTTP `Server`.
- Informasi hostname tidak boleh dianggap sebagai manufacturer.
- MAC yang tidak tersedia harus bernilai null.
- Jenis perangkat yang belum dapat diidentifikasi harus menggunakan kategori Unknown atau Generic.
- Identifikasi harus menyimpan sumber informasi dan tingkat keyakinan jika memungkinkan.

### Tahap 3 — Device Detail Screen

**Tujuan:** menampilkan informasi lengkap perangkat yang ditemukan.

Halaman detail dibuka melalui interaksi pada kartu perangkat di `ListPerangkatWidget`.

Susunan informasi:

**A. Device Identity**
- Device Name.
- Device Type.
- Manufacturer.
- MAC Address.

**B. Network Information**
- IP Address.
- Status.
- Ping.
- Packet Loss.
- Last Seen.

**C. Open Ports**
- Tombol Scan Ports.
- Daftar port terbuka.
- Nomor port.
- Nama layanan jika teridentifikasi.

Ketentuan UI:

- Mengikuti referensi tampilan yang diberikan pengguna.
- Mendukung dark mode.
- Informasi yang tidak tersedia ditampilkan sebagai Not Available.
- Tidak menampilkan data hasil tebakan sebagai informasi pasti.

### Tahap 4 — Device Monitoring

**Tujuan:** memantau konektivitas setiap perangkat.

Fitur:

1. ICMP Ping per perangkat.
2. Average Latency.
3. Minimum Latency.
4. Maximum Latency.
5. Packet Loss.
6. Status perangkat.

Ketentuan:

- Ping gateway dan ping perangkat harus tetap dibedakan.
- TCP Probe tidak boleh dilabeli sebagai ICMP Ping.
- Packet Loss dihitung berdasarkan beberapa probe.
- Satu kegagalan ping tidak langsung menjadikan perangkat offline.
- Monitoring harus memiliki interval yang terkendali.

### Tahap 5 — TCP Port Scanner

**Tujuan:** mengetahui port TCP yang menerima koneksi pada perangkat tertentu.

Informasi:

- Port Number.
- Protocol.
- Status.
- Service Name jika tersedia.

Ketentuan:

- Pemindaian dilakukan atas permintaan pengguna.
- Pengguna memilih perangkat yang akan diperiksa.
- Memiliki timeout dan batas concurrency.
- Tidak melakukan eksploitasi layanan.
- Tidak memindai seluruh perangkat secara otomatis.

## 5. Arsitektur dan Integrasi

Pengembangan harus menggunakan struktur WiFi Analyzer yang sudah ada.

Komponen yang harus dievaluasi dan digunakan kembali:

- `PerangkatWifiModel`
- `PerangkatWifiState`
- `PerangkatWifiNotifier`
- `PingNotifier`
- `ListPerangkatWidget`
- `WifiAnalyzerScreen`

Tidak diperbolehkan membuat scanner baru yang menduplikasi fungsi `PerangkatWifiNotifier`.

Service tambahan hanya dibuat apabila memang memiliki tanggung jawab baru dan tidak dapat ditangani secara wajar oleh komponen yang sudah tersedia.

State management tetap mengikuti standar Riverpod proyek.

## 6. Persyaratan Android

- Memeriksa target SDK aktual.
- Menangani permission LAN sesuai versi Android.
- Menangani permission lokasi jika diperlukan oleh metode Wi-Fi tertentu.
- Menangani permission yang ditolak.
- Menangani perubahan jaringan.
- Memastikan discovery tidak menggunakan konfigurasi jaringan yang sudah kedaluwarsa.

Untuk target Android 17 / API 37 atau lebih tinggi, akses LAN luas memerlukan pengelolaan `ACCESS_LOCAL_NETWORK` sesuai ketentuan Android.

## 7. Nonfunctional Requirements

**Performance**
- Tidak menyebabkan UI freeze.
- Menggunakan concurrency terbatas.
- Memiliki timeout.
- Mendukung pembatalan proses.

**Reliability**
- Discovery multi-metode.
- Deduplikasi hasil.
- Penanganan error per metode.
- Validasi data sebelum ditampilkan.

**Battery Efficiency**
- Tidak menjalankan scanning intensif tanpa kendali.
- Tidak menjalankan port scanning otomatis.
- Refresh menggunakan interval yang terkendali.

**Maintainability**
- Menghindari boilerplate.
- Menghindari duplikasi kode.
- Memanfaatkan package yang sudah tersedia.
- Memisahkan tanggung jawab setiap komponen.
- Menggunakan logging yang sesuai standar proyek.

## 8. Acceptance Criteria

### Discovery
- [ ] IP dan konfigurasi subnet terbaca dengan benar.
- [ ] Perhitungan subnet sesuai prefix aktual.
- [ ] Perangkat dapat ditemukan menggunakan subnet scanner.
- [ ] Discovery mDNS tetap berjalan.
- [ ] Hasil kedua metode digabung tanpa duplikasi.
- [ ] Perubahan jaringan ditangani dengan benar.

### Identification
- [ ] IP perangkat tersedia ketika berhasil ditemukan.
- [ ] MAC Address diperoleh jika sistem mengizinkan.
- [ ] Manufacturer berasal dari sumber yang valid.
- [ ] Hostname dan manufacturer dipisahkan.
- [ ] Device Type memiliki fallback Unknown.
- [ ] Sumber identifikasi dapat ditelusuri.

### Device Detail
- [ ] Kartu perangkat dapat dibuka.
- [ ] Halaman detail menampilkan informasi identitas.
- [ ] Halaman detail menampilkan informasi jaringan.
- [ ] Data yang tidak tersedia ditangani dengan benar.

### Monitoring
- [ ] Ping dapat dilakukan per perangkat.
- [ ] Packet Loss dapat dihitung.
- [ ] TCP Probe dan ICMP dibedakan.
- [ ] Status perangkat tidak ditentukan hanya dari satu kegagalan ping.

### Port Scanner
- [ ] Pengguna dapat memilih perangkat.
- [ ] Pengguna dapat memulai pemindaian port.
- [ ] Hasil port terbuka ditampilkan.
- [ ] Proses dapat dihentikan.

## 9. Urutan Implementasi

| Urutan | Tahapan | Prioritas |
|---|---|---|
| 1 | Penyempurnaan Discovery | Sangat Tinggi |
| 2 | Device Identification | Sangat Tinggi |
| 3 | Device Detail Screen | Tinggi |
| 4 | Device Monitoring | Tinggi |
| 5 | TCP Port Scanner | Menengah |

Setiap tahap harus dievaluasi sebelum melanjutkan tahap berikutnya.

## 10. Di Luar Ruang Lingkup

Untuk versi awal, fitur berikut tidak wajib:

- Integrasi API seluruh merek router.
- Pengelolaan konfigurasi router.
- Pemblokiran perangkat.
- Pemutusan koneksi perangkat.
- Eksploitasi port atau layanan.
- Pemantauan lalu lintas jaringan secara mendalam.

Integrasi API router dapat menjadi pengembangan terpisah untuk meningkatkan kelengkapan daftar klien.

## 11. Definisi Keberhasilan

Pengembangan dinyatakan berhasil apabila admin_wifi mampu:

1. Menemukan perangkat lain pada jaringan Wi-Fi lokal melalui beberapa metode.
2. Menggabungkan hasil discovery secara akurat.
3. Menampilkan informasi identitas perangkat berdasarkan bukti yang tersedia.
4. Menyediakan halaman detail perangkat.
5. Mengukur konektivitas perangkat secara terpisah dari gateway.
6. Memeriksa port TCP berdasarkan permintaan pengguna.
7. Berjalan stabil tanpa menduplikasi sistem yang sudah ada.

**Keputusan akhir:** pengembangan merupakan penyempurnaan modul WiFi Analyzer yang sudah ada, bukan pembuatan modul LAN Discovery baru dari nol.