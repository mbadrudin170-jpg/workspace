**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek sebelum membaca spesifikasi fitur.

**Aturan pengisian:**
Isi setiap atribut berdasarkan kondisi proyek yang sebenarnya; jangan mengarang informasi yang belum diketahui — tulis secara eksplisit (mis. `Belum diketahui`).

**Informasi:**
- Nama aplikasi: `base_coc`
- Deskripsi produk: aplikasi Flutter penyedia base/layout Clash of Clans; katalog lokal offline, galeri terfilter, detail base dengan pratinjau dan salin tautan, pelacakan progres upgrade desa, favorit, tag strategi base, berbagi base (A7), dan panduan singkat per base (A8, implementasi tercatat di `base_coc` HEAD `149fe81`; status PRD A8 masih `Sedang Diimplementasikan` per `prd/prd_panduan_singkat_base.md`).
- Platform: Android (utama); struktur Flutter menyiapkan Android, iOS, Web, Linux, macOS, dan Windows
- Versi: `1.0.0+1`
- Status pengembangan: Dalam pengembangan aktif. Item A46 (cadangan dan pemulihan lokal satu berkas) **belum diimplementasikan**; sesi ini hanya menyusun PRD dan tidak mengubah kode.

Rujukan sumber item fitur: `refrensi_apk.md` baris 399–405 (item `A46. Cadangan dan pemulihan lokal satu berkas`, prioritas Tinggi). Tautan referensi kompetitor pada item A46:

