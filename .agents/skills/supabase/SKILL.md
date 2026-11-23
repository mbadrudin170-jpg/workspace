---
name: supabase
description: Trigger: saat mengintegrasikan Supabase (PostgREST) di Flutter - panduan singleton SupabaseKlien idempotent (StateError bila belum init), OperasiSupabase CRUD generik (ambil/tambah/ubah/hapus/tambahBatch) dengan filter match, order, limit/range, logging L dengan $e $s, rethrow, dan penandaan kapan init di main(). Berguna untuk proyek yang memakai Supabase sebagai backend.
---

# Skill: supabase

# Integrasi Supabase (PostgREST) di Flutter

Panduan pola integrasi Supabase pada proyek Flutter: singleton klien idempotent, operasi CRUD generik, dan penempatan inisialisasi di `main()`.

## Cakupan yang Di-Cover

- Package: `supabase_flutter` (`Supabase`, `SupabaseClient`, `Supabase.initialize`), `flutter_riverpod` (`Provider`), `share_global_saya` (`L`)
- Class: `SupabaseKlien`, `OperasiSupabase`
- Method: `inisialisasi(...)`, `client` (getter), `ambil`, `tambah`, `ubah`, `hapus`, `tambahBatch`

## Aturan

1. Klien Supabase **WAJIB** berupa singleton dengan konstruktor privat (`_internal`) dan instance statis (`static final ... instance`).
2. Getter `client` **WAJIB** melempar `StateError` bila `inisialisasi()` belum dipanggil; jangan mengembalikan `null` atau membuat klien diam-diam.
3. `inisialisasi(...)` **WAJIB** idempoten: pemanggilan kedua dilewati dengan log peringatan (`L.w`), bukan melempar error.
4. Validasi input **WAJIB** sebelum init: `url` tidak boleh kosong; minimal salah satu dari `publishableKey`/`anonKey` harus diisi; lempar `ArgumentError` bila tidak.
5. Inisialisasi **WAJIB** dipanggil sekali di `main()` sebelum `runApp`, dengan konfigurasi dari environment (`String.fromEnvironment`), bukan hardcode.
6. Operasi CRUD generik **WAJIB** memakai `L.i`/`L.w`/`L.e` dengan nilai aktual dan `rethrow` pada `catch (e, s)` dengan `$e $s`.
7. Query `ambil` **WAJIB** mendukung filter (`match`), pengurutan (`order`), dan paginasi (`limit`/`range`); `range` dihitung `offset..offset+limit-1` bila `limit` ada, atau `offset..offset+999` bila tidak.
8. `tambahBatch` **WAJIB** membatalkan operasi bila daftar kosong (log `L.w`) sebelum menyentuh jaringan.
9. Operasi **WAJIB** memakai `Map<String, Object>.from(filter)` saat memanggil `.match(...)` untuk keamanan tipe.
10. Penyediaan instance **WAJIB** lewat `Provider<OperasiSupabase>` (Riverpod) agar mudah di-override pada test.
11. Nama tabel/kolom **WAJIB** memakai konstanta skema (`XxxSkema`) bila tersedia, bukan string literal (lihat skill `konstanta-skema-tabel`).

## Contoh Benar

