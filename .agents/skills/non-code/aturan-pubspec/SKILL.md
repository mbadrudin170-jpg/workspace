---
name: aturan-pubspec
description: Trigger: saat menambah, menghapus, atau meng-upgrade paket pada pubspec.yaml, atau mengurutkan dependensi pubspec.yaml secara abjad | Panduan pengelolaan paket Flutter/Dart: `flutter pub add`/`remove`/`pub upgrade`, larangan penyuntingan manual pubspec.yaml (kecuali kasus `path:`/`git:` dan reorder urutan abjad sesuai `pengurutan-paket-pubspec`), dan kewajiban bertanya ke pengguna saat konflik.
---

# Aturan Pubspec

1. Menambahkan paket wajib memakai `flutter pub add`; dilarang menambahkan paket secara manual ke `pubspec.yaml`.
2. Menghapus paket wajib memakai `flutter pub remove`.
3. `pubspec.yaml` hanya boleh disunting manual bila `flutter pub add`/`flutter pub remove` tidak dapat menangani kasusnya (mis. dependensi `path:`/`git:`), atau bila hanya memindahkan posisi entri demi urutan abjad `dependencies`/`dev_dependencies` sesuai skill `pengurutan-paket-pubspec` (tanpa mengubah nama/versi paket, tidak menambah/menghapus paket); selain itu wajib memakai kedua perintah tersebut. Setelah penyuntingan manual, wajib verifikasi `flutter pub get` berhasil.
4. Upgrade paket wajib memakai `flutter pub upgrade` (hanya memajukan versi di dalam constraint `pubspec.yaml`); dilarang upgrade ke versi mayor tanpa persetujuan pengguna (mis. `flutter pub upgrade --major-versions`).
5. Jika terjadi konflik versi atau masalah apa pun terkait paket, wajib tanyakan ke pengguna terlebih dahulu.

## Contoh Benar

```bash
flutter pub add http
flutter pub remove http
flutter pub upgrade
```

## Contoh Salah

```yaml
# pubspec.yaml — DILARANG: menambahkan paket manual
dependencies:
  http: ^1.2.0
```

## Sumber Evaluasi

- Permintaan eksplisit pengguna (sesi 29, 2026-11-18): 5 poin aturan pengelolaan paket pubspec.
- Sesi 48 (2026-11-19): revisi Butir 3 + perluasan trigger `description` — pengecualian eksplisit penyuntingan manual `pubspec.yaml` untuk reorder urutan abjad (temuan transkrip `ses_e0ff43aabffeZAT9lQX9Ao60Av`: ambiguitas antara larangan penyuntingan manual dan kewajiban `pengurutan-paket-pubspec`; `flutter pub add` tidak menghasilkan urutan abjad). Atas persetujuan pengguna.
