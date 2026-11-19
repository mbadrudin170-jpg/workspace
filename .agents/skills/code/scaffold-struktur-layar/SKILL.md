---
name: scaffold-struktur-layar
description: "Trigger: saat menyusun struktur layar | Panduan Scaffold, AppBar, body, floatingActionButton, bottomNavigationBar, drawer untuk struktur layar standar; feedback sementara memakai `AppToast` dari `share_global_saya` bila tersedia. Struktur Layar Standar (Scaffold) Menggunakan `Scaffold` sebagai kerangka layar dengan `AppBar`, `body`, `floatingActionButton`, `bottomNavigationBar`, dan `drawer` sesuai pedoman Material Design. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/material/scaffold.dart`, `lib/src/material/app_bar.dart`, `lib/src/material/bottom_app_bar.dart`, `lib/src/material/floating_action_button.dart`), `package:share_global_saya` (`lib/src/widget/toast_widget.dart`, kelas `AppToast`) - Class: `Scaffold`, `AppBar`, `PreferredSizeWidget`, `BottomNavigationBar`, `BottomNavigationBarItem`, `Drawer`, `FloatingActionButton`, `AppToast`, `PersistentBottomSheet`, `SliverAppBar` - Properti: `Scaffold.appBar`, `Scaffold.body`, `Scaffold.floatingActionButton`, `Scaffold.bottomNavigationBar`"
metadata:
  kategori: "custom"
  versi: "1.3.0"
  diperbarui: "Wed Nov 18 2026 05:26 WIB"
---

# Struktur Layar Standar (Scaffold)

