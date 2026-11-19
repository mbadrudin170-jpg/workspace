---
name: konfirmasi-sebelum-simpan
description: "Trigger: saat menyimpan data dari form | saat konfirmasi aksi destruktif (hapus/hapus semua) | Panduan dialog konfirmasi sebelum menyimpan/konfirmasi, hanya lanjut jika OK, flag loading + EasyLoading selama proses."
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Wed Nov 18 2026 23:55 WIB"
---

# Konfirmasi sebelum Menyimpan pada Form

Sebelum menyimpan data, tampilkan dialog konfirmasi, hanya jalankan jika OK, flag loading + EasyLoading selama proses.

## Aturan

1. Sebelum menyimpan data, tampilkan dialog konfirmasi (`showOkCancelAlertDialog`) yang menjelaskan tindakan yang akan dilakukan.
2. Hanya jalankan penyimpanan jika pengguna menekan OK.
3. Selama proses penyimpanan, aktifkan flag `_isLoading` dan tampilkan loading overlay (`EasyLoading`).
4. Setelah selesai (berhasil/gagal), hentikan loading dan kembalikan flag.

## Larangan

- Jangan menyimpan data tanpa konfirmasi pengguna.
- Jangan membiarkan proses penyimpanan berjalan tanpa indikator loading.

## Contoh Benar

```dart
final konfirmasi = await showOkCancelAlertDialog(
  context: context,
  title: 'Simpan Craving',
  message: 'Apakah Anda yakin ingin menyimpan catatan craving ini?',
  okLabel: 'Simpan',
  cancelLabel: 'Batal',
);
if (konfirmasi != OkCancelResult.ok) return;
```

## Alternatif: `ConfirmationDialog` (share_global_saya)

Untuk proyek yang bergantung pada `share_global_saya`, tersedia dialog konfirmasi terstandar `ConfirmationDialog` (`lib/src/widget/confirmation_dialog.dart`) — dipakai bila ingin satu gaya dialog untuk aksi destruktif/info tanpa menambah dependency `adaptive_dialog` pada alur baru. Jangan mencampur dua pola pada satu alur yang sama. Pola utama skill ini (adaptive_dialog `showOkCancelAlertDialog`) tetap berlaku; pilih salah satu per alur.

API `ConfirmationDialog`:

- `show({required context, title = 'Konfirmasi', message = 'Apakah Anda yakin?', confirmText = 'Ya', cancelText = 'Batal', confirmColor, cancelColor, barrierDismissible = true, isDestructive = false})` → `Future<bool?>` (`true` = konfirmasi, `false` = batal, `null` = dismiss). `isDestructive: true` menambahkan ikon `Icons.warning_amber_rounded` + warna `colorScheme.error`/`onError`.
- `showDelete({required context, required itemName, ...})` → pesan memuat nama item dalam tanda kutip; selalu `isDestructive: true`.
- `showDeleteAll({required context, itemName?, itemCount?, message?, ...})` → menyusun pesan otomatis (`"Yakin ingin menghapus semua <item> (<n> item)?"` atau fallback), menambahkan `\n\nTindakan ini tidak dapat dibatalkan!`; `isDestructive: true` + `confirmColor: Colors.red.shade700` (hardcode status semantik).
- `showInfo({required context, title = 'Informasi', message = '', buttonText = 'OK', buttonColor})` → `Future<void>`; `AlertDialog` satu tombol, `barrierDismissible: false`.
- Navigasi internal memakai `Nav.pop(context, result)`; warna tombol dari `Theme.of(context).colorScheme` + `withValues(alpha:)`; layout dua tombol Expanded (`OutlinedButton` batalkan + `ElevatedButton` konfirmasi).

Contoh nyata (commit `eb3efc3`): konfirmasi destruktif bulk — `AlertDialog` manual diganti `ConfirmationDialog`:

```dart
final bool? konfirmasi = await ConfirmationDialog.showDeleteAll(
  context: context,
  itemName: 'pelanggan aktif',
  title: 'Konfirmasi Hapus Semua',
);
if (konfirmasi != true) return;
```

## Contoh Salah

```dart
// Menyimpan langsung tanpa konfirmasi.
await ref.read(diaryCravingProvider.notifier).tambah(model);
```
