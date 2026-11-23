---
name: aturan-penamaan
description: "Trigger: saat membuat atau memperbarui model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) atau skema tabel | Panduan pola XxxSkema: abstract final class terpisah berisi static const String tabel dan konstanta kolom, interpolasi ${XxxSkema.*} di DDL/query/migrasi, nilai konstanta kolom cocok persis nama kolom DB, hindari kolisi dengan kolom bernama 'tabel'. Konstanta Skema Tabel untuk Model Database Setiap model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) wajib mendefinisikan konstanta nama tabel dan kolom melalui kelas `XxxSkema` terpisah, lalu memakainya (interpolasi) di DDL, query, dan migrasi - bukan string literal. Aturan 1. Untuk setiap model terkait database, buat `abstract final class <Model>Skema` di berkas model yang sama (terpisah dari model, agar tidak konflik `conflicting_static_and_instance` pada field dengan nama sama). 2. Kelas `XxxSkema` wajib memuat `static const String tabel = '<nama_tabel>'` dan satu `static const String <field> = '<nama_kolom>'` u"
---

# Konstanta Skema Tabel untuk Model Database

Setiap model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) wajib mendefinisikan konstanta nama tabel dan kolom melalui kelas `XxxSkema` terpisah, lalu memakainya (interpolasi) di DDL, query, dan migrasi - bukan string literal.

## Aturan

1. Untuk setiap model terkait database, buat `abstract final class <Model>Skema` di berkas model yang sama (terpisah dari model, agar tidak konflik `conflicting_static_and_instance` pada field dengan nama sama).
2. Kelas `XxxSkema` wajib memuat `static const String tabel = '<nama_tabel>'` dan satu `static const String <field> = '<nama_kolom>'` untuk setiap kolom.
3. Nama konstanta field menggunakan camelCase (sesuai identifier Dart); nilainya wajib cocok persis (case-sensitive) dengan nama kolom aktual pada skema/migrasi/query.
4. Semua referensi nama tabel/kolom di DDL (`CREATE TABLE`), query (`SELECT/INSERT/...`), dan migrasi (`ALTER TABLE`, `CREATE INDEX`) wajib menggunakan interpolasi `${XxxSkema.*}`.
5. Jika ada kolom bernama `tabel`, gunakan identifier berbeda (mis. `namaTabel`) untuk konstanta kolom tersebut agar tidak kolisi dengan konstanta nama tabel.
6. Kelas Skema tidak boleh diedit bersama berkas hasil generate; perubahan sumber lalu build_runner bila model Freezed.
7. Seluruh key database pada method `fromSqlite`/`toSqlite` (serta `fromFirebase`/`toFirebase`) wajib memakai interpolasi `${XxxSkema.*}` sebagai key map - DILARANG string literal nama kolom di method from/to.
8. Nama field Firestore wajib sama persis dengan kolom SQLite (umumnya snake_case); TIDAK ADA konstanta khusus Firestore dengan nama berbeda - pakai konstanta Skema yang sama.

## Larangan

- Jangan menggunakan string literal nama tabel/kolom di kode database.
- DILARANG string literal nama kolom sebagai key map pada method from/to (fromSqlite/fromFirebase/toSqlite/toFirebase); wajib interpolasi `${XxxSkema.*}`.
- DILARANG membuat konstanta khusus Firestore dengan nama berbeda dari kolom SQLite; samakan nama field Firestore dengan kolom SQLite.
- Jangan menempatkan konstanta Skema di dalam kelas model (konflik static/instance).
- Jangan menamai kolom konstan dengan kata "kolom" (ikuti skill `aturan-penamaan` untuk nilai).

## Contoh Benar

```dart
abstract final class DompetSkema {
  static const String tabel = 'dompet';
  static const String id = 'id';
  static const String namaDompet = 'namaDompet';
  static const String saldo = 'saldo';
}

final String _tabelDompet = '''
  CREATE TABLE ${DompetSkema.tabel}(
    ${DompetSkema.id} TEXT PRIMARY KEY,
    ${DompetSkema.namaDompet} TEXT NOT NULL,
    ${DompetSkema.saldo} REAL NOT NULL
  )
''';
```
