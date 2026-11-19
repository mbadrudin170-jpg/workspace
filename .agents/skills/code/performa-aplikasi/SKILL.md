---
name: performa-aplikasi
description: "Trigger: saat mengoptimasi performa aplikasi | Aturan performa Flutter: rebuild minimal, const constructor, builder list (lazy), lazy IndexedStack tab BottomNavigationBar (termasuk AutomaticKeepAliveClientMixin di IndexedStack), image caching, async gap yielding, memory leak, query DB optimization, profiling."
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Wed Nov 18 2026 21:43 WIB"
---

# Aturan Performa Aplikasi

Skill ini mendokumentasikan aturan performa yang wajib diterapkan di proyek ini.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `ListView`, `GridView`, `Image`, `CachedNetworkImage`, `Opacity`, `ClipRect`, `ClipRRect`, `Stack`, `Positioned`, `Timer`, `StreamSubscription`, `AnimationController`, `TextEditingController`, `ScrollController`), `package:flutter_riverpod` (class `ref`, `AsyncValue`, `select`), `package:compute` (fungsi `compute`)
- Class: `ListView`, `GridView`, `Image`, `CachedNetworkImage`, `Timer`, `StreamSubscription`, `AnimationController`, `TextEditingController`, `ScrollController`, `AsyncValue`
- Method: `ref.watch(provider.select(...))`, `compute()`, `Future.microtask()`, `SchedulerBinding.instance.scheduleTask()`, `timer.cancel()`, `subscription.cancel()`, `controller.dispose()`
- Properti: `mounted`, `itemExtent`, `prototypeItem`, `cacheWidth`, `cacheHeight`, `memCacheWidth`, `memCacheHeight`

## Aturan

1. Wajib gunakan `const` constructor dimana mungkin (widget stateless, immutable data).
2. Wajib isolasi widget yang rebuild sering (Timer, Animation) ke widget terpisah (lihat `isolasi-widget-timer`).
3. Wajib gunakan `ref.watch(provider.select(...))` untuk hanya rebuild saat field tertentu berubah (lihat `riverpod-pola`).
4. DILARANG `setState` di widget parent besar untuk update kecil → extract ke child widget.
5. Wajib gunakan `ListView.builder` / `GridView.builder` untuk daftar panjang/dinamis.
6. DILARANG `ListView(children: [...])` dengan list sudah di-materialize semua.
7. Gunakan `itemExtent` / `prototypeItem` untuk performa scroll lebih baik.
8. Wajib gunakan `Image.asset` / `Image.network` dengan `cacheWidth`/`cacheHeight` untuk downsample.
9. DILARANG load image resolusi besar ke widget kecil tanpa downsample.
10. Network image: pakai `cached_network_image` package untuk disk cache.
11. Operasi berat (parse JSON besar, hitung statistik, query DB kompleks) wajib offload ke `compute()` / `Isolate` atau gunakan `Future.microtask` / `SchedulerBinding.instance.scheduleTask` untuk yield ke event loop.
12. DILARANG blocking computation di main thread > 16ms (frame drop).
13. Wajib `cancel()` Timer/StreamSubscription di `dispose()` (lihat `isolasi-widget-timer`).
14. Wajib `dispose()` `AnimationController`, `TextEditingController`, `ScrollController`.
15. Wajib cek `mounted` sebelum `setState` di async callback (lihat `isolasi-widget-timer`).
16. Wajib `ref.listen` / `ref.listenManual` cleanup di `dispose` kalau pakai manual listen.
17. DILARANG closure capture `BuildContext` di async gap lama.
18. Wajib `const` untuk widget, list, map, object yang immutable.
19. Wajib `final` untuk variable yang tidak di-reassign.
20. Wajib `const` di `switch` expression / pattern matching case.
21. Wajib `where` + `whereArgs` (parameterized query) - bukan string interpolation.
22. Wajib index di kolom yang sering di-query (WHERE, JOIN, ORDER BY).
23. Wajib `LIMIT` untuk query yang tidak butuh semua row.
24. Gunakan `queryCursor` / `queryIterate` untuk result set besar (streaming).
25. Wajib `--split-debug-info` / `--obfuscate` di release build (CI handle).
26. DILARANG dependency tidak dipakai (cek `dart pub deps --style=compact`).
27. DILARANG asset image tidak dipakai di `pubspec.yaml`.
28. Gunakan `flutter build apk --analyze-size` untuk audit ukuran.
29. Wajib test performa di device fisik (low-end) bukan hanya emulator.
30. Gunakan `flutter run --profile` + DevTools (Performance, Memory, CPU tabs).
31. Target: 60fps (16ms/frame), no jank > 50ms, memory stabil tidak naik terus.
32. Wajib lazy loading untuk tab BottomNavigationBar yang berat: simpan penanda tab yang sudah pernah dibuka (mis. `Set<int>`, default tab pertama), bangun tab hanya saat pertama kali dibuka, dan render dengan `IndexedStack` + placeholder `SizedBox.shrink()` untuk tab yang belum pernah dibuka.
33. Anak IndexedStack yang sudah dibangun wajib `SizedBox.expand` (Stack memberi loose constraints ke anak); placeholder `SizedBox.shrink()` membuat tab yang belum dibuka nol biaya layout.
34. Anak `IndexedStack`/tab yang state-nya ingin dipertahankan saat tab disembunyikan wajib memakai `AutomaticKeepAliveClientMixin` dengan getter `wantKeepAlive => true`, dan `build()` wajib memanggil `super.build(context)` — tanpa pemanggilan itu, keep-alive tidak terdaftar dan analyzer menandai `must_call_super`. Jika keep-alive tidak diperlukan, mixin wajib dihapus sepenuhnya (bukan dibiarkan tanpa `super.build(context)`); tab yang selalu dibangun di `IndexedStack` (subtree tidak di-unmount) tidak wajib mixin.

