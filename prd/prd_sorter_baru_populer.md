**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek sebelum menentukan kebutuhan fitur.

**Aturan pengisian:**
Isi informasi sesuai kondisi proyek yang sebenarnya; cantumkan platform dan versi target.

**Informasi:**
- Nama aplikasi: `base_coc` (submodule Flutter di dalam repositori `workspace`)
- Deskripsi produk: aplikasi galeri base Clash of Clans lokal-offline — menampilkan katalog layout base (12 entri pada rilis 1.0.0), filter Town Hall/tipe/tag strategi, pencarian, favorit, layar detail dengan salin tautan satu ketuk, dan pelacakan progres upgrade desa (impor Data Export). Tanpa backend; seluruh data katalog dibundel sebagai aset JSON (`assets/data/base_katalog.json`)
- Platform: Android (Flutter); iOS belum diverifikasi untuk basis kode ini
- Versi: `1.0.0+1` (`base_coc/pubspec.yaml`)
- Status pengembangan: katalog lokal + filter + detail + favorit + pelacakan progres sudah berjalan; item ini (C38) belum diimplementasikan

Sumber item fitur: `refrensi_apk.md` baris 1014–1020 (`#### C38. Sorter "Baru / Populer / Pilihan" pada daftar base`); tabel prioritas gabungan baris 1293 (`126 | C38 Sorter Baru/Populer/Pilihan | UI/UX | Membantu menemukan base populer tanpa backend.`).

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menjelaskan hasil yang diharapkan dari PRD ini.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; tujuan harus jelas dan dapat dievaluasi; jangan masukkan tujuan di luar ruang lingkup.

**Isi:**
1. Mendefinisikan sorter daftar base "Terbaru / Terpopuler" yang sepenuhnya lokal (tanpa backend), mengadopsi pola refinement "New, Hot or Top" dari `ClashLy`.
2. Mendefinisikan fondasi penghitung interaksi lokal per base (jumlah buka detail dan jumlah salin tautan) yang dibutuhkan sorter — subset A36 (`refrensi_apk.md` baris 321–327) yang dipindahkan ke ruang lingkup PRD ini atas keputusan diskusi.
3. Menentukan sumber urutan "Terbaru" (urutan entri katalog) tanpa menambah field baru pada data katalog, sesuai keputusan diskusi.
4. Menjamin penanganan eksplisit kegagalan pemuatan statistik (fallback urutan katalog + pencatatan log), bukan kegagalan senyap.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk mendaftarkan fitur yang harus tersedia pada produk.

