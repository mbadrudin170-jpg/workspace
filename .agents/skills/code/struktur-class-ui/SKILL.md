---
name: struktur-class-ui
description: "Trigger: saat membuat widget custom reusable | Panduan struktur class UI reusable: StatelessWidget, parameter final, const constructor, build pure, aman tema (ColorScheme), Column.spacing, semua method di atas build, dispose di bawah initState. Struktur Class UI Reusable Panduan struktur class widget UI reusable yang konsisten, pure, dan aman tema. Aturan 1. Widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state. 2. Semua parameter WAJIB `final` dan constructor WAJIB `const` bila memungkinkan. 3. Method `build` WAJIB pure (tidak memanggil side-effect, tidak membaca provider langsung). 4. Warna WAJIB dari `ColorScheme`/tema, bukan hardcode (kecuali status semantic). 5. Gunakan `Column.spacing`/`Row.spacing` untuk jarak seragam, bukan `SizedBox` berulang. 6. Widget WAJIB aman untuk light/dark mode."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sat Nov 21 2026 08:02 WIB"
---

# Struktur Class UI Reusable

Panduan struktur class widget UI reusable yang konsisten, pure, dan aman tema.

## Aturan

1. Widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state.
2. Semua parameter WAJIB `final` dan constructor WAJIB `const` bila memungkinkan.
3. Method `build` WAJIB pure (tidak memanggil side-effect, tidak membaca provider langsung).
4. Warna WAJIB dari `ColorScheme`/tema, bukan hardcode (kecuali status semantic).
5. Gunakan `Column.spacing`/`Row.spacing` untuk jarak seragam, bukan `SizedBox` berulang.
6. Widget WAJIB aman untuk light/dark mode.
8. Pada `StatefulWidget`, `dispose()` WAJIB diletakkan tepat di bawah `initState()` (urutan lifecycle).

```dart
class KartuInfo extends StatelessWidget {
  const KartuInfo({
    super.key,
    required this.judul,
    required this.deskripsi,
  });

  final String judul;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      color: cs.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(judul, style: Theme.of(context).textTheme.titleMedium),
            Text(deskripsi, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
```

## Contoh Salah

```dart
class KartuInfo extends StatelessWidget {
  KartuInfo({required this.judul, required this.deskripsi});
  String judul;
  String deskripsi;

  @override
  Widget build(BuildContext context) {
    // side-effect + warna hardcode
    print('build');
    return Container(color: Colors.blue, child: Text(judul));
  }
}
```
