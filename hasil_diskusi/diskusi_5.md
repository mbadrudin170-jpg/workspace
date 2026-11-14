# Hasil Diskusi 5 — Mengapa agen AI tidak menggunakan mockito saat membuat test

## Status

- Dokumen: Final
- Implementasi: Belum Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Analisa penyebab agen AI (Kilo) tidak menggunakan `package:mockito` saat membuat test, dan rekomendasi agar mockito dipakai sesuai aturan proyek.

## Latar Belakang

Pengguna mengamati bahwa agen AI ketika membuat test (mis. `base_coc/test/widget_test.dart`) tidak menggunakan `package:mockito`, padahal aturan proyek (`share_global_saya/docs/aturan/aturan_testing.md`) menyatakan "mockito : untuk testing gunakan paket mockito." Skill `pola-testing` juga menyebut mockito generate mocks. Diskusi ini menganalisa penyebab dan menyusun rekomendasi.

## Poin Diskusi

### 1. Konteks kode dan aturan yang ada

- Tanya: Aturan dan skill mana yang mengatur penggunaan mockito?
- Kesimpulan: `aturan_testing.md` (share_global_saya) mewajibkan mockito; skill `pola-testing` section 4 mewajibkan mock repository/service (bukan Notifier/Provider) dan dummy data; skill bawaan `dart-generate-test-mocks` menjelaskan `@GenerateMocks` + build_runner. Namun, aturan ini tidak otomatis terbaca agen AI kecuali skill/aturan dimuat ke konteks.

### 2. Test yang ada di proyek

- Tanya: Apakah test yang sudah ada memerlukan mockito?
- Kesimpulan: `base_coc/test/widget_test.dart` hanya menguji rendering widget (BerandaGaleriScreen) dengan `ProviderScope` tanpa override repository; tidak ada dependensi eksternal kompleks yang di-mock, sehingga agen tidak melihat kebutuhan mockito. share_global_saya tidak memiliki test yang terdeteksi.

### 3. Perilaku agen AI bawaan

- Tanya: Mengapa agen AI tidak menambahkan mockito secara default?
- Kesimpulan: Agen bawaan cenderung membuat test minimal dan mengikuti instruksi literal; mockito memerlukan codegen (build_runner) dan dependensi dev tambahan. Skill `dart-add-unit-test` hanya menyebut mockito "jika kode bergantung pada dependency injection". Agen juga dapat memilih override provider langsung (sesuai skill `pola-testing` "mock Notifier/Provider → override provider") alih-alih mock repository, sehingga mockito jarang terpakai.

### 4. Keterbacaan aturan proyek

- Tanya: Apakah agen AI membaca `aturan_testing.md`?
- Kesimpulan: Aturan tersebut berada di submodule `share_global_saya/docs/aturan/` dan tidak tercantum sebagai sumber kebenaran di `AGENTS.md` root (yang menggabungkan `.agents/rules/`). Tanpa referensi eksplisit, agen tidak mengetahui kewajiban mockito.

## Keputusan

- K-1: Diskusi ini bersifat analisa; belum ada keputusan implementasi. Hasil analisa: agen AI tidak menggunakan mockito karena (a) test yang dibuat sering tidak memerlukan mock (widget/unit murni), (b) skill/aturan tidak secara eksplisit mewajibkan mockito untuk semua kasus dependensi eksternal, dan (c) aturan proyek (`aturan_testing.md`) tidak terhubung ke konteks agen.
- K-2: Rekomendasi utama adalah memperkuat instruksi di skill `pola-testing` dan menghubungkan aturan proyek ke konteks agen (AGENTS.md/rules), bukan mengubah kode test yang ada.
- K-3: Aturan mockito di `aturan_testing.md` berlaku untuk **semua submodule** (`base_coc`, `share_global_saya`, dan proyek Flutter lain), bukan hanya `share_global_saya`. Rekomendasi R-3 (penambahan `mockito` ke `dev_dependencies`) dan R-4 (template `test/mocks.dart`) berlaku lintas submodule.
- K-4: Implementasi R-1..R-5 **ditunda**; sebelum implementasi, dilakukan diskusi lanjutan untuk menentukan prioritas, cakupan, dan urutan perubahan skill/aturan agar tidak mengganggu konsistensi proyek. Keputusan ini tidak mengubah status rekomendasi (masih rekomendasi, bukan keputusan implementasi).

