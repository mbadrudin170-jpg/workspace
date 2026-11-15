# Hasil Diskusi 5 — Mengapa agen AI tidak menggunakan mocktail saat membuat test

## Status

- Dokumen: Final
- Implementasi: Sudah Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Analisa penyebab agen AI (Kilo) tidak menggunakan `package:mocktail` saat membuat test, dan rekomendasi agar mocktail dipakai sesuai aturan proyek.

## Latar Belakang

Pengguna mengamati bahwa agen AI ketika membuat test (mis. `base_coc/test/widget_test.dart`) tidak menggunakan `package:mocktail`, padahal aturan proyek (`share_global_saya/docs/aturan/aturan_testing.md`) menyatakan "mockito : untuk testing gunakan paket mockito." (aturan lama; seharusnya mocktail). Skill `pola-testing` juga menyebut mockito generate mocks. Diskusi ini menganalisa penyebab dan menyusun rekomendasi.

## Poin Diskusi

### 1. Konteks kode dan aturan yang ada

- Tanya: Aturan dan skill mana yang mengatur penggunaan mocktail?
- Kesimpulan: `aturan_testing.md` (share_global_saya) mewajibkan mockito (perlu diperbarui ke mocktail); skill `pola-testing` section 4 mewajibkan mock repository/service (bukan Notifier/Provider) dan dummy data; skill bawaan `dart-generate-test-mocks` menjelaskan `@GenerateMocks` + build_runner (mockito). Namun, aturan ini tidak otomatis terbaca agen AI kecuali skill/aturan dimuat ke konteks.

### 2. Test yang ada di proyek

- Tanya: Apakah test yang sudah ada memerlukan mocktail?
- Kesimpulan: `base_coc/test/widget_test.dart` hanya menguji rendering widget (BerandaGaleriScreen) dengan `ProviderScope` tanpa override repository; tidak ada dependensi eksternal kompleks yang di-mock, sehingga agen tidak melihat kebutuhan mocktail. share_global_saya tidak memiliki test yang terdeteksi.

### 3. Perilaku agen AI bawaan

- Tanya: Mengapa agen AI tidak menambahkan mocktail secara default?
- Kesimpulan: Agen bawaan cenderung membuat test minimal dan mengikuti instruksi literal; skill bawaan `dart-add-unit-test` menyebut mockito "jika kode bergantung pada dependency injection", dan skill `dart-generate-test-mocks` memakai mockito + build_runner. Aturan proyek seharusnya memakai mocktail (tanpa codegen), tetapi tidak terhubung ke konteks agen. Agen juga dapat memilih override provider langsung (sesuai skill `pola-testing` "mock Notifier/Provider → override provider") alih-alih mock repository, sehingga mocktail jarang terpakai.

### 4. Keterbacaan aturan proyek

- Tanya: Apakah agen AI membaca `aturan_testing.md`?
- Kesimpulan: Aturan tersebut berada di submodule `share_global_saya/docs/aturan/` dan tidak tercantum sebagai sumber kebenaran di `AGENTS.md` root (yang menggabungkan `.agents/rules/`). Tanpa referensi eksplisit, agen tidak mengetahui kewajiban mocktail (dan masih melihat aturan lama "mockito").

## Keputusan

