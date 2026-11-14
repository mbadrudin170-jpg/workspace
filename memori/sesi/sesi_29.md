# Sesi 29

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sat Nov 14 2026 (WIB)
- Topik: Membuat workflow GitHub Actions untuk build APK debug pada submodule base_coc

## Catatan Sesi

- Pengguna meminta cara membuat workflow untuk build APK; dipilih GitHub Actions CI/CD.
- Lokasi: submodule `base_coc/.github/workflows/build-apk.yml`.
- Jenis build: debug APK (tanpa signing).
- Trigger: push dan pull request ke branch `main`.
- Isi workflow: checkout, setup Flutter 3.47.9 (stable, cache), pub get, flutter analyze, flutter test, flutter build apk --debug, upload artifact `app-debug-apk` (retensi 14 hari).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `base_coc/.github/workflows/build-apk.yml` | Dibuat | Workflow GitHub Actions build APK debug |
| `memori/sesi/sesi_29.md` | Dibuat | Catatan sesi ini |
| `memori/riwayat_perubahan.md` | Diubah | Entri pembuatan workflow build APK |

## Sinkronisasi ke MEMORI.md

- `MEMORI.md` bagian `Status Kerja` ditambahkan catatan pembuatan `base_coc/.github/workflows/build-apk.yml`.
- `memori/riwayat_perubahan.md` diberi entri pembuatan workflow build APK.
- Tidak ada berkas sesi `Sudah Sinkron` yang diubah.
