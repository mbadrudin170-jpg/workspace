# Sesi 19 — Riset 10 APK Kompetitor untuk base_coc

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-14 (WIB)
- Topik: Riset referensi APK kompetitor untuk aplikasi `base_coc` dan pembaruan `apk_kompetitor.md` serta `refrensi_apk.md`.

## Catatan Sesi

- Membaca `README.md`, `AGENTS.md`, `apk_serupa.md`, dan `MEMORI.md`; memuat skill `riset-kompetitor`, `penggunaan-tool-question`, dan `memori-check`.
- Temuan awal: `apk_serupa.md` tidak ada di root proyek; `apk_kompetitor.md` dan `refrensi_apk.md` berukuran 0 byte dan sudah di-stage sebagai pengosongan isi. Katalog HEAD (`a4ecbaf`) bertema Spektra tidak dipakai ulang.
- Klarifikasi pengguna melalui tool `question`: katalog diisi baru, dan aplikasi sasaran riset adalah `base_coc` (penyedia base/layout Clash of Clans).
- Kondisi proyek: `base_coc` masih template `flutter create`; belum ada fitur penyedia base, pencarian, penyimpanan, tema, atau copy link.
- Riset Google Play Store: 10 kandidat APK sejenis diverifikasi dengan `curl` dan seluruhnya mengembalikan HTTP 200.
- Katalog `apk_kompetitor.md` diisi 10 listing berstatus `Sudah Dianalisa` setelah analisa.
- `refrensi_apk.md` ditulis dengan bagian A (15 rekomendasi fitur baru), B (2 arahan kualitas pra-implementasi), C (10 pola UI/UX), D katalog, E prioritas gabungan, F verifikasi/keterbatasan, dan G sumber. Seluruh item memuat tautan, tujuan, saran, dan prioritas.
- Keterbatasan dicatat eksplisit: pola UI/UX diidentifikasi dari deskripsi resmi dan ulasan halaman toko, bukan dari pembacaan piksel tangkapan layar atau pengujian APK langsung.
- Tidak ada kode Dart yang diubah; tidak ada commit yang dibuat.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `apk_kompetitor.md` | Diubah | Diisi ulang dengan 10 listing Google Play Store untuk `base_coc`, seluruhnya `Sudah Dianalisa`. |
| `refrensi_apk.md` | Diubah | Laporan riset 10 APK: rekomendasi fitur, pra-implementasi, UI/UX, katalog, prioritas, verifikasi, sumber. |
| `MEMORI.md` | Diubah | Memperbarui bagian `Status Kerja` dan `Riset Kompetitor`. |
| `memori/riwayat_perubahan.md` | Diubah | Entri riset 10 APK kompetitor untuk `base_coc`. |
| `memori/sesi/sesi_19.md` | Dibuat | Berkas sesi aktif. |

## Sinkronisasi ke MEMORI.md

- Memperbarui `Status Kerja`: `refrensi_apk.md` kini berisi riset 10 APK kompetitor untuk `base_coc`, bukan Spektra.
- Memperbarui bagian `Riset Kompetitor`: aplikasi sasaran `base_coc`, katalog berisi 10 listing Google Play Store, seluruhnya `Sudah Dianalisa`, dan `apk_serupa.md` tidak ditemukan.