## Larangan

- DILARANG `setState` di widget parent besar untuk update kecil.
- DILARANG `ListView(children: [...])` dengan list sudah di-materialize semua.
- DILARANG load image resolusi besar ke widget kecil tanpa downsample.
- DILARANG blocking computation di main thread > 16ms.
- DILARANG closure capture `BuildContext` di async gap lama.
- DILARANG `Opacity` widget wrapping subtree besar (gunakan `color.withValues(alpha:)` di child).
- DILARANG `ClipRect` / `ClipRRect` tanpa butuh (costly).
- DILARANG `Stack` dengan banyak `Positioned` overlapping kompleks (pertimbangkan `CustomPainter`).
- DILARANG `ListView` nested tanpa `shrinkWrap: true` + `physics: NeverScrollableScrollPhysics()`.
- DILARANG `setState` di loop / callback cepat tanpa debounce.
- DILARANG dependency tidak dipakai.
- DILARANG asset image tidak dipakai di `pubspec.yaml`.

## Contoh Benar

```dart
// BENAR: const widget stateless
const _EmptyDiaryCraving();

// BENAR: select hanya field yang butuh
final nama = ref.watch(biodataProvider.select((v) => v.valueOrNull?.nama));

// BENAR: ListView.builder lazy
ListView.builder(
  itemCount: list.length,
  itemBuilder: (context, index) => ItemWidget(item: list[index]),
)

// BENAR: itemExtent untuk fixed height
ListView.builder(
  itemCount: list.length,
  itemExtent: 80,
  itemBuilder: (context, index) => ItemWidget(item: list[index]),
)

// BENAR: Downsample asset image
Image.asset(
  'assets/large_image.png',
  cacheWidth: 200,
  cacheHeight: 200,
)

// BENAR: Network dengan cache
CachedNetworkImage(
  imageUrl: url,
  memCacheWidth: 200,
  memCacheHeight: 200,
  placeholder: (_, _) => const CircularProgressIndicator(),
)

// BENAR: Offload ke isolate
final data = await compute(parseJsonBesar, jsonString);

// BENAR: Cleanup di dispose
@override
void dispose() {
  _timer?.cancel();
  _controller.dispose();
  _subscription.cancel();
  super.dispose();
}

// BENAR: Mounted check
_timer = Timer.periodic(Duration(seconds: 1), (_) {
  if (mounted) setState(() {});
});

// BENAR: Parameterized query + index + limit
final rows = await db.query(
  NamaTabel.craving,
  where: '${NamaKolom.tanggal} >= ? AND ${NamaKolom.tanggal} <= ?',
  whereArgs: [start.toIso8601String(), end.toIso8601String()],
  orderBy: '${NamaKolom.tanggal} DESC',
  limit: 50,
)

// BENAR: Lazy + keep-alive IndexedStack (bottom navigation)
int _selectedIndex = 0;
final Set<int> _tabDibangun = <int>{0};

void _onItemTapped(int index) {
  setState(() {
    _tabDibangun.add(index);
    _selectedIndex = index;
  });
}

// body:
IndexedStack(
  index: _selectedIndex,
  children: <Widget>[
    for (var i = 0; i < _widgetOptions.length; i++)
      _tabDibangun.contains(i)
          ? SizedBox.expand(child: _widgetOptions[i])
          : const SizedBox.shrink(),
  ],
)

// BENAR: anak IndexedStack yang keep-alive
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin<MyTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // wajib: mendaftarkan keep-alive
    return const Placeholder();
  }
}
```

## Contoh Salah

```dart
// DILARANG: Watch full provider cuma butuh nama
final biodata = ref.watch(biodataProvider); // Rebuild saat field lain berubah

// DILARANG: ListView children materialized semua
ListView(children: list.map((e) => ItemWidget(item: e)).toList())

// DILARANG: Blocking computation di main thread
final data = parseJsonBesar(jsonString); // Bisa frame drop

// DILARANG: Opacity wrapping subtree besar
Opacity(
  opacity: 0.5,
  child: LargeWidgetTree(), // DILARANG
)

// DILARANG: SetState di loop
for (final item in items) {
  setState(() {}); // DILARANG tanpa debounce
}

// DILARANG: semua tab dibangun eager padahal tab berat
body: IndexedStack(index: _selectedIndex, children: _widgetOptions),

// DILARANG: elementAt jika state tab wajib terjaga
// (state tab hilang setiap pindah tab)
body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

// DILARANG: mixin tanpa super.build(context)
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin<MyTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) => const Placeholder();
}
// analyzer: 'must_call_super'; keep-alive tidak pernah terdaftar
```