- [Clash Command (GitHub)](https://github.com/AmruthLP12/clash-command) — diverifikasi 2026-11-15 (halaman repositori terbaca): aplikasi Flutter offline-first untuk melacak upgrade Clash of Clans; menyediakan "Complete Application Backup & Restore: Portable `.clashcommandbackup` archive containing versioned manifest, SQLite database, and user preferences. Pre-restore validation, automatic safety backup creation before destructive restore, atomic transactions, and automatic notification reconciliation."

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menyatakan hasil yang diharapkan dari dokumen ini dan membatasi ruang lingkup.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.

**Isi:**
1. Menyediakan cara bagi pengguna `base_coc` untuk mencadangkan seluruh data pengguna (database SQLite `base_coc.db`: tabel `akun_desa`, `progres`, `favorit_base`) ke **satu berkas JSON** yang dapat dipindahkan antar perangkat tanpa cloud dan tanpa akun.
2. Menyediakan pemulihan data dari berkas cadangan yang **divalidasi lebih dulu** (manifest berversi), dijalankan dalam **satu transaksi atomik** (gagal di tengah = rollback, data lama tetap utuh), dan diawali **cadangan pengaman otomatis** dari data saat ini.
3. Menjaga prinsip offline-first dan tanpa akun: seluruh proses berjalan lokal; berkas dibagikan/diambil lewat share sheet dan file picker native; tidak ada jaringan, backend, atau moderasi.
4. Menetapkan cakupan A46 saja: mode impor "Gabung" vs "Ganti" tetap menjadi cakupan item `A47` dan **tidak** termasuk di sini.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk merinci fitur yang harus ada agar tujuan PRD tercapai.

**Aturan pengisian:**
Satu baris mewakili satu fitur yang dapat diidentifikasi terpisah; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Manifest cadangan berversi | Bagian `manifest` pada payload: `format` (`base_coc_cadangan`), `versiFormat` (`1`), `versiAplikasi`, `versiDatabase` (`2` saat ini), `dibuat` (ISO-8601 lokal), `preferensi` (objek, **kosong** — `base_coc` belum memakai SharedPreferences), dan `tabel` (jumlah baris per tabel). | Must Have |
| Ekspor cadangan JSON | `CadanganService.ekspor()` membaca seluruh tabel (`akun_desa`, `progres`, `favorit_base`), menyusun payload JSON (manifest + isi tabel), menulis ke berkas sementara `base_coc_cadangan_<yyyyMMdd_HHmm>.json` di direktori sementara (`path_provider`), lalu membagikannya lewat share sheet (`SharePlus.instance.share(ShareParams(files: ...))`). | Must Have |
| Validasi berkas cadangan | `BerkasCadanganTidakValidException` (`class ... implements Exception`) dilempar bila: JSON bukan objek, `manifest.format` ≠ `base_coc_cadangan`, `versiFormat` ≠ `1`, `versiDatabase` lebih besar dari `SqfliteOpener.versiDatabase`, `preferensi` bukan objek, atau `tabel` tidak memuat `akun_desa`, `progres`, dan `favorit_base`. | Must Have |
| Cadangan pengaman otomatis | Sebelum restore destruktif, tulis payload JSON dari data saat ini ke `<applicationDocumentsDirectory>/base_coc_safety_backup.json` (ditimpa tiap restore; 1 berkas) via `path_provider`; berkas dihapus setelah restore sukses; bila restore gagal, berkas ini dipertahankan dan path-nya dilaporkan ke pengguna. | Must Have |
| Pemulihan atomik | Restore berjalan dalam satu transaksi DB (`db.transaction`): hapus `favorit_base`, `progres`, `akun_desa` (urutan menghormati FK `progres → akun_desa`), lalu insert dari cadangan (insert `akun_desa` lebih dulu, lalu `progres`, lalu `favorit_base`). Gagal = rollback otomatis. Hanya mode "Ganti seluruh data"; tidak ada mode "Gabung" (item A47). | Must Have |
| Layar "Cadangkan & Pulihkan" | `CadanganScreen` baru dengan dua aksi (Cadangkan / Pulihkan), flag `_sedangMemproses` anti double-submit, dialog konfirmasi destruktif (`isDestructiveAction`-setara; `showDialog` OK/Batal karena proyek belum memakai `adaptive_dialog`), dan umpan balik `SnackBar`/`debugPrint` (proyek belum memakai EasyLoading/AppToast). | Must Have |
| Entry point di AppBar Galeri | `BerandaGaleriScreen` menambah `IconButton` (mis. `Icons.backup`/`Icons.save_alt`, tooltip "Cadangkan & Pulihkan") di `AppBar.actions`, setelah ikon favorit; push `MaterialPageRoute` ke `CadanganScreen`. | Must Have |
| Refresh provider setelah restore | Setelah restore sukses, segarkan `favoritProvider` dan `progresProvider` via `ref.refresh(...)` masing-masing dalam `try/catch` + `debugPrint`, agar UI tidak menampilkan data usang. | Must Have |
| Cek platform | Bila `kIsWeb` (atau platform tanpa dukungan sistem berkas/sqflite), kontrol ekspor/pulihkan tidak ditampilkan dan diganti peringatan; tidak crash. | Must Have |
| Validasi jumlah baris | Setelah parsing, cocokkan jumlah baris tiap tabel dengan `manifest.tabel`; ketidakcocokan → `BerkasCadanganTidakValidException` (data tidak diubah). | Should Have |
| Test unit round-trip | `base_coc/test/cadangan_service_test.dart`: ekspor → impor pada DB uji (`sqflite_common_ffi`, mengikuti `db_helper.dart` `DatabaseOpener`); validasi manifest gagal; manifest `versiDatabase` lebih baru ditolak; jumlah baris tidak cocok ditolak. | Should Have |

Di luar ruang lingkup (eksplisit): mode impor "Gabung"/"Ganti" dengan deteksi snapshot ganda (item `A47`); riwayat aktivitas data (item `A48`); berkas arsip ZIP/`.clashcommandbackup`; unggah/sinkron cloud; ekspor katalog bawaan (aset bundel, bukan data pengguna); enkripsi berkas cadangan (data lokal tidak sensitif per skill keamanan-aplikasi).

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan interaksi pengguna dari kondisi awal hingga kondisi akhir.

**Aturan pengisian:**
Mulai dari kondisi awal, jelaskan langkah secara berurutan, sebutkan tindakan pengguna dan respons aplikasi, sertakan percabangan bila ada.

**Isi:**

Kondisi awal: pengguna membuka aplikasi dan melihat galeri base (fitur yang sudah ada).

**Ekspor (Cadangkan):**
1. Pengguna menekan ikon cadangan di AppBar galeri; aplikasi membuka `CadanganScreen`.
2. Pengguna menekan tombol "Cadangkan"; aplikasi membaca seluruh tabel dan menyusun payload JSON (`_sedangMemproses` mencegah aksi ganda).
3. Aplikasi menulis berkas `base_coc_cadangan_<yyyyMMdd_HHmm>.json` ke direktori sementara dan membuka share sheet native.
4. Pengguna memilih tujuan (mis. penyimpanan berkas, kirim ke perangkat lain); kondisi akhir: berkas cadangan satu file tersedia di luar aplikasi.

**Impor (Pulihkan):**
1. Pengguna menekan tombol "Pulihkan"; aplikasi menampilkan dialog konfirmasi destruktif ("Data saat ini akan diganti dengan isi cadangan. Lanjutkan?" — OK/Batal).
2. Bila OK, aplikasi membuka file picker (`FilePicker.pickFile`, filter ekstensi `json`); pengguna memilih berkas cadangan.
3. Aplikasi memvalidasi berkas (lihat fitur validasi). Bila tidak valid → `BerkasCadanganTidakValidException` ditangkap, pesan ramah pengguna ditampilkan, **data tidak diubah**.
4. Bila valid, aplikasi menulis cadangan pengaman data saat ini ke `<applicationDocumentsDirectory>/base_coc_safety_backup.json` (menimpa yang lama).
5. Aplikasi menjalankan restore dalam satu transaksi: hapus `favorit_base` → `progres` → `akun_desa`, lalu insert `akun_desa` → `progres` → `favorit_base`.
6. Setelah transaksi sukses, cadangan pengaman dihapus, `favoritProvider` dan `progresProvider` disegarkan, dan SnackBar "Cadangan berhasil dipulihkan" ditampilkan.

Percabangan:
- Pengguna membatalkan share sheet atau file picker tanpa memilih berkas → tidak ada perubahan data; `_sedangMemproses` dikembalikan ke `false` di `finally`.
- Berkas valid tapi restore gagal di tengah transaksi → rollback otomatis; cadangan pengaman dipertahankan; pesan error ramah pengguna ditampilkan (tanpa detail path/SQL); `debugPrint` mencatat detail untuk pengembang.
- Platform web → kontrol tidak ditampilkan, peringatan platform ditampilkan.
- Berkas cadangan dibuat dari versi aplikasi dengan `versiDatabase` lebih baru daripada `SqfliteOpener.versiDatabase` → ditolak dengan `BerkasCadanganTidakValidException`.

Kondisi akhir yang diharapkan: data progres dan favorit pengguna berpindah utuh ke perangkat lain (atau kembali setelah bersih data) melalui satu berkas, tanpa kehilangan data saat proses gagal.

## 5. Steps

**Konteks penggunaan:**
Digunakan sebagai panduan kerja langkah demi langkah bagi implementor.

**Aturan pengisian:**
Gunakan numbered list; setiap langkah spesifik, tidak ambigu, dan dapat dikerjakan.

**Isi:**
1. Tambahkan dependensi di `base_coc/pubspec.yaml` (abjad, posisi sesuai skill pengurutan paket): `file_picker: ^13.3.3` dan `path_provider: ^2.1.6` (diverifikasi ke pub.dev 2026-11-15; `share_plus: ^13.3.1` sudah ada). Jalankan `flutter pub get`.
2. Buat `base_coc/lib/fitur/cadangan/service/cadangan_service.dart`:
   - `const cadanganFormat = 'base_coc_cadangan'; const cadanganVersiFormat = 1; const cadanganNamaBerkasSafety = 'base_coc_safety_backup.json';`
   - `class BerkasCadanganTidakValidException implements Exception` dengan field `pesan` dan `toString()`.
   - `class CadanganService` (konstruktor `const`): `Future<String> eksporKeBerkas()` — baca `akun_desa`, `progres`, `favorit_base` via `DbHelper().database`; susun map `{'manifest': {...}, 'tabel': {...}}` (manifest memuat jumlah baris per tabel di `tabel`); tulis `jsonEncode` ke `<temporaryDirectory>/base_coc_cadangan_<yyyyMMdd_HHmm>.json`; kembalikan path.
   - `Future<CadanganHasil> pulihkanDariBerkas(String path)` — baca bytes, `jsonDecode`, validasi (format, `versiFormat`, `versiDatabase` ≤ `SqfliteOpener.versiDatabase`, `preferensi` Map, ketiga tabel hadir, jumlah baris cocok dengan manifest), lalu: (a) `eksporKeBerkasSafety()` ke `getApplicationDocumentsDirectory()/base_coc_safety_backup.json`; (b) `db.transaction` — hapus tabel (urutan `favorit_base`, `progres`, `akun_desa`), insert ulang (urutan `akun_desa`, `progres`, `favorit_base`); (c) hapus safety backup; kembalikan jumlah baris yang dipulihkan per tabel.
3. Buat `base_coc/lib/fitur/cadangan/screen/cadangan_screen.dart`: `ConsumerStatefulWidget` `CadanganScreen`; dua kartu/aksi ("Cadangkan", "Pulihkan"); flag `bool _sedangMemproses = false` dicek di awal dan dikembalikan di `finally`; tombol nonaktif saat proses; dialog konfirmasi destruktif untuk "Pulihkan" (OK/Batal); ekspor memanggil `CadanganService.eksporKeBerkas()` lalu share sheet (`SharePlus.instance.share(ShareParams(files: [XFile(path, mimeType: 'application/json')]))`) dalam `try/catch`; pulihkan memanggil `FilePicker.pickFile(type: FileType.custom, allowedExtensions: ['json'])` (v13: mengembalikan `PlatformFile?`), lalu `pulihkanDariBerkas`; setelah sukses, `ref.refresh(favoritProvider)` dan `ref.refresh(progresProvider)` masing-masing dalam `try/catch`; umpan balik via `SnackBar` + `debugPrint`; `if (kIsWeb)` tampilkan peringatan dan sembunyikan kontrol.
4. Ubah `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart`: impor `cadangan_screen.dart`; tambah `IconButton(tooltip: 'Cadangkan & Pulihkan', icon: const Icon(Icons.backup), onPressed: ...)` di `AppBar.actions` **setelah** ikon favorit; push `MaterialPageRoute(builder: (_) => const CadanganScreen())`.
5. Buat `base_coc/test/cadangan_service_test.dart`: pakai `sqflite_common_ffi` + override `DbHelper.opener` seperti test database yang ada; uji round-trip (isi tabel → ekspor → hapus DB → impor → data sama), validasi JSON rusak, manifest format salah, `versiDatabase` lebih baru, dan jumlah baris tidak cocok.
6. Jalankan `dart format`, `flutter analyze`, `flutter test`. Perbarui `base_coc/README.md` (bagian fitur) setelah implementasi; PRD tidak mengubah kode.

Contoh potongan kode manifest (rancangan, bukan hasil generate):

```json
{
  "manifest": {
    "format": "base_coc_cadangan",
    "versiFormat": 1,
    "versiAplikasi": "1.0.0+1",
    "versiDatabase": 2,
    "dibuat": "2026-11-15T11:40:00.000",
    "preferensi": {},
    "tabel": {"akun_desa": 1, "progres": 12, "favorit_base": 3}
  },
  "tabel": {
    "akun_desa": [{"tag_pemain": "#2PP0Q8YUV", "nama_desa": "Desa", "town_hall": 12, "builder_hall": 9, "waktu_impor_terakhir": "2026-11-15T10:00:00.000"}],
    "progres": [],
    "favorit_base": []
  }
}
```

Contoh potongan kode restore (rancangan):

```dart
await db.transaction((txn) async {
  await txn.delete('favorit_base');
  await txn.delete('progres');
  await txn.delete('akun_desa');
  for (final row in akunDesa) { await txn.insert('akun_desa', row); }
  for (final row in progres) { await txn.insert('progres', row); }
  for (final row in favoritBase) { await txn.insert('favorit_base', row); }
});
```

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mendaftar berkas yang akan dibuat/diubah beserta alasannya.

**Aturan pengisian:**
Periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi spesifik; tandai `Dibuat`/`Diubah`; jangan mengarang lokasi.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ---------------- | ------------------- |
| `base_coc/pubspec.yaml` | Diubah | Tambah dependensi `file_picker: ^13.3.3` dan `path_provider: ^2.1.6` (share_plus sudah ada). |
| `base_coc/lib/fitur/cadangan/service/cadangan_service.dart` | Dibuat | `CadanganService` (ekspor/impor), `BerkasCadanganTidakValidException`, konstanta format/safety backup; transaksi restore; validasi manifest. |
| `base_coc/lib/fitur/cadangan/screen/cadangan_screen.dart` | Dibuat | Layar Cadangkan & Pulihkan: dua aksi, `_sedangMemproses`, dialog konfirmasi destruktif, share sheet, file picker, refresh provider, umpan balik SnackBar/debugPrint, cek `kIsWeb`. |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah | Tambah `IconButton` cadangan di `AppBar.actions` (setelah favorit) yang membuka `CadanganScreen`. |
| `base_coc/test/cadangan_service_test.dart` | Dibuat | Test ekspor/impor round-trip + validasi manifest (gagal) pada DB uji (`sqflite_common_ffi`). |
| `base_coc/README.md` | Diubah | Dokumentasi fitur (setelah implementasi, bukan pada sesi PRD). |

Tidak ada tumpang tindih dengan PRD lain: satu-satunya PRD di `prd/` adalah `prd_panduan_singkat_base.md` (item A8 — menyentuh `panduan_base*.dart`, `detail_base_screen.dart`, `base_katalog.json`); tidak ada berkas yang sama dengan cadangan. Item A47 (mode "Gabung"/"Ganti" impor Data Export) dan A48 (riwayat aktivitas) berdekatan secara konsep tetapi di luar cakupan dan belum memiliki PRD aktif yang mengklaim berkas ini. File `beranda_galeri_screen.dart` pernah disentuh pekerjaan A5 (favorit) sebelumnya, tetapi tidak ada PRD aktif yang mengklaimnya; perubahan bersifat aditif (satu IconButton).

Integrasi dengan fitur yang sudah ada: restore menyentuh seluruh tabel yang dikelola `DbHelper`/`progres_dao.dart`/`favorit_dao.dart` tanpa mengubah skema (versi DB tetap `2`); `KatalogService` dan aset katalog tidak tersentuh; `progres_provider.dart` dan `favorit_provider.dart` disegarkan setelah restore; `ImporDataExportScreen` di luar cakupan.

**Status implementasi:** `Belum Diimplementasikan` — sesi ini hanya menyusun PRD dan tidak mengubah kode Dart satu pun.