**Aturan pengisian:**
Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`; setiap fitur wajib mendukung tujuan PRD dan masuk ruang lingkup.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Migrasi skema database 3 → 4 | Tabel baru `statistik_base` di `onCreate` dan `onUpgrade` (cabang `oldVersion < 4`); `versiDatabase` dinaikkan; konstanta nama tabel/kolom baru (snake_case); tanpa menghapus data pengguna | Must Have |
| Penghitung lokal interaksi base | Tabel `statistik_base` menyimpan `jumlah_salin` dan `jumlah_dibuka` per `id_base`; dihitung pada aksi salin tautan sukses dan pembukaan layar detail; gabungan keduanya dipakai sortir Populer | Should Have |
| Chip sortir "Terbaru / Terpopuler" di atas grid | Dua chip single-select di area `FilterChipBar` (bagian atas baris chip), dengan `Icon` pendamping; "Terbaru" aktif secara default; tidak persisten antar sesi aplikasi | Should Have |
| Logika pengurutan daftar base | Mode `terbaru` = urutan entri katalog (tanpa re-sort); mode `terpopuler` = `jumlah_salin + jumlah_dibuka` menurun dengan tie-break stabil mengikuti urutan katalog; base tanpa data statistik diurutkan paling bawah (dianggap 0) | Should Have |
| Fallback ke urutan katalog saat statistik gagal dimuat | Bila pemuatan statistik gagal, grid tetap tampil dengan urutan katalog; kegagalan dicatat lewat logging (`L.e`/`debugPrint`), tidak ditelan senyap | Could Have |

Catatan ruang lingkup: mode "Pilihan" (kurasi manual) **tidak** termasuk; item A36 penuh (indikator popularitas di kartu) **tidak** termasuk — PRD ini hanya bagian penghitungan dan sortir; pemakaian data yang sama untuk badge (C22/C27) menunggu PRD tersendiri.

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menggambarkan perjalanan pengguna saat memakai fitur.

**Aturan pengisian:**
Mulai dari kondisi awal; jelaskan langkah berurutan; sebutkan tindakan pengguna dan respons aplikasi; sertakan percabangan bila ada; jelaskan kondisi akhir; jangan masukkan proses di luar kebutuhan produk.

**Isi:**

Kondisi awal: pengguna membuka layar beranda galeri (`BerandaGaleriScreen`); dua chip sortir ("Terbaru", "Terpopuler") tampil di bagian atas area `FilterChipBar`; chip "Terbaru" terpilih secara default; grid menampilkan urutan entri katalog.

1. Pengguna mengetuk chip "Terpopuler" → chip "Terpopuler" menjadi terpilih (single-select; "Terbaru" batal) → daftar grid tersusun menurun berdasarkan `jumlah_salin + jumlah_dibuka`; base tanpa data statistik tampil paling bawah (tie-break mengikuti urutan katalog).
2. Pengguna mengetuk chip "Terbaru" → chip "Terbaru" terpilih → grid kembali ke urutan entri katalog persis seperti aset JSON.
3. Pengguna mengetuk kartu base → layar detail terbuka → `jumlah_dibuka` base tersebut bertambah satu (dicatat secara asinkron, tidak memblokir navigasi).
4. Pengguna menekan tombol salin tautan pada layar detail dan operasi salin berhasil → `jumlah_salin` base tersebut bertambah satu.
5. Pengguna kembali ke galeri → urutan "Terpopuler" mencerminkan penghitung terbaru (provider statistik di-refresh/dibatalkan otomatis sesuai siklus Riverpod).
6. Pengguna menutup aplikasi dan membukanya kembali → pilihan sortir kembali ke "Terbaru" (tidak persisten).

Percabangan / kondisi alternatif:

- Bila pemuatan statistik gagal (mis. database kosong/korek) → grid tetap tampil dengan urutan katalog; kegagalan dicatat lewat logging; tidak ada dialog/error yang menghalangi pengguna.
- Bila aksi salin gagal → `jumlah_salin` tidak bertambah (hanya salin yang sukses yang dihitung).
- Sortir bukan filter: `reset()` pada filter mengembalikan Town Hall/tipe/tag/kueri dan sortir ke default ("Terbaru"); `hasFilter` tidak menghitung status sortir.

Kondisi akhir: pengguna menemukan base paling sering dipakai (buka + salin) tanpa backend, atau kembali ke urutan katalog; kondisi galeri konsisten dengan data lokal.

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk memberikan langkah implementasi yang dapat dieksekusi.

**Aturan pengisian:**
Langkah spesifik dan tidak ambigu; numbered list; setiap langkah dapat dikerjakan.

**Isi:**

1. Tambah konstanta nama tabel/kolom baru pada berkas model konstanta (mengikuti pola `nama_tabel_tautan.dart`): `NamaTabelStatistik` (`statistik_base`) dan `NamaKolomStatistik` (`id_base`, `jumlah_salin`, `jumlah_dibuka`, `diperbarui`).
2. Migrasi skema SQLite 3 → 4 pada `base_coc/lib/core/database/db_helper.dart`: naikkan `versiDatabase` ke `4`; tambah komentar versi per aturan migrasi (`// Versi 4: tabel statistik_base (penghitung lokal buka/salin).`); buat tabel `statistik_base` di `onCreate` (mencerminkan skema terkini) dan cabang `if (oldVersion < 4)` di `onUpgrade`; nama tabel/kolom selalu lewat konstanta; verifikasi `PRAGMA table_info(statistik_base)` hasil `onCreate` dan chain `onUpgrade`.
3. Buat `StatistikDao` (`base_coc/lib/core/database/statistik_dao.dart`): `catatSalin(String idBase)`, `catatBuka(String idBase)` (upsert: sisip baris baru atau increment kolom masing-masing, plus `diperbarui` waktu lokal ISO 8601), `ambilSemua()` mengembalikan `Map<String, StatistikBase>`; operasi increment memakai transaksi agar tidak ada lost update.
4. Buat model statistik (Freezed opsional, mengikuti konvensi proyek bila model DB diperlukan — minimal record/DTO dengan `fromSqflite`/`toSqflite`) dan provider statistik (`base_coc/lib/fitur/galeri_base/provider/statistik_provider.dart`): Notifier `@Riverpod(keepAlive: true)` pola CRUD (`catatSalin`/`catatBuka` memanggil DAO lalu memperbarui state), serta provider turunan untuk daftar terurut (mis. `FutureProvider`/`Provider<AsyncValue<Map<String, StatistikBase>>>`) yang menangani `isLoading`/`hasError`/`data` secara eksplisit (skill `penanganan-async-data-kosong` Aturan 7; `penanganan-asyncvalue-berkali` bila digabung di `filteredBasesProvider`).
5. Tambah `SortirMode` (enum `terbaru`, `terpopuler`) pada berkas model baru `base_coc/lib/fitur/galeri_base/model/sortir_mode.dart`; tambah field `@Default(SortirMode.terbaru) SortirMode sortir` pada `FilterState` (`filter_state.dart`) — `hasFilter` **tidak** menghitung `sortir`; `reset()` mengembalikan `sortir` ke `SortirMode.terbaru`; jalankan `build_runner` setelah perubahan Freezed.
6. Tambah `setSortir(SortirMode sortir)` pada `FilterNotifier` (`filter_provider.dart`).
7. Ubah `FilterChipBar` (`widget/filter_chip_bar.dart`): tampilkan dua `FilterChip`/`ChoiceChip` "Terbaru" (`Icons.schedule`) dan "Terpopuler" (`Icons.trending_up`) di bagian atas `Row` chip, single-select, label dari enum; `FilterChip` yang terpilih mengikuti `filter.sortir`; `onSelected` memanggil `notifier.setSortir(...)`; turunkan warna/ikon dari `ColorScheme`/`ThemeData` (tanpa hardcode).
8. Ubah `filteredBasesProvider` (`provider/katalog_provider.dart`): gabungkan `katalogProvider`, `filterProvider`, dan provider statistik dengan penanganan status eksplisit; mode `terbaru` mengembalikan urutan katalog apa adanya (setelah filter); mode `terpopuler` mengurutkan berdasarkan `(jumlahSalin + jumlahBuka)` menurun secara stabil (tie-break = urutan katalog); kegagalan statistik → urutan katalog + logging (`L.e` bila tersedia, atau `debugPrint`), bukan kegagalan senyap.
9. Kaitkan pencatatan: `DetailBaseScreen` (`fitur/detail_base/screen/detail_base_screen.dart`) — `initState` memanggil `catatBuka(base.id)` (`unawaited` + `catchError` dengan logging), dan pada `_salinBase` yang sukses memanggil `catatSalin(base.id)` dengan pola sama. Pencatatan tidak memblokir navigasi maupun alur salin.
10. Tambah test: `test/statistik_dao_test.dart` (upsert salin/buka, increment ganda, pembacaan peta) dan `test/sortir_test.dart` (urutan terbaru = katalog; terpopuler menurun; tie-break stabil; fallback statistik gagal) memakai `DatabaseOpener` ffi memori sesuai pola test yang ada.
11. Verifikasi: `dart format`, `dart analyze`, `flutter test`; pastikan `refrensi_apk.md` item C38 ditandai sebagai sudah dibuatkan PRD (pada langkah penulisan PRD ini) dan status tetap `Belum Diimplementasikan` sampai sesi `kerjakan_prd`.

