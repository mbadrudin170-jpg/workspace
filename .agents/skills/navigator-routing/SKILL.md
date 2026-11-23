---
name: navigator-routing
description: "Gunakan ini saat navigasi atau routing Flutter | Panduan Navigator, Route, Page, MaterialApp.router, pushNamed, pop, onGenerateRoute, onUnknownRoute, restorablePushNamed. Navigasi dan Routing Flutter Mengelola navigasi antar layar menggunakan `Navigator`, `Route`, `Page`, dan `MaterialApp` baik dengan imperative API maupun declarative (`MaterialApp.router`). Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/widgets/navigator.dart`, `lib/src/widgets/app.dart`, `lib/src/widgets/material/app.dart`) - Class: `Navigator`, `NavigatorState`, `Route<T>`, `Page<T>`, `RouteSettings`, `MaterialApp`, `WidgetsApp`, `Router` - Method: `Navigator.push`, `Navigator.pop`, `Navigator.pushNamed`, `Navigator.pushReplacement`, `Navigator.popUntil`, `Navigator.pushNamedAndRemoveUntil`, `Navigator.restorablePushNamed`, `Navigator.maybePop`, `Navigator.of`, `Navigator.maybeOf` - Tipe: `RouteFactory`, `RoutePredicate`, `PageRouteFactory`, `TransitionBuilder` - Properti: `Navigator.pages`, `onGenerateRoute`, `onUnknownRou"
---

# Navigasi dan Routing Flutter

