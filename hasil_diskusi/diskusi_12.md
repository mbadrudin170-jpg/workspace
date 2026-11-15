# Hasil Diskusi 12 — Revisi command `scan` (dukungan submodule, larangan bash, checklist)

## Status
- Dokumen: Final
- Implementasi: Belum Diimplementasikan
- Tanggal: 2026-11-15
- Topik: Peninjauan dan usulan revisi command `.kilo/commands/scan.md` — dukungan proyek submodule, sinkronisasi memori, kebijakan bash, dan strategi checklist per berkas.

## Latar Belakang

Command `scan` (`.kilo/commands/scan.md`, 381 baris; diperbaiki terakhir sesi 87) berfungsi mengaudit seluruh berkas Dart di `lib/` satu per satu, lalu memperbarui `task.md` sesuai skill `format-task-md` tanpa mengubah kode Dart. Pemeriksaan fakta pada sesi 128 menemukan ketidaksesuaian dengan kondisi repositori aktual:

- Root `workspace` bukan proyek Flutter dan tidak memiliki `lib/`; seluruh kode Dart berada di submodule `base_coc/lib` (49 berkas, 7 di antaranya `*.g.dart`/`*.freezed.dart`).
- `task.md` hanya ada di root `workspace` (0 byte); `rencana_fitur_baru.md` tidak ada di root maupun `base_coc`; dokumen desain `optimasi_ui.md`, `desain.md`, dan `DESAINS.md` juga tidak ada.
- `.agents/rules/AGENTS.md` tidak ada (klaim Ketentuan Umum #1 command benar), tetapi `MEMORI.md` masih mencantumkannya sebagai berkas yang ada.
- Larangan bash menyeluruh pada command berbenturan dengan semangat `.agents/rules/global/prioritas_tool_bawaan.md` yang mengizinkan shell untuk `flutter`/`dart` dan operasi tanpa padanan tool.
- Tidak ada tahap sinkronisasi memori di akhir, padahal command mengubah `task.md`.

## Poin Diskusi

### 1. Dukungan proyek/submodule
- Tanya: Bagaimana `scan` menentukan proyek target dan lokasi dokumen hasil ketika kode Dart berada di submodule?
- Kesimpulan: `$ARGUMENTS` diperluas menjadi path proyek target; jika kosong dilakukan deteksi otomatis (root bila memiliki `lib/`, jika tidak pilih submodule dari `.gitmodules` via `question`). Satu eksekusi hanya untuk satu proyek. Dokumen hasil tetap di root `workspace` sebagai agregat, dengan penanda proyek asal pada setiap task.

### 2. Review dan usulan revisi lain
- Tanya: Bagian mana dari command yang perlu diperbaiki agar konsisten dengan aturan proyek?
- Kesimpulan: Tambah tahap sinkronisasi memori di akhir; tegaskan larangan menyentuh pointer submodule, `.gitmodules`, gitlink, dan commit/push di root maupun submodule; tambah larangan membuat `task.md`/`rencana_fitur_baru.md` di lokasi alternatif tanpa persetujuan; tambah rujukan skill `struktur-folder-lib` untuk konteks penataan folder `lib/`; koreksi entri `MEMORI.md` yang menyebut `.agents/rules/AGENTS.md` ada.

### 3. Kebijakan larangan bash
- Tanya: Apakah command tetap melarang seluruh bash, atau menyelaraskan dengan `prioritas_tool_bawaan.md`?
- Kesimpulan: Larangan dipersempit dan dibedakan — shell dilarang untuk membaca, mencari, menghitung, menulis, dan mengubah berkas; shell diizinkan hanya untuk verifikasi baca-saja (`flutter analyze`, `flutter test`, `dart analyze`); `dart format` (mengubah berkas) dan commit/push tetap dilarang.

### 4. Strategi checklist per berkas
- Tanya: Bagaimana mengelola checklist `todowrite` untuk 42 berkas Dart non-generated?
- Kesimpulan: Tetap satu item per berkas untuk akuntabilitas, ditambah aturan audit per batch maksimal 10 berkas dengan pembaruan checklist setiap batch; dilarang menandai selesai secara massal tanpa pembacaan penuh; dilarang menghilangkan item yang masih tertunda saat memperbarui checklist.

## Keputusan

- K-1: `$ARGUMENTS` pada `scan` diperluas menjadi path proyek target (root atau submodule), dengan deteksi otomatis dan fallback `question` bila ambigu.
- K-2: Satu eksekusi `scan` hanya mengaudit satu proyek target; submodule lain diaudit pada eksekusi terpisah.
- K-3: `task.md` dan `rencana_fitur_baru.md` tetap diperbarui sebagai agregat di root `workspace`, dengan penanda proyek asal (mis. `base_coc`) pada task.
- K-4: Kebijakan bash diubah: shell dilarang untuk operasi berkas (baca/cari/hitung/tulis/ubah) dan untuk `dart format`/commit/push; shell diizinkan hanya untuk verifikasi baca-saja `flutter analyze`, `flutter test`, dan `dart analyze` pada proyek target.
- K-5: Checklist tetap satu item per berkas Dart, dikerjakan per batch maksimal 10 berkas, tanpa penandaan selesai massal.
- K-6: Command wajib menambahkan tahap sinkronisasi memori (`memori/sesi/sesi_N.md`, `MEMORI.md`, `memori/riwayat_perubahan.md`) setelah `task.md` diperbarui.

## Rekomendasi

- R-1: Tambahkan larangan eksplisit menyentuh pointer submodule, `.gitmodules`, gitlink, dan melakukan commit/push di root maupun submodule.
- R-2: Tambahkan larangan membuat `task.md`/`rencana_fitur_baru.md` di lokasi alternatif tanpa persetujuan pengguna.
- R-3: Tambahkan rujukan skill `struktur-folder-lib` (`.agents/skills/custom/struktur-folder-lib/SKILL.md`) untuk konteks audit penataan folder `lib/`; pertahankan rujukan `memori-check`, `format-task-md`, dan `bug-runtime`.
- R-4: Pertahankan syarat "jika tersedia" untuk `optimasi_ui.md`, `desain.md`, dan `DESAINS.md`, disertai larangan membuat berkas desain tersebut.
- R-5: Koreksi entri `MEMORI.md` yang menyebut `.agents/rules/AGENTS.md` sebagai berkas yang ada; berkas tersebut tidak ditemukan (terverifikasi sesi 128).

## Tindak Lanjut

| No | Tindakan | File Terdampak | Status |
|----|----------|----------------|--------|
| 1 | Perluas `$ARGUMENTS` menjadi path proyek target + deteksi otomatis + fallback `question`; rombak bagian Cakupan dan Parameter | `.kilo/commands/scan.md` | belum |
| 2 | Tambahkan ketentuan satu proyek per eksekusi dan penanda proyek asal pada task agregat di root | `.kilo/commands/scan.md` | belum |
| 3 | Ganti larangan bash menyeluruh menjadi larangan terarah + izin verifikasi baca-saja | `.kilo/commands/scan.md` | belum |
| 4 | Tambahkan aturan batch maksimal 10 berkas pada TAHAP 4 dan larangan penandaan selesai massal | `.kilo/commands/scan.md` | belum |
| 5 | Tambahkan tahap sinkronisasi memori di akhir command | `.kilo/commands/scan.md` | belum |
| 6 | Tambahkan larangan pointer submodule/`.gitmodules`/gitlink/commit-push dan larangan membuat dokumen di lokasi alternatif | `.kilo/commands/scan.md` | belum |
| 7 | Tambahkan rujukan skill `struktur-folder-lib` | `.kilo/commands/scan.md` | belum |
| 8 | Koreksi entri `.agents/rules/AGENTS.md` di `MEMORI.md` | `MEMORI.md` | belum |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| `.kilo/commands/scan.md` | Diusulkan berubah | Penyesuaian parameter proyek, kebijakan bash, aturan batch checklist, tahap sinkronisasi memori, dan larangan submodule (belum diterapkan) |
| `MEMORI.md` | Diusulkan berubah | Koreksi entri `.agents/rules/AGENTS.md` dan pencatatan berkas diskusi ini (belum diterapkan) |
| `hasil_diskusi/diskusi_12.md` | Dibuat | Berkas hasil diskusi ini |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan

| Tanggal | Perubahan |
|---------|-----------|
| 2026-11-15 | Berkas dibuat; hasil diskusi command `scan` (dukungan submodule, kebijakan bash, strategi checklist) dengan keputusan K-1 s.d. K-6 |
