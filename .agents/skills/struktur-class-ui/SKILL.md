---
name: struktur-class-ui
description: "Gunakan saat membuat atau mengubah widget UI reusable. Aturan struktur: helper privat aksi (void) wajib di atas build(); build() berada di atas helper widget; helper non-widget pengembali nilai (Color, String, int, bool) wajib di bagian paling bawah kelas. Widget tanpa state wajib menggunakan StatelessWidget, parameter final, const constructor jika memungkinkan, build() harus pure, warna mengikuti tema, dan widget mendukung light/dark mode."
---

# Struktur Class UI Reusable

Panduan struktur class widget UI reusable yang konsisten, pure, dan aman tema.

## Aturan

1. Widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state.
2. Semua parameter WAJIB `final` dan constructor WAJIB `const` bila memungkinkan.
3. Method `build` WAJIB pure (tidak memanggil side-effect, tidak membaca provider langsung) dan WAJIB berada di atas seluruh method helper widget (yang mengembalikan `Widget`). Method helper privat aksi (nama diawali `_`, mengembalikan `void`) WAJIB di atas `build`; method helper non-widget pengembali nilai (`Color`, `String`, `int`, `bool`) WAJIB di paling bawah kelas. Hierarki dari atas ke bawah: helper privat aksi → `build` → helper widget → helper non-widget pengembali nilai.
5. Jarak seragam mengikuti skill `spacing` (Column.spacing/Row.spacing).
6. Widget WAJIB aman untuk light/dark mode.
7. Method helper privat (nama diawali `_`, termasuk aksi non-widget seperti `_editXxx`, `_salinXxx`, `_tambahXxx`, `_muatUlang`) WAJIB ditempatkan di atas method `build`; method helper widget yang mengembalikan `Widget` (mis. `_buildXxx`, `_buildError`) tetap di bawah `build`. DILARANG menempatkan method helper privat di bawah `build` atau mencampurnya dengan helper widget di bawah `build`.
8. Method helper non-widget yang mengembalikan nilai non-widget (mis. `Color`, `String`, `int`, `bool`) WAJIB ditempatkan di paling bawah kelas, setelah seluruh method helper widget dan method `build`; DILARANG mencampur method non-widget di antara method widget.

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
