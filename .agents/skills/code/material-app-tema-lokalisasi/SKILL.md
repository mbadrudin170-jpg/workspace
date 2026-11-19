---
name: material-app-tema-lokalisasi
description: "Trigger: saat mengonfigurasi MaterialApp dan WidgetsApp | Panduan tema (theme, darkTheme, themeMode), lokalisasi (locale, supportedLocales, localizationsDelegates), dan ScrollBehavior. Konfigurasi MaterialApp, Tema, dan Lokalisasi Mengatur `MaterialApp` / `WidgetsApp` dengan tema gelap/terang, locale, supportedLocales, dan localizationsDelegates untuk aplikasi multi-bahasa. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/widgets/material/app.dart`, `lib/src/widgets/app.dart`) - Class: `MaterialApp`, `WidgetsApp`, `ThemeMode`, `ThemeData`, `MaterialScrollBehavior`, `ScrollBehavior`, `Localizations`, `LocalizationsDelegate`, `GlobalKey` - Enum: `ThemeMode.system`, `ThemeMode.light`, `ThemeMode.dark` - Properti: `theme`, `darkTheme`, `highContrastTheme`, `highContrastDarkTheme`, `themeMode`, `themeAnimationDuration`, `themeAnimationCurve`, `locale`, `supportedLocales`, `localizationsDelegates`, `localeResolutionCallback`, `localeListResolutionCallback`, `color`, `debugShowCheckedModeBanner`, `n"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Konfigurasi MaterialApp, Tema, dan Lokalisasi

Mengatur `MaterialApp` / `WidgetsApp` dengan tema gelap/terang, locale, supportedLocales, dan localizationsDelegates untuk aplikasi multi-bahasa.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/widgets/material/app.dart`, `lib/src/widgets/app.dart`)
- Class: `MaterialApp`, `WidgetsApp`, `ThemeMode`, `ThemeData`, `MaterialScrollBehavior`, `ScrollBehavior`, `Localizations`, `LocalizationsDelegate`, `GlobalKey`
- Enum: `ThemeMode.system`, `ThemeMode.light`, `ThemeMode.dark`
- Properti: `theme`, `darkTheme`, `highContrastTheme`, `highContrastDarkTheme`, `themeMode`, `themeAnimationDuration`, `themeAnimationCurve`, `locale`, `supportedLocales`, `localizationsDelegates`, `localeResolutionCallback`, `localeListResolutionCallback`, `color`, `debugShowCheckedModeBanner`, `navigatorKey`, `scaffoldMessengerKey`
- Method: `basicLocaleListResolution`, `Theme.of`, `MediaQuery.platformBrightnessOf`

## Aturan

1. `MaterialApp` membungkus `WidgetsApp` dan menambahkan fungsionalitas Material Design (AnimatedTheme, ScaffoldMessenger, Hero, DefaultSelectionStyle).
2. Salah satu dari `home`, `routes`, `onGenerateRoute`, atau `builder` harus non-null.
3. `themeMode = ThemeMode.system` mengikuti kecerahan sistem melalui `MediaQuery.platformBrightnessOf`.
4. `darkTheme` wajib memiliki `ThemeData.brightness = Brightness.dark` jika disediakan.
5. `highContrastTheme` dan `highContrastDarkTheme` untuk aksesibilitas high contrast (mis. iOS).
6. `supportedLocales` default adalah `[Locale('en', 'US')]`. Tambahkan locale yang didukung aplikasi.
7. `localizationsDelegates` harus menyertakan `GlobalMaterialLocalizations.delegate` dan `GlobalWidgetsLocalizations.delegate` untuk lokalisasi bawaan Flutter.
8. `localeResolutionCallback` atau `localeListResolutionCallback` digunakan untuk override algoritma pemilihan locale default.
9. `color` digunakan untuk warna app switcher di Android lama, diambil dari light theme meski dark mode aktif.
10. `debugShowCheckedModeBanner = true` default di debug mode; setel `false` untuk menyembunyikan banner DEBUG.
11. `themeAnimationDuration` default `kThemeAnimationDuration`; setel `Duration.zero` untuk transisi tema instan.
12. `navigatorKey` (`GlobalKey<NavigatorState>`) dan `scaffoldMessengerKey` (`GlobalKey<ScaffoldMessengerState>`) — dideklarasikan top-level final di berkas khusus (mis. `share_global_saya/lib/src/utils/app_keys.dart`: `navigatorKey` untuk navigasi dari widget overlay global di luar pohon halaman aktif, `scaffoldMessengerKey` untuk akses `ScaffoldMessenger` global), didaftarkan SEKALI di `MaterialApp(navigatorKey: ..., scaffoldMessengerKey: ...)`, dan TIDAK boleh dibuat di dalam `build()`.

## Larangan

- `darkTheme` dengan brightness bukan `Brightness.dark`.
- `MaterialApp` tanpa `home`, `routes`, `onGenerateRoute`, atau `builder` (tidak ada Navigator).
- `supportedLocales` kosong (harus minimal 1 elemen).
- `localizationsDelegates` tanpa delegate Material/Widgets untuk aplikasi yang menggunakan lokalisasi bawaan.

## Contoh Benar

```dart
MaterialApp(
  title: 'Berhenti Merokok',
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    useMaterial3: true,
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    useMaterial3: true,
  ),
  themeMode: ThemeMode.system,
  locale: Locale('id', 'ID'),
  supportedLocales: [
    Locale('en', 'US'),
    Locale('id', 'ID'),
  ],
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  debugShowCheckedModeBanner: false,
  home: const HomeScreen(),
);
```

## Contoh Salah

```dart
// darkTheme tanpa brightness dark
darkTheme: ThemeData(primaryColor: Colors.blue), // salah: brightness default light
```

```dart
// supportedLocales kosong
supportedLocales: [], // assert error
```
