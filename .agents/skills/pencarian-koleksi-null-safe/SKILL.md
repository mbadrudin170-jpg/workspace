---
name: pencarian-koleksi-null-safe
description: "Gunakan ini saat mencari, mengurutkan, atau mengakses elemen dalam koleksi (List/Iterable/Map) | Panduan koleksi: pencarian wajib `firstWhereOrNull`, pengurutan wajib `.sorted`/`.sortedBy`/`.sortedByDescending` dari `package:collection/collection.dart`; akses nilai Map DILARANG memakai `!` (gunakan `.entries`, `??`, atau `putIfAbsent`); larangan `cast<T?>().firstWhere(..., orElse: ...)`, `..sort(...)` in-place, dan `map[key]!`."
---

# Pencarian Koleksi Null-Safe

Saat mencari elemen dalam koleksi (`List`/`Iterable`) dengan predikat yang mungkin tidak ditemukan, wajib memakai `firstWhereOrNull` dari `package:collection/collection.dart`.

## Aturan

1. Pencarian elemen dalam koleksi dengan predikat yang mungkin tidak ditemukan wajib memakai `firstWhereOrNull` dari `package:collection/collection.dart`.
2. Import `package:collection/collection.dart` wajib ditambahkan bila belum ada (urutan alfabetis sesuai skill `aturan-penamaan`).
3. Hasil `firstWhereOrNull` bertipe nullable (`T?`); tangani `null` secara eksplisit (mis. `??` atau `if (result == null)`).
4. Pola `cast<T?>().firstWhere(..., orElse: () => null)` DILARANG karena verbose dan rentan salah tipe.
5. Pola `firstWhere(..., orElse: () => null)` tanpa `cast` juga DILARANG; gunakan `firstWhereOrNull`.

## Pengurutan Koleksi

6. Pengurutan elemen koleksi (`List`/`Iterable`) wajib memakai extension `.sorted(...)`, `.sortedBy(...)`, atau `.sortedByDescending(...)` dari `package:collection/collection.dart`, bukan `..sort(...)` pada list yang dimutasi (cascade).
7. `.sorted(...)` mengembalikan `List<T>` baru (immutable-friendly); jangan memutasi list sumber secara langsung untuk pengurutan.
8. Gunakan `.sortedBy((e) => e.field)` bila kunci pengurutan sederhana; gunakan `.sorted((a, b) => ...)` bila perlu pembanding kustom.
9. Import `package:collection/collection.dart` wajib ditambahkan bila belum ada (urutan alfabetis sesuai skill `aturan-penamaan`).

## Larangan

- Jangan memakai `_list..sort((a, b) => ...)` atau `list.sort(...)` untuk pengurutan yang menghasilkan list baru; gunakan `.sorted(...)`.
- Jangan memutasi list sumber secara langsung untuk pengurutan; gunakan `.sorted(...)`.

- Jangan memakai `_list.cast<T?>().firstWhere((e) => e?.id == id, orElse: () => null)`.
- Jangan memakai `_list.firstWhere((e) => e.id == id, orElse: () => null)` untuk koleksi yang mungkin tidak berisi elemen cocok.
- Jangan memakai operator `!` untuk memaksa hasil pencarian non-null apabila hasilnya dapat bernilai `null`.
- Jangan memakai `map[key]!` pada akses nilai Map; gunakan `.entries` atau `??`.
- Jangan memakai `map[key]!.add(x)` saat menambahkan ke koleksi di dalam Map; gunakan `putIfAbsent`.

## Akses Nilai Map

10. Akses nilai `Map` melalui indeks (`map[key]`) mengembalikan nilai nullable (`V?`); DILARANG memakai operator `!` untuk memaksakan non-null (mis. `map[key]!`).
11. Bila iterasi berdasarkan indeks, gunakan `.entries` dan ambil `.key`/`.value` dari entri (tidak perlu lookup ulang).
12. Bila lookup memang diperlukan dan nilai mungkin tidak ada, sediakan nilai default dengan `??` (mis. `map[key] ?? defaultValue`) atau tangani `null` secara eksplisit.
13. Jangan memakai `map[key]!` hanya karena key berasal dari `map.keys` (lookup tetap nullable menurut tipe).
14. Saat menambahkan elemen ke koleksi yang disimpan di dalam `Map` (mis. pengelompokan), DILARANG `map[key]!.add(x)`; gunakan `map.putIfAbsent(key, () => []).add(x)` agar entri dibuat bila belum ada tanpa operator `!`.
15. Alternatif yang setara: `map[key] = (map[key] ?? <T>[])..add(x);` (simpan list baru yang sudah berisi elemen); namun `putIfAbsent` lebih ringkas dan menghindari pembuatan list sementara.

## Contoh Benar (Akses Map)

```dart
final entry = grouped.entries.elementAt(index);
final tanggal = entry.key;
final transaksiPadaTanggal = entry.value;

// Lookup dengan default
final value = grouped[tanggal] ?? const <TransaksiModel>[];

// Tambah ke list di dalam Map (pengelompokan) - putIfAbsent
grouped.putIfAbsent(tanggal, () => []).add(t);
```

## Contoh Salah (Akses Map)

```dart
final tanggal = grouped.keys.elementAt(index);
final transaksiPadaTanggal = grouped[tanggal]!; // DILARANG

// DILARANG: menambah ke list di dalam Map dengan !
grouped[tanggal]!.add(t);
```

## Contoh Benar

````dart
import 'package:collection/collection.dart';

final kategori = state.listKategori.firstWhereOrNull(
  (k) => k.id == id,
);
if (kategori == null) {
  // tangani tidak ditemukan
}

// Pengurutan dengan .sorted (package:collection)
final terbaru = state.listTransaksi
    .where((t) => t.idPelanggan == idPelanggan)
    .sorted((a, b) => b.tanggal.compareTo(a.tanggal));

## Contoh Salah

```dart
final kategori = state.listKategori
    .cast<KategoriModel?>()
    .firstWhere(
      (k) => k?.id == id,
      orElse: () => null,
    );
````

```dart
// Salah: mutasi in-place dengan ..sort
final terbaru = (state.listTransaksi
        .where((t) => t.idPelanggan == idPelanggan)
        .toList()
      ..sort((a, b) => b.tanggal.compareTo(a.tanggal)));
```


---

# Referensi (dipindahkan dari folder references)