Contoh potongan kode (indikatif; final mengikuti implementasi):

```dart
// filter_state.dart
@freezed
abstract class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    TownHallLevel? townHall,
    TipeBase? tipe,
    @Default(SortirMode.terbaru) SortirMode sortir,
    @Default('') String query,
    @Default(<TagStrategi>{}) Set<TagStrategi> tags,
  }) = _FilterState;

  bool get hasFilter =>
      townHall != null || tipe != null || query.isNotEmpty || tags.isNotEmpty;
}
```

```dart
// filteredBasesProvider (indikatif)
return katalog.when(
  loading: () => const AsyncValue.loading(),
  error: AsyncValue.error,
  data: (bases) {
    final hasil = bases.where(_cocokFilter(filter)).toList(growable: false);
    if (filter.sortir == SortirMode.terpopuler) {
      final statistik = statistikAsync.asData?.value ?? const {};
      if (statistikAsync.hasError) {
        // logging; fallback urutan katalog
        return hasil;
      }
      final indeks = {for (var i = 0; i < hasil.length; i++) hasil[i].id: i};
      final terurut = [...hasil]..sort((a, b) {
        final sa = statistik[a.id];
        final sb = statistik[b.id];
        final ta = (sa?.jumlahSalin ?? 0) + (sa?.jumlahDibuka ?? 0);
        final tb = (sb?.jumlahSalin ?? 0) + (sb?.jumlahDibuka ?? 0);
        final banding = tb.compareTo(ta);
        return banding != 0 ? banding : indeks[a.id]!.compareTo(indeks[b.id]!);
      });
      return terurut;
    }
    return hasil;
  },
);
```

