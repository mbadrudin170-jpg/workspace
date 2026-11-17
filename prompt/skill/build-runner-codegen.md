diperbarui : Tue Nov 17 2026 16:46 WIB
file : [build-runner-codegen](../../.agents/skills/custom/build-runner-codegen/SKILL.md)

1. Jalankan `dart run build_runner build --delete-conflicting-outputs` setelah mengubah/menambah model Freezed, notifier Riverpod (`@riverpod`/`@Riverpod`), `@GenerateMocks`, `@JsonSerializable`, atau setelah pull branch yang mengubah berkas generated.
2. Mode `watch --delete-conflicting-outputs` hanya untuk development; `build` untuk sekali jalan.
3. Ubah sumber (`.dart` biasa) saja; berkas `*.g.dart`, `*.freezed.dart`, `*.mocks.dart` DILARANG diedit manual.
4. Bila bentrok output, hapus berkas generated lalu jalankan ulang dengan `--delete-conflicting-outputs`.
5. DILARANG commit berkas generated tanpa perubahan sumber; DILARANG meng-ignore berkas generated di `.gitignore` karena dipakai CI.
6. Opsi builder (Freezed, `riverpod_generator`) diatur pada `build.yaml` di root proyek.