---
name: logging-debug
description: "Trigger: saat menambahkan log debug; saat membersihkan/mengurangi log berlebihan (narasi langkah, banner separator) | Panduan logging proyek (L.i, L.s, L.w, L.e, L.json, L.list, L.api) untuk variabel dan parameter, format singkat dan konsisten; log narasi langkah tanpa nilai aktual dan banner/separator DILARANG; L.e wajib menyertakan stack trace ($e $s); dilarang membuat wrapper log manual per proyek — cukup gunakan L dari share_global_saya. Logging Debug pada Variabel dan Parameter Gunakan sistem logging yang sudah tersedia di proyek (`L.*` dari `share_global_saya`, `lib/src/utils/l.dart`) untuk mencatat nilai variabel dan parameter, alih-alih membuat sistem logging baru. API `L` (share_global_saya) - `L.i(String message)` → `ℹ️ …` (`TipeLog.info`) - `L.s(String message)` → `✅ …` (`TipeLog.sukses`) - `L.w(String message)` → `⚠️ …` (`TipeLog.warning`) - `L.e(String message)` → `❌ …` (`TipeLog.error`) - `L.json(Map<String, dynamic> data)` → `📦 …` (`TipeLog.info`) - `L.list(List<dynamic> items, {String label ="
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Thu Nov 19 2026 02:38 WIB"
---

# Logging Debug pada Variabel dan Parameter

Gunakan sistem logging yang sudah tersedia di proyek (`L.*` dari `share_global_saya`, `lib/src/utils/l.dart`) untuk mencatat nilai variabel dan parameter, alih-alih membuat sistem logging baru.

## API `L` (share_global_saya)

- `L.i(String message)` → `ℹ️ …` (`TipeLog.info`)
- `L.s(String message)` → `✅ …` (`TipeLog.sukses`)
- `L.w(String message)` → `⚠️ …` (`TipeLog.warning`)
- `L.e(String message)` → `❌ …` (`TipeLog.error`)
- `L.json(Map<String, dynamic> data)` → `📦 …` (`TipeLog.info`)
- `L.list(List<dynamic> items, {String label = '📋'})` → `<label> …` (`TipeLog.info`)
- `L.api(String path, Map<String, dynamic> data, {required String method})` → `🌐 [<method>][<id-uuid>] <path> Data: <data>` (`TipeLog.api`)

## Infrastruktur Overlay Debug

- `L.init(ProviderContainer container)` WAJIB dipanggil dengan container yang sama dengan root app; tanpa init, log hanya keluar ke console (`debugPrint`, `kDebugMode`) dan TIDAK masuk panel overlay.
- Routing ke overlay: setiap log ditambahkan sinkron ke buffer `L.buffer`, lalu di-kirim ke `logDebugProvider.notifier.tambah(model)` lewat `Future.delayed(Duration(milliseconds: 50))` dalam `try/catch` (kegagalan dicatat via `debugPrint` di `kDebugMode` saja).
- `L.hapusBuffer()` mengosongkan `L.buffer` (sinkron dengan `hapusSemua` notifier).
- `L.buffer` adalah sumber gabungan panel overlay (dedup per `id` dengan `logDebugProvider`) — lihat skill `overlay-log-debug`.
- `showLocation = true` (default): setiap output console diberi prefix `[<file.dart>:<line>]` hasil parse stack trace (`useTerse = true`; frame `.g.dart`/`.freezed.dart`/riverpod/flutter/dart-sdk dilewati; fallback `_getCallerInfoManual`). `_aktifkanLog = true` bersifat `final` — tidak ada API publik untuk mematikan logging.
- `L` bukan pengganti `print()` untuk debugging satu-kali sembarangan; helper paralel `p(...)` (`print_custom.dart`, `kDebugMode` saja) khusus dipakai internal `share_global_saya` dan TIDAK routing ke overlay — jangan dipakai di kode proyek sebagai pengganti `L`.

## Aturan

