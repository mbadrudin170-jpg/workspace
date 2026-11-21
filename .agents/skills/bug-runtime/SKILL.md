---
name: bug-runtime
description: "Trigger: saat mencegah bug runtime Flutter | Indeks skill spesifik: type-promotion-null-safety, penanganan-async, penanganan-error-unawaited, validasi-platform-izin, exception-khusus-deteksi-error. Indeks Pencegahan Bug Runtime Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap topik pencegahan bug runtime. Jangan menduplikasi isi skill spesifik di sini. Cakupan yang Di-Cover - Package: `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:flutter` (class `DateTime`, `Timer`) - Class: `AsyncValue`, `DateTime`, `Timer`, `Exception`, `ImpianProgresHelper`, `BiodataModel` - Method: `AsyncValue.requireValue()`, `AsyncValue.asData?.value`, `ref.watch()`, `ref.refresh()`, `DateTime.normalize()`, `Timer.periodic()`, `Timer.cancel()` Aturan 1. Untuk implementasi detail, buka skill spesifik yang tercantum di tabel di bawah. 2. Untuk code review, periksa apakah kode mengikuti aturan dari sk"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Indeks Pencegahan Bug Runtime

Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap topik pencegahan bug runtime. Jangan menduplikasi isi skill spesifik di sini.

## Cakupan yang Di-Cover

- Package: `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:flutter` (class `DateTime`, `Timer`)
- Class: `AsyncValue`, `DateTime`, `Timer`, `Exception`, `ImpianProgresHelper`, `BiodataModel`
- Method: `AsyncValue.requireValue()`, `AsyncValue.asData?.value`, `ref.watch()`, `ref.refresh()`, `DateTime.normalize()`, `Timer.periodic()`, `Timer.cancel()`

## Pemetaan Topik → Skill Teknis

| Topik bug runtime                             | Skill teknis yang wajib dimuat |
| --------------------------------------------- | ------------------------------ |
| Type promotion / null safety pada field model | `type-promotion-null-safety`   |
| Normalisasi tanggal / perhitungan hari        | `normalisasi-tanggal`          |

| Penanganan state async & data kosong (satu atau beberapa provider) | `penanganan-async` |
| Future yang dilepas (unawaited) | `penanganan-error-unawaited` |
| Dukungan platform & izin runtime | `validasi-platform-izin` |
| Deteksi tipe error via exception khusus | `exception-khusus-deteksi-error` |

## Aturan

1. Untuk implementasi detail, buka skill spesifik yang tercantum di tabel di bawah.
2. Untuk code review, periksa apakah kode mengikuti aturan dari skill spesifik yang relevan.
3. Untuk onboarding, gunakan indeks ini untuk memahami lanskap pencegahan bug runtime, lalu pelajari setiap skill spesifik.
4. Sebelum implementasi atau code review terkait bug runtime, wajib memuat (via tool `skill`) skill teknis yang relevan berdasarkan tabel pemetaan di atas. Indeks ini hanya untuk menemukan skill teknis, bukan pengganti pemuatan isi skill teknis.

## Larangan

- JANGAN menyalin isi skill spesifik ke skill indeks ini.
- JANGAN menambahkan contoh kode detail di skill indeks ini (contoh ada di skill spesifik).
- JANGAN membuat aturan baru di skill indeks ini yang seharusnya ada di skill spesifik.

## Contoh Benar

```dart
// Rujuk ke skill spesifik untuk implementasi detail
// type promotion → lihat skill `type-promotion-null-safety`
final tanggalLahir = biodata?.tanggalLahir;
if (tanggalLahir == null) {
  return 'Belum dipilih';
} // type promotion berlaku di sini

// normalisasi tanggal → dihapus (skill dihapus)
final hariIniDate = DateTime(hariIni.year, hariIni.month, hariIni.day);

// AsyncValue handling → lihat skill `penanganan-async-data-kosong`
if (dataAsync.isLoading) return const _LoadingView();
if (dataAsync.hasError) return _ErrorRetry(onRetry: () => ref.refresh(provider));
final data = dataAsync.requireValue;
```

## Contoh Salah

```dart
// Jangan menyalin isi skill spesifik ke sini
// Jangan menambahkan contoh kode detail di skill indeks

// SALAH: requireValue tanpa handle loading/error
final state = ref.watch(provider).requireValue;

// SALAH: Tanggal tanpa normalisasi
final totalHari = DateTime.now().difference(tanggalBerhenti).inDays + 1;
```
