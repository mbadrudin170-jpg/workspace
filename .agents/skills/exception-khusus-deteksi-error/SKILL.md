---
name: exception-khusus-deteksi-error
description: "Gunakan ini saat mendeteksi tipe error; saat memilih tipe yang dilempar (exception/error) | Panduan exception khusus (class implements Exception) untuk deteksi via type check (is), bukan string matching pesan error; throw string literal DILARANG. Penggunaan Tipe Exception Khusus untuk Deteksi Error Gunakan class exception khusus yang implements `Exception` untuk menandai kondisi error, deteksi via `is` (type check), bukan string matching. Aturan 1. Gunakan tipe exception khusus (class yang mengimplementasikan `Exception` atau `Error`) untuk menandai kondisi error yang perlu dideteksi oleh pemanggil. 2. Pemanggil wajib mendeteksi error melalui `is` (type check), bukan pencocokan string `e.toString().contains(...)`. 3. Tipe exception khusus wajib dideklarasikan sebagai class terpisah dengan dokumentasi singkat. 4. Jangan bergantung pada teks pesan exception untuk menentukan alur program. Larangan - Jangan melempar `Exception('pesan')` lalu mendeteksi via `e.toString().contains('pesan')`. - Jangan menggunakan strin"
---

# Penggunaan Tipe Exception Khusus untuk Deteksi Error

Gunakan class exception khusus yang implements `Exception` untuk menandai kondisi error, deteksi via `is` (type check), bukan string matching.

## Aturan

1. Gunakan tipe exception khusus (class yang mengimplementasikan `Exception` atau `Error`) untuk menandai kondisi error yang perlu dideteksi oleh pemanggil.
2. Pemanggil wajib mendeteksi error melalui `is` (type check), bukan pencocokan string `e.toString().contains(...)`.
3. Tipe exception khusus wajib dideklarasikan sebagai class terpisah dengan dokumentasi singkat.
4. Jangan bergantung pada teks pesan exception untuk menentukan alur program.

## Larangan

- Jangan melempar `Exception('pesan')` lalu mendeteksi via `e.toString().contains('pesan')`.
- Jangan menggunakan string matching untuk deteksi error.
- Jangan melempar string literal (`throw 'pesan'`); stack trace tidak tertangkap dan tidak bisa dideteksi via `is`. Gunakan `StateError('pesan')` atau exception khusus.

## Contoh Benar

```dart
class IzinNotifikasiTidakDiberikanException implements Exception {
  const IzinNotifikasiTidakDiberikanException();
  @override
  String toString() => 'Izin notifikasi tidak diberikan';
}

// Melempar
throw const IzinNotifikasiTidakDiberikanException();

// Mendeteksi via type check
} on Exception catch (e, s) {
  if (e is IzinNotifikasiTidakDiberikanException) {
    // tangani kegagalan izin
  }
}

// StateError membawa stack trace dan dapat dideteksi via `is`
throw StateError('WhatsApp tidak dapat dibuka: $uri');
```

## Contoh Salah

```dart
throw Exception('Izin notifikasi tidak diberikan');

// Mendeteksi melalui pencocokan string (rentan)
final isIzin = e.toString().contains('Izin notifikasi tidak diberikan');

// Melempar string literal (stack trace hilang)
throw 'Could not launch $uri';
```
