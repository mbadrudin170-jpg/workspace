---
name: data-dummy
description: "Gunakan ini saat menambahkan atau memperbarui data dummy untuk pratinjau UI atau pengembangan | Pola data dummy: kelas `abstract final class <Model>Dummy` di `lib/fitur/<fitur>/dummy/<model>_dummy.dart`; daftar `dummyList`; id konstanta UUID; tanggal relatif; dummy berelasi memakai ID dari dummy sumber."
---

# Data Dummy

Skill ini menetapkan pola pembuatan data dummy (data sampel) untuk kebutuhan pratinjau UI dan pengembangan. Data dummy bukan sumber data produksi dan bukan pengganti test.

## Aturan

1. Folder data dummy berada di `lib/fitur/<fitur>/dummy/` (bukan di `test/`). Berkas bernama `<nama_model>_dummy.dart` (snake_case) dan diawali komentar header `// path: lib/fitur/<fitur>/dummy/<nama_model>_dummy.dart`.
2. Kelas dummy berupa `abstract final class <NamaModel>Dummy` - mencegah instansiasi; seluruh isi berupa anggota statis.
3. Daftar sampel berupa `static final List<NamaModel> dummyList = [ ... ]` (bukan `const`, karena nilai memuat instansiasi `DateTime`/model).
4. **Setiap nilai id pada model dummy WAJIB konstanta `static const String` SCREAMING_SNAKE_CASE di atas daftar** (mis. `ID_ITEM_001`), bukan literal tersebar langsung pada entri.
5. **Nilai konstanta id WAJIB mengikuti format UUID `8-4-4-4-12`** (nibble versi `4`, varian `8`) - format saja; DILARANG memakai hasil generate UUID sebagai nilai dummy.
6. Konstanta id dikelompokkan per field model (mis. id entitas utama, id entitas relasi, id referensi lain) dengan prefiks berbeda; nilai yang sama dipakai ulang lewat konstanta yang sama.
7. Tanggal pada entri dummy WAJIB relatif terhadap `DateTime.now()` (mis. `DateTime.now().subtract(const Duration(days: 10))`) agar tetap relevan; DILARANG memakai tanggal absolut yang lekas usang.
8. Untuk kebutuhan test (unit/widget), dummy data tetap dipakai dari `lib/fitur/<fitur>/dummy/` dan diimpor oleh berkas test - lihat skill `aturan-testing`.
9. Dummy yang berelasi WAJIB memakai konstanta ID yang sama dengan ID di kelas dummy sumber (mis. `PelangganAktifDummy.ID_PELANGGAN_001` == `PelangganDummy.ID_PELANGGAN_001`); referensi ke ID yang tidak ada di kelas dummy sumber DILARANG (menyebabkan log peringatan "tidak ditemukan" dari operasi `getXxxById` saat dummy direset).

## Contoh Benar

```dart
// path: lib/fitur/produk/dummy/produk_dummy.dart

import 'package:contoh_aplikasi/enum/status_enum.dart';
import 'package:contoh_aplikasi/fitur/produk/model/produk_model.dart';

/// Data dummy `ProdukModel` untuk kebutuhan pratinjau UI dan pengembangan.
/// Tanggal mengikuti `DateTime.now()` agar tetap relevan.
abstract final class ProdukDummy {
  static const String ID_PRODUK_001 = 'aa000001-0000-4000-8000-000000000001';
  static const String ID_PRODUK_002 = 'aa000002-0000-4000-8000-000000000002';

  static const String ID_TOKO_001 = 'bb000001-0000-4000-8000-000000000001';

  static const String ID_TRANSAKSI_001 = 'dd000001-0000-4000-8000-000000000001';

  static final List<ProdukModel> dummyList = [
    ProdukModel(
      id: ID_PRODUK_001,
      idToko: ID_TOKO_001,
      idTransaksi: ID_TRANSAKSI_001,
      tanggalMulai: DateTime.now().subtract(const Duration(days: 10)),
      tanggalBerakhir: DateTime.now().add(const Duration(days: 20)),
      status: StatusEnum.aktif,
    ),
    ProdukModel(
      id: ID_PRODUK_002,
      idToko: ID_TOKO_001,
      tanggalMulai: DateTime.now().subtract(const Duration(days: 3)),
      tanggalBerakhir: DateTime.now().add(const Duration(days: 4)),
      status: StatusEnum.nonaktif,
    ),
  ];
}
```

## Contoh Salah

```dart
// DILARANG: literal id tersebar langsung pada entri, tanpa konstanta
ProdukModel(id: 'aa000001-0000-4000-8000-000000000001', ...),

// DILARANG: konstanta id tidak berformat UUID
static const String ID_PRODUK_001 = 'produk-dummy-001';

// DILARANG: memakai hasil generate UUID sebagai nilai dummy
static const String ID_PRODUK_001 = 'f47ac10b-58cc-4372-a567-0e02b2c3d479';

// DILARANG: tanggal absolut yang usang
tanggalMulai: DateTime(2026, 1, 1),

// DILARANG: kelas dummy bisa diinstansiasi (bukan `abstract final`)
class ProdukDummy {
  ...
}

// DILARANG: referensi lintas entitas ke ID yang TIDAK ADA di kelas dummy
// sumber (mis. dummy PelangganAktif merujuk ID Pelanggan/Paket dummy yang
// belum/ tidak pernah di-seed) - memicu peringatan "tidak ditemukan" dari
// operasi getXxxById saat dummy direset
static const String ID_PELANGGAN_999 = 'bb000099-0000-4000-8000-000000000099';
```