Menggunakan `Scaffold` sebagai kerangka layar dengan `AppBar`, `body`, `floatingActionButton`, `bottomNavigationBar`, dan `drawer` sesuai pedoman Material Design.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/material/scaffold.dart`, `lib/src/material/app_bar.dart`, `lib/src/material/bottom_app_bar.dart`, `lib/src/material/floating_action_button.dart`), `package:share_global_saya` (`lib/src/widget/toast_widget.dart`, kelas `AppToast`)
- Class: `Scaffold`, `AppBar`, `PreferredSizeWidget`, `BottomNavigationBar`, `BottomNavigationBarItem`, `Drawer`, `FloatingActionButton`, `AppToast`, `PersistentBottomSheet`, `SliverAppBar`
- Properti: `Scaffold.appBar`, `Scaffold.body`, `Scaffold.floatingActionButton`, `Scaffold.bottomNavigationBar`, `Scaffold.drawer`, `Scaffold.endDrawer`, `Scaffold.bottomSheet`, `Scaffold.backgroundColor`, `Scaffold.resizeToAvoidBottomInset`, `Scaffold.primary`, `Scaffold.drawerEdgeDragWidth`, `Scaffold.extendBody`, `Scaffold.extendBodyBehindAppBar`
- Method: `Scaffold.of(context)`, `showBottomSheet`, `showModalBottomSheet`, `AppToast.sukses`, `AppToast.gagal`, `AppToast.info`, `AppToast.warning`

## Aturan

1. `Scaffold.body` wajib diisi; tidak boleh null. Gunakan widget kosong (`SizedBox.shrink`) jika tidak ada konten.
2. `AppBar` harus wrap dalam `Scaffold.appBar` dan mengimplementasikan `PreferredSizeWidget`.
3. `Scaffold.of(context)` mengakses `ScaffoldState` untuk `openDrawer()`, `openEndDrawer()`, `showBottomSheet()`.
4. Feedback sementara wajib memakai `AppToast` dari `share_global_saya` (`AppToast.sukses`, `AppToast.gagal`, `AppToast.info`, `AppToast.warning`) bila dependency `share_global_saya` tersedia. Jangan memakai `ScaffoldMessenger.showSnackBar`, `SnackBar`, atau `Fluttertoast` langsung untuk feedback sementara. Bila `share_global_saya` belum ada pada dependency, tambahkan path/git dependency + `flutter pub get`, atau tanyakan pengguna sebelum memakai snackbar.
5. `resizeToAvoidBottomInset = true` default agar body menyusut saat keyboard muncul; setel `false` jika body sudah menangani inset sendiri.
6. `extendBody = true` agar `bottomNavigationBar` menimpa area body di bawahnya (dipakai dengan `FloatingActionButtonLocation.centerDocked`).
7. `extendBodyBehindAppBar = true` jika body perlu meluas di belakang app bar (transparan/blur).
8. `bottomNavigationBar` dengan `BottomNavigationBar` untuk navigasi antar tab utama (maksimal 5 item).
9. `floatingActionButton` untuk aksi primer layar, lokasi default `centerFloat`.
10. `drawer` untuk navigasi sekunder, diakses melalui ikon hamburger di `AppBar.leading` atau geser dari tepi.
11. `backgroundColor` diabaikan jika `theme.scaffoldBackgroundColor` diatur; gunakan tema untuk konsistensi.

## Larangan

- `Scaffold` tanpa `body` (null).
- Beberapa `Scaffold` bersarang tanpa alasan (akan menimpa `AppBar` dan `BottomNavigationBar`).
- `Scaffold.of(context)` dengan context di atas Scaffold (melempar error).
- `AppBar` tanpa `title` atau `leading` yang informatif.
- `bottomNavigationBar` dengan lebih dari 5 item (terlalu ramai layar seluler).
- `SnackBar`/`ScaffoldMessenger`/`Fluttertoast` langsung untuk feedback sementara bila `share_global_saya` tersedia; gunakan `AppToast`.

## Detail `AppToast` (share_global_saya)

`AppToast` (`lib/src/widget/toast_widget.dart`) adalah pembungkus `FToast` (`fluttertoast`) dengan gaya terstandar. Semua varian memakai `Container` padding `16/12`, radius 8, teks putih 15, `ToastGravity.BOTTOM`, dan memanggil `FToast().init(context)` tiap tampil; setiap varian juga menulis log ke `L` otomatis (lihat skill `logging-debug`).

| Varian                           | Warna                            | Log   | Radius                                                                  |
| -------------------------------- | -------------------------------- | ----- | ----------------------------------------------------------------------- |
| `AppToast.sukses(context, msg)`  | `Colors.green.shade700`          | `L.s` | `BorderRadius.circular(8)`                                              |
| `AppToast.gagal(context, msg)`   | `Colors.red` (tanpa `.shade700`) | `L.e` | `BorderRadius.all(Radius.circular(8))` (inkonsisten dengan varian lain) |
| `AppToast.info(context, msg)`    | `Colors.blue.shade700`           | `L.i` | `BorderRadius.circular(8)`                                              |
| `AppToast.warning(context, msg)` | `Colors.orange.shade700`         | `L.w` | `BorderRadius.circular(8)`                                              |

Catatan: tidak ada parameter durasi/posisi/gravitasi; `AppToast._()` (private ctor); warna hardcode hanya status semantik (sesuai skill `gaya`). Jika tampilan konsisten diinginkan, samakan `gagal` ke `Colors.red.shade700` + `BorderRadius.circular(8)` (perlu perubahan kode, tidak dilakukan sesi ini).

## Contoh Benar

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Profil Saya'),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  ),
  body: const Center(child: Text('Konten layar profil')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (index) => setState(() => _selectedIndex = index),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
    ],
  ),
  resizeToAvoidBottomInset: true,
);
```

```dart
// Feedback sementara (butuh package `share_global_saya`; import `package:share_global_saya/core_shared.dart`)
AppToast.sukses(context, 'Data tersimpan');
```

```dart
// Feedback peringatan (butuh package `share_global_saya`; import `package:share_global_saya/core_shared.dart`)
AppToast.warning(context, 'Pesan peringatan untuk pengguna');
```

## Contoh Salah

```dart
// Feedback sementara via snackbar — dilarang bila `share_global_saya` tersedia
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Data tersimpan')),
);
```

```dart
// Scaffold tanpa body
Scaffold(
  appBar: AppBar(title: Text('Judul')),
  // body hilang -> error
);
```

```dart
// Scaffold bersarang berlebihan
Scaffold(
  body: Scaffold( // DILARANG tanpa alasan khusus
    body: Container(),
  ),
);
```
