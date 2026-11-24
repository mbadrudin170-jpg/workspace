# Sesi 265

- Tugas: implementasi service discovery (flutter_local_device_discovery) untuk memperkaya daftar perangkat WiFi (nama/MAC/vendor) pada admin_wifi.
- Perubahan:
  - pubspec: tambah `flutter_local_device_discovery` (^0.1.0, tersedia 2.0.0).
  - perangkat_wifi_notifier.dart: jalankan `FlutterLocalDeviceDiscovery.discover` (mDNS/DNS-SD/SSDP/UPnP) paralel dengan host scan, gabungkan hasil berdasarkan IP (nama/vendor/MAC), tambahkan perangkat yang hanya muncul dari discovery.
  - list_perangkat_widget.dart: fallback label "Perangkat tidak dikenal" bila nama null.
  - wifi_analyzer_screen_test.dart: alihkan ke mode WiFi sebelum asersi (default mode kini perangkat).
- Verifikasi: dart format bersih, dart analyze No issues, flutter test wifi_analyzer_screen 1/1 lulus.
- Catatan: MAC/vendor di Android tetap terbatas oleh OS; discovery hanya memperkaya perangkat yang merespons protokol discovery.
- Sudah Sinkron