- K-1: Diskusi ini bersifat analisa; belum ada keputusan implementasi. Hasil analisa: agen AI tidak menggunakan mocktail karena (a) test yang dibuat sering tidak memerlukan mock (widget/unit murni), (b) skill/aturan tidak secara eksplisit mewajibkan mocktail untuk semua kasus dependensi eksternal (skill bawaan memakai mockito), dan (c) aturan proyek (`aturan_testing.md`) tidak terhubung ke konteks agen dan masih menyebut mockito.
- K-2: Rekomendasi utama adalah memperkuat instruksi di skill `pola-testing` dan menghubungkan aturan proyek ke konteks agen (AGENTS.md/rules), bukan mengubah kode test yang ada.
- K-3: Aturan mocktail (bukan mockito) berlaku untuk **semua submodule** (`base_coc`, `share_global_saya`, dan proyek Flutter lain), bukan hanya `share_global_saya`. Rekomendasi R-3 (penambahan `mocktail` ke `dev_dependencies`) dan R-4 (template `test/mocks.dart` dengan mocktail, tanpa codegen) berlaku lintas submodule.
- K-4: Implementasi R-1..R-5 **ditunda**; sebelum implementasi, dilakukan diskusi lanjutan untuk menentukan prioritas, cakupan, dan urutan perubahan skill/aturan agar tidak mengganggu konsistensi proyek. Keputusan ini tidak mengubah status rekomendasi (masih rekomendasi, bukan keputusan implementasi).
- K-5: Paket mocking yang benar untuk proyek ini adalah **mocktail**, bukan mockito. Mocktail tidak memerlukan codegen/build_runner (`@GenerateMocks`), sehingga R-1/R-3/R-4 disesuaikan (tanpa build_runner). `aturan_testing.md` (yang masih menyebut mockito) perlu diperbarui ke mocktail (bagian dari R-2).
- K-6: Implementasi R-1..R-4 dilaksanakan pada sesi 158 (2026-11-16) atas perintah pengguna. R-2 **dialihkan**: `share_global_saya/docs/aturan/aturan_testing.md` tidak ditemukan lagi di submodule, sehingga kewajiban mocktail dimasukkan ke `.agents/rules/global/kelompok_skill_wajib.md` (kelompok Testing) sebagai pengganti rujukan aturan yang hilang — keputusan pengguna via `question` (sesi 158). Cakupan yang disetujui: R-1 + R-3 + R-4 + R-2 (versi dialihkan); R-5 tidak berupa perubahan berkas.

## Rekomendasi

- R-1: Perbarui skill `pola-testing` section 4 agar tegas: "Jika kode bergantung pada repository/service eksternal, WAJIB gunakan mocktail (kelas mock manual `class MockX extends Mock implements X {}`); jangan lewati hanya karena override provider." Sertakan contoh dan checklist. (Tidak memerlukan build_runner.)
- R-2: Tambahkan referensi ke `share_global_saya/docs/aturan/aturan_testing.md` (atau generalisasi aturan) di `AGENTS.md`/`.agents/rules/proyek/` agar agen membaca kewajiban mocktail; perbarui isi aturan dari "mockito" ke "mocktail".
- R-3: Pastikan `pubspec.yaml` (submodule yang relevan) memuat `mocktail` pada `dev_dependencies`; agen perlu menambahkan bila belum ada sebelum membuat mock.
- R-4: Sediakan template `test/mocks.dart` dengan kelas mock manual mocktail di proyek agar agen mudah mengikuti pola.
- R-5: Saat meminta agen membuat test, gunakan prompt eksplisit "gunakan mocktail untuk mock repository/service X" agar konvensi proyek termuat (skill bawaan `dart-generate-test-mocks` memakai mockito, jangan diikuti untuk proyek ini).

## Tindak Lanjut

