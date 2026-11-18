---
name: logging-debug
description: "Trigger: saat menambahkan log debug | Panduan logging proyek (L.i, L.s, L.w, L.e, L.json, L.list, L.api) untuk variabel dan parameter, format singkat dan konsisten; L.e wajib menyertakan stack trace ($e $s); dilarang membuat wrapper log manual per proyek — cukup gunakan L dari share_global_saya."
metadata:
  kategori: "custom"
  versi: "1.1.2"
  diperbarui: "Wed Nov 18 2026 22:43 WIB"
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
```

## Sumber Evaluasi

- Commit: `f2859a0f7b8f6ebeb0befefffa8047a9c3173c04`, `6bae21014ab8f156d70364ea40ff669573de1f37`, `f55410ae5d09de92cb53f1f284ab69051d6af46a`, `c05f4460a316c3bf33aaad30fc1d8a32f66b9c5b`, `7b9e8d054624b8941c1f44b11551fe9ea57a54a1`, `be04199e5b44537ee1052a3815f5af8518308148`, `fc8100ff6cd50280b6d7b4cd650c3a3314ca1d6f` (penghapusan log debug satu-kali di dashboard & pelacakan toxin)
- Berkas sumber: `share_global_saya/lib/src/utils/l.dart` (commit rujukan untuk `L` belum diverifikasi spesifik pada sesi 24)
- Audit `l.dart` vs skill (sesi 24, 2026-11-18, atas persetujuan pengguna): rujukan path diperbaiki (`lib/shared/utils/l.dart` → `lib/src/utils/l.dart`); API lengkap `L` didokumentasikan (`i`, `s`, `w`, `e`, `json`, `list`, `api`); infrastruktur overlay (`L.init`, `L.buffer`, `hapusBuffer`, `Future.delayed(50ms)`, `try/catch`) dan default `showLocation`/`useTerse` dicatat; `p(...)` dibedakan dari `L`; Contoh Benar ditambah; versi 1.0.1 → 1.1.0. Catatan: komentar header `l.dart` sendiri juga merujuk path usang (`lib/shared/utils/l.dart`) — di submodule, TIDAK diubah sesi ini.
- Berkas sumber: migrasi `lib/debug/log.dart` (kelas `Log` + `_formatData`) → `L` di `admin_wifi` — `admin_wifi` commit `ef883f2` ("m", 15:24 WIB+7, dibuat pengguna/harness): 99 berkas memigrasikan `Log.info/warning/error/api` ke `L.i/L.w/L.e/L.api`; `lib/debug/log.dart` dihapus; `dart analyze` bersih; `flutter test` +105/−24 identik baseline. Skill diperbarui atas permintaan eksplisit pengguna (sesi 42, 2026-11-18) — versi 1.1.1 → 1.1.2.
- File: `lib/fitur/dummy/helper/dummy_helper.dart`, `lib/fitur/dummy/screens/dummy_screen.dart`, `lib/fitur/impian/screens/impian_screen.dart`, `lib/fitur/impian/screens/form_impian.dart`, `lib/fitur/biodata/notifier/biodata_notifier.dart`, `lib/fitur/biodata/screens/biodata_screen.dart`, `lib/fitur/impian/notifier/impian_notifier.dart`, `lib/fitur/pengaturan/screens/pengaturan_screen.dart`, `lib/fitur/dashboard/screens/dashboard_screen.dart`, `.kilo/commands/tambah_log.md`