```dart
// Tabel statistik_base (SQL indikatif)
CREATE TABLE IF NOT EXISTS statistik_base (
  id_base TEXT PRIMARY KEY,
  jumlah_salin INTEGER NOT NULL DEFAULT 0,
  jumlah_dibuka INTEGER NOT NULL DEFAULT 0,
  diperbarui TEXT NOT NULL
)
```

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mengetahui berkas yang perlu dibuat atau diubah saat mengimplementasikan PRD.

**Aturan pengisian:**
Periksa struktur proyek sebelum menentukan file terdampak; cantumkan hanya file terkait; jika file belum dapat ditentukan tandai belum diketahui — jangan menebak; perbarui daftar setelah analisis teknis/implementasi.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
|-------------|------------------|---------------------|
| `base_coc/lib/fitur/galeri_base/model/sortir_mode.dart` | Dibuat | Enum `SortirMode` (`terbaru`, `terpopuler`) sebagai satu-satunya nilai yang boleh dipilih chip sortir |
| `base_coc/lib/fitur/galeri_base/model/nama_tabel_statistik.dart` | Dibuat | `NamaTabelStatistik` / `NamaKolomStatistik` (snake_case): `statistik_base`, `id_base`, `jumlah_salin`, `jumlah_dibuka`, `diperbarui` |
| `base_coc/lib/core/database/statistik_dao.dart` | Dibuat | `StatistikDao`: `catatSalin`, `catatBuka` (upsert dalam transaksi), `ambilSemua()` → `Map<String, StatistikBase>` |
| `base_coc/lib/fitur/galeri_base/provider/statistik_provider.dart` | Dibuat | Notifier `@Riverpod(keepAlive: true)` (catatSalin/catatBuka) + provider turunan `AsyncValue<Map<String, StatistikBase>>` dengan penanganan eksplisit |
| `base_coc/lib/core/database/db_helper.dart` | Diubah | `versiDatabase` 3 → 4; `onCreate` membuat `statistik_base`; `onUpgrade` cabang `oldVersion < 4`; komentar versi |
| `base_coc/lib/fitur/galeri_base/model/filter_state.dart` | Diubah | Tambah `@Default(SortirMode.terbaru) SortirMode sortir`; `hasFilter` tidak menghitung `sortir`; `reset()` mengembalikan `sortir` ke default; perlu `build_runner` (Freezed) |
| `base_coc/lib/fitur/galeri_base/provider/filter_provider.dart` | Diubah | Tambah `setSortir(SortirMode sortir)` pada `FilterNotifier` |
| `base_coc/lib/fitur/galeri_base/widget/filter_chip_bar.dart` | Diubah | Dua chip sortir "Terbaru"/"Terpopuler" di bagian atas baris chip (single-select, `ColorScheme`) |
| `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart` | Diubah | `filteredBasesProvider` menerapkan pengurutan terbaru/terpopuler (stabil, tie-break katalog) dengan penanganan `AsyncValue` eksplisit dan fallback katalog + logging saat statistik gagal |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | `initState` mencatat `catatBuka`; aksi salin sukses mencatat `catatSalin` (`unawaited` + `catchError`) |
| `base_coc/test/statistik_dao_test.dart` | Dibuat | Test DAO: upsert, increment ganda, pemetaan pembacaan |
| `base_coc/test/sortir_test.dart` | Dibuat | Test logika sortir: terbaru = katalog; terpopuler menurun; tie-break stabil; fallback saat statistik gagal |
| `refrensi_apk.md` | Diubah | Item C38 ditandai sudah dibuatkan PRD (`prd/prd_sorter_baru_populer.md`, sesi 163); belum diimplementasikan |

Tidak ada irisan berkas dengan PRD lain (folder `prd/` kosong saat PRD ini disusun, 2026-11-15 WIB / 2026-11-15 UTC ~20:40); item A36 (indikator popularitas penuh) dan badge popularitas (C22/C27) di luar cakupan.
