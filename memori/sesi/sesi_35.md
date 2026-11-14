# Sesi 35

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sat Nov 14 2026 (WIB)
- Topik: Mengubah workflow menjadi build APK release

## Catatan Sesi

- `base_coc/.github/workflows/build-apk.yml`: `flutter build apk --debug` → `flutter build apk --release`; nama artefak `app-debug-apk` → `app-release-apk`; path artefak `app-release.apk`; nama job diubah menjadi `Build APK release`.
- Catatan: release build masih memakai signing debug (`android/app/build.gradle.kts` — `signingConfig = signingConfigs.getByName("debug")`); untuk rilis produksi perlu keystore signing.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `base_coc/.github/workflows/build-apk.yml` | Diubah | Release build |
| `memori/sesi/sesi_35.md` | Dibuat | Catatan sesi ini |

## Sinkronisasi ke MEMORI.md

- Tidak ada perubahan struktur MEMORI.md.
- Tidak ada berkas sesi `Sudah Sinkron` yang diubah.