1. Tambahkan log pada setiap variabel dan parameter yang relevan, **setelah** variabel mendapatkan nilainya.
2. Format log wajib singkat: nama variabel dan nilainya menggunakan interpolasi Dart, mis. `L.i('kopi=$kopi, susu=$susu')`.
3. Untuk objek model (Freezed, API, database, repository), cukup tampilkan objek langsung: `L.i('model=$model')`; jangan uraikan properti satu per satu.
4. Gabungkan variabel yang berkaitan dalam satu pemanggilan log apabila berada pada titik eksekusi yang sama.
5. Jangan mencatat variabel sensitif (password, token, OTP, secret key, kredensial).
6. Jangan mengubah logika bisnis, nilai variabel, tipe data, kondisi percabangan, atau menambah fitur saat menambahkan log.
7. Jangan menambahkan log sebelum variabel mendapatkan nilai.
8. Jangan menambahkan log yang tidak memberikan informasi nilai aktual.
9. Jangan menggunakan `print()` sebagai pengganti logger yang tersedia.
10. Pada `catch`, catat error dengan konteks proses yang gagal dan **wajib** sertakan stack trace: `L.e('Gagal ...: $e $s')`. Jangan gunakan `L.e` tanpa `$s`.
11. Log pada `initState` dan `dispose` diperbolehkan karena hanya dipanggil sekali. Log pada `build()` dihindari apabila memungkinkan karena `build()` dapat dipanggil berulang dan menambah noise; prioritaskan log pada titik yang tidak berfrekuensi tinggi (initState, dispose, method helper, perhitungan). Log pada getter/properti turunan yang dapat dipanggil berulang saat `build()` (mis. `targetRokokHariIni`, label Enum) juga dihindari.
12. Log debug satu-kali (mis. untuk verifikasi sementara di layar/helper) wajib dihapus saat commit cleanup (`chore(logging): hapus pernyataan log debug ...`); jangan biarkan log debug-sementara ikut ter-commit permanen. Log bermakna jangka panjang (initState, dispose, catch, ringkasan perhitungan) boleh dipertahankan.
13. Jangan menulis log yang hanya menarasikan langkah eksekusi tanpa nilai aktual (mis. `L.i('Membuat instance ...')`, `L.i('Memanggil ...')`, `L.i('Memeriksa ...')`) atau banner/separator (mis. `L.i('========================================')`, `L.i('LIFECYCLE: ...')`); saat membersihkan log, hapus log semacam itu dan pertahankan hanya log nilai aktual, titik penting (initState, dispose, catch `$e $s`), dan ringkasan bermakna.

## Larangan

- Jangan membuat sistem logging baru.
- Jangan membuat kelas/wrapper log manual per proyek (mis. `lib/debug/log.dart` dengan `class Log`, `_formatData`, atau `_logCustom`) — hapus dan migrasikan seluruh pemakaiannya ke `L` dari `share_global_saya` (`package:share_global_saya/src/utils/l.dart`); `L` adalah satu-satunya pintu masuk logging yang sah.
- Jangan mencetak properti model satu per satu (gunakan `$model`).
- Jangan mencetak data sensitif.
- Jangan mengubah logika program saat menambahkan log.

## Contoh Benar

```dart
L.i('dummyImpian.length=${dummyImpian.length}, dummyBiodata.length=${dummyBiodata.length}');
L.i('row=$row');
L.i('biodata=$biodata');
L.i('impian=$impian');
L.i('konfirmasi=$konfirmasi');
L.s('isinImpianBerhasil: id=$idImpian');
L.json({'row': row, 'tanggal': tanggal});
L.list(listImpian, label: '📋 daftarImpian');
L.api('/api/impian', {'id': 1}, method: 'GET');
L.i('_namaController.text=${_namaController.text}, _jumlahController.text=${_jumlahController.text}, _targetTanggal=$_targetTanggal');
L.i('listImpian.length=${listImpian.length}, totalJumlah=${impianState.totalJumlah}');
L.i('DashboardScreen initState');
L.i('DashboardScreen dispose');
L.i('biodataAsync=$biodataAsync');
L.w('konfirmasi bukan ok');
L.w('jumlah <= 0');
L.w('biodataAsync loading');
L.e('Gagal memasukkan data dummy: $e $s');
L.e('biodataAsync error: ${biodataAsync.error} ${biodataAsync.stackTrace}');
L.i('tanggalBerhenti=$tanggalBerhenti, jumlahRokokPerHari=$jumlahRokokPerHari, hargaPerBungkus=$hargaPerBungkus, hariBerhenti=$hariBerhenti, rokokTidakDiHisap=$rokokTidakDiHisap, uangDihemat=$uangDihemat');
L.i('icon=$icon, title=$title, subtitle=$subtitle');
```

## Contoh Salah

```dart
L.i('tes'); // tidak memberikan informasi nilai variabel
L.i('nama=${model.nama}, umur=${model.umur}'); // menguraikan properti model
print('data=$data'); // menggunakan print() alih-alih L.*

// DILARANG: kelas pembungkus log manual per proyek
class Log {
  static void info(String message) => debugPrint('... $message'); // wrapper manual
}

// DILARANG: log narasi langkah tanpa nilai aktual
L.i('Membuat instance PelangganOperasi');
L.i('Memeriksa apakah perangkat dapat membuka URI WhatsApp');
L.i('Memanggil _loadDetails() untuk mengambil data');

// DILARANG: banner/separator
L.i('========================================');
L.i('LIFECYCLE: build() - Membangun UI');
```
