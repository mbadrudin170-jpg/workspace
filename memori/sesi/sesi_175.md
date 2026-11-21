# Sesi 175

Diperbarui: 2026-11-20

## Status

Status Sinkron: Sudah Sinkron
Tanggal: 2026-11-20
Command: interaksi langsung (tanpa command)
Topik: Memindahkan logika `DompetOperasi` ke `DompetNotifier`.

## Catatan Sesi

- Seluruh metode `DompetOperasi` (create/update/get/getById/arsip/hapus/total saldo/batch/getByIds) dipindahkan ke `DompetNotifier`.
- Ditambahkan `dompetNotifierGlobal` (pola `transaksiNotifierGlobal`) untuk akses di luar Riverpod.
- Konsumen diperbarui: `unduh_data.dart`, `dummy_helper.dart`, `transaksi_list_widgets.dart`, `detail_dompet.dart`, `form_dompet.dart`, `dompet.dart`.
- `lib/data/operasi/dompet_operasi.dart` dihapus dan ekspornya dihapus dari `operasi.dart`.
- Verifikasi: `dart format`, `dart analyze` (No issues found!), `flutter test` (18 kegagalan pra-eksisting, tidak terkait dompet).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| lib/fitur/dompet/notifier/dompet_notifier.dart | Diubah | Logika operasi dompet dipindah ke sini + global accessor |
| lib/fitur/dompet/notifier/dompet_notifier.g.dart | Diubah (generate) | Hasil build_runner |
| lib/data/operasi/dompet_operasi.dart | Dihapus | Logika dipindah ke notifier |
| lib/data/operasi/operasi.dart | Diubah | Hapus export dompet_operasi |
| lib/data/sync/unduh_data.dart | Diubah | Pakai dompetNotifierGlobal |
| lib/dummy/dummy_helper.dart | Diubah | Pakai dompetNotifierGlobal |
| lib/widget/transaksi_list_widgets.dart | Diubah | Pakai dompetNotifierGlobal |
| lib/fitur/dompet/screens/detail_dompet.dart | Diubah | Pakai DompetNotifier/dompetNotifierGlobal |
| lib/fitur/dompet/screens/form_dompet.dart | Diubah | Pakai ref.read(dompetProvider.notifier) |
| lib/fitur/dompet/screens/dompet.dart | Diubah | Pakai dompetNotifierGlobal |
| lib/fitur/transaksi/notifier/transaksi_notifier.dart | Diubah | Hapus import flutter_riverpod tak perlu |
| lib/fitur/transaksi/notifier/transaksi_notifier.g.dart | Diubah (generate) | Hasil build_runner |

## Sinkronisasi ke MEMORI.md

Ditambahkan catatan teknis migrasi DompetOperasi ke DompetNotifier (sesi 175).
