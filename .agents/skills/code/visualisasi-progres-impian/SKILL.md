---
name: visualisasi-progres-impian
description: "Trigger: saat memvisualisasikan progres impian atau perayaan | Panduan ImpianProgresHelper, guard divisi nol, SharedPreferences penandaan sekali, AppToast, saldo aktual via MetrikBerhentiHelper, clamp 0-1, VisualTabunganImpian."
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Visualisasi Progres Impian dan Perayaan Pencapaian

Helper murni untuk rasio/sisa/tercapai, guard divisi nol, SharedPreferences penandaan perayaan, AppToast, saldo aktual (fallback estimasi baseline dari biodata) via `MetrikBerhentiHelper`, widget bawaan, clamp rasio.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `LinearProgressIndicator`, `Stack`, `FractionallySizedBox`, `Container`, `Icon`, `Text`, `ListTile`, `ListView`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:share_global_saya` (class `SharedPrefService`, `AppToast`)
- Class: `ImpianProgresHelper`, `VisualTabunganImpian`, `SharedPrefService`, `AppToast`, `LinearProgressIndicator`
- Method: `ImpianProgresHelper.rasio()`, `ImpianProgresHelper.tercapai()`, `ImpianProgresHelper.sisa()`, `SharedPrefService.getStringList()`, `SharedPrefService.setStringList()`, `AppToast.sukses()`, `unawaited()`

## Aturan

1. Perhitungan progres (rasio, sisa, tercapai) diekstrak ke helper murni (class static, private constructor, no BuildContext/provider).
2. Helper wajib guard divisi nol (target <= 0 → return 0.0/false).
3. Penandaan impian diraikan (perayaan sekali) disimpan di `SharedPrefService` (`impian_diraikan`), bukan variabel memori (wajib `SharedPrefService.init()` di `main()` sebelum dipakai).
4. Impian baru tercapai → `AppToast.sukses` perayaan, penandaan via `unawaited()` non-blocking.
5. Layar progres impian wajib watch `biodataProvider` untuk saldo, bukan `totalJumlah` dari `ImpianState`. Saldo wajib: metrik **aktual** (`MetrikBerhentiHelper.hitungUangDihematAktual`) bila ada catatan konsumsi, **fallback estimasi baseline** (`hitungUangDihematEstimasi`) bila belum ada — mis. `final saldo = pakaiAktual ? uangDihematAktual : uangDihematEstimasi;` dengan `pakaiAktual = MetrikBerhentiHelper.hitungJumlahHariTercatat(konsumsiList) > 0`. Saat saldo fallback estimasi, beri label "estimasi" di UI.
6. Widget visual (`VisualTabunganImpian`) pakai komponen bawaan (Stack, LinearProgressIndicator, Icon), no aset baru.
7. Rasio clamp 0.0–1.0 sebelum ke `LinearProgressIndicator`.

## Larangan

- Jangan hitung rasio/sisa/tercapai inline di layar dengan formula berbeda.
- Jangan pakai `totalJumlah` `ImpianState` sebagai saldo; pakai metrik aktual (fallback estimasi) via `MetrikBerhentiHelper`.
- Jangan toast perayaan berulang untuk impian sama (pakai SharedPreferences penandaan).
- Jangan tambah aset gambar/Lottie untuk visual progres.

## Contoh Benar

```dart
// Helper murni tanpa BuildContext/provider
class ImpianProgresHelper {
  const ImpianProgresHelper._();
  static double rasio(double saldo, double target) {
    if (target <= 0) return 0.0; // Guard divisi nol
    return (saldo / target).clamp(0.0, 1.0);
  }
  static bool tercapai(double saldo, double target) {
    if (target <= 0) return false;
    return saldo >= target;
  }
}

// Layar progres: saldo aktual (fallback estimasi), bukan totalJumlah
class ImpianScreenBenar extends ConsumerWidget {
  @override Widget build(BuildContext context, WidgetRef ref) {
    final impianState = ref.watch(impianProvider).requireValue;
    final biodataAsync = ref.watch(biodataProvider);
    final biodata = biodataAsync.asData?.value;
    final konsumsiList = ref.watch(konsumsiRokokProvider).asData?.value.listKonsumsi ?? const [];
    final pakaiAktual = biodata != null && MetrikBerhentiHelper.hitungJumlahHariTercatat(konsumsiList) > 0;
    final saldo = biodata == null
        ? 0.0
        : pakaiAktual
            ? MetrikBerhentiHelper.hitungUangDihematAktual(biodata, konsumsiList)
            : MetrikBerhentiHelper.hitungUangDihematEstimasi(biodata);

    return ListView.builder(itemCount: impianState.list.length, itemBuilder: (_, i) {
      final item = impianState.list[i];
      final rasio = ImpianProgresHelper.rasio(saldo, item.jumlah);
      final tercapai = ImpianProgresHelper.tercapai(saldo, item.jumlah);

      if (tercapai) {
        unawaited(_tandaiDanRaiikan(context, item.id, item.nama));
      }

      return ListTile(
        title: Text(item.nama),
        subtitle: LinearProgressIndicator(value: rasio),
        trailing: tercapai ? const Icon(Icons.celebration, color: Colors.amber) : null,
      );
    });
  }

  Future<void> _tandaiDanRaiikan(BuildContext context, String id, String nama) async {
    // SharedPrefService.init() wajib di main() sebelum dipakai
    final daftar = await SharedPrefService.getStringList('impian_diraikan') ?? <String>[];
    if (!daftar.contains(id)) {
      daftar.add(id);
      await SharedPrefService.setStringList('impian_diraikan', daftar);
      AppToast.sukses(context, 'Selamat! Impian "$nama" telah tercapai!');
    }
  }
}
```

## Contoh Salah

```dart
// DILARANG: Hitung inline di layar dengan formula berbeda
final rasio = uangDihemat <= 0 || item.jumlah <= 0 ? 0 : (uangDihemat / item.jumlah).clamp(0.0, 1.0);

// DILARANG: Pakai totalJumlah sebagai saldo (bukan uangDihemat)
final rasio2 = impianState.totalJumlah <= 0 ? 0 : (impianState.totalJumlah / item.jumlah).clamp(0.0, 1.0);

// DILARANG: Helper tanpa guard divisi nol
class ImpianProgresHelperSalah {
  static double rasio(double saldo, double target) => saldo / target;
}

// DILARANG: Toast berulang tanpa penandaan SharedPreferences
AppToast.sukses(context, 'Tercapai!'); // Muncul setiap build
```
