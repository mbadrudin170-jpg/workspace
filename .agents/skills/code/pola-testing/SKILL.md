---
name: pola-testing
description: "Trigger: saat menulis test | Pola testing standar: package:test untuk unit test, WidgetTester untuk widget test, integration test, mocktail mock manual (tanpa codegen), dummy data, build_runner."
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Tue Nov 17 2026 11:52 WIB"
---

# Pola Testing Standar

Skill ini mendokumentasikan pola testing yang wajib diterapkan di proyek ini.

## 1. Unit Test (package:test)

### Aturan

- File test diletakkan flat di `test/*_test.dart` (bukan di subfolder).
- Gunakan `package:test` dengan `test()`, `group()`, `setUp()`, `tearDown()`.
- Test fungsi murni, helper, extension, logic bisnis (bukan widget).
- Nama test: `should <expected behavior> when <condition>`.

```dart
// test/biodata_perhitungan_test.dart
import 'package:test/test.dart';
import 'package:berhenti_merokok/fitur/biodata/model/biodata_model.dart';

void main() {
  group('BiodataModelPerhitungan', () {
    test('should return 0 hariBerhenti when tanggalMulaiBerhentiMerokok is null', () {
      const model = BiodataModel(nama: 'Test', tanggalMulaiBerhentiMerokok: null);
      expect(model.hariBerhenti, 0);
    });

    test('should calculate hariBerhenti correctly', () {
      final tanggal = DateTime.now().subtract(const Duration(days: 5));
      final model = BiodataModel(nama: 'Test', tanggalMulaiBerhentiMerokok: tanggal);
      expect(model.hariBerhenti, 5);
    });
  });
}
```

### Referensi

- `dart-add-unit-test` skill untuk detail

## 2. Widget Test (WidgetTester)

### Aturan

- Gunakan `WidgetTester` dari `package:flutter_test`.
- Test rendering, tap, scroll, input text, navigasi.
- Bungkus widget dengan `ProviderScope` + `MaterialApp` + override provider.
- Gunakan `pumpWidget()`, `pumpAndSettle()`, `tap()`, `enterText()`.

```dart
// test/biodata_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:berhenti_merokok/app.dart';
import 'package:berhenti_merokok/fitur/biodata/dummy_data/biodata_dummy.dart';

void main() {
  testWidgets('should show biodata form when biodata is null', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [biodataProvider.overrideWithValue(AsyncValue.data(null))],
        child: const MaterialApp(home: BiodataScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Isi Biodata'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });
}
```

### Referensi

- `flutter-add-widget-test` skill untuk detail

## 3. Integration Test

### Aturan

- Gunakan `integration_test` package.
- Test flow utuh: onboarding → home → fitur spesifik.
- Hanya jalan di device/emulator (bukan web-only).
- File di `integration_test/` (bukan `test/`).

```dart
// integration_test/app_flow_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:berhenti_merokok/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('complete onboarding flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Isi biodata
    await tester.enterText(find.byKey(Key('namaField')), 'Test User');
    await tester.tap(find.byKey(Key('simpanBtn')));
    await tester.pumpAndSettle();

    // Verify home screen
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
```

### Referensi

- `flutter-add-integration-test` skill untuk detail

## 4. Mocktail Mock Manual (tanpa codegen)

### Aturan

- Jika kode bergantung pada repository/service eksternal, **WAJIB** gunakan `package:mocktail` dengan kelas mock manual `class MockX extends Mock implements X {}`; jangan lewati hanya karena override provider.
- **JANGAN** gunakan mockito (`@GenerateMocks` + build_runner) untuk proyek ini; mocktail tidak memerlukan codegen.
- `package:mocktail` wajib tercantum pada `dev_dependencies` (`mocktail: ^1.0.5` per 2026-11-16) sebelum file mock dibuat; tambahkan memakai skill `pengurutan-paket-pubspec` bila belum ada.
- Mock repository/service, **BUKAN** Notifier/Provider (override provider langsung melalui `ProviderScope`/`ProviderContainer`).
- `class MockX extends Mock implements X {}` ditulis di `test/mocks.dart` (bukan di file `*_test.dart`); `test/mocks.dart` bukan file test sehingga tidak dijalankan langsung oleh `flutter test`.
- Dummy data dari `lib/fitur/*/dummy_data/`.
- Stub dengan `when(() => mock.metode()).thenAnswer(...)`/`thenReturn(...)`; `registerFallbackValue` untuk tipe non-nullable custom bila diperlukan; `verify(() => mock.metode())` dan `verifyNever(...)` untuk verifikasi interaksi.

```dart
// test/mocks.dart
import 'package:mocktail/mocktail.dart';

// Sesuaikan X dengan tipe repository/service yang di-mock.
class MockX extends Mock implements X {}
```

Implementasi nyata `test/mocks.dart` di `share_global_saya` (pola dari commit `e43255b`):

