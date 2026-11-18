diperbarui : Thu Nov 19 2026 03:20 WIB
file : [aturan-pubspec](../../.agents/skills/non-code/aturan-pubspec/SKILL.md)

1. Menambahkan paket wajib memakai `flutter pub add`; dilarang menambahkan paket secara manual ke `pubspec.yaml`.
2. Menghapus paket wajib memakai `flutter pub remove`.
3. `pubspec.yaml` hanya boleh disunting manual bila `flutter pub add`/`flutter pub remove` tidak dapat menangani kasusnya (mis. dependensi `path:`/`git:`), atau bila hanya memindahkan posisi entri demi urutan abjad `dependencies`/`dev_dependencies` sesuai skill `pengurutan-paket-pubspec` (tanpa mengubah nama/versi paket); selain itu wajib memakai kedua perintah tersebut. Setelah penyuntingan manual, wajib verifikasi `flutter pub get` berhasil.
4. Upgrade paket wajib memakai `flutter pub upgrade` (hanya memajukan versi di dalam constraint `pubspec.yaml`); dilarang upgrade ke versi mayor tanpa persetujuan pengguna.
5. Jika terjadi konflik versi atau masalah apa pun terkait paket, wajib tanyakan ke pengguna terlebih dahulu.
6. jika pengguna tidak memberikan paket spesifik untuk di install maka baca isi file `docs/paket_favorit.md` dan baca terlebih dahulu apakah masalah yang diatasi paket bisa menyelesaikan masalah yang sedang di alami pengguna, kalau tidak ada baru cari di pub dev.
