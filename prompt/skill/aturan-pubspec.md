diperbarui : Wed Nov 18 2026 05:50 WIB
file : [aturan-pubspec](../../.agents/skills/non-code/aturan-pubspec/SKILL.md)

1. Menambahkan paket wajib memakai `flutter pub add`; dilarang menambahkan paket secara manual ke `pubspec.yaml`.
2. Menghapus paket wajib memakai `flutter pub remove`.
3. `pubspec.yaml` hanya boleh disunting manual bila `flutter pub add`/`flutter pub remove` tidak dapat menangani kasusnya (mis. dependensi `path:`/`git:`); selain itu wajib memakai kedua perintah tersebut.
4. Upgrade paket wajib memakai `flutter pub upgrade` (hanya memajukan versi di dalam constraint `pubspec.yaml`); dilarang upgrade ke versi mayor tanpa persetujuan pengguna.
5. Jika terjadi konflik versi atau masalah apa pun terkait paket, wajib tanyakan ke pengguna terlebih dahulu.
