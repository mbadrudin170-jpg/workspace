# Overlay Log Debug pada Root App

1. Setiap proyek Flutter yang bergantung pada `share_global_saya` **WAJIB** membungkus root app (`app.dart`/`main.dart`) dengan `PengelolaOverlayLogDebug` (ikon melayang + panel log debug), dan menginisialisasi logger `L` dengan `ProviderContainer` yang sama (`L.init(container)`) sebelum `runApp`.
2. Detail teknis (pola inisialisasi, `UncontrolledProviderScope`, pengelolaan `OverlayEntry`) diatur pada skill `overlay-log-debug`.