## Rekomendasi

- R-1: Perbarui skill `pola-testing` section 4 agar tegas: "Jika kode bergantung pada repository/service eksternal, WAJIB gunakan mockito (`@GenerateMocks`) + build_runner; jangan lewati hanya karena override provider." Sertakan contoh dan checklist.
- R-2: Tambahkan referensi ke `share_global_saya/docs/aturan/aturan_testing.md` (atau generalisasi aturan) di `AGENTS.md`/`.agents/rules/proyek/` agar agen membaca kewajiban mockito.
- R-3: Pastikan `pubspec.yaml` (submodule yang relevan) memuat `mockito` pada `dev_dependencies`; agen perlu menambahkan bila belum ada sebelum membuat mock.
- R-4: Sediakan template `test/mocks.dart` dengan `@GenerateMocks` di proyek agar agen mudah mengikuti pola.
- R-5: Saat meminta agen membuat test, gunakan prompt eksplisit "gunakan mockito untuk mock repository/service X" agar skill `dart-generate-test-mocks` termuat.

## Tindak Lanjut

| No | Tindakan | File Terdampak | Status |
| --- | -------- | -------------- | ------ |
| 1 | Perbarui skill `pola-testing` section 4 (tambah kewajiban mockito + contoh) | `.agents/skills/custom/pola-testing/SKILL.md` | belum |
| 2 | Hubungkan `aturan_testing.md` ke konteks agen (AGENTS.md/rules proyek) | `AGENTS.md`, `.agents/rules/proyek/*` | belum |
| 3 | Tambahkan `mockito` ke `dev_dependencies` bila belum ada | `base_coc/pubspec.yaml`, `share_global_saya/pubspec.yaml` | belum |
| 4 | Sediakan template `test/mocks.dart` | `base_coc/test/mocks.dart`, `share_global_saya/test/mocks.dart` | belum |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `.agents/skills/custom/pola-testing/SKILL.md` | Belum diubah | Kandidat perubahan (R-1) |
| `AGENTS.md` | Belum diubah | Kandidat perubahan (R-2) |
| `share_global_saya/docs/aturan/aturan_testing.md` | Referensi | Aturan sumber |
| `base_coc/test/widget_test.dart` | Referensi | Contoh test tanpa mockito |

## Pertanyaan Terbuka

- Urutan dan prioritas implementasi R-1..R-5 yang akan dilakukan setelah diskusi selesai (skill `pola-testing`, koneksi aturan ke konteks agen, dev_dependencies, template `test/mocks.dart`, prompt eksplisit).

## Riwayat Perubahan

| Tanggal | Perubahan |
| ------- | --------- |
| 2026-11-14 | Pertanyaan terbuka ditutup: apakah implementasi R-1..R-5 dilakukan sekarang atau hanya dokumentasi analisa — diputuskan diskusikan dulu (implementasi ditunda) (sesi 35). Tambah K-4. |
| 2026-11-14 | Pertanyaan terbuka ditutup: apakah aturan mockito di `aturan_testing.md` berlaku untuk semua submodule atau hanya `share_global_saya` — berlaku untuk semua submodule (base_coc, share_global_saya, dan proyek Flutter lain) (sesi 34). Status Dokumen → Final; tambah K-3. |
| 2026-11-14 | Membuat `hasil_diskusi/diskusi_5.md` (Draft): analisa mengapa agen AI tidak menggunakan mockito saat membuat test, plus rekomendasi R-1..R-5. Tidak ada kode Dart yang diubah. |