| No | Tindakan | File Terdampak | Status |
| --- | -------- | -------------- | ------ |
| 1 | Perbarui skill `pola-testing` section 4 (kewajiban mocktail + contoh) | `.agents/skills/custom/pola-testing/SKILL.md` (+ `SKILLS_INDEX.md` entri 39) | selesai (sesi 158; v1.1.0) |
| 2 | Hubungkan aturan mocktail ke konteks agen; ubah "mockito" → "mocktail" (dialihkan: `aturan_testing.md` tidak ditemukan) | `.agents/rules/global/kelompok_skill_wajib.md` | selesai (sesi 158; lihat K-6) |
| 3 | Tambahkan `mocktail` ke `dev_dependencies` bila belum ada | `base_coc/pubspec.yaml`, `share_global_saya/pubspec.yaml` | selesai (sesi 158; `mocktail: ^1.0.5` + `pub get`) |
| 4 | Sediakan template `test/mocks.dart` (mocktail manual) | `base_coc/test/mocks.dart`, `share_global_saya/test/mocks.dart` | selesai (sesi 158) |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/skills/custom/pola-testing/SKILL.md` | Diubah (sesi 158) | Bagian 4 (Mockito → Mocktail), frontmatter (v1.1.0), Larangan Testing, Referensi Aturan Sumber |
| `SKILLS_INDEX.md` | Diubah (sesi 158) | Entri 39 diperbarui |
| `.agents/rules/global/kelompok_skill_wajib.md` | Diubah (sesi 158) | Kelompok Testing + kelompok mocktail baru |
| `base_coc/pubspec.yaml`, `base_coc/pubspec.lock` | Diubah (sesi 158) | `mocktail: ^1.0.5` di `dev_dependencies` + `pub get` |
| `share_global_saya/pubspec.yaml`, `share_global_saya/pubspec.lock` | Diubah (sesi 158) | `mocktail: ^1.0.5` di `dev_dependencies` (+ pengurutan dev_deps abjad) + `pub get` |
| `base_coc/test/mocks.dart` | Dibuat (sesi 158) | Template mock manual mocktail (`MockFavoritDao`) |
| `share_global_saya/test/mocks.dart` | Dibuat (sesi 158) | Template mock manual mocktail (generik; belum ada kelas kandidat) |
| `AGENTS.md` | Tidak ada perubahan (sesi 158) | Root `AGENTS.md` tidak memuat blok berkas ini (hanya 2 blok: `aturan-pembuatan-skill`, `format_hasil_diskusi`); tidak perlu regenerasi `/perbarui_agents_md`; Kilo memuat berkas langsung via `instructions` di `.kilo/kilo.jsonc` |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan

| Tanggal | Perubahan |
| ------- | --------- |
| 2026-11-16 | Pertanyaan terbuka ditutup: urutan dan prioritas implementasi R-1..R-5 — diputuskan jalankan R-1, R-2 (versi dialihkan), R-3, R-4 sekaligus pada sesi 158 atas perintah pengguna (R-5 bukan perubahan berkas); R-2 dialihkan ke `.agents/rules/global/kelompok_skill_wajib.md` karena `aturan_testing.md` tidak ditemukan (sesi 158). |
| 2026-11-16 | Implementasi R-1..R-4 dieksekusi sesi 158: skill `pola-testing` v1.1.0 (bagian 4 mocktail + checklist + larangan mockito; `SKILLS_INDEX.md` entri 39 diperbarui); `kelompok_skill_wajib.md` kelompok Testing + kelompok mocktail; `mocktail: ^1.0.5` di `dev_dependencies` kedua submodule + `pub get` (mocktail 1.0.5 terpasang); `test/mocks.dart` template di kedua submodule. Verifikasi: `flutter analyze` bersih (keduanya), `flutter test` base_coc 122/122 lulus. `Implementasi` → `Sudah Diimplementasikan`. (sesi 158) |
| 2026-11-14 | Koreksi (sesi 36): paket mocking yang benar adalah mocktail, bukan mockito. Perbarui judul, topik, latar belakang, poin, K-1/K-3/K-5, R-1..R-5, tindak lanjut, dan file terdampak (mockito → mocktail; hapus ketergantungan build_runner). `aturan_testing.md` (masih menyebut mockito) perlu diperbarui ke mocktail (R-2). |
| 2026-11-14 | Pertanyaan terbuka ditutup: apakah implementasi R-1..R-5 dilakukan sekarang atau hanya dokumentasi analisa — diputuskan diskusikan dulu (implementasi ditunda) (sesi 35). Tambah K-4. |
| 2026-11-14 | Pertanyaan terbuka ditutup: apakah aturan mockito di `aturan_testing.md` berlaku untuk semua submodule atau hanya `share_global_saya` — berlaku untuk semua submodule (base_coc, share_global_saya, dan proyek Flutter lain) (sesi 34). Status Dokumen → Final; tambah K-3. |
| 2026-11-14 | Membuat `hasil_diskusi/diskusi_5.md` (Draft): analisa mengapa agen AI tidak menggunakan mockito saat membuat test, plus rekomendasi R-1..R-5. Tidak ada kode Dart yang diubah. |