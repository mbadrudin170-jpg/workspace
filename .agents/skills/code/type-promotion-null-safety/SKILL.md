---
name: type-promotion-null-safety
description: "Trigger: saat mengakses field nullable objek model | Panduan type promotion: salin field nullable ke variabel lokal sebelum null-check agar promotion berlaku."
metadata:
  kategori: "custom"
  versi: "1.0.2"
  diperbarui: "Thu Nov 19 2026 08:30 WIB"
---

# Type Promotion untuk Null Safety pada Field Objek

Field nullable dari objek model wajib disalin terlebih dahulu ke variabel lokal sebelum digunakan dalam kondisi null-check, agar type promotion berlaku.

## Aturan

1. Field nullable dari objek model (misalnya `BiodataModel`) wajib disalin terlebih dahulu ke variabel lokal sebelum digunakan dalam kondisi null-check.
2. Setelah penyalinan, gunakan variabel lokal tersebut dalam percabangan `== null` dan pemanggilan fungsi, bukan akses properti objek dengan operator `!`.
3. Jangan menggunakan operator `!` untuk memaksakan nilai nullable menjadi non-null apabila nilai tersebut dapat dipromosikan melalui variabel lokal.
4. Urutan import wajib mengikuti urutan alfabetis berdasarkan path package.

## Larangan

- Jangan menggunakan `biodata.tanggalLahir!` atau `biodata.tanggalMulaiMerokok!` ketika nilai tersebut dapat disalin ke variabel lokal.
- Jangan mengakses properti nullable secara langsung dengan operator `!` apabila type promotion dapat digunakan.
- Jangan mengurutkan import secara sembarangan; ikuti urutan alfabetis.

## Contoh Benar

```dart
final tanggalLahir = biodata?.tanggalLahir;
final tanggalMulaiMerokok = biodata?.tanggalMulaiMerokok;
final tanggalMulaiBerhentiMerokok = biodata?.tanggalMulaiBerhentiMerokok;

_buildItem(
  'Tanggal lahir',
  tanggalLahir == null
      ? 'Belum dipilih'
      : FormatTanggal.formatDasar(tanggalLahir),
);
```

## Contoh Salah

```dart
_buildItem(
  'Tanggal lahir',
  biodata.tanggalLahir == null
      ? 'Belum dipilih'
      : FormatTanggal.formatDasar(biodata.tanggalLahir!),
);
```
