# Sesi 63

## Status

- Status Sinkron: Sudah Sinkron (catch-up sesi 65)
- Tanggal: 2026-11-19
- Command: interaksi langsung (tanpa command)
- Topik: Membuat data dummy untuk seluruh model tabel pada `admin_wifi`

## Catatan Sesi

- Catch-up sync awal sesi: berkas `memori/sesi/*.md` berstatus `Belum Sinkron` dari sesi sebelumnya (antara lain sesi_45–sesi_49, sesi_52, sesi_55, sesi_56) masih ambigu/paralel dan tidak disentuh; dilaporkan ke pengguna sesuai aturan `memori-check`.
- Dibuat 9 berkas dummy baru mengikuti pola `data-dummy`:
  - `admin_wifi/lib/fitur/dompet/dummy/dompet_dummy.dart`
  - `admin_wifi/lib/fitur/kategori/dummy/kategori_dummy.dart`
  - `admin_wifi/lib/fitur/kategori/dummy/sub_kategori_dummy.dart`
  - `admin_wifi/lib/fitur/kritik_saran/dummy/kritik_saran_dummy.dart`
  - `admin_wifi/lib/fitur/pengaturan/dummy/pengaturan_dummy.dart`
  - `admin_wifi/lib/fitur/pesanan/dummy/pesanan_dummy.dart`
  - `admin_wifi/lib/fitur/status_unggah/dummy/status_unggah_dummy.dart`
  - `admin_wifi/lib/fitur/transaksi/dummy/transaksi_dummy.dart`
  - `admin_wifi/lib/fitur/versi_apk_user/dummy/versi_apk_user_dummy.dart`
- Dummy yang berelasi memakai konstanta ID yang sama nilainya dengan dummy sumber (dompet, kategori/sub kategori, pelanggan, paket, transaksi).
- DummyHelper diperbarui untuk menyisipkan, menghapus, dan mereset semua dummy baru sesuai urutan referensi (paket, pelanggan, dompet, kategori, sub kategori, pengaturan, status unggah, versi apk user, pesanan, kritik saran, transaksi, pelanggan aktif).
- Dihapus `admin_wifi/lib/widget/nama_dari_id.dart`; 2 pemakaian di `kritik_saran.dart` dan `detail_kritik_saran.dart` diganti ke `NamaPelangganWidget`.
- Dipindahkan `riwayat_aktivasi_paket.dart` dan `form_edit_riwayat_langganan.dart` ke `lib/fitur/riwayat_langganan/screens/`; impor di `lainnya.dart` diperbarui.
- Refaktor `pelanggan_aktif_screen.dart`: state async (`ref.watch`) dipindah ke `build`; `_buildBody` kini hanya menerima parameter state (`PelangganState`, `PaketState`, `PelangganAktifState`).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| admin_wifi/lib/fitur/dompet/dummy/dompet_dummy.dart | Dibuat | Data dummy DompetModel |
| admin_wifi/lib/fitur/kategori/dummy/kategori_dummy.dart | Dibuat | Data dummy KategoriModel |
| admin_wifi/lib/fitur/kategori/dummy/sub_kategori_dummy.dart | Dibuat | Data dummy SubKategoriModel |
| admin_wifi/lib/fitur/kritik_saran/dummy/kritik_saran_dummy.dart | Dibuat | Data dummy KritikSaranModel |
| admin_wifi/lib/fitur/pengaturan/dummy/pengaturan_dummy.dart | Dibuat | Data dummy PengaturanModel |
| admin_wifi/lib/fitur/pesanan/dummy/pesanan_dummy.dart | Dibuat | Data dummy PesananModel |
| admin_wifi/lib/fitur/status_unggah/dummy/status_unggah_dummy.dart | Dibuat | Data dummy StatusUnggahModel |
| admin_wifi/lib/fitur/transaksi/dummy/transaksi_dummy.dart | Dibuat | Data dummy TransaksiModel |
| admin_wifi/lib/fitur/versi_apk_user/dummy/versi_apk_user_dummy.dart | Dibuat | Data dummy VersiApkUserModel |
| admin_wifi/lib/app.dart | Diubah | Menghapus blok localizationsDelegates manual (material_ui menyediakan delegasi bawaan) |
| admin_wifi/lib/app.dart | Diubah | `appBarTheme.titleTextStyle` diberi warna putih agar judul tidak hitam |

| admin_wifi/lib/widget/nama_dari_id.dart | Dihapus | Duplikat NamaPelangganWidget; pemakaian diganti |

| admin_wifi/lib/fitur/riwayat_langganan/screens/form_edit_riwayat_langganan.dart | Dipindahkan | Dari lib/halaman/form/ |
| admin_wifi/lib/fitur/riwayat_langganan/screens/riwayat_aktivasi_paket.dart | Dipindahkan | Dari lib/halaman/lainnya/ |
| admin_wifi/lib/halaman/tab/lainnya.dart | Diubah | Impor riwayat_aktivasi_paket diperbarui |
| admin_wifi/lib/fitur/kritik_saran/screens/kritik_saran.dart | Diubah | Pemakaian NamaPelangganWidget menggantikan NamaDariIdWidget |
| admin_wifi/lib/fitur/kritik_saran/screens/detail_kritik_saran.dart | Diubah | Pemakaian NamaPelangganWidget menggantikan NamaDariIdWidget |
| admin_wifi/lib/dummy/dummy_helper.dart | Diubah | Integrasi seluruh dummy baru ke DummyHelper |
| admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart | Diubah | Refaktor `_buildBody`, pindah helper di bawah `build`, format tanggal ringkas |
| memori/sesi/sesi_63.md | Dibuat | Berkas sesi aktif |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan
