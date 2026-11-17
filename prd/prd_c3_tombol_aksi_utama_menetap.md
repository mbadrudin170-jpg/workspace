**Status Dokumen:** Final
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek.

**Aturan pengisian:**
Isi sesuai kondisi proyek yang sebenarnya; jangan mengarang.

**Informasi:**

- Nama aplikasi: berhenti_merokok (root workspace induk; aplikasi Flutter pada submodule `base_coc`)
- Deskripsi produk: Aplikasi katalog base Clash of Clans dengan fitur salin base link satu ketuk dan UI/UX pendukung.
- Platform: Flutter (Android)
- Versi: Belum diketahui
- Status pengembangan: Belum Diimplementasikan (fitur C3 belum terimplementasi)

## 2. Tujuan PRD

**Konteks penggunaan:**
Hasil yang diharapkan dari PRD ini.

**Aturan pengisian:**
Tujuan jelas dan dapat dievaluasi, berhubungan langsung dengan kebutuhan dokumen.

**Isi:**

- Memastikan layar detail base memiliki tombol aksi utama ("Copy Base") yang selalu terlihat sehingga pengguna dapat menyelesaikan tugas utama tanpa menggulir mencari tombol.
- Menetapkan penempatan, perilaku, dan respons aplikasi untuk aksi utama pada layar detail.

## 3. Daftar Fitur

**Konteks penggunaan:**
Satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah.

**Aturan pengisian:**
Prioritas `Must Have`, `Should Have`, atau `Could Have`.

| Fitur                                        | Deskripsi                                                                                                | Prioritas   |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ----------- |
| Tombol "Copy Base" menetap pada layar detail | Tombol aksi utama selalu terlihat di bagian bawah layar detail base (bottomNavigationBar/SafeArea bawah) | Must Have   |
| Gambar base di area utama + metadata ringkas | Preview besar base di area utama dengan metadata ringkas di bawahnya                                     | Should Have |

## 4. Alur Pengguna

**Konteks penggunaan:**
Mulai dari kondisi awal pengguna; jelaskan langkah berurutan; sertakan percabangan/alternatif; kondisi akhir.

**Aturan pengisian:**
Alur sesuai persyaratan fitur; jangan memasukkan proses yang tidak didukung.

**Isi:**

1. Pengguna membuka layar detail sebuah base.
2. Aplikasi menampilkan gambar base di area utama dan metadata ringkas di bawahnya.
3. Tombol "Copy Base" tampil menetap di bagian bawah layar (bottomNavigationBar/SafeArea bawah) dan selalu terlihat tanpa menggulir.
4. Pengguna menekan tombol "Copy Base".
5. Aplikasi menyalin tautan base ke clipboard dan menampilkan umpan balik (lihat PRD C6 bila ada).
6. Kondisi akhir: tautan tersalin dan pengguna menerima konfirmasi; tombol tetap tersedia untuk penyalinan ulang.

Alternatif: jika gambar/metadata belum dimuat, tombol tetap tersedia (disabled state tidak diperlukan) namun aksi copy tetap dapat dijalankan bila tautan base tersedia.

## 5. Steps

**Konteks penggunaan:**
Langkah spesifik dan dapat diikuti.

**Aturan pengisian:**
Numbered list; tidak ambigu; dapat dikerjakan.

1. Identifikasi layar detail base pada submodule `base_coc` (file terdampak, lihat bagian 6).
2. Tempatkan widget gambar base pada area utama dan metadata ringkas di bawahnya.
3. Tambahkan tombol "Copy Base" pada `bottomNavigationBar` atau `SafeArea` bawah agar selalu terlihat.
4. Hubungkan tombol ke layanan salin tautan base (ClipboardService) yang sudah tersedia (fitur A2).
5. Tambahkan umpan balik setelah penyalinan (lihat PRD C6 bila ada) tanpa mengubah perilaku tombol menetap.
6. Verifikasi dengan `dart format`, `dart analyze`, dan `flutter test`.

## 6. File-File Terdampak

**Konteks penggunaan:**
Cantumkan lokasi file spesifik sesuai struktur proyek sebenarnya.

**Aturan pengisian:**
Tandai `Dibuat`/`Diubah`/`Dihapus`; jelaskan alasan; hanya file terkait; jika belum dapat ditentukan, tandai belum diketahui.

| Lokasi File                                                    | Status Perubahan | Deskripsi Perubahan                                                          |
| -------------------------------------------------------------- | ---------------- | ---------------------------------------------------------------------------- |
| base_coc/lib/fitur/detail_base/screens/detail_base_screen.dart | Diubah           | Tambahkan tombol "Copy Base" menetap pada bottomNavigationBar/SafeArea bawah |
| base_coc/lib/fitur/detail_base/widgets/ (belum diketahui)      | Diubah           | Penyesuaian tata letak gambar base dan metadata ringkas                      |
| Belum diketahui                                                | Belum diketahui  | File tambahan akan ditentukan setelah analisis teknis implementasi           |

Referensi sumber: `refrensi_apk.md` baris 712–718 (#### C3. Layar detail dengan tombol aksi utama yang menetap) dan baris 1154 (prioritas gabungan C3).
