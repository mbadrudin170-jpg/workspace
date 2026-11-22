---
name: type-promotion-null-safety
description: "Trigger: saat mengakses field nullable objek model | Panduan type promotion: salin field nullable ke variabel lokal sebelum null-check agar promotion berlaku. Operator `!` DILARANG — gunakan type promotion via variabel lokal universal."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Sun Nov 22 2026 17:00 WIB"
---

# Type Promotion untuk Null Safety pada Field Objek

Field nullable dari objek model wajib disalin terlebih dahulu ke variabel lokal sebelum digunakan dalam kondisi null-check, agar type promotion berlaku. **Operator `!` (null assertion) DILARANG digunakan untuk memaksakan nilai nullable menjadi non-null; wajib gunakan type promotion via variabel lokal.**

## Aturan

1. Field nullable dari objek model (misalnya `BiodataModel`) wajib disalin terlebih dahulu ke variabel lokal sebelum digunakan dalam kondisi null-check.
2. Setelah penyalinan, gunakan variabel lokal tersebut dalam percabangan `== null` dan pemanggilan fungsi, bukan akses properti objek dengan operator `!`.
3. **Operator `!` DILARANG digunakan pada semua ekspresi nullable** (field model, property widget seperti `widget.pelanggan`, return value fungsi, Map access, dll.). Wajib gunakan type promotion via variabel lokal: `final x = nullableValue; if (x == null) return; // gunakan x di sini`.
4. Pola ini berlaku universal: model, widget, fungsi, koleksi, dan semua konteks nullable.

## Larangan

- Jangan menggunakan `biodata.tanggalLahir!` atau `biodata.tanggalMulaiMerokok!` ketika nilai tersebut dapat disalin ke variabel lokal.
- Jangan mengakses properti nullable secara langsung dengan operator `!` apabila type promotion dapat digunakan.
- Jangan menggunakan `widget.pelanggan!.nama` — gunakan `final pelanggan = widget.pelanggan; if (pelanggan == null) return; pelanggan.nama`.
- Jangan menggunakan `map[key]!` — gunakan `entries`/`putIfAbsent`/`??` (rule 36).
- Jangan mengurutkan import secara sembarangan; ikuti urutan alfabetis.

## Contoh Benar

```dart
// Variabel lokal + early return (type promotion aktif)
final pelanggan = widget.pelanggan;
if (pelanggan == null) return;
_namaController.text = pelanggan.nama; // pelanggan sudah non-null di sini

// Variabel lokal + if != null block
final tanggalLahir = biodata?.tanggalLahir;
final tanggalMulaiMerokok = biodata?.tanggalMulaiMerokok;

_buildItem(
  'Tanggal lahir',
  tanggalLahir == null
      ? 'Belum dipilih'
      : FormatTanggal.formatDasar(tanggalLahir), // tanggalLahir dipromosikan non-null
);

// Map access pakai entries/putIfAbsent (lihat rule 36)
final entry = grouped.entries.elementAt(index);
final value = entry.value; // entry non-null karena dari entries
```

## Contoh Salah

```dart
// DILARANG: operator ! untuk memaksakan non-null
_buildItem(
  'Tanggal lahir',
  biodata.tanggalLahir == null
      ? 'Belum dipilih'
      : FormatTanggal.formatDasar(biodata.tanggalLahir!),
);

// DILARANG: widget property pakai !
_namaController.text = widget.pelanggan!.nama;

// DILARANG: Map access pakai !
final value = map[key]!;
```

## Rujukan

- Rule 27 di `.agents/rules/code.md` (type promotion field model)
- Rule 36 di `.agents/rules/code.md` (Map access tanpa !)
- Rule 49 di `.agents/rules/code.md` (larangan operator ! universal)
- Skill `penanganan-data-null` (indeks penanganan data null)
```
