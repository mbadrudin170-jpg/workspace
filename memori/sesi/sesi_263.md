# Sesi 263

- Tugas: mencari paket Flutter/Dart untuk mendeteksi perangkat yang terhubung ke WiFi yang sama (network scanning / device discovery).
- Hasil: rekomendasi disusun. Proyek admin_wifi sudah memakai `network_tools` (^6.0.18) + `network_info_plus` (^8.2.2) + `dart_ping` (^10.0.1) + `wifi_scan` (^0.5.0). Untuk daftar perangkat di subnet yang sama, gunakan `network_info_plus` (ambil IP → turunkan subnet) lalu `network_tools` `HostScannerService.getAllPingableDevices`/`getAllPingableDevicesAsync`. Alternatif pelengkap: `flutter_local_device_discovery` (^2.0.0) untuk discovery berbasis protokol (mDNS/SSDP/WS-Discovery/UPnP) dengan info lebih kaya, namun hanya perangkat yang merespons protokol discovery. Keterbatasan: tidak ada paket yang menjamin 100% perangkat (client isolation, firewall, batasan ARP di Android 11+/iOS, hostname sering null di jaringan rumah; MAC/vendor hanya desktop).
- Status: selesai (tanpa perubahan kode).
- Sudah Sinkron
