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

- Nama aplikasi: base_coc
- Deskripsi produk: aplikasi penyedia base/layout Clash of Clans (fan app) berbasis Flutter.
- Platform: Android (mobile)
- Versi: 1.0.0+1 (pubspec.yaml)
- Status pengembangan: Fitur galeri base (A1) belum diimplementasikan; aplikasi masih counter bawaan.

## 2. Tujuan PRD

**Konteks penggunaan:**
Digunakan untuk menentukan hasil yang ingin dicapai dari dokumen PRD ini. Tujuan harus berhubungan langsung dengan kebutuhan dokumen.

**Aturan pengisian:**

- Tuliskan hasil yang diharapkan dari PRD.
- Pastikan setiap tujuan memiliki hubungan dengan kebutuhan dokumen PRD.
- Gunakan tujuan yang jelas dan dapat dievaluasi.
- Jangan memasukkan tujuan yang berada di luar ruang lingkup PRD.

**Isi:**
Mendefinisikan fitur "Copy base link satu ketuk" (item A2 pada `refrensi_apk.md` baris 61-67) agar pengguna dapat menyalin tautan base ke clipboard, mendapat konfirmasi, dan membuka Clash of Clans dengan satu aksi. Fitur ini adalah inti nilai aplikasi dan alasan utama pengguna memasang aplikasi sejenis; keandalan copy menentukan reputasi aplikasi.

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
| Copy base link satu ketuk | Salin tautan resmi base ke clipboard, tampilkan konfirmasi dengan tombol "Buka Clash of Clans", tangani kasus game tidak terpasang. | Must Have |
| Validasi tautan base | Validasi format tautan saat data dimuat; sediakan fallback salin manual; tampilkan status berhasil/gagal yang jelas. | Must Have |
| Pembukaan game | Buka Clash of Clans via intent/URL scheme jika terpasang; jika tidak, tampilkan petunjuk. | Should Have |

Isi fitur (dari `refrensi_apk.md` baris 61-67):

- Temuan: Kompetitor menjadikan tombol copy sebagai aksi utama; deskripsi menekankan "one-tap copy" dan pembukaan otomatis ke game.
- Tujuan fitur: menghilangkan pekerjaan menyusun ulang layout secara manual, yang merupakan alasan utama pengguna memasang aplikasi sejenis.
- Referensi: [Maps For COC Base Layouts 2026](https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps), [Base Drop](https://play.google.com/store/apps/details?id=com.cocbasedrop), [Map Layout Links Base for COC](https://play.google.com/store/apps/details?id=com.coc.layouts).
- Saran: salin tautan resmi ke clipboard, tampilkan konfirmasi berisi tombol "Buka Clash of Clans", dan tangani kasus game tidak terpasang. Uji tautan sebelum rilis karena tautan invalid adalah keluhan utama pada kompetitor.
- Prioritas: Tinggi.

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
1. Pengguna membuka layar detail base (dari galeri, di luar cakupan PRD ini).
2. Pengguna mengetuk tombol "Copy Base" yang menetap di area bawah layar.
3. Aplikasi menyalin tautan base ke clipboard.
4. Aplikasi menampilkan SnackBar/dialog singkat: status salin, tombol "Buka Clash of Clans", dan petunjuk satu langkah.
5. Jika game terpasang, pengguna dapat membuka Clash of Clans dari tombol.
6. Jika game tidak terpasang, tampilkan petunjuk manual menempelkan tautan.
7. Jika tautan invalid, tampilkan status gagal dan fallback salin manual.

## 5. Steps

**Konteks penggunaan:**
Digunakan untuk menjelaskan urutan langkah-langkah kerja yang harus diikuti dalam mengisi atau menerapkan PRD.

**Aturan pengisian:**

- Buat langkah-langkah yang spesifik dan dapat diikuti.
- Gunakan numbered list untuk mempertahankan urutan.
- Setiap langkah harus tidak ambigu dan dapat dikerjakan.
- Jangan memasukkan langkah yang tidak relevan atau redundan.

**Isi:**

1. Buat service clipboard (salin tautan, cek hasil).
2. Buat utilitas validasi format tautan base.
3. Buat layar detail base dengan tombol aksi utama menetap.
4. Implementasikan SnackBar/dialog konfirmasi pasca-salin.
5. Implementasikan pembukaan game via intent/URL scheme dengan penanganan game tidak terpasang.
6. Tambahkan test untuk copy, validasi, dan fallback.

Contoh kode singkat implementasi (ilustrasi, bukan final):

```dart
// Salin tautan dan umpan balik
Future<void> salinBase(BuildContext context, String link) async {
  if (!validasiLinkBase(link)) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tautan base tidak valid')),
      );
    }
    return;
  }
  await Clipboard.setData(ClipboardData(text: link));
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Tautan disalin'),
        action: SnackBarAction(label: 'Buka CoC', onPressed: bukaGame),
      ),
    );
  }
}
```

```dart
// Validasi format tautan base
bool validasiLinkBase(String link) {
  final uri = Uri.tryParse(link);
  return uri != null && (uri.scheme == 'https' || uri.scheme == 'http') && uri.host.isNotEmpty;
}
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
| base_coc/lib/fitur/detail_base/model/copy_base_result.dart | Dibuat | Hasil operasi copy (sukses/gagal, pesan). |
| base_coc/lib/fitur/detail_base/screen/detail_base_screen.dart | Dibuat | Layar detail base dengan tombol "Copy Base" menetap di bawah. |
| base_coc/lib/fitur/detail_base/service/clipboard_service.dart | Dibuat | Service salin tautan, validasi, dan pembukaan game. |
| base_coc/lib/fitur/detail_base/widget/konfirmasi_salin.dart | Dibuat | SnackBar/dialog konfirmasi pasca-salin. |
| base_coc/lib/core/util/validasi_link_base.dart | Dibuat | Validasi format tautan base. |
| base_coc/test/detail_base_test.dart | Dibuat | Test copy, validasi, dan fallback game tidak terpasang. |

Referensi sumber: `refrensi_apk.md` baris 61-67 (item A2). Link APK rujukan: https://play.google.com/store/apps/details?id=com.baselayouts.cocmaps, https://play.google.com/store/apps/details?id=com.cocbasedrop, https://play.google.com/store/apps/details?id=com.coc.layouts.
