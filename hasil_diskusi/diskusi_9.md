# Hasil Diskusi 9 — Penggabungan Skill Freezed ke `model-state-freezed-abstract`

## Status

- Dokumen: Final
- Implementasi: Sudah Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Penggabungan skill Freezed (model & state) ke skill yang sudah ada `model-state-freezed-abstract`, mencakup contoh Freezed state (dari commit `share_global_saya`) dan model (JSON dari SDK resmi + model DB dari commit lama).

## Latar Belakang

Pengguna ingin memiliki skill baru di `.agents/skills/` yang mencontohkan cara membuat **model** dan **state** dengan paket Freezed, agar pembuatan model/state di proyek-proyek Flutter milik pengguna konsisten dan mengikuti pola yang sudah ada di repositori.

Pemeriksaan sumber menemukan bahwa di repositori hanya ada **satu** contoh Freezed yang sudah ter-commit, yaitu **Freezed state** `LogDebugState` pada `share_global_saya/lib/log_debug/log_debug_notifier.dart` (kelas abstract `@freezed` + notifier Riverpod). Model pada repo (`log_debug_model.dart`) menggunakan `fromJson`/`toJson`/`copyWith` manual dan **tidak** memakai Freezed. Sesuai aturan `aturan-pembuatan-skill` §5.3, isi `SKILL.md` tidak boleh mengarang bila tidak ada commit relevan; hal ini menjadi poin diskusi utama.

## Poin Diskusi

### 1. Cakupan contoh (state saja vs state + model)

- Tanya: Repo hanya punya contoh Freezed STATE yang ter-commit; tidak ada Freezed MODEL. Apakah skill cukup mencontohkan state, atau tetap sertakan model?
- Kesimpulan: Pengguna memutuskan **menyertakan Freezed STATE (dari commit) dan Freezed MODEL (dari SDK resmi package:freezed)**, dengan keterangan jelas pada bagian `Sumber Evaluasi` bahwa contoh model berasal dari SDK resmi, bukan dari commit repo.

### 2. Sumber isi (commit acuan)

- Tanya: Commit Freezed mana yang dijadikan rujukan utama `Sumber Evaluasi`?
- Kesimpulan: Rujukan utama adalah commit yang menambahkan Freezed ke `share_global_saya` (`b70ffda`) dan berkas notifier/state (`acf4bb6`, `804b307`); pola diambil dari commit terbaru yang relevan.

### 3. Kategori dan nama folder skill

- Tanya: Skill ditempatkan di kategori mana dan diberi nama folder apa?
- Kesimpulan: Awalnya diputuskan skill baru `freezed-model-state` di kategori `custom`. Namun setelah ditemukan tumpang tindih dengan skill yang sudah ada (`model-state-freezed-abstract`), pengguna memutuskan **menggabungkan** ke skill lama tersebut (nama/path dipertahankan), dan folder `freezed-model-state` dihapus.

### 4. Penanganan tumpang tindih dengan skill yang sudah ada

- Tanya: Sudah ada skill `model-state-freezed-abstract` (v1.1.1) dengan trigger identik "saat membuat model atau state Freezed" (fokus model DB `fromSqflite`/`toSqflite`/`ParserUtil`/UTC dari proyek `berhenti_merokok`). Bagaimana penanganannya?
- Kesimpulan: Digabung ke `model-state-freezed-abstract` (nama/path dipertahankan karena dirujuk `SKILLS_INDEX.md` root + `share_global_saya`); isi kedua skill disatukan, versi dinaikkan ke v2.0.0, dan folder `freezed-model-state` dihapus.

## Keputusan

- K-1: Cakupan contoh mencakup Freezed STATE (dari commit repo) dan Freezed MODEL (dari SDK resmi package:freezed); asal contoh model ditandai jelas di `Sumber Evaluasi` (bukan dari commit).
- K-2: Rujukan utama commit Freezed: `b70ffda33ce6473e6309af8acd0c64b48c2d0404` (menambahkan freezed ke pubspec), `acf4bb6dddc17ca633d551b2e9f5f62f39020d78`, `804b307506389b678f09e7c2cb7bfb8f2aa94112` (berkas notifier/model).
- K-3: Isi digabung ke skill yang sudah ada `model-state-freezed-abstract` (kategori `custom`); nama/path dipertahankan, versi dinaikkan ke `2.0.0`. Folder `freezed-model-state` tidak dipakai (dihapus).
- K-4: Skill mengikuti struktur wajib `aturan-pembuatan-skill` §9 (Judul/Intro, `## Cakupan yang Di-Cover`, `## Aturan`, `## Larangan`, `## Contoh Benar`, `## Contoh Salah`, `## Sumber Evaluasi`) dengan front matter lengkap dan segmen trigger-only.

## Rekomendasi

- R-1: Sertakan pola state dari sumber nyata: kelas abstract `@freezed`, private constructor `._()` untuk getter/method, `@Default([])` untuk list, dan integrasi notifier `@Riverpod(keepAlive: true)`.
- R-2: Sertakan pola model dari SDK resmi: `@freezed` abstract class, `const factory`, serialisasi JSON via `part '*.freezed.dart'` + `part '*.g.dart'`, serta larangan mengedit berkas hasil generate.
- R-3: Pertahankan pola model database dari skill lama (`fromSqflite`/`toSqflite`, `ParserUtil`, konversi UTC, enum `lowerCamelCase`) sebagai bagian dari cakupan gabungan.
- R-4: Cantumkan workflow `build_runner` (pub get → build_runner → dart format → dart analyze) pada bagian Aturan/Langkah sesuai konvensi proyek.
- R-5: Perbarui `SKILLS_INDEX.md` (entri `model-state-freezed-abstract` — status pembaruan saja, tanpa entri baru karena digabung).

## Tindak Lanjut

| No  | Tindakan                                                                 | File Terdampak                                                        | Status |
| --- | ------------------------------------------------------------------------ | --------------------------------------------------------------------- | ------ |
| 1   | Menggabungkan isi ke skill `model-state-freezed-abstract/SKILL.md` (v2.0.0). | `.agents/skills/custom/model-state-freezed-abstract/SKILL.md`         | selesai |
| 2   | Menghapus folder skill yang tidak dipakai `freezed-model-state`.         | `.agents/skills/custom/freezed-model-state/`                          | selesai |
| 3   | Memperbarui status entri `model-state-freezed-abstract` di `SKILLS_INDEX.md`. | `SKILLS_INDEX.md`                                                     | selesai |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi                                                        |
| ----------- | ---------------- | ---------------------------------------------------------------- |
| `.agents/skills/custom/model-state-freezed-abstract/SKILL.md` | Diubah | Digabung dengan cakupan Freezed state + model (JSON + DB), versi 2.0.0. |
| `.agents/skills/custom/freezed-model-state/` | Dihapus | Folder skill baru yang digabung ke `model-state-freezed-abstract` (tidak dipakai). |
| `SKILLS_INDEX.md` | Diubah | Status entri `model-state-freezed-abstract` diperbarui. |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan

| Tanggal    | Perubahan                                                                 |
| ---------- | ------------------------------------------------------------------------- |
| 2026-11-14 | Membuat berkas hasil diskusi 9 (Draft → Final) dan mencatat keputusan K-1..K-4, R-1..R-5. |
| 2026-11-14 | Mencatat keputusan pengguna untuk menggabungkan skill ke `model-state-freezed-abstract` (v2.0.0), menghapus folder `freezed-model-state`, dan memperbarui `SKILLS_INDEX.md`; status implementasi → `Sudah Diimplementasikan`. |