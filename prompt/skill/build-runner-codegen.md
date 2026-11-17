diperbarui : Tue Nov 17 2026 16:59 WIB
file : [build-runner-codegen](../../.agents/skills/code/build-runner-codegen/SKILL.md)

1. Jalankan dari direktori proyek/paket yang memiliki `pubspec.yaml` (mis. `cd <direktori-proyek>`).
2. Setelah ubah/menambah sumber codegen (Freezed, Riverpod `@riverpod`/`@Riverpod`, `@GenerateMocks`, `@JsonSerializable`) atau setelah pull yang mengubah berkas hasil generate, jalankan `dart run build_runner build --delete-conflicting-outputs`.
3. Gunakan `watch --delete-conflicting-outputs` hanya saat pengembangan; gunakan `build` untuk sekali jalan.
4. Ubah hanya berkas sumber; `*.g.dart`, `*.freezed.dart`, `*.mocks.dart` dilarang diedit manual.
5. Jika output bentrok, hapus berkas hasil generate yang bentrok/terkait lalu jalankan ulang dengan `--delete-conflicting-outputs`.
6. Jalankan `build_runner` pada paket terdampak; bila perlu membatasi keluaran, gunakan `--build-filter` dengan glob berkas hasil generate yang valid (mis. `--build-filter="lib/kopi.g.dart"` atau `--build-filter="lib/kopi.freezed.dart"`), bukan argumen path berkas sumber.
