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
- Deskripsi produk: aplikasi Flutter penyedia base/layout Clash of Clans; katalog lokal offline, galeri terfilter, detail base dengan pratinjau dan salin tautan, pelacakan progres upgrade desa, favorit, dan tag strategi base.
- Platform: Android (utama); struktur Flutter menyiapkan Android, iOS, Web, Linux, macOS, dan Windows
- Versi: `1.0.0+1`
- Status pengembangan: Dalam pengembangan aktif. Fitur yang sudah diimplementasikan: galeri base + filter, detail base + copy tautan, pelacakan progres upgrade desa, favorit, dan tag strategi base (A6). Item A7 (berbagi base ke anggota klan) **belum diimplementasikan**; sesi ini hanya menyusun PRD dan tidak mengubah kode.

Rujukan sumber item fitur: `refrensi_apk.md` baris 85–91 (item `A7. Berbagi base ke anggota klan`, prioritas Sedang). Tautan referensi kompetitor pada item A7 (keduanya diverifikasi 2026-11-14: halaman Play Store terbaca):

- [ClasherPro - Base Layout Map](https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster) — menyebut "share any CoC base/map with other clashers or on social media".
- [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop) — "Share Bases — Send base links to your clan members".

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menyatakan hasil yang diharapkan dari dokumen ini dan membatasi ruang lingkup.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.

**Isi:**
1. Menyediakan aksi "Bagikan" pada base di aplikasi yang membagikan tautan base resmi Clash of Clans beserta identitas singkat base (ID/Town Hall/tipe) melalui native share sheet platform (`share_plus`).
2. Mendukung koordinasi perang klan: pemimpin/anggota dapat mengirim layout ke anggota klan lewat kanal apa pun yang tersedia di perangkat (chat, media sosial, dll.) tanpa backend, akun, atau autentikasi.
3. Tidak membuat tautan internal aplikasi: yang dibagikan adalah `baseLink` resmi (mis. `https://link.clashofclans.com/?action=OpenLayout&id=...`) yang dapat dibuka penerima di game/browser; tautan internal (deep link aplikasi) tidak dipakai.
4. Menjaga prinsip offline-first sejauh mungkin: aksi bagikan tetap memerlukan share sheet platform (bukan jaringan intra-aplikasi) dan tidak bergantung pada server `base_coc`.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk merinci fitur yang harus ada agar tujuan PRD tercapai.

**Aturan pengisian:**
Satu baris mewakili satu fitur yang dapat diidentifikasi terpisah; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Dependensi `share_plus` | Tambahkan `share_plus: ^13.3.1` ke `dependencies` di `pubspec.yaml` (versi terverifikasi di pub.dev 2026-11-14; kompatibel Dart `^3.10.0` dan Flutter `>=3.38.1`; base_coc memakai Dart `^3.13.7`). | Must Have |
| Layanan `ShareBaseService` | `Future<void> bagikanBase(BaseLayout base)` di `base_coc/lib/fitur/detail_base/service/share_base_service.dart`; membentuk `ShareParams(text: ...)` dan memanggil `SharePlus.instance.share(params)`; dibungkus try/catch dengan log `debugPrint` (pola base_coc: logger proyek absen). | Must Have |
| Teks berbagi standar | Fungsi murni `String teksBerbagiBase(BaseLayout base)` di service yang sama, contoh keluaran: `"Layout <id> (<labelTownHall>, <tipe>)\n<baseLink>"`; diuji lewat unit test. | Must Have |
| Tombol "Bagikan" di AppBar layar detail | `IconButton` (ikon `Icons.share`, tooltip `'Bagikan'`) pada `AppBar.actions` `DetailBaseScreen`, di sebelah `IconButton` reset zoom; memanggil `ShareBaseService`; tombol "Copy Base" di `bottomNavigationBar` tidak bergeser. | Must Have |
| Test | Unit test `teksBerbagiBase` (format teks) dan unit/widget test pemicu bagikan bila memungkinkan tanpa plugin platform. | Should Have |

Di luar ruang lingkup (eksplisit): kartu berbagi visual/poster (item A24), berbagi langsung ke grup tertentu, analytics, dan deep link internal ke aplikasi; gambar/screenshot base dilampirkan hanya bila pengguna memilih berbagi screenshot sendiri dari galeri sistem (bukan bagian fitur ini).

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan interaksi pengguna dari kondisi awal hingga kondisi akhir.

**Aturan pengisian:**
Mulai dari kondisi awal, jelaskan langkah secara berurutan, sebutkan tindakan pengguna dan respons aplikasi, sertakan percabangan bila ada.

**Isi:**
1. Pengguna membuka aplikasi dan memilih satu base dari galeri (kondisi awal, fitur yang sudah ada).
2. Aplikasi membuka `DetailBaseScreen`.
3. Pengguna menekan ikon "Bagikan" (`Icons.share`) di AppBar.
4. Aplikasi membuka native share sheet platform (Android: `ACTION_SEND` intent; iOS: `UIActivityViewController`; Web/Linux: Web Share API dengan fallback sesuai kemampuan `share_plus`).
5. Pengguna memilih kanal (chat klan, WhatsApp, dll.); aplikasi penerima menerima teks berisi ID/TH/tipe base dan tautan layout resmi Clash of Clans.
6. Penerima menekan tautan → game Clash of Clans membuka layout (mekanisme resmi CoC) atau tautan dibuka di browser bila game tidak terpasang.