```dart
class SupabaseKlien {
  SupabaseKlien._internal();
  static final SupabaseKlien instance = SupabaseKlien._internal();

  bool _sudahDiinisialisasi = false;

  SupabaseClient get client {
    if (!_sudahDiinisialisasi) {
      throw StateError(
        'SupabaseKlien belum diinisialisasi. '
        'Panggil SupabaseKlien.instance.inisialisasi() di main() terlebih dahulu.',
      );
    }
    return Supabase.instance.client;
  }

  Future<void> inisialisasi({
    required String url,
    String? publishableKey,
    String? anonKey,
  }) async {
    if (_sudahDiinisialisasi) {
      L.w('SupabaseKlien sudah diinisialisasi; pemanggilan dilewati.');
      return;
    }
    final pk = publishableKey?.trim();
    final ak = anonKey?.trim();
    if (url.trim().isEmpty) {
      throw ArgumentError('url Supabase tidak boleh kosong.');
    }
    if ((pk == null || pk.isEmpty) && (ak == null || ak.isEmpty)) {
      throw ArgumentError(
        'publishableKey atau anonKey Supabase tidak boleh kosong.',
      );
    }
    L.i('Memulai inisialisasi Supabase (url: $url).');
    try {
      await Supabase.initialize(url: url, publishableKey: pk, anonKey: ak);
      _sudahDiinisialisasi = true;
      L.i('Supabase berhasil diinisialisasi.');
    } catch (e, s) {
      L.e('Gagal inisialisasi Supabase: $e $s');
      rethrow;
    }
  }

  bool get sudahDiinisialisasi => _sudahDiinisialisasi;
}
```

```dart
class OperasiSupabase {
  Future<List<Map<String, dynamic>>> ambil(
    String tabel, {
    String select = '*',
    Map<String, dynamic>? filter,
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  }) async {
    L.i('Memulai ambil data dari Supabase tabel: $tabel');
    try {
      final client = SupabaseKlien.instance.client;
      dynamic query = client.from(tabel).select(select);
      if (filter != null && filter.isNotEmpty) {
        query = query.match(Map<String, Object>.from(filter));
      }
      if (orderBy != null && orderBy.trim().isNotEmpty) {
        query = query.order(orderBy, ascending: ascending);
      }
      if (limit != null) query = query.limit(limit);
      if (offset != null) {
        final to = (limit != null) ? offset + limit - 1 : offset + 999;
        query = query.range(offset, to);
      }
      final hasil = await query;
      final list = (hasil as List).cast<Map<String, dynamic>>();
      L.i('Berhasil mengambil ${list.length} data dari Supabase tabel: $tabel');
      return list;
    } catch (e, s) {
      L.e('Gagal ambil data dari Supabase tabel: $tabel Error: $e $s');
      rethrow;
    }
  }

  Future<void> tambahBatch(
    String tabel,
    List<Map<String, dynamic>> daftarData,
  ) async {
    if (daftarData.isEmpty) {
      L.w('Daftar data batch kosong, operasi dibatalkan: $tabel');
      return;
    }
    L.i('Memulai tambahBatch ke Supabase tabel: $tabel total: ${daftarData.length}');
    try {
      final client = SupabaseKlien.instance.client;
      await client.from(tabel).insert(daftarData);
      L.i('Berhasil tambahBatch ke Supabase tabel: $tabel');
    } catch (e, s) {
      L.e('Gagal tambahBatch ke Supabase tabel: $tabel Error: $e $s');
      rethrow;
    }
  }
}

final operasiSupabaseProvider = Provider<OperasiSupabase>((ref) {
  return OperasiSupabase();
});
```

```dart
// main.dart
await SupabaseKlien.instance.inisialisasi(
  url: const String.fromEnvironment('SUPABASE_URL'),
  publishableKey: const String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY'),
);
```

## Contoh Salah

```dart
// DILARANG: getter client mengembalikan null diam-diam
SupabaseClient? get client => _sudahDiinisialisasi ? Supabase.instance.client : null;
```

```dart
// DILARANG: init tanpa validasi / hardcode URL
await Supabase.initialize(url: 'https://xxx.supabase.co', anonKey: 'anon');
```

```dart
// DILARANG: catch tanpa $s / tanpa rethrow
try {
  await client.from(tabel).select();
} catch (e) {
  L.e('Gagal: $e');
}
```

```dart
// DILARANG: tambahBatch tanpa guard kosong
Future<void> tambahBatch(String tabel, List<Map<String, dynamic>> data) async {
  final client = SupabaseKlien.instance.client;
  await client.from(tabel).insert(data); // data kosong tetap dikirim
}
```
