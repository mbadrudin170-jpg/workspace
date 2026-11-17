## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-17 (WIB)
- Command: interaksi langsung (tanpa command)
- Topik: Diskusi dan perbaikan `prompt/skill/build-runner-codegen.md`

## Catatan Sesi
- AI melakukan checklist awal: membaca `MEMORI.md`, membaca aturan global (`format_hasil_diskusi.md`, `build_apk_github_workflow.md`), membuat berkas sesi `sesi_224.md`, dan memuat skill relevan (`memori-check`, `aturan-folder-prompt`).
- Pengguna meminta diskusi/analisis berkas `prompt/` (poin penting saja, perbaiki typo/salah penempatan/ambigu) tanpa edit sebelum persetujuan.
- Berkas yang dibahas: `prompt/skill/build-runner-codegen.md`. Ditemukan typo (`pubscl yml` → `pubspec.yaml`), prasyarat direktori salah penempatan, contoh poin 6 keliru (argumen berkas sumber tidak valid untuk `build_runner`), dan redaksi ambigu pada penghapusan output bentrok.
- Klarifikasi: `dart run build_runner` dijalankan pada paket ber-`pubspec.yaml`; pembatasan keluaran memakai `--build-filter` pada glob berkas hasil generate, bukan path berkas sumber.
- Pengguna menyetujui perbaikan (`ok`). `prompt/skill/build-runner-codegen.md` diperbarui (poin diringkas/diperjelas, tanggal diperbarui 16:59 WIB, contoh `--build-filter` valid).
- Command `salin_prompt_ke_target` dijalankan (cakupan: `prompt/skill/build-runner-codegen.md`); target `.agents/skills/custom/build-runner-codegen/SKILL.md` kosong → ditimpa sesuai poin sumber dan skill `aturan-pembuatan-skill`.
- Diskusi `prompt/skill/riverpod-pola.md`: kontradiksi poin 11 vs 18 (`asData`), gaya, dan redaksi "tanpa akhiran manual" diperbaiki (persetujuan `ok`, 17:07 WIB). Dilanjutkan perbaikan poin 18 duplikat/typo dan penambahan contoh kode `AsyncValue` di `build()` (persetujuan `ok`, 17:12 WIB); poin 19 kosong dihapus.
- Penambahan contoh kode untuk poin 9 (provider overrides testing) dan poin 10 (`select` untuk optimasi rebuild) pada `prompt/skill/riverpod-pola.md` disetujui (`ok`, 17:15 WIB).
- Penambahan contoh kode untuk poin 14 (larangan modifikasi di lifecycle), poin 15 (lokasi/penamaan provider CRUD vs read-only), dan poin 16 (`try-catch`, DB sebelum update state) disetujui (`ok`, 17:18 WIB).
- Penambahan contoh kode untuk poin 12 (larangan mengoper `WidgetRef`, alternatif `ConsumerWidget`) dan poin 13 (`UncontrolledProviderScope` + `ProviderContainer.dispose()` oleh pemanggil) disetujui (`ok`, 17:24 WIB).
- Penambahan contoh kode untuk poin 2 (notifier sinkron codegen `keepAlive`, larangan legacy) dan poin 4 (`ref.watch` di `build()`, `ref.read` di callback) disetujui (`ok`, 17:25 WIB).
- Penambahan contoh kode untuk poin 6 (family provider, parameter immutable/comparable dengan `Ref`) disetujui (`ok`, 17:28 WIB).
- Catch-up sinkron (sesi 228): perubahan nyata telah disinkronkan — entri ditambahkan ke `memori/riwayat_perubahan.md` (sesi 224), header `MEMORI.md` diperbarui. Berkas yang terlibat: `prompt/skill/build-runner-codegen.md` (Diubah), `.agents/skills/custom/build-runner-codegen/SKILL.md` (Dibuat/Diubah), `prompt/skill/riverpod-pola.md` (Diubah). Tidak ada kode Dart yang diubah; tidak ada commit/push.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `memori/sesi/sesi_224.md` | Dibuat, Diubah | Berkas sesi diskusi, perbaikan prompt build-runner/riverpod-pola, dan salin target build-runner |
| `prompt/skill/build-runner-codegen.md` | Diubah | Perbaikan typo, urutan/prasyarat, kejelasan poin, dan contoh `--build-filter` yang valid |
| `.agents/skills/custom/build-runner-codegen/SKILL.md` | Dibuat/Diubah | Skill `build_runner` codegen disusun dari poin prompt (frontmatter, aturan, contoh, sumber) |
| `prompt/skill/riverpod-pola.md` | Diubah | Penyatuan aturan `asData`/`valueOrNull`, penghapusan duplikat/typo, serta penambahan contoh `AsyncValue` dan contoh poin 2, 4, 6, 9–10, 12–16 |

## Sinkronisasi ke MEMORI.md
Sinkronisasi selesai (sesi 228): entri riwayat perubahan ditambahkan; header `MEMORI.md` diperbarui (Diperbarui: Tue Nov 17 2026 18:48 WIB). Perubahan dokumentasi/skill tidak dipromosi ke isi inti `MEMORI.md` (belum memenuhi kriteria promosi Aturan 14).
