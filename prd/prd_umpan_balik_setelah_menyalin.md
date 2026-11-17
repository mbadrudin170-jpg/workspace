**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek. Informasi ini membantu seluruh pihak memahami konteks aplikasi sebelum membaca kebutuhan fitur.

**Aturan pengisian:**
Isi nama aplikasi, deskripsi produk, platform, versi, dan status pengembangan berdasarkan kondisi proyek yang sebenarnya. Gunakan nama yang konsisten dengan proyek; cantumkan platform dan versi target.

**Informasi:**
- Nama aplikasi: `base_coc`
- Deskripsi produk: Aplikasi Flutter penyedia base/layout Clash of Clans. Memuat katalog base lokal (offline-first, `assets/data/base_katalog.json`), galeri terfilter, detail base dengan pratinjau gambar, panduan singkat per base, aksi salin/buka tautan, berbagi tautan ke klan, pelacakan progres upgrade desa (impor Data Export), serta cadangan dan pemulihan data pengguna dalam satu berkas JSON.
- Platform: Android (Application ID `com.example.base_coc`); dibangun dengan Flutter (Material 3, `useMaterial3: true`)
- Versi: `1.0.0+1` (Dart SDK `^3.13.7`)
- Status pengembangan: Aktif dikembangkan; fitur inti (galeri, detail base, salin tautan, progres upgrade, cadangan/pemulihan) sudah berjalan di kode

Sumber: `base_coc/pubspec.yaml` (versi, SDK), `base_coc/README.md` (identitas proyek dan daftar fitur), `base_coc/lib/main.dart` (aplikasi Flutter Material 3).

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menyatakan hasil yang diharapkan dari dokumen PRD ini, agar ruang lingkup dan kriteria selesai jelas sebelum implementasi dilakukan.

**Aturan pengisian:**
Setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; gunakan tujuan yang jelas dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.

**Isi:**
1. Menetapkan spesifikasi perilaku umpan balik setelah pengguna menyalin tautan base pada layar detail base, sehingga pengguna mengetahui (a) status salin (sukses/gagal) dan (b) langkah berikutnya yang harus dilakukan.
2. Mengurangi persepsi "copy gagal" yang dikeluhkan pada kompetitor, sesuai item C6 di `refrensi_apk.md` (baris 736–742; juga tercantum pada Prioritas Gabungan baris 1155 dan 1199).
3. Menjadi acuan penyempurnaan implementasi yang sudah ada sebagian (SnackBar status + aksi "Buka Clash of Clans") agar memenuhi seluruh saran C6, tanpa mengubah kode dalam PRD ini.
4. Menjaga konsistensi perilaku umpan balik dengan alur yang diamati pada referensi kompetitor (buka game lalu tempel layout), tanpa mengarang mekanisme yang tidak tersedia di proyek.

## 3. Daftar Fitur

**Konteks penggunaan:**
Digunakan untuk merinci fitur-fitur yang termasuk dalam ruang lingkup PRD beserta prioritasnya.

