---
name: struktur-class-ui
description: "Gunakan saat membuat atau mengubah widget UI reusable. Aturan struktur: helper privat aksi (void) wajib di atas build(); build() berada di atas helper widget; helper non-widget pengembali nilai (Color, String, int, bool) wajib di bagian paling bawah kelas. Widget tanpa state wajib menggunakan StatelessWidget, parameter final, const constructor jika memungkinkan, build() harus pure, warna mengikuti tema, dan widget mendukung light/dark mode."
---

# Struktur Class UI Reusable

Panduan struktur class widget UI reusable yang konsisten, pure, dan aman tema.

## Aturan

1. Widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state.
2. Semua parameter WAJIB `final` dan constructor WAJIB `const` bila memungkinkan.
3. Urutan method dalam class widget WAJIB mengikuti hierarki: (1) helper privat aksi (nama diawali `_`, return `void` atau `Future<void>`) di atas `build()`; (2) method `build()`; (3) helper widget yang mengembalikan `Widget` (termasuk `_buildXxx`, `_buildError`) di bawah `build()`; (4) helper non-widget pengembali nilai non-widget (`Color`, `String`, `int`, `bool`, dll.) di paling bawah kelas. Method `build` WAJIB pure (tidak memanggil side-effect, tidak membaca provider langsung).
5. Jarak seragam mengikuti skill `spacing` (Column.spacing/Row.spacing).
6. Widget WAJIB aman untuk light/dark mode.
7. Penempatan helper aksi privat: helper aksi privat seperti `_editXxx`, `_salinXxx`, `_tambahXxx`, dan `_muatUlang` WAJIB berada sebelum `build()`. Aturan ini hanya berlaku untuk helper aksi, bukan helper widget.
8. Penempatan helper non-widget: helper non-widget yang mengembalikan nilai seperti `Color`, `String`, `int`, atau `bool` WAJIB ditempatkan setelah seluruh helper widget, pada bagian paling bawah kelas.

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

## Contoh Urutan Method

```dart
class ContohWidget extends StatelessWidget {
  const ContohWidget({super.key});

  // 1. Helper aksi privat
  void _simpan() {
    // ...
  }

  // 2. Build
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTombol(),
        _buildError(),
      ],
    );
  }

  // 3. Helper widget privat
  Widget _buildTombol() {
    return const ElevatedButton(
      onPressed: null,
      child: Text('Simpan'),
    );
  }

  Widget _buildError() {
    return const Text('Terjadi kesalahan');
  }

  // 4. Helper non-widget
  Color _warnaStatus() {
    return Colors.green;
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
