---
name: struktur-folder-lib
description: Trigger: saat menata atau membuat struktur folder lib/ Flutter | Panduan feature-first + core/ untuk proyek Flutter: sub-folder lapisan di dalam folder fitur (screens/, notifier/, provider/, widgets/ bila dibutuhkan), pembeda state Riverpod yang bisa diubah (notifier/ + nama_notifier.dart) vs provider read-only (provider/ + nama_provider.dart), main.dart/app.dart/home.dart (shell) tetap di akar, dan berkas hasil generate (*.g.dart) tidak dipindah/diedit manual (build_runner). Larangan: jangan membuat folder core/ kosong; desain blueprint harus dieksekusi beserta build_runner, bukan sekadar rename. Workflow: pindahkan sumber → build_runner → perbarui impor → dart format, dart analyze, flutter test. Referensi: hasil_diskusi/diskusi_4.md, lib/main.dart, lib/app.dart, lib/home.dart, lib/fitur/. Struktur Folder `lib/` Flutter Menata `lib/` dengan pola feature-first + `lib/core/` lintas-fitur. Akar `lib/` menyimpan `main.dart`, `app.dart`, dan shell utama (mis. `home.dart`); kode per fitur berada di `lib/fitur/<nam
---

# Struktur Folder `lib/` Flutter

Menata `lib/` dengan pola feature-first + `lib/core/` lintas-fitur. Akar `lib/` menyimpan `main.dart`, `app.dart`, dan shell utama (mis. `home.dart`); kode per fitur berada di `lib/fitur/<nama_fitur>/` dengan sub-folder lapisan.

Status referensi: konvensi `notifier/` vs `provider/` berasal dari hasil diskusi (belum ada di commit mana pun). Blueprint target belum dieksekusi (lihat `hasil_diskusi/diskusi_4.md`); contoh yang ditandai "target" mengikuti blueprint tersebut.

## Cakupan yang Di-Cover

- Package: `package:flutter_riverpod`, `package:riverpod_annotation`, `package:riverpod_generator`, `package:build_runner`
- Class: `TemaNotifier` (contoh; `@Riverpod(keepAlive: true)` dengan `_$TemaNotifier`), layar `<Nama>Screen`, widget shell (`MyHomePage`)
- Layout folder: `lib/fitur/<nama_fitur>/{screens,notifier,provider,widgets}/`, `lib/core/`
- File generate: `*.g.dart` (mis. `tema_notifier.g.dart`)
- Commit rujukan struktur: `c30a4ec` (struktur file utama + navigasi tab), `f0f437d` (migrasi tema ke Riverpod)

## Aturan

1. Akar `lib/` hanya berisi `main.dart` (entry), `app.dart` (root widget), dan shell utama (mis. `home.dart`). Jangan pindahkan mereka ke dalam fitur tanpa keputusan eksplisit.
2. Satu folder per fitur di `lib/fitur/<nama_fitur>/`; nama folder fitur memakai `snake_case` bahasa Indonesia (mis. `pengaturan`).
3. Di dalam folder fitur, gunakan sub-folder lapisan:

   - `screens/` - layar; nama berkas `<nama>_screen.dart`, class `<Nama>Screen`.
   - `notifier/` - state Riverpod yang **bisa diubah** (memiliki method mutasi); nama berkas `<nama>_notifier.dart`, class `<Nama>Notifier`.
   - `provider/` - provider yang **hanya membaca nilai** (tanpa method mutasi); nama berkas `<nama>_provider.dart`.
   - `widgets/` - widget privat/lokal fitur, dibuat hanya saat dibutuhkan.
   - `model/` - **enum, state, model data, dan class domain** yang berkaitan dengan fitur tersebut (mis. `ModeBerhenti`, `StatusBerhenti`, `BiodataModel`).
4. Pembeda `notifier/` vs `provider/` wajib berdasarkan kemampuan mengubah state, bukan pretensi nama: bila class memiliki method yang mengubah/persisten state, tempatkan di `notifier/`.
5. **Setiap enum, state, model data, dan class domain yang berkaitan dengan sebuah fitur WAJIB diletakkan di sub-folder `model/` di dalam folder fitur tersebut** (mis. `lib/fitur/berhenti_merokok/model/mode_berhenti.dart`).
6. `lib/core/` untuk hal lintas-fitur (utilitas, konstanta, widget bersama); hanya dibuat saat ada isi nyata - dilarang folder kosong.
7. Berkas `*.g.dart` hasil generate tidak diedit, disalin, atau dipindah manual; pindahkan berkas sumber lalu jalankan `dart run build_runner build --delete-conflicting-outputs`.
8. `part`/`part of` diarahkan ke berkas `.g.dart` dengan nama yang sama dengan sumbernya (mis. `part 'tema_notifier.g.dart';`).
9. Impor memakai path package (`package:<nama_aplikasi>/...`), bukan path relatif.
10. Nama berkas `snake_case`, class `PascalCase`, konstanta `SCREAMING_SNAKE_CASE` (lihat skill `penamaan-konvensi`); tabel/kolom/field database `snake_case`.
11. Provider hasil generate dinamai dari nama class minus akhiran `Notifier` (mis. `TemaNotifier` → `temaProvider`); merename berkas tidak mengubah nama provider, hanya jalur impor dan `part` yang berubah.
12. Berkas yang dipindah/rename dengan header `// path:` WAJIB memperbarui header tersebut seiring pemindahan (menunjuk lokasi baru); `grep` path lama WAJIB bersih sebelum tugas dinyatakan selesai (termasuk berkas yang dipindah oleh `git mv`).

