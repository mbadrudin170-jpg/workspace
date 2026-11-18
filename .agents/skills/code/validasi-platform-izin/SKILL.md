---
name: validasi-platform-izin
description: "Trigger: saat fitur memerlukan platform atau izin | Panduan: cek dukungan platform sebelum API, minta izin sesuai kebijakan OS, periksa hasil izin sebelum mengaktifkan fitur."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 02:56 WIB"
---

# Validasi Dukungan Platform dan Izin Runtime

Periksa dukungan platform sebelum menggunakan API, minta izin sesuai kebijakan OS, periksa hasil izin sebelum mengaktifkan fitur.

## Aturan

1. Sebelum menggunakan API package, periksa dukungan platform berdasarkan versi package yang terpasang. Jangan mengasumsikan API yang sama tersedia di semua platform.
2. Jangan menampilkan kontrol fitur yang tidak didukung platform (misalnya pengingat terjadwal pada Web/Linux).
3. Permintaan izin harus mengikuti kebijakan sistem operasi dan dilakukan pada konteks yang tepat (setelah interaksi pengguna, bukan saat aplikasi pertama dibuka).
4. Periksa hasil izin sebelum menyatakan fitur berhasil diaktifkan. Jangan menyimpan status aktif jika izin sistem belum tersedia.
5. Pisahkan inisialisasi layanan dari permintaan izin pengguna. Inisialisasi boleh dilakukan saat startup, tetapi izin diminta sesuai kebutuhan fitur.
6. Tangani error platform yang tidak didukung (mis. `UnsupportedError`) secara eksplisit, bukan hanya `Exception`.
7. Layanan Firebase (unggah/unduh/sinkronisasi, termasuk di callback refresh/auto-sync dan jalur tanpa interaksi pengguna) WAJIB di-guard `kIsWeb` bila Firebase Web tidak dikonfigurasi (aplikasi berjalan offline), atau Firebase Web diinisialisasi eksplisit (mis. `firebase_options.dart` + `index.html`); pemanggilan tanpa guard DILARANG — melempar `[core/not-initialized] Firebase has not been correctly initialized`.

## Larangan

- Jangan meminta izin saat aplikasi pertama dibuka tanpa konteks fitur.
- Jangan menyimpan status aktif tanpa memeriksa hasil izin.
- Jangan mengasumsikan API notifikasi terjadwal tersedia di Web/Linux/Windows.
- Jangan memanggil layanan Firebase (unggah/unduh/sinkronisasi, termasuk di callback refresh dan auto-sync) di Web tanpa guard `kIsWeb` — mode offline melempar `[core/not-initialized]`; akses Firestore di Web wajib `Firebase.initializeApp` eksplisit + konfigurasi Web.

## Contoh Benar

```dart
if (kIsWeb) {
  // Jangan tampilkan pengingat terjadwal
} else if (defaultTargetPlatform == TargetPlatform.android) {
  final izin = await mintaIzinAndroid();
  if (!izin) return;
}

// Guard akses layanan Firebase di mode offline
if (kIsWeb) {
  // lewati unggah/unduh — Firebase Web tidak dikonfigurasi
} else {
  await layananUnggahData.unggah(...);
}
```

## Contoh Salah

```dart
// Meminta izin saat aplikasi pertama dibuka tanpa konteks fitur.
await plugin.requestNotificationsPermission();
// Menyimpan status aktif tanpa memeriksa hasil izin.
await setAktif(true);
```

## Sumber Evaluasi

- Commit: `774431dbf61bb330d548785e8d47597c5bdcd123`, `0cb0e52f48f6d6f95f2bfc9e8b82a092bb5f9e4f`
- File: `lib/shared/notifikasi/notifikasi_service.dart`, `lib/fitur/pengaturan/screens/pengaturan_screen.dart`, `saran.md`
- Berkas sumber: `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` (`_loadData(forceRefresh: true)` → `[core/not-initialized] Firebase has not been correctly initialized`), `admin_wifi/lib/halaman/form/form_kategori.dart` (baris ~32), `admin_wifi/lib/main.dart` (guard `kIsWeb` + log mode offline) — temuan runtime Web 2026-11-18 (sesi induk "kode"), tercatat di MEMORI.md proyek. Skill diperbarui atas permintaan pengguna (perintah `/tambah_kode_keskill`, sesi 47, 2026-11-19), di luar alur commit-history atas persetujuan pengguna — versi 1.0.1 → 1.1.0; Aturan 7 (guard Firebase/kIsWeb) dan Larangan terkait ditambahkan. Provenance: sesi; proyek menunjukkan pola guard `kIsWeb` eksplisit di `main.dart` (bukan edit skill dari commit baru untuk aturan ini).
