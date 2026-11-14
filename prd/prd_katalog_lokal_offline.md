# PRD Katalog Lokal Offline-first untuk base_coc

**Status Dokumen:** Final

**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek. Informasi ini menjadi identitas utama PRD.

**Aturan pengisian:**

- Isi informasi berdasarkan kondisi dan identitas proyek yang sebenarnya.
- Gunakan nama yang konsisten dengan proyek.
- Tuliskan platform dan versi yang menjadi target pengembangan.
- Bedakan status dokumen dengan status implementasi.
- Jangan mengarang informasi yang belum diketahui.

**Informasi:**

- Nama aplikasi: `base_coc`.
- Deskripsi produk: aplikasi Flutter penyedia katalog base dan layout Clash of Clans, dengan alur penelusuran katalog, pratinjau, dan penyalinan tautan base.
- Platform: Android sebagai target utama; Flutter tetap dapat berjalan pada platform lain yang didukung proyek.
- Versi: `1.0.0+1` berdasarkan `base_coc/pubspec.yaml` baris 19.
- Status pengembangan: katalog lokal dari aset JSON, pemuatan melalui `rootBundle`, filter dasar, serta halaman kosong/gagal sudah tersedia sebagian; validasi data, sumber pembaruan versi, pengujian offline, dan cakupan aset gambar belum terbukti selesai.
- Implementasi lanjutan: belum ditandai selesai karena belum ada verifikasi format katalog, aset gambar, mekanisme pembaruan, dan pengujian offline.

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menentukan hasil yang ingin dicapai dari dokumen PRD ini. Tujuan harus berhubungan langsung dengan kebutuhan dokumen.

**Aturan pengisian:**

- Tuliskan hasil yang diharapkan dari PRD.
- Pastikan setiap tujuan memiliki hubungan dengan kebutuhan dokumen PRD.
- Gunakan tujuan yang jelas dan dapat dievaluasi.
- Jangan memasukkan tujuan yang berada di luar ruang lingkup PRD.

**Isi:**
Menyediakan katalog base yang dapat dibuka tanpa koneksi internet, tanpa login, dan tanpa ketergantungan backend pada pemakaian dasar. Katalog yang dibundel sebagai aset lokal harus konsisten dengan model `BaseLayout`, tetap mendukung filter Town Hall/tipe/query, menampilkan kondisi kosong dan gagal secara eksplisit, serta menyediakan mekanisme pembaruan katalog tanpa mengubah kode aplikasi.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk melihat keseluruhan fitur produk dan menentukan tingkat kepentingannya.

**Aturan pengisian:**

- Setiap fitur harus memiliki nama dan deskripsi yang jelas.
- Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah.
- Hindari menggabungkan beberapa fitur berbeda dalam satu baris.
- Pastikan fitur mendukung tujuan produk dan masuk dalam ruang lingkup.
- Gunakan prioritas berdasarkan kepentingan kebutuhan produk.

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | ----------- |
| Pemuatan katalog lokal | Katalog base dibaca dari `assets/data/base_katalog.json` melalui `rootBundle` sehingga alur utama tidak memerlukan permintaan jaringan atau autentikasi. | Must Have |
| Model data katalog | Data JSON dikonversi menjadi `BaseLayout` dengan metadata Town Hall, Builder Hall opsional, tipe, gaya, thumbnail, dan tautan base. | Must Have |
| Penyaringan lokal | Katalog hasil pemuatan dapat disaring berdasarkan Town Hall, tipe base, dan kata kunci pencarian tanpa mengambil data dari server. | Must Have |
| Kondisi antarmuka eksplisit | Layar menampilkan indikator pemuatan, keadaan kosong dengan saran mengubah filter, dan keadaan gagal dengan tombol coba lagi. | Should Have |
| Pembaruan katalog | Mekanisme pembaruan aset/katalog versi berikutnya dirancang tanpa mengubah aplikasi; bentuk final belum ditentukan. | Should Have |
| Aset gambar lokal | Thumbnail base disimpan sebagai aset lokal atau lokasi yang tersedia secara lokal agar pratinjau tetap dapat ditampilkan offline. | Should Have |