**Aturan pengisian:**
Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah (`| Fitur | Deskripsi | Prioritas |`); jangan menggabungkan beberapa fitur dalam satu baris; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`; setiap fitur wajib mendukung tujuan produk dan masuk dalam ruang lingkup.

**Isi:**

| Fitur | Deskripsi | Prioritas |
| ----- | --------- | --------- |
| Status salin yang jelas | Umpan balik menampilkan pesan status salin yang tegas: sukses ("Tautan base berhasil disalin") atau gagal (pesan penyebab, mis. "Tautan base tidak valid" / "Gagal menyalin tautan"). Durasi tampil cukup untuk dibaca (saat ini 4 detik). | Must Have |
| Aksi "Buka Clash of Clans" | Umpan balik sukses memuat aksi/tombol "Buka Clash of Clans" yang membuka game dengan tautan base (`url_launcher`, `LaunchMode.externalApplication`). Aksi hanya tampil saat salin sukses. | Must Have |
| Petunjuk satu langkah | Umpan balik sukses memuat petunjuk satu langkah yang menjelaskan langkah berikutnya (mis. "Buka Clash of Clans → editor layout → tempel tautan"), agar pengguna tidak bingung ketika game tidak terbuka otomatis. | Should Have |
| Umpan balik saat game gagal dibuka | Bila game tidak terpasang atau gagal dibuka, aplikasi menampilkan umpan balik informatif (mis. "Clash of Clans tidak terpasang. Tempel tautan secara manual."). | Should Have |
| Verifikasi hasil salin | Sebelum menyatakan sukses, aplikasi memverifikasi isi clipboard bila platform mendukung (`Clipboard.getData`); kegagalan verifikasi memunculkan status gagal, bukan sukses. | Could Have |

Ruang lingkup yang **tidak** termasuk: mekanisme deep link yang menempel otomatis ke editor layout game (bukan kemampuan yang tersedia di proyek dan tidak dijamin oleh `url_launcher`); perubahan desain tombol "Copy Base" pada `bottomNavigationBar` (sudah tercakup PRD C3 yang telah diimplementasikan dan dihapus).

## 4. Alur Pengguna

**Konteks penggunaan:**
Digunakan untuk menggambarkan perjalanan pengguna dari kondisi awal sampai kondisi akhir yang diharapkan, termasuk percabangan kondisi.

**Aturan pengisian:**
Mulai dari kondisi awal pengguna; jelaskan langkah secara berurutan; sebutkan tindakan pengguna dan respons aplikasi; sertakan percabangan atau kondisi alternatif bila ada; jelaskan kondisi akhir yang diharapkan; pastikan alur sesuai persyaratan fitur; jangan memasukkan proses yang tidak didukung kebutuhan produk.

**Isi:**

Kondisi awal: pengguna berada di layar detail base (`DetailBaseScreen`, `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart`) dan mengetuk tombol "Copy Base" pada `bottomNavigationBar`.

Alur utama (sukses):
1. Pengguna mengetuk "Copy Base".
2. Aplikasi memvalidasi tautan base (`validasiLinkBase`) — tautan tidak valid langsung memunculkan status gagal.
3. Aplikasi menyalin tautan ke clipboard, lalu memverifikasi isi clipboard bila platform mendukung.
4. Aplikasi mencatat statistik salin (`statistikProvider.notifier.catatSalin`, unawaited dengan catchError) — tidak memblokir umpan balik.
5. Aplikasi menampilkan umpan balik sukses: pesan "Tautan base berhasil disalin", aksi "Buka Clash of Clans", dan — sesuai spesifikasi PRD ini — petunjuk satu langkah.
6. Pengguna mengetuk "Buka Clash of Clans"; aplikasi membuka game dengan tautan (`url_launcher`).
7. Kondisi akhir: pengguna berada di dalam game dengan tautan di clipboard (atau menerima petunjuk menempel manual), dan memahami langkah berikutnya.

Percabangan/alternatif:
- Salin gagal (tautan tidak valid / verifikasi clipboard gagal): umpan balik gagal ditampilkan tanpa aksi "Buka Clash of Clans"; pengguna dapat memperbaiki tautan atau melapor tautan rusak.
- Game gagal dibuka (tidak terpasang / `launchUrl` gagal / `canLaunchUrl` false): aplikasi menampilkan umpan balik "Clash of Clans tidak terpasang. Tempel tautan secara manual."
- Pengguna menutup/melewatkan umpan balik tanpa mengetuk aksi: tautan tetap tersimpan di clipboard; pengguna dapat menempel manual di game.

Kondisi akhir yang diharapkan: pada setiap skenario (sukses, gagal, game tidak terpasang), pengguna tahu persis apa yang terjadi dan apa yang harus dilakukan berikutnya; persepsi "copy gagal" menurun.

## 5. Steps

**Konteks penggunaan:**
Digunakan sebagai daftar langkah kerja yang spesifik dan dapat diikuti untuk mewujudkan fitur pada PRD ini.

**Aturan pengisian:**
Buat langkah yang spesifik dan dapat diikuti; gunakan numbered list; setiap langkah harus tidak ambigu dan dapat dikerjakan; jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Baca implementasi yang ada: `base_coc/lib/fitur/detail_base/widget/konfirmasi_salin.dart` (`tampilkanKonfirmasiSalin`), `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` (baris 230–271, `_salinBase`), `base_coc/lib/fitur/detail_base/model/copy_base_result.dart`, dan `base_coc/lib/fitur/detail_base/service/clipboard_service.dart`.
2. Tambahkan petunjuk satu langkah pada konten umpan balik sukses (mis. teks "Buka Clash of Clans → editor layout → tempel tautan" pada `KonfirmasiSalin`/SnackBar); jaga agar konten tetap ringkas dan muat di SnackBar atau konten dua baris.
3. Pastikan aksi "Buka Clash of Clans" hanya tampil saat `hasil.sukses` dan `onBukaGame != null` (perilaku yang sudah ada; pertahankan).
4. Pertahankan umpan balik saat game gagal dibuka ("Clash of Clans tidak terpasang. Tempel tautan secara manual.") dan pastikan `context.mounted` dicek sebelum menampilkan SnackBar lanjutan.
5. Jangan menambah dependency baru; `share_global_saya` tidak tersedia di `base_coc`, sehingga SnackBar `ScaffoldMessenger` tetap sah untuk umpan balik sementara (skill `scaffold-struktur-layar` aturan 4 tidak berlaku).
6. Jangan mengubah alur salin/validasi/verifikasi yang sudah berjalan (`ClipboardService.salinBase`) di luar kebutuhan tampilan umpan balik.
7. Perbarui/tambah widget test di `base_coc/test/detail_base_test.dart` untuk memverifikasi kehadiran petunjuk satu langkah (contoh pola test yang sudah ada: test 'mengetuk Copy Base menampilkan konfirmasi salin', baris 173–197).
8. Jangan mengubah kode di luar lingkup item C6.
9. Verifikasi: `dart format`, `dart analyze`, dan `flutter test` (minimal `test/detail_base_test.dart`) dijalankan pada submodule `base_coc`.

Catatan kondisi aktual (penting untuk implementasi): implementasi parsial sudah ada di kode — SnackBar status salin + aksi "Buka Clash of Clans" + umpan balik game tidak terpasang + verifikasi clipboard. Yang belum ada adalah petunjuk satu langkah (poin 2). Status Implementasi PRD ini tetap `Belum Diimplementasikan` karena belum seluruh saran C6 terpenuhi dan PRD ini belum dieksekusi/diverifikasi.

## 6. File-File Terdampak

**Konteks penggunaan:**
Digunakan untuk mencatat berkas-berkas yang diperkirakan dibuat/diubah/dihapus dalam implementasi PRD ini, agar pelaksanaan dan review fokus pada berkas yang relevan.

**Aturan pengisian:**
Periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi file spesifik sesuai struktur proyek sebenarnya; tandai `Dibuat` / `Diubah` / `Dihapus`; jelaskan alasan dan tujuan perubahan; cantumkan hanya file yang terkait kebutuhan fitur; jika file belum dapat ditentukan, tandai sebagai belum diketahui — jangan menebak; perbarui daftar setelah analisis teknis atau implementasi bila ditemukan file terdampak tambahan.

**Isi:**

| Lokasi File | Status Perubahan | Deskripsi Perubahan |
| ----------- | ---------------- | ------------------- |
| `base_coc/lib/fitur/detail_base/widget/konfirmasi_salin.dart` | Diubah | Tambah petunjuk satu langkah pada konten umpan balik sukses (`tampilkanKonfirmasiSalin` dan/atau widget `KonfirmasiSalin`). |
| `base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart` | Diubah | Sesuaikan pemanggilan `tampilkanKonfirmasiSalin` bila konten/tanda tangan umpan balik berubah; `onBukaGame` dan alur `_salinBase` dipertahankan. |
| `base_coc/lib/fitur/detail_base/model/copy_base_result.dart` | Diubah | Hanya bila teks petunjuk dibawa melalui model pesan `CopyBaseResult` (opsional; alternatif: petunjuk statis di widget umpan balik). |
| `base_coc/lib/fitur/detail_base/service/clipboard_service.dart` | Tidak berubah / Diubah | Tidak perlu diubah untuk petunjuk satu langkah; diubah hanya bila alur buka game perlu penyesuaian kecil. Ditandai eksplisit agar tidak disentuh tanpa kebutuhan. |
| `base_coc/test/detail_base_test.dart` | Diubah | Perbarui/tambah verifikasi widget test atas petunjuk satu langkah pada umpan balik sukses. |
| `refrensi_apk.md` | Diubah | Penanda bahwa item C6 sudah dibuatkan PRD (lihat penanda pada bagian C6, Prioritas Gabungan baris 1155 dan 1199). |

Bukti tidak bertumpang tindih dengan PRD lain: folder `prd/` kosong pada saat PRD ini dibuat (PRD A2 "Copy base link satu ketuk" dan PRD C3 "Tombol aksi utama menetap" telah diimplementasikan dan dihapus mengikuti preseden), sehingga tidak ada PRD aktif lain yang menyentuh berkas-berkas di atas. File terdampak beririsan dengan PRD A2/C3 yang sudah selesai — bukan tumpang tindih aktif.

Referensi item pada `refrensi_apk.md`:
- `refrensi_apk.md` baris 736–742 — `#### C6. Umpan balik jelas setelah menyalin base` (bagian C, Prioritas Tinggi): pola yang diamati, tujuan UI/UX, referensi, saran, prioritas Tinggi.
- `refrensi_apk.md` baris 1155 — Prioritas Gabungan #4 (`| 4 | C6 Umpan balik setelah menyalin | UI/UX | ...`).
- `refrensi_apk.md` baris 1199 — Prioritas Gabungan #48 (`| 48 | C6 Umpan balik setelah menyalin | UI/UX | ...`).

