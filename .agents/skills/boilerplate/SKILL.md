---
name: boilerplate
description: 'Trigger: saat membuat kode boilerplate atau pola kode berulang yang siap pakai | Panduan boilerplate: pola kode berulang (widget, notifier, model, layar) yang konsisten dengan aturan proyek, dengan contoh benar/salah dan rujukan ke skill terkait (struktur-class-ui, struktur-folder-lib, aturan-riverpod, model-state-freezed-abstract).'
---

# Skill: boilerplate

Panduan pembuatan boilerplate (kode berulang yang siap pakai) agar konsisten dengan aturan dan konvensi proyek.

## Aturan

1. Boilerplate WAJIB mengikuti aturan yang berlaku: `struktur-class-ui`, `struktur-folder-lib`, `aturan-riverpod`, `model-state-freezed-abstract`, `penamaan-konvensi`, `gaya`, `spacing`, `tipografi`.
2. Boilerplate WAJIB memakai bahasa Indonesia untuk identifier yang didefinisikan aplikasi (variable, method, class, enum, table, column) — lihat `penamaan-konvensi`.
3. Boilerplate WAJIB memakai impor material `package:material_ui/material_ui.dart` dan utilitas shared lewat `package:share_global_saya/core_shared.dart` (bukan impor individu).
4. Boilerplate widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state; parameter `final` + constructor `const`; `build` pure; aman light/dark mode.
5. Method helper privat (nama diawali `_`) WAJIB di atas `build`; method helper widget (`_buildXxx`) di bawah `build`; method helper non-widget value-returning di paling bawah kelas (lihat `struktur-class-ui`).
6. Boilerplate notifier Riverpod berbasis codegen WAJIB mengembalikan state immutable Freezed di `build()`; reload via `AsyncValue.data(await _ambilSemua())` + `catch (e, s)` + `L.e(...)` + `rethrow`; nama provider = nama class tanpa akhiran `Notifier` (camelCase).
7. Boilerplate model database WAJIB Freezed (`abstract class` + `const factory`), `id` non-nullable disuplai pemanggil, parsing lewat `ParserUtil`, key DB lewat `XxxSkema`, tulis UTC baca lokal.
8. Boilerplate DILARANG memuat log narasi tanpa nilai aktual dan banner/separator (lihat `logging-debug` #12).
9. Boilerplate DILARANG memakai operator `!` untuk nullable; gunakan type promotion via variabel lokal (lihat `type-promotion-null-safety`).
10. Boilerplate DILARANG memakai `package:flutter/material.dart`; wajib `package:material_ui/material_ui.dart`.

## Contoh Benar

```dart
// path: lib/fitur/contoh/screens/contoh_screen.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:share_global_saya/core_shared.dart';

class ContohScreen extends ConsumerStatefulWidget {
  const ContohScreen({super.key});

  @override
  ConsumerState<ContohScreen> createState() => _ContohScreenState();
}

class _ContohScreenState extends ConsumerState<ContohScreen> {
  void _muatUlang() {
    ref.refresh(contohProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(contohProvider);
    if (asyncState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (asyncState.hasError) {
      return _buildError(
        'Gagal memuat: ${asyncState.error}',
        () => ref.refresh(contohProvider),
      );
    }
    final data = asyncState.requireValue;
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh')),
      body: Center(child: Text(data.nama)),
    );
  }

  Widget _buildError(String pesan, VoidCallback onRetry) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const Icon(Icons.error_outline),
            Text(pesan),
            FilledButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
```

## Contoh Salah

```dart
import 'package:flutter/material.dart'; // DILARANG: deprecated

class ContohScreen extends StatefulWidget {
  @override
  State<ContohScreen> createState() => _ContohScreenState();
}

class _ContohScreenState extends State<ContohScreen> {
  @override
  Widget build(BuildContext context) {
    // helper privat di bawah build — DILARANG
    return const SizedBox.shrink();
  }

  void _muatUlang() {
    // DILARANG: method helper privat di bawah build
  }
}
```