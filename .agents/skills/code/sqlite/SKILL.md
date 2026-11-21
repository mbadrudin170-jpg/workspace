---
name: sqlite
description: "Trigger: saat menambahkan atau memperbaiki dukungan SQLite (sqflite) di Flutter Web | Panduan `sqflite_common_ffi_web`: tambah paket via `flutter pub add`, setup `dart run sqflite_common_ffi_web:setup` (`web/sqlite3.wasm` + `web/sqflite_sw.js` di samping `index.html`), set `databaseFactoryFfiWeb` di `main()` untuk `kIsWeb` sebelum database pertama dibuka, path database di web hanya nama (IndexedDB), dan batasan resmi (singleInstance, origin:port, shared/basic worker). Dukungan SQLite di Flutter Web `sqflite` tidak berjalan di web. SQLite di web berjalan lewat `sqflite_common_ffi_web` (SQLite dikompilasi ke WASM; penyimpanan IndexedDB; pada saat panduan ini dibuat paket tersebut masih _experimental_). Aturan 1. Pada target Web, gunakan `sqflite_common_ffi_web` — bukan `sqflite` (Android/iOS) dan bukan `sqflite_common_ffi` (desktop/VM test). 2. Tambah paket WAJIB lewat `flutter pub add sqflite_common_ffi_web`; dilarang edit `pubspec.yaml` manual (kecuali kasus `path:`/`git:`). 3. Setup binari WAJIB: `dart run s"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Wed Nov 18 2026 08:04 WIB"
---

# Dukungan SQLite di Flutter Web

`sqflite` tidak berjalan di web. SQLite di web berjalan lewat `sqflite_common_ffi_web` (SQLite dikompilasi ke WASM; penyimpanan IndexedDB; pada saat panduan ini dibuat paket tersebut masih _experimental_).

## Aturan

1. Pada target Web, gunakan `sqflite_common_ffi_web` — bukan `sqflite` (Android/iOS) dan bukan `sqflite_common_ffi` (desktop/VM test).
2. Tambah paket WAJIB lewat `flutter pub add sqflite_common_ffi_web`; dilarang edit `pubspec.yaml` manual (kecuali kasus `path:`/`git:`).
3. Setup binari WAJIB: `dart run sqflite_common_ffi_web:setup` dari folder proyek (yang memiliki `web/`) — membuat `web/sqlite3.wasm` dan `web/sqflite_sw.js`; keduanya harus berada di samping `index.html` (masukkan ke source control atau jalankan setup di CI/build).
4. Set factory sekali di `main()`, sebelum database pertama dibuka:

   ```dart
   if (kIsWeb) {
     databaseFactory = databaseFactoryFfiWeb;
   }
   ```

   Factory di luar Web melempar `UnsupportedError` — wajib dijaga `kIsWeb`.

5. Pada Web, path database hanyalah nama (`getDatabasesPath()` mengembalikan `/`); `app.db`, `./app.db`, `/app.db` mengarah ke database yang sama (IndexedDB). Jangan memakai `getApplicationDocumentsDirectory()` untuk Web.
6. Penjaga platform di inisialisasi database: bila Web memang didukung, JANGAN melempar `UnsupportedError` pada `kIsWeb`; buka database dengan factory yang sama (setelah diset di `main()`).
7. Batasan resmi (experimental): satu koneksi per database — `OpenDatabaseOptions(singleInstance: false)` untuk DB persisten → `ArgumentError`; shared worker tidak tersedia di Android Chrome → basic worker (tidak cross-tab safe); IndexedDB terikat origin termasuk port (gunakan `--web-port <port>` tetap saat debugging); lebih lambat dari native.
8. Import factory dari paket yang tepat: `databaseFactoryFfiWeb` dari `package:sqflite_common_ffi_web/sqflite_ffi_web.dart`; `databaseFactory` dari `package:sqflite/sqflite.dart` (atau `package:sqflite_common/sqlite_api.dart`). Jangan hanya meng-import `sqflite_ffi_web.dart` — `Database`/`OpenDatabaseOptions` tidak diekspor dari sana.
9. Verifikasi: `dart format` + `dart analyze` bersih; `flutter test` tidak terpengaruh (`kIsWeb == false` di VM test); konfirmasi runtime lewat `flutter run -d chrome` (port tetap); JANGAN mengklaim dukungan Web sebelum diverifikasi runtime.
10. Web tidak punya akses file — import/ekspor database gunakan `databaseFactory.writeDatabaseBytes()` / `readDatabaseBytes()`.

## Contoh Benar

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // Factory wajib diset sebelum database pertama dibuka.
    databaseFactory = databaseFactoryFfiWeb;
  }
  runApp(const AplikasiSaya());
}
```

```dart
Future<Database> _initDB() async {
  if (kIsWeb) {
    // Di Web, path hanya nama; database tersimpan di IndexedDB.
    return await openDatabase(
      'app.db',
      version: versiDatabase,
      onCreate: createTables,
      onUpgrade: _onUpgrade,
    );
  }
  // ... jalur lain (Android/iOS/desktop/VM test) seperti biasa
}
```

## Contoh Salah

```dart
// Salah: Web didukung tapi kIsWeb tetap dilempar UnsupportedError
if (kIsWeb) {
  throw UnsupportedError('Database lokal tidak didukung pada Flutter Web.');
}

// Salah: factory belum diset di main() sebelum DB dibuka di Web
// → console: "An error occurred while initializing the web worker"
//   (sqflite_sw.js tidak ditemukan / belum disetup)

// Salah: debugging dengan port berbeda tiap run → database IndexedDB "hilang"
// (localhost:8080 ≠ localhost:8081); gunakan --web-port tetap

// Salah: singleInstance: false pada database persisten → ArgumentError
```