```dart
// Template mock manual memakai `package:mocktail` (tanpa codegen).
// Berkas ini BUKAN file test (bukan `*_test.dart`) sehingga tidak dijalankan
// oleh `flutter test`; import dari file test dengan `import 'mocks.dart';`.
//
// Cara pakai:
//   1. Pastikan `mocktail` ada di `dev_dependencies`.
//   2. Buat kelas mock manual untuk repository/service yang ingin di-mock:
//
//        import 'package:mocktail/mocktail.dart';
//
//        class MockXxx extends Mock implements Xxx {}
//
//   3. Stub dengan `when(() => mock.metode()).thenAnswer((_) async => ...);`
//      dan verifikasi dengan `verify(() => mock.metode()).called(1);`.
//
// Catatan: kelas dengan hanya static method (mis. `SharedPrefService`,
// `ParserUtil`, `L`) TIDAK bisa di-mock dengan mocktail; abstraksikan ke
// kelas/instance eksternal bila perlu di-mock.
```

```dart
// test/contoh_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  test('repository dipanggil dengan argumen yang benar', () async {
    final mock = MockX();
    when(() => mock.ambilSemua()).thenAnswer((_) async => <Item>[]);

    final hasil = await panggilAlur(mock);

    expect(hasil, isEmpty);
    verify(() => mock.ambilSemua()).called(1);
  });
}
```

### Checklist

- [ ] `mocktail` tercantum di `dev_dependencies` submodule yang bersangkutan.
- [ ] Kelas mock manual ada di `test/mocks.dart`, bukan di dalam `*_test.dart`.
- [ ] Tidak ada import `package:mockito` maupun `@GenerateMocks`.
- [ ] Notifier/Provider di-override langsung, tidak di-mock.
- [ ] Stub default ditetapkan (`when`) agar tidak ada `NoSuchMethodError` dari pemanggilan tak ter-stub.

### Referensi

- `hasil_diskusi/diskusi_5.md` (K-5, R-1; sesi 158)
- `package:mocktail` (https://pub.dev/packages/mocktail)

## 5. Test Organization & Dummy Data

### Aturan

- Dummy data di `lib/fitur/<fitur>/dummy_data/` (bukan di test/).
- Import dummy data di test: `import 'package:berhenti_merokok/fitur/biodata/dummy_data/biodata_dummy.dart';`
- Satu file test per unit/widget yang diuji.
- Group test by fitur/class.

## 6. Build Runner untuk Codegen

### Aturan

- **WAJIB** jalankan `dart run build_runner build --delete-conflicting-outputs` setelah:
  - Ubah model Freezed (`.freezed.dart`)
  - Ubah Riverpod Notifier (`.g.dart`)
- Jangan edit file `.g.dart` / `.freezed.dart` manual.
- CI akan jalanin build_runner otomatis.

```bash
# Local development
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto rebuild)
dart run build_runner watch --delete-conflicting-outputs
```

### Referensi Commit

- `3b67d309` — Freezed models + Riverpod generator

## 7. Coverage

### Aturan

- Target coverage minimal 80% untuk logic bisnis.
- Gunakan `flutter test --coverage` lalu `genhtml coverage/lcov.info -o coverage/html`.
- Exclude generated files, main.dart, dummy data dari coverage.

### Referensi

- `dart-collect-coverage` skill untuk detail

## 8. Static Analysis

### Aturan

- **WAJIB** `flutter analyze` clean (no warnings/errors) sebelum commit.
- Jalankan `dart fix --apply` untuk fix otomatis lint mechanical.
- Config di `analysis_options.yaml`.

```bash
flutter analyze
dart fix --apply
```

### Referensi

- `dart-run-static-analysis` skill untuk detail

## 9. Larangan Testing

- **DILARANG** test logic di widget test (pisahkan ke unit test).
- **DILARANG** `pumpWidget` tanpa `ProviderScope` + override.
- **DILARANG** mock Notifier/Provider → override provider.
- **DILARANG** test bergantung urutan (gunakan `setUp`/`tearDown`).
- **DILARANG** hardcode delay (`await Future.delayed`) → gunakan `pumpAndSettle`.
- **DILARANG** import `package:mockito` / `@GenerateMocks` (proyek ini memakai mocktail; lihat bagian 4).

## Referensi Aturan Sumber

- `aturan_bersama.md` — Tests flat di test/, web only, build APK CI only
- `flutter-add-widget-test` skill
- `flutter-add-integration-test` skill
- `dart-add-unit-test` skill
- `dart-collect-coverage` skill
- `dart-run-static-analysis` skill
- `hasil_diskusi/diskusi_5.md` (K-5, R-1; sesi 158) — mocktail menggantikan mockito; `dart-generate-test-mocks` (mockito) tidak diikuti untuk proyek ini
- Commit `share_global_saya` `e43255bd56b4eaba6b7629d749582be96dcd2527` (`test/mocks.dart` template mock manual mocktail, `mocktail: ^1.0.5` pada `dev_dependencies`, `pubspec.lock` diperbarui)
