---
name: perbaikan-test-notifikasi
description: "Trigger: saat memperbaiki test notifikasi yang gagal karena mismatch jumlah call mock atau mock tidak diisolasi | Panduan prosedur: baca log aktual jumlah jadwal notifikasi, cocokkan dengan kontrak domain, reset mock setelah setup, verifikasi ID/hash notifikasi spesifik, jalankan test terkait lalu semua test."
---

# Perbaikan Test Notifikasi

## Tujuan

Mencegah pola error berulang pada test notifikasi: mismatch jumlah call mock dan mock yang tidak diisolasi dari setup.

## Langkah

1. Baca log aktual jumlah jadwal notifikasi dari kode produksi.
2. Cocokkan dengan kontrak domain (mis. `notifikasiPelangganAktif`).
3. Setelah setup membuat data, panggil `clearInteractions(mockNotifikasiServis)`.
4. Verifikasi perilaku hanya pada tahap yang diuji.
5. Verifikasi ID/hash notifikasi spesifik, bukan total call global.
6. Jalankan hanya test terkait terlebih dahulu.
7. Baru jalankan seluruh test.

## Contoh Benar

```dart
final modelDibuat = await operasi.createPelangganAktif(buatModel());
clearInteractions(mockNotifikasiServis);
await operasi.arsipkanPelangganAktif(modelDibuat.id);

verify(() => mock.batalNotifikasi(modelDibuat.id.hashCode)).called(1);
verify(() => mock.batalNotifikasi(modelDibuat.id.hashCode + 1)).called(1);
verify(() => mock.batalNotifikasi(modelDibuat.id.hashCode + 2)).called(1);
```

## Contoh Salah

```dart
// Salah: menghitung call dari setup + aksi yang diuji
verify(() => mock.batalNotifikasi(any())).called(3);
```
