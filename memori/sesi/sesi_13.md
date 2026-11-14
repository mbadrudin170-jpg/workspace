# Sesi 13 — Instalasi riverpod_lint pada Submodule

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-14 (WIB)
- Topik: Menambahkan `riverpod_lint` pada submodule `share_global_saya` dan `base_coc`.

## Catatan Sesi

- Membaca `MEMORI.md` dan `AGENTS.md`; memuat skill `memori-check` dan `pengurutan-paket-pubspec`.
- Catch-up sync: `memori/sesi/sesi_12.md` berstatus `Belum Sinkron` dan yatim/kosong (tidak ada perubahan proyek nyata) → ditandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan". Berkas `sesi_1.md` s.d. `sesi_11.md` sudah `Sudah Sinkron`.
- Berkas sesi ini dibuat sebagai nomor tertinggi (12) + 1.
- Permintaan pengguna: instal `riverpod_lint` di `share_global_saya` dan `base_coc`.
- `riverpod_lint` 3.2.0 memakai mekanisme `analysis_server_plugin`; konfigurasi dipasang melalui `plugins:` pada `analysis_options.yaml`.
- Catch-up sync (2026-11-14 06:55): verifikasi working tree submodule bersih; perubahan `riverpod_lint` sudah ter-commit di repo submodule (`share_global_saya` `c59ed5b`, `base_coc` `ad79bd6`), sedangkan pointer submodule di root belum diperbarui.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `memori/sesi/sesi_12.md` | Diubah | Catch-up sync: status `Belum Sinkron` → `Sudah Sinkron` dengan catatan tidak ada perubahan untuk disinkronkan. |
| `share_global_saya/pubspec.yaml` | Diubah | Menambahkan `riverpod_lint: ^3.2.0` pada `dev_dependencies`. |
| `share_global_saya/analysis_options.yaml` | Diubah | Menambahkan konfigurasi `plugins:` untuk `riverpod_lint: ^3.2.0`. |
| `share_global_saya/pubspec.lock` | Diubah | Hasil `pub get` untuk `riverpod_lint` dan dependensinya. |
| `base_coc/pubspec.yaml` | Diubah | Menambahkan `riverpod_lint: ^3.2.0` pada `dev_dependencies`. |
| `base_coc/analysis_options.yaml` | Diubah | Menambahkan konfigurasi `plugins:` untuk `riverpod_lint: ^3.2.0`. |
| `base_coc/pubspec.lock` | Diubah | Hasil `pub get` untuk `riverpod_lint` dan dependensinya. |
| `memori/sesi/sesi_13.md` | Dibuat | Berkas sesi aktif. |

## Sinkronisasi ke MEMORI.md

- `Status Kerja`: menambahkan catatan pemasangan `riverpod_lint` 3.2.0 di submodule `share_global_saya` dan `base_coc` beserta hash commit submodule dan status pointer yang belum diperbarui.
- `memori/riwayat_perubahan.md`: entri catch-up sync sesi 13.
- Catch-up sync: `memori/sesi/sesi_12.md` ditandai `Sudah Sinkron` (tidak ada perubahan untuk disinkronkan).