Contoh potongan kode singkat kondisi aktual (bukan kode final; langkah implementasi di bagian 5):

```dart
// base_coc/lib/fitur/detail_base/widget/konfirmasi_salin.dart (kondisi aktual)
messenger.showSnackBar(
  SnackBar(
    content: Text(hasil.pesan),
    duration: const Duration(seconds: 4),
    action: hasil.sukses && onBukaGame != null
        ? SnackBarAction(label: 'Buka Clash of Clans', onPressed: onBukaGame)
        : null,
  ),
);
```

```dart
// base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart (kondisi aktual, baris 250–270)
tampilkanKonfirmasiSalin(
  context,
  hasil,
  onBukaGame: hasil.sukses
      ? () => widget.clipboardService.bukaGame(widget.base.baseLink).then((dibuka) {
          if (!dibuka && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Clash of Clans tidak terpasang. Tempel tautan secara manual.'),
              ),
            );
          }
        })
      : null,
);
```

Referensi kompetitor (tercantum pada item C6 `refrensi_apk.md` baris 740, diverifikasi via `webfetch` pada sesi ini):
- Base Drop — https://play.google.com/store/apps/details?id=com.cocbasedrop — "One-Tap Copy — Copy any COC base layout link directly into Clash of Clans"; "Open Clash of Clans and paste the base into your layout editor"; diperbarui 2026-11-15.
- ClasherPro (Base Layout Map) — https://play.google.com/store/apps/details?id=qtstudio.clashofclans.mapsmaster — "click 'copy base' and it opens and copies directly into the game!!!"; diperbarui 2026-09-25.
