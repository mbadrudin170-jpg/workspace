---
name: exception-khusus-deteksi-error
description: "Trigger: saat mendeteksi tipe error; saat memilih tipe yang dilempar (exception/error) | Panduan exception khusus (class implements Exception) untuk deteksi via type check (is), bukan string matching pesan error; throw string literal DILARANG."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 02:38 WIB"
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

## Sumber Evaluasi

- Commit: `07fc8df6cf5ea28fe7133b1aee5dae7b05b96590`
- File: `lib/shared/notifikasi/notifikasi_service.dart`, `lib/fitur/pengaturan/screens/pengaturan_screen.dart`
- Berkas sumber: `admin_wifi/lib/fitur/pelanggan_aktif/screens/detail_pelanggan_aktif.dart` (sesi 47, 2026-11-19 — `throw 'Could not launch ...'` diganti `throw StateError(...)`; perubahan pada saat penulisan **belum ter-commit**, diterapkan di luar alur commit-history atas persetujuan eksplisit pengguna). Skill diperbarui atas permintaan eksplisit pengguna (sesi 47, 2026-11-19) — versi 1.0.1 → 1.1.0; Larangan & Contoh ditambahkan. Provenance: sesi, bukan commit.