### Sumber dari `refrensi_apk.md`

- Rujukan utama: `refrensi_apk.md` baris 65-71, item `A4. Katalog lokal yang tetap berfungsi tanpa internet`.
- Rujukan kondisi proyek: `refrensi_apk.md` baris 37-51 menyatakan target aplikasi berupa aplikasi penyedia base/layout Clash of Clans.
- Rujukan pola UI pendukung: `refrensi_apk.md` baris 341-355 mengenai grid thumbnail dan layar detail, serta baris 365-379 mengenai kondisi kosong, pemuatan, gagal, dan umpan balik pengguna.
- Temuan sumber: Notificlash dan Coc Base Layout 2026 disebut sebagai pembanding offline/no-login pada `refrensi_apk.md` baris 65-71.
- Tautan APK sumber yang diperiksa:
  - [Notificlash: Tracker for CoC](https://play.google.com/store/apps/details?id=com.efertre.notificapp) — deskripsi toko menyebut offline access, pemrosesan data lokal, dan tidak memerlukan login akun game.
  - [Coc Base Layout 2026](https://play.google.com/store/apps/details?id=com.cocbase.net) — deskripsi toko menyebut katalog base, filter, pratinjau, dan pembaruan katalog.
  - [Clash Trackers](https://github.com/Killersparrow1/clash-Trackers) — README menyatakan aplikasi offline Android dan tidak meminta izin internet; dijadikan pembanding pola offline-first, bukan sumber data base.
  - [ClashPrime](https://github.com/FarhanZafarr-9/ClashPrime) — README menjelaskan katalog base dan pemuatan snapshot lokal; dijadikan pembanding arsitektur cache/offline, bukan sumber data base.

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan interaksi pengguna dengan aplikasi dari awal hingga tujuan tercapai.

**Aturan pengisian:**

- Mulai dari kondisi awal pengguna.
- Jelaskan setiap langkah secara berurutan.
- Sebutkan tindakan pengguna dan respons aplikasi.
- Sertakan percabangan atau kondisi alternatif jika tersedia.
- Jelaskan kondisi akhir yang diharapkan.
- Pastikan alur sesuai dengan persyaratan fitur.
- Jangan memasukkan proses yang tidak didukung oleh kebutuhan produk.

**Isi:**

1. Pengguna membuka aplikasi saat koneksi internet tidak tersedia.
2. Aplikasi memuat katalog dari aset lokal melalui `katalogProvider`; tidak ada layar login atau permintaan jaringan yang diperlukan untuk alur dasar.
3. Aplikasi menampilkan indikator pemuatan selama pembacaan dan validasi katalog berlangsung.
4. Jika katalog berhasil dimuat, pengguna melihat daftar/grid base dan dapat memilih Town Hall, tipe base, atau memasukkan kata kunci pencarian.
5. Jika filter menghasilkan daftar kosong, aplikasi menampilkan `EmptyStateView` dan saran untuk mengubah atau mengatur ulang filter.
6. Jika berkas katalog tidak dapat dibaca atau formatnya tidak valid, aplikasi menampilkan pesan gagal serta tombol coba lagi.
7. Pengguna memilih base untuk membuka detail dan menyalin tautan sesuai alur detail yang sudah ada; fitur ini tidak menggantikan alur copy base.

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menentukan hasil yang ingin dicapai dari dokumen PRD ini. Tujuan harus berhubungan langsung dengan kebutuhan dokumen.

**Aturan pengisian:**

- Buat langkah-langkah yang spesifik dan dapat diikuti.
- Gunakan numbered list untuk mempertahankan urutan.
- Setiap langkah harus tidak ambigu dan dapat dikerjakan.
- Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**
1. Tetapkan skema katalog versi lokal yang memuat metadata versi, daftar base, dan metadata validasi seperti checksum atau tanggal publikasi.
2. Pastikan `BaseLayout.fromJson` memvalidasi identifier, enum Town Hall/tipe/gaya, thumbnail, dan tautan base; kegagalan format harus menghasilkan error terkontrol.
3. Lengkapi katalog contoh dan aset thumbnail lokal yang benar-benar tersedia pada `assets/`; daftarkan seluruh direktori aset yang diperlukan di `base_coc/pubspec.yaml`.
4. Pertahankan pemisahan antara `katalogProvider` sebagai sumber data lokal dan `filteredBasesProvider` sebagai hasil turunan filter.
5. Tambahkan pengujian unit/widget untuk katalog valid, katalog kosong, format rusak, filter tanpa hasil, serta pemulihan melalui tombol coba lagi.
6. Tentukan mekanisme pembaruan katalog versi berikutnya, yaitu pembaruan aset melalui rilis aplikasi atau unduhan berkas katalog yang disimpan di penyimpanan lokal; jangan mengubah alur baca lokal menjadi API wajib.
7. Jalankan `flutter pub get`, `dart format`, `dart analyze`, dan `flutter test` di submodule `base_coc` setelah implementasi lanjutan.

### Potongan Kode Ilustratif

Potongan berikut hanya menunjukkan arah implementasi dan tidak mengganti keputusan teknis final.

```dart
final katalogProvider = FutureProvider<List<BaseLayout>>((ref) async {
  final raw = await rootBundle.loadString('assets/data/base_katalog.json');
  final decoded = jsonDecode(raw) as List<dynamic>;
  return decoded
      .map((item) => BaseLayout.fromJson(item as Map<String, dynamic>))
      .toList(growable: false);
});
```

```dart
final filteredBasesProvider = Provider<AsyncValue<List<BaseLayout>>>((ref) {
  final katalog = ref.watch(katalogProvider);
  final filter = ref.watch(filterProvider);

  return katalog.whenData((bases) {
    final kataKunci = filter.query.trim().toLowerCase();
    return bases.where((base) {
      final cocokTownHall =
          filter.townHall == null || base.townHall == filter.townHall;
      final cocokTipe = filter.tipe == null || base.tipe == filter.tipe;
      final cocokKataKunci = kataKunci.isEmpty ||
          base.id.toLowerCase().contains(kataKunci);
      return cocokTownHall && cocokTipe && cocokKataKunci;
    }).toList(growable: false);
  });
});
```

```dart
filteredAsync.when(
  loading: () => const Center(child: CircularProgressIndicator()),
  error: (_, __) => _TampilanGagal(
    onCobaLagi: () => ref.refresh(katalogProvider),
  ),
  data: (bases) => bases.isEmpty
      ? _TampilanKosong(onReset: () => ref.read(filterProvider.notifier).reset())
      : GridBase(bases: bases),
);
```

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi file proyek yang berkaitan dengan implementasi kebutuhan produk. Bagian ini menjadi gambaran awal cakupan perubahan kode.

**Aturan pengisian:**

- Periksa struktur proyek sebelum menentukan file terdampak.
- Cantumkan lokasi file secara spesifik berdasarkan struktur proyek sebenarnya.
- Tandai apakah file perlu dibuat, diubah, atau dihapus.
- Jelaskan alasan dan tujuan perubahan setiap file.
- Cantumkan hanya file yang memiliki hubungan dengan kebutuhan fitur.
- Jangan mengarang lokasi, nama, atau keberadaan file.
- Jika file belum dapat ditentukan, tandai sebagai belum diketahui dan jangan menebak.
- Perbarui daftar setelah analisis teknis atau implementasi apabila ditemukan file terdampak tambahan.

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ------------------------- | ------------------- |
| `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart` | Diubah | Sumber pemuatan katalog lokal saat ini berada di sini; perlu ditambah validasi dan penanganan error yang konsisten. |
| `base_coc/lib/fitur/galeri_base/model/base_layout.dart` | Diubah | Model dan parser katalog berada di sini; validasi format serta metadata katalog perlu diperjelas. |
| `base_coc/assets/data/base_katalog.json` | Diubah | Katalog contoh sudah ada, tetapi thumbnail masih kosong dan cakupan data perlu disesuaikan dengan strategi rilis. |
| `base_coc/pubspec.yaml` | Diubah | Sudah memuat `flutter_riverpod` dan aset JSON pada baris 37 serta 63-64; perlu dipastikan seluruh aset lokal yang dipakai benar-benar terdaftar. |
| `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` | Diubah | Sudah memuat kondisi loading, error, dan kosong; perlu dipastikan pesan error tidak mengekspos detail teknis dan tombol coba lagi bekerja. |
| `base_coc/lib/fitur/galeri_base/widget/grid_base.dart` | Dihapus atau Diubah | Widget grid sudah digunakan; tidak perlu diubah bila hanya mendukung tampilan data lokal, tetapi perlu ditinjau untuk ketersediaan thumbnail. |
| `base_coc/test/widget_test.dart` | Diubah | Pengujian katalog/filter sudah ada; perlu ditambah kasus katalog rusak, kosong, dan pemulihan error. |
| `base_coc/assets/data/` | Dibuat | Direktori aset data masih hanya memuat berkas JSON; tambahkan aset gambar lokal hanya bila thumbnail lokal disepakati. |
| `base_coc/lib/fitur/galeri_base/model/` | Diubah | Tempat model katalog berada; tambahkan model metadata katalog atau skema versi bila diperlukan. |
| `base_coc/lib/fitur/galeri_base/service/` | Dibuat | Belum ada berkas pada lokasi ini; buat layanan pembaca katalog lokal hanya bila validasi dan pembaruan katalog dipisahkan dari provider. |

### Pemeriksaan Implementasi

- `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart` baris 10-17 sudah membaca `assets/data/base_katalog.json` melalui `rootBundle.loadString`.
- `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart` baris 20-41 sudah menerapkan filter Town Hall, tipe, dan query.
- `base_coc/lib/fitur/galeri_base/model/base_layout.dart` baris 51-69 sudah memuat `fromJson`, tetapi pencarian enum memakai `firstWhere` tanpa fallback error yang eksplisit.
- `base_coc/pubspec.yaml` baris 37 dan 63-64 sudah mendaftarkan `flutter_riverpod` serta `assets/data/base_katalog.json`.
- `base_coc/assets/data/base_katalog.json` baris 2-13 memuat data contoh dengan `thumbnailPath` kosong.
- `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` baris 17-50 sudah menangani loading/error/data dan `onCobaLagi`.
- `base_coc/test/widget_test.dart` baris 31-61 sudah memuat pengujian grid dan filter, tetapi belum memvalidasi format katalog rusak atau pemulihan error.
- PRD galeri yang sudah diimplementasikan (`prd/prd_galeri_base_terfilter.md`) memiliki tumpang tindih file inti seperti `main.dart`, `pubspec.yaml`, model, provider, screen, dan test; karena implementasi ini sudah berjalan, PRD ini dipertahankan sebagai PRD fitur turunan dan tidak mengklaim file yang tidak relevan. Jika pengguna menghendaki PRD tanpa tumpang tindih file sama sekali, cakupan PRD perlu dipersempit menjadi berkas katalog, validasi, dan pengujian saja.
- Tidak ada kode Dart yang diubah selama penyusunan PRD ini.

### Rujukan Akhir

- `refrensi_apk.md` baris 65-71: fitur `A4`.
- `refrensi_apk.md` baris 341-379: pola grid, detail, dan state antarmuka.
- `refrensi_apk.md` baris 499-522: katalog listing sumber pembanding.
- `base_coc/pubspec.yaml` baris 19, 37, dan 63-64.
- `base_coc/lib/fitur/galeri_base/provider/katalog_provider.dart` baris 10-41.
- `base_coc/lib/fitur/galeri_base/model/base_layout.dart` baris 1-87.
- `base_coc/assets/data/base_katalog.json` baris 1-14.
- `base_coc/lib/fitur/galeri_base/screen/beranda_galeri_screen.dart` baris 17-128.