## Steps

1. Pindahkan/rename berkas sumber (mis. `tema_provider.dart` → `notifier/tema_notifier.dart`); sesuaikan `part` ke `<sumber>.g.dart` dengan nama berkas baru.
2. Hapus `*.g.dart` lama yang tertinggal; jalankan `dart run build_runner build --delete-conflicting-outputs`.
3. Perbarui semua impor pemakai ke lokasi baru.
4. Perbarui header `// path:` (bila ada) ke lokasi baru; `grep` path lama wajib bersih.
5. Verifikasi `dart format`, `dart analyze`, `flutter test`.

## Larangan

- DILARANG membuat `lib/core/` tanpa isi nyata.
- DILARANG menempatkan state yang bisa diubah di `provider/` atau provider read-only di `notifier/`.
- DILARANG memindah, menyalin, atau mengedit berkas `*.g.dart` secara manual.
- DILARANG merename berkas tanpa memperbarui `part` dan seluruh impor - impor patah lebih berbahaya daripada struktur belum rapi.
- DILARANG memindahkan `main.dart`/`app.dart`/shell utama ke dalam folder fitur tanpa keputusan eksplisit pengguna.
- DILARANG mencampur lapisan (mis. layar di `notifier/`, provider di `screens/`).
- DILARANG mengganti pola folder fitur per fitur (mis. flat semua) tanpa kesepakatan - blueprint adalah default proyek.
- DILARANG meletakkan berkas test flat di `test/` tanpa mengikuti struktur `lib/fitur/<fitur>/...`; test WAJIB di `test/fitur/<fitur>/...` (mirror `lib/`).

## Contoh Benar

Blueprint target (belum dieksekusi; lihat `hasil_diskusi/diskusi_4.md`):

```text
lib/
├── main.dart                              # entry; ProviderScope + runApp(MyApp)
├── app.dart                               # root; ConsumerWidget; MaterialApp + tema
├── home.dart                              # shell; NavigationBar + IndexedStack
└── fitur/
    └── pengaturan/
        ├── screens/
        │   └── pengaturan_screen.dart     # layar pengaturan (konten tab)
        ├── notifier/
        │   ├── tema_notifier.dart         # TemaNotifier (@Riverpod)
        │   └── tema_notifier.g.dart       # hasil build_runner
        ├── provider/
        │   └── tema_provider.dart         # provider read-only (jika ada)
        └── model/
            └── tema_model.dart            # enum, state, model (ThemeMode, dll.)
```

```dart
// lib/fitur/pengaturan/notifier/tema_notifier.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tema_notifier.g.dart';

@Riverpod(keepAlive: true)
class TemaNotifier extends _$TemaNotifier {
  @override
  Future<ThemeMode> build() async => ThemeMode.system;

  Future<void> ubah(ThemeMode mode) async {
    state = AsyncValue.data(mode);
  }
}
```

```dart
// lib/app.dart - impor memakai path package ke lokasi baru
import 'package:spektra/fitur/pengaturan/notifier/tema_notifier.dart';
```

## Contoh Salah

```text
// DILARANG: state yang bisa diubah disimpan di folder provider/
lib/fitur/pengaturan/provider/tema_provider.dart   // salah: TemaNotifier punya ubah()
```

```dart
// DILARANG: menyalin berkas hasil generate ke lokasi baru daripada generate ulang
// cp tema_provider.g.dart tema_notifier.g.dart   // salah: part of menunjuk sumber lama
```

```dart
// DILARANG: impor relatif setelah memindahkan berkas
import '../notifier/tema_notifier.dart';           // salah: pakai package:spektra/...
```

```text
// DILARANG: folder core kosong sebagai "persiapan"
lib/core/                                        // salah: buat saat ada isi nyata
```