Mengelola navigasi antar layar menggunakan `Navigator`, `Route`, `Page`, dan `MaterialApp` baik dengan imperative API maupun declarative (`MaterialApp.router`).

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/widgets/navigator.dart`, `lib/src/widgets/app.dart`, `lib/src/widgets/material/app.dart`)
- Class: `Navigator`, `NavigatorState`, `Route<T>`, `Page<T>`, `RouteSettings`, `MaterialApp`, `WidgetsApp`, `Router`
- Method: `Navigator.push`, `Navigator.pop`, `Navigator.pushNamed`, `Navigator.pushReplacement`, `Navigator.popUntil`, `Navigator.pushNamedAndRemoveUntil`, `Navigator.restorablePushNamed`, `Navigator.maybePop`, `Navigator.of`, `Navigator.maybeOf`
- Tipe: `RouteFactory`, `RoutePredicate`, `PageRouteFactory`, `TransitionBuilder`
- Properti: `Navigator.pages`, `onGenerateRoute`, `onUnknownRoute`, `onGenerateInitialRoutes`, `initialRoute`, `transitionDelegate`, `restorationScopeId`

## Aturan

1. Gunakan `Navigator.of(context)` untuk navigasi imperatif (`push`, `pop`, `pushNamed`) - hanya untuk pemakaian umum Flutter; pada proyek yang bergantung pada `share_global_saya`, navigasi WAJIB lewat helper `Nav` (lihat Aturan 12 dan 16).
2. Pastikan `MaterialApp` atau `WidgetsApp` memiliki `onGenerateRoute` jika menggunakan `pushNamed` atau named routes.
3. `onGenerateRoute` tidak boleh mengembalikan `null` kecuali `onUnknownRoute` juga disediakan.
4. `Navigator.pop(context, result)` untuk kembali dan mengirimkan nilai ke route sebelumnya.
5. `Navigator.popUntil(context, ModalRoute.withName('/'))` untuk kembali ke halaman root.
6. `Navigator.pushNamedAndRemoveUntil` untuk mengganti seluruh stack (mis. setelah login).
7. `Navigator.pushReplacement` untuk mengganti route saat ini tanpa menumpuk (mis. splash screen → home).
8. `MaterialApp.router` digunakan untuk declarative routing dengan `routerDelegate` / `routerConfig` (contoh `go_router`).
9. Satu `Navigator` hanya boleh memiliki satu `routerConfig` atau satu kombinasi `routerDelegate`/`routeInformationParser`, tidak keduanya sekaligus.
10. Gunakan `restorablePushNamed` jika route perlu dapat dipulihkan saat state restoration.
11. `RouteSettings.arguments` untuk melewatkan data ke route yang dipush dengan nama.
12. Helper `Nav` (`share_global_saya`, `lib/src/utils/navigator_helper.dart`) menyederhanakan navigasi: `Nav.to<T extends Object?>(context, page)` → `Future<T?>` (`Navigator.push`); `Nav.toReplacement<T extends Object?, TO extends Object?>(context, page)` → `Future<T?>` (`Navigator.pushReplacement<T, TO>`); `Nav.pop<T extends Object?>(context, [result])` → `void` (`Navigator.pop`); `Nav.pushAndRemoveUntil<T extends Object?>(context, page, {predicate})` → `Future<T?>` (`Navigator.pushAndRemoveUntil`, default `predicate ?? (route) => false`; dipakai saat membuka halaman dari notifikasi agar tidak ada route awal tersisa). Semua memakai `MaterialPageRoute<T>` dan private constructor `Nav._()`. Pemanggilan yang mengembalikan `Future` wajib `unawaited(...)` dengan `.catchError(...)` yang mencatat `L.e` dan `return null`.
13. Untuk daftar item yang masing-masing menavigasi (mis. menu "Lainnya", kartu aksi), ekstrak pembungkus tunggal (mis. `_navigasi(BuildContext context, Widget page, String nama)`) yang berisi pola `unawaited(Nav.to(...).catchError(...))` - jangan mengulang closure catchError per item.
14. Ratakan indentasi blok `onPressed: () => unawaited(...)` mengikuti pola lain di file yang sama (closure satu level lebih dalam, `child:`/penutup sejajar `onPressed:`).
15. `initialRoute` hanya berlaku saat pertama kali widget dibuat; perubahan setelah itu tidak berpengaruh.
16. Pada proyek yang bergantung pada `share_global_saya`, navigasi WAJIB memakai `Nav.to`/`Nav.toReplacement`/`Nav.pop`/`Nav.pushAndRemoveUntil`; DILARANG memanggil `Navigator.push`/`pushReplacement`/`pop`/`pushAndRemoveUntil` langsung - sesuai doc comment `Nav`, pelanggaran ditolak pada code review.
17. Navigasi mundur tanpa mengembalikan nilai WAJIB memakai `Nav.pop(context)` tanpa argumen; DILARANG `Nav.pop(context, false)`, `Nav.pop(context, null)`, atau `Nav.pop(context, true)`.
18. `AppBar` WAJIB tidak memasang `leading: BackButton(...)` kustom - `AppBar` sudah menampilkan tombol kembali otomatis bila ada route sebelumnya di stack; memasangnya ulang redundan dan berpotensi menimpa perilaku default (mis. `closeButton` pada dialog).

## Larangan

- `pushNamed` tanpa `onGenerateRoute` di `MaterialApp`/`WidgetsApp`.
- `onGenerateRoute` mengembalikan `null` tanpa `onUnknownRoute`.
- Pada proyek yang bergantung pada `share_global_saya`: memanggil `Navigator.push`/`pushReplacement`/`pop`/`pushAndRemoveUntil` langsung - wajib lewat helper `Nav` (Aturan 12 dan 16).
- `Navigator.of(context)` dengan `context` yang tidak berada di bawah `Navigator` (akan melempar `FlutterError`).
- Menggunakan `initialRoute` dan `routes` yang sama-sama berisi entri `'/'`.
- `Navigator.push` dengan route yang sudah pernah di-install (harus buat `Route` baru).
- `Nav.pop(context, false/null/true)` - navigasi mundur biasa tidak boleh mengirim hasil.
- `AppBar(leading: BackButton(...))` atau `AppBar(leading: IconButton(icon: Icon(Icons.arrow_back), ...))` - gunakan default `AppBar`.

## Contoh Benar

```dart
// push ke route bernama
Navigator.pushNamed(context, '/profil', arguments: <String, dynamic>{'id': 123});

// pop tanpa hasil (halaman ditutup biasa)
Nav.pop(context);

// pop dengan result
Navigator.pop(context, true);

// kembali ke root
Navigator.popUntil(context, ModalRoute.withName('/'));

// ganti stack seluruhnya
Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

// MaterialApp dengan named routes
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/profil': (context) => ProfilScreen(),
  },
  onGenerateRoute: (settings) {
    if (settings.name == '/detail') {
      return MaterialPageRoute(builder: (context) => DetailScreen());
    }
    return null;
  },
  onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => NotFoundScreen()),
);
```

## Contoh Salah

```dart
// context bukan di bawah Navigator
Navigator.of(context).push(...); // melempar FlutterError
```

```dart
// routes dengan '/' dan home sekaligus
MaterialApp(home: HomeScreen(), routes: {'/': (context) => HomeScreen()}); // assert error
```
