# Kelompok 5

## file terdampak

- (detail_base_screen.dart)[base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart]

## Tinggi

#### Task 10

- Status : kerjakan
- Masalah : Commit `207aa5d` menambahkan konsumsi cache provider turunan `ref.watch(baseSerupaProvider(widget.base)).asData?.value` di `_DetailBaseScreenState.build`. Kegagalan load section "Base Serupa" ditelan senyap: tanpa pesan error, tanpa retry, tanpa logging apa pun; section langsung disembunyikan. `baseSerupaProvider` adalah provider sinkron turunan `Provider.family<AsyncValue<List<BaseLayout>>, BaseLayout>` yang eksplisit disebut sebagai cakupan cache provider pada aturan terkait.
- Solusi : Tangani status secara eksplisit di titik konsumsi, mis.:
  ```dart
  final serupaAsync = ref.watch(baseSerupaProvider(widget.base));
  if (serupaAsync.hasError) {
    debugPrint('DetailBaseScreen: gagal memuat base serupa: ${serupaAsync.error}');
  }
  final kandidatSerupa = serupaAsync.asData?.value ?? const <BaseLayout>[];
  ```
  Karena section ini opsional (disembunyikan sadar saat gagal), minimal wajib logging (`L.w`/`L.e`; di `base_coc` tidak ada logger `L` sehingga `debugPrint` dipakai); konten utama layar dilarang memakai `.asData?.value` sama sekali. Section tetap disembunyikan bila kosong.
- aturan dilanggar : (penanganan-async-data-kosong)[.agents/skills/custom/penanganan-async-data-kosong/SKILL.md] Aturan 7 dan Larangan ("DILARANG menelan kegagalan cache provider secara senyap: `.asData?.value`/`valueOrNull` tanpa pesan error, tanpa retry, dan tanpa logging"); rujukan `base_serupa_provider.dart` sebagai provider turunan
- file bermasalah : (detail_base_screen.dart)[base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart]
- prompt : hanya diisi oleh saya

# Kelompok 6

## file terdampak

- (tautan_status_dao.dart)[base_coc/lib/core/database/tautan_status_dao.dart]

## Rendah

#### Task 11

- Status : kerjakan
- Masalah : Commit `db65ac2` menambahkan model database `TautanStatus` (tabel `tautan_status`) yang hanya menyediakan factory `fromSqflite`; method `toSqflite()` tidak ada. Aturan terkait mewajibkan model database menyediakan factory `fromSqflite(Map<String, Object?> row)` dan method `toSqflite()` untuk konversi ke/dari SQLite. (Field `jumlahLaporan`/`terakhirDilaporkan`/`diperbarui` dibaca via `ParserUtil` — sudah sesuai; celah hanya `toSqflite()`.)
- Solusi : Tambahkan `Map<String, Object?> toSqflite()` pada `TautanStatus` yang memetakan `idBase`, `jumlahLaporan`, `terakhirDilaporkan`, `diperbarui` ke konstanta `NamaKolomTautan` (snake_case); parsing/konversi mengikuti pola `fromSqflite` yang sudah ada; atau hapus `TautanStatus` bila diputuskan insert selalu memakai map literal di DAO (keputusan pengguna).
- aturan dilanggar : (model-state-freezed-abstract)[.agents/skills/custom/model-state-freezed-abstract/SKILL.md] Aturan 7
- file bermasalah : (tautan_status_dao.dart)[base_coc/lib/core/database/tautan_status_dao.dart]
- prompt : hanya diisi oleh saya
