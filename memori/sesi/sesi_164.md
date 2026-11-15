# Sesi 164 — Menjalankan build APK lewat CI (GitHub Actions)

## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: Mon Nov 16 2026 (WIB; UTC ~20:34–20:47)
- Command: interaksi langsung (tanpa command)
- Topik: menjalankan build APK `base_coc` lewat terminal mengikuti pola `script/build_apk.sh` (workflow `build-apk.yml` GitHub Actions)

## Catatan Sesi
- `MEMORI.md` dibaca (header `Diperbarui: Mon Nov 16 2026 03:47 WIB (sesi 163)` pada awal sesi — catatan: slot sesi 163 sudah diklaim sesi paralel lain (topik `diskusi_fitur_baru` C38) yang commit-nya memuat `memori/sesi/sesi_163.md` versi paralel; sesi ini (build APK CI) dialihkan ke nomor **164** agar tidak menimpa berkas sesi paralel).
- Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron$` menemukan `sesi_81`, `sesi_122`, `sesi_123`, `sesi_139`, `sesi_147`, `sesi_150` (keputusan pengguna sesi 131–132: biarkan apa adanya — tidak disentuh) serta `sesi_162.md` (sesi paralel `analisa_commit_skill`, dibuat ~UTC 20:31 — tidak disentuh, dilaporkan). `sesi_161.md` dan `sesi_163.md` (versi paralel) sudah `Sudah Sinkron` — tidak disentuh.
- Arah pengguna: "jalankan lewat terminal dan gunakan contoh seperti yang ada di @script/build_apk.sh".
- Fakta terverifikasi sebelum menjalankan:
  - `script/build_apk.sh` memicu workflow `build-apk.yml` di repo `mbadrudin170-jpg/base_coc` (ref `main`), menunggu run baru, `gh run watch --exit-status`, lalu mengunduh artefak `app-release-apk` ke `apk/`.
  - Workflow `.github/workflows/build-apk.yml` (remote = `main`): Flutter 3.47.9 stable, `flutter pub get`, `flutter analyze`, `flutter build apk --release` (**bukan** `--split-per-abi --target-platform android-arm64` — berbeda dari konfigurasi yang dipilih pengguna untuk command `build_apk` sesi 161), artefak `app-release-apk` → `build/app/outputs/flutter-apk/app-release.apk`, retention 14 hari.
  - `gh` terpasang dan terautentikasi (akun `mbadrudin170-jpg`, scope `repo` + `workflow`).
  - `base_coc` pada `main...origin/main` (tidak ada commit yang belum ter-push; CI membangun `main` remote).
- Pelaksanaan:
  - Run pertama `43758932387` (commit `45ae356`) gagal di langkah **Analisis statis** (`flutter analyze`): 1 issue, `asset_directory_does_not_exist` — direktori `assets/images/bases/` kosong sehingga tidak ikut ter-commit ke git, maka tidak ada di checkout CI.
  - Atas jawaban pengguna via `question`: (a) tambahkan `assets/images/bases/.gitkeep`, commit + push ke `base_coc`, lalu jalankan ulang CI; (b) sesuaikan workflow menjadi `flutter build apk --release --split-per-abi --target-platform android-arm64` + artefak `app-arm64-v8a-release.apk` (agar selaras dengan target yang dipilih).
  - Commit `95fd70e` (`fix(assets): tambahkan .gitkeep agar folder aset kosong ikut ter-commit`) dan `007b854` (`ci(build): bangun APK release arm64 dengan split-per-abi`) dibuat dan di-push ke `origin/main` (2 commit; working tree bersih).
  - Run kedua `43759408058` (commit `007b854`) **berhasil** (conclusion `success`): checkout → Flutter 3.47.9 → pub get → analyze → build → upload artefak.
  - Artefak diunduh ke `apk/app-arm64-v8a-release.apk` (18.024.645 bytes / ~17,2 MiB).
- Tidak ada perubahan kode Dart/fungsional; hanya penambahan `.gitkeep` dan penyesuaian workflow CI. Tidak ada commit/push di repo root workspace (perubahan commit/push hanya di submodule `base_coc` atas perintah pengguna).

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| base_coc/assets/images/bases/.gitkeep | Dibuat | Agar folder aset kosong ikut ter-commit ke git (commit `95fd70e` di submodule `base_coc`) |
| base_coc/.github/workflows/build-apk.yml | Diubah | Langkah build & artefak disesuaikan ke release + split-per-abi + arm64 (commit `007b854` di submodule `base_coc`) |
| apk/app-arm64-v8a-release.apk | Dibuat (lokal) | Artefak CI run `43759408058` diunduh ke root workspace (gitignored/lokal; bukan ter-commit) |
| memori/sesi/sesi_164.md | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md
Belum disinkronkan
