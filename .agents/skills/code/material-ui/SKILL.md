---
name: material-ui
description: "Trigger: saat menambah/mengubah impor material Flutter, saat memakai/mengganti MaterialApp, saat migrasi package:flutter/material.dart ke package:material_ui/material_ui.dart | Impor material wajib package:material_ui/material_ui.dart (package:flutter/material.dart deprecated sejak v3.47.0-0.0.pre); MaterialApp material_ui menyediakan delegasi MaterialLocalizations bawaan (dilarang menambah localizationsDelegates/supportedLocales manual); error No MaterialLocalizations found pada Overlay root manual diatasi dengan Localizations DI ATAS Directionality, bukan delegasi di MaterialApp."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Thu Nov 19 2026 09:36 WIB"
---

# Impor Material Flutter: material_ui

`package:flutter/material.dart` deprecated sejak v3.47.0-0.0.pre; seluruh impor material wajib memakai `package:material_ui/material_ui.dart`.

## Aturan

1. Impor material WAJIB memakai `package:material_ui/material_ui.dart`; `package:flutter/material.dart` DILARANG — deprecated sejak v3.47.0-0.0.pre (analyzer: `deprecated_member_use`).
2. MaterialApp dari `material_ui` sudah menyediakan delegasi `MaterialLocalizations` bawaan; DILARANG menambahkan `localizationsDelegates`/`supportedLocales` manual dari flutter/material (mis. `DefaultMaterialLocalizations.delegate`, `DefaultWidgetsLocalizations.delegate`) — redundan dan memakai API deprecated.
3. Error `No MaterialLocalizations found` yang sumbernya panel log debug / `SelectionArea` pada `PengelolaOverlayLogDebug` WAJIB diatasi dengan membungkus Overlay root manual dengan `Localizations` DI ATAS `Directionality` (lihat `.agents/rules/overlay_log_debug.md` butir 4 dan skill `overlay-log-debug` Aturan 4), BUKAN dengan delegasi di MaterialApp.
4. Migrasi masal impor (codemod/subagent) hanya pada cakupan berkas yang ditugaskan; `dart format` hanya pada berkas terdampak; review `git diff --stat` sebelum melapor (skill `disiplin-scope-kerja`).
5. Jangan mencampur impor `package:flutter/material.dart` dan `package:material_ui/material_ui.dart` pada berkas yang sama; ganti impornya, jangan menambahkan duplikat.

## Larangan

- Jangan mengimpor `package:flutter/material.dart` pada kode baru maupun kode lama yang sedang diubah.
- Jangan menulis `localizationsDelegates: const [DefaultMaterialLocalizations.delegate, DefaultWidgetsLocalizations.delegate]` pada MaterialApp material_ui.
- Jangan menambahkan `supportedLocales: const [Locale('en', 'US')]` semata untuk memuaskan analyzer; delegasi sudah bawaan material_ui.
- Jangan memakai delegasi material_ui sebagai solusi error yang sumbernya Overlay root manual (lihat Aturan 3).

## Contoh Benar

```dart
import 'package:material_ui/material_ui.dart';
```

```dart
// MaterialApp material_ui — delegasi MaterialLocalizations bawaan,
// tanpa localizationsDelegates/supportedLocales manual
MaterialApp(
  title: 'Aplikasi',
  home: const Beranda(),
);
```

## Contoh Salah

```dart
import 'package:flutter/material.dart'; // deprecated sejak v3.47.0-0.0.pre
```

```dart
MaterialApp(
  localizationsDelegates: const [
    DefaultMaterialLocalizations.delegate, // deprecated + redundan
    DefaultWidgetsLocalizations.delegate,
  ],
  supportedLocales: const [Locale('en', 'US')],
  title: 'Aplikasi',
  home: const Beranda(),
);
```

## Sumber Evaluasi

- Transkrip sesi Kilo `ses_e0e8c862dffeZX10v07226tjSk` (sesi 63–65): AI menambahkan `localizationsDelegates` manual dari flutter/material untuk error `No MaterialLocalizations found`; pengguna mengoreksi "ini mah gak ngaruh ternyata material sudah deprecated jadi harus gunakan material ui" dan memerintahkan blok itu dihapus; `MaterialApp` material_ui menyediakan delegasi bawaan (diverifikasi via pub-cache material_ui 1.11.1 pada sesi 63).
- Provenance: di luar alur commit-history atas persetujuan eksplisit pengguna (sesi 65) — selaras `.agents/rules/lainnya.md` butir 3 dan skill `aturan-pembuatan-skill` Aturan 13.
