---
name: isolasi-widget-timer
description: "Trigger: saat widget diperbarui berkala (Timer.periodic) | Panduan isolasi widget timer ke widget terpisah agar hanya widget itu yang rebuild, bukan seluruh halaman. Isolasi Widget yang Diperbarui Berkala (Timer/Animasi) Widget yang diperbarui secara berkala (mis. `Timer.periodic` per detik) wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild. Aturan 1. Widget yang diperbarui secara berkala wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild, bukan seluruh halaman. 2. Timer wajib dibatalkan (`cancel()`) di `dispose()` widget yang memilikinya. 3. Di dalam callback timer, periksa `mounted` sebelum memanggil `setState`. 4. Jangan menjalankan `Timer.periodic` pada widget yang mencakup seluruh halaman apabila hanya sebagian tampilan yang perlu diperbarui. 5. Jangan membiarkan timer tetap aktif setelah widget tidak lagi terpasang. 6. Widget teknik SOS yang interaktif (timer/animasi napas: Box Breathing, Napas 4-7"
---

# Isolasi Widget yang Diperbarui Berkala (Timer/Animasi)

Widget yang diperbarui secara berkala (mis. `Timer.periodic` per detik) wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild.

## Aturan

1. Widget yang diperbarui secara berkala wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild, bukan seluruh halaman.
2. Timer wajib dibatalkan (`cancel()`) di `dispose()` widget yang memilikinya.
3. Di dalam callback timer, periksa `mounted` sebelum memanggil `setState`.
4. Jangan menjalankan `Timer.periodic` pada widget yang mencakup seluruh halaman apabila hanya sebagian tampilan yang perlu diperbarui.
5. Jangan membiarkan timer tetap aktif setelah widget tidak lagi terpasang.
6. Widget teknik SOS yang interaktif (timer/animasi napas: Box Breathing, Napas 4-7-8, Napas 90 Detik, Grounding 5-4-3-2-1, Urge Surfing, Timer Craving, Distraksi) wajib diekstrak ke file terpisah `lib/fitur/sos_craving/widgets/*_view.dart` sebagai `ConsumerStatefulWidget` + `ConsumerState`, bukan kelas private di dalam file layar. Layar utama hanya menyimpan state `_teknikTerpilih` dan merender tampilan sesuai pilihan.

## Contoh Benar

```dart
class _HeaderPemulihan extends StatefulWidget {
  const _HeaderPemulihan({required this.tanggalBerhenti});
  final DateTime tanggalBerhenti;

  @override
  State<_HeaderPemulihan> createState() => _HeaderPemulihanState();
}

class _HeaderPemulihanState extends State<_HeaderPemulihan> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // hanya widget ini yang rebuild tiap detik
    return Text('Hari ke-${_hitungHari()}');
  }
}
```

## Contoh Salah

```dart
// Timer.periodic dijalankan di widget tingkat halaman, menyebabkan
// seluruh halaman rebuild setiap detik.
class _HalamanState extends State<Halaman> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {}); // rebuild seluruh halaman
    });
  }
}
```