Percabangan:
- Platform tidak mendukung identifikasi hasil: `ShareResultStatus.unavailable` — aplikasi tidak menampilkan pesan error; alur berakhir diam-diam (opsional: log `debugPrint`).
- Error pada share sheet (plugin gagal, konteks hilang): ditangkap try/catch; pengguna tidak melihat crash; log `debugPrint` mencatat pesan error.
- Pengguna membatalkan share sheet (`ShareResultStatus.dismissed`): tidak ada aksi lanjutan; state tidak berubah.

Kondisi akhir yang diharapkan: tautan base terkirim ke anggota klan tanpa pengguna menyalin/menempel manual dan tanpa aplikasi penerima memerlukan akun `base_coc`.

## 5. Steps

**Konteks penggunaan:**
Digunakan sebagai panduan kerja langkah demi langkah bagi implementor.

**Aturan pengisian:**
Gunakan numbered list; setiap langkah spesifik, tidak ambigu, dan dapat dikerjakan.

**Isi:**
1. Tambahkan `share_plus: ^13.3.1` ke `dependencies` di `base_coc/pubspec.yaml` (urutan alfabetis mengikuti skill `pengurutan-paket-pubspec` — entri `share_plus` berada setelah `riverpod_annotation`/sebelum `url_launcher` sesuai abjad), lalu jalankan `flutter pub get`.
2. Buat `base_coc/lib/fitur/detail_base/service/share_base_service.dart`:
   ```dart
   import 'package:share_plus/share_plus.dart';

   import 'package:base_coc/fitur/galeri_base/model/base_layout.dart';

   /// Membentuk teks berbagi standar untuk satu base.
   String teksBerbagiBase(BaseLayout base) {
     return 'Layout ${base.id} (${base.labelTownHall}, ${base.tipe.name.toUpperCase()})\n${base.baseLink}';
   }

   /// Layanan berbagi base melalui native share sheet platform.
   class ShareBaseService {
     const ShareBaseService();

     Future<void> bagikanBase(BaseLayout base) async {
       try {
         await SharePlus.instance.share(
           ShareParams(text: teksBerbagiBase(base)),
         );
       } catch (e) {
         debugPrint('ShareBaseService: gagal membagikan base ${base.id}: $e');
       }
     }
   }
   ```
   Catatan: `debugPrint` memerlukan `import 'package:flutter/foundation.dart';` bila `dart:developer` tidak dipakai.
3. Ubah `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart`: impor service; tambahkan `IconButton` `Icons.share` (tooltip `'Bagikan'`) **sebelum** `IconButton` reset zoom di `AppBar.actions`; `onPressed` memanggil `const ShareBaseService().bagikanBase(widget.base)` (unawaited dengan penanganan error sudah ada di dalam service); tombol "Copy Base" tidak berubah.
4. Pertimbangkan (opsional, perlu keputusan diskusi): tombol "Bagikan" juga pada kartu di `BerandaGaleriScreen`/`grid_base.dart`; MVP tidak menyertakannya.
5. Tambahkan `base_coc/test/share_base_service_test.dart`: unit test `teksBerbagiBase` untuk format `"Layout <id> (<LABELTH>, <TIPE>)\n<link>"` (gunakan fixture `BaseLayout` dari `test/` yang sudah ada atau buat inline).
6. Jalankan `dart format lib test`, `flutter analyze`, `flutter test`.
7. Perbarui `base_coc/README.md` (bagian "Fitur yang Tersedia" → "Detail Base dan Salin Tautan" atau section baru "Berbagi Base") setelah implementasi; PRD tidak mengubah kode.

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mendaftar berkas yang akan dibuat/diubah beserta alasannya.

**Aturan pengisian:**
Periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi spesifik; tandai `Dibuat`/`Diubah`; jangan mengarang lokasi.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ---------------- | ------------------- |
| `base_coc/pubspec.yaml` | Diubah | Tambahkan `share_plus: ^13.3.1` ke `dependencies` (abjad), lalu `flutter pub get`. |
| `base_coc/lib/fitur/detail_base/service/share_base_service.dart` | Dibuat | `teksBerbagiBase` (fungsi murni) + `ShareBaseService.bagikanBase` (memanggil `SharePlus.instance.share`). |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | Tambahkan `IconButton` "Bagikan" di `AppBar.actions` (sebelum reset zoom). Catatan: berkas ini juga masuk daftar File Terdampak PRD A8 (`prd_panduan_singkat_base.md`, Final, belum diimplementasikan) — perubahan keduanya bersifat aditif pada lokasi berbeda (AppBar vs body) dan tidak saling menimpa; urutan pengerjaan A7/A8 bebas. |
| `base_coc/test/share_base_service_test.dart` | Dibuat | Unit test format teks berbagi. |
| `base_coc/README.md` | Diubah | Dokumentasi fitur (setelah implementasi, bukan pada sesi PRD). |

Tidak ada tumpang tindih substansial dengan PRD lain: PRD A8 (`prd_panduan_singkat_base.md`) menyentuh `detail_base_screen.dart` pada bagian body (section "Panduan"), sedangkan A7 menyentuh `AppBar.actions`; `pubspec.yaml`, service baru, dan test A7 tidak diklaim PRD lain. `prd/` hanya memuat `prd_panduan_singkat_base.md` per 2026-11-15. Integrasi: berbagi tidak menyentuh model (`BaseLayout`), provider (`katalog_provider`, `filter_provider`, `favorit_provider`), atau skema SQLite; `baseLink` yang dibagikan sama dengan yang disalin tombol "Copy Base".

**Status implementasi:** `Belum Diimplementasikan` — sesi ini hanya menyusun PRD dan tidak mengubah kode Dart satu pun.
