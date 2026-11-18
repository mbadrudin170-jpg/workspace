# Sesi 54

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Kamis, 19 November 2026 (Asia/Jakarta)
- Command: pantau dan evaluasi transkrip sesi (ses_e0f434957ffeUIbRVnN1ycvghH)
- Topik: Evaluasi transkrip sesi "code" (ses_...) — identifikasi kesalahan/pelanggaran yang perlu ditambahkan/diperbarui pada aturan/skill

## Catatan Sesi

- Catch-up sync awal sesi: berkas `memori/sesi/*.md` berstatus `Belum Sinkron` milik sesi sebelumnya ditemukan: `sesi_45.md`, `sesi_46.md`, `sesi_47.md`, `sesi_48.md`, `sesi_49.md`, `sesi_52.md`. Isinya ambigu (sesi paralel; pengguna sebelumnya berkali-kali menjawab "Skip"). Per aturan `memori-check` Aturan 2 dan Larangan, tidak diputuskan sendiri — dilaporkan ke pengguna; tidak disentuh pada sesi ini.
- Transkrip yang dievaluasi: sesi "code" (ses_e0f434957ffeUIbRVnN1ycvghH), topik "harus sesuai skill" pada `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` baris 487–493 (penanganan error gabungan → per-provider + retry).
- Temuan evaluasi (celah yang belum tercakup aturan/skill yang ada):
  1. Retry tombol memakai `ref.invalidate(provider)`, sedangkan skill `penanganan-asyncvalue-berkali` Aturan 2 dan `penanganan-async-data-kosong` Aturan 2 menyebut `ref.refresh(provider)`. Skill tidak menjelaskan perbedaan dan kapan pakai yang mana → ambiguitas.
  2. Verifikasi perubahan pada submodule: AI menjalankan `git diff --stat && git diff` di root, yang tidak menampilkan perubahan kode submodule (hanya gitlink). Skill `disiplin-scope-kerja` Aturan 3 tidak menyebut kewajiban review diff di submodule.
  3. Empty state daftar: layar memakai `Center(child: Text('Tidak ada pelanggan aktif ditemukan.'))` (custom), padahal skill `empty-state-daftar` mewajibkan `EmptyStateView`. Tidak ada aturan di `.agents/rules/code.md` yang merujuk skill `empty-state-daftar`.
- Pelanggaran lain yang sudah tercakup aturan/skill yang ada (tidak diusulkan sebagai celah baru): tidak membuat berkas sesi di awal sesi (memori-check #3), tidak memperbarui tanggal diperbarui MEMORI.md (memori-check #10), log narasi (code.md #12), unawaited tanpa catchError (code.md #13), guard kIsWeb (code.md #18), warna hardcode non-semantik (code.md #16), mounted check setelah await (penanganan-async-data-kosong #6).
- Keputusan pengguna (sesi 54): "harusnya refresh bukan invalidate" → retry wajib `ref.refresh(provider)`. Diterapkan pada kode + skill code/ (di luar alur commit-history atas persetujuan eksplisit pengguna) + aturan code.md #24.
- Temuan SDK Riverpod 3.5.0 (sesi 54 lanjutan): `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider); hasil WAJIB dipakai. Single provider → `() => ref.refresh(provider)`; beberapa provider sekaligus → list literal `() => [ref.refresh(p1), ...]`. DILARANG statement yang mengabaikan hasil dan `// ignore: unused_result`. Pola diterapkan pada `form_pelanggan_aktif.dart` (4 provider, list literal). Skill code/ dan aturan code.md #24 diperbarui agar AI tidak mengulang kesalahan.
- Perubahan yang dilakukan:
  - `admin_wifi/.../pelanggan_aktif_screen.dart`: retry 3 provider `invalidate` → `refresh`.
  - `admin_wifi/.../detail_pelanggan_aktif.dart`: retry 3 provider `invalidate` → `refresh`.
  - `admin_wifi/.../form_pelanggan_aktif.dart`: retry 4 provider `invalidate` → `refresh` (list literal agar hasil refresh terpakai, tanpa ignore).
  - `.agents/skills/code/penanganan-asyncvalue-berkali/SKILL.md`: Aturan 2 diperjelas (refresh, bukan invalidate) + metadata + Sumber Evaluasi.
  - `.agents/skills/code/penanganan-async-data-kosong/SKILL.md`: Aturan 2 diperjelas (refresh, bukan invalidate) + metadata + Sumber Evaluasi.
  - `.agents/rules/code.md`: aturan #24 baru (retry wajib ref.refresh, bukan invalidate).
- Verifikasi: `dart format` OK (0 changed); `dart analyze` No issues found pada 3 berkas.

## Berkas Terdampak

| Lokasi File                                                                | Status Perubahan | Deskripsi                                                              |
| -------------------------------------------------------------------------- | ---------------- | ---------------------------------------------------------------------- |
| `memori/sesi/sesi_54.md`                                                   | Dibuat           | Berkas sesi aktif                                                      |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` | Diubah           | Retry 3 provider `invalidate` → `refresh`                              |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/detail_pelanggan_aktif.dart` | Diubah           | Retry 3 provider `invalidate` → `refresh`                              |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/form_pelanggan_aktif.dart`   | Diubah           | Retry 4 provider `invalidate` → `refresh` (list literal, tanpa ignore) |

| `.agents/skills/code/penanganan-asyncvalue-berkali/SKILL.md` | Diubah | Aturan 2: retry wajib `ref.refresh`, bukan `invalidate`; metadata + Sumber Evaluasi |
| `.agents/skills/code/penanganan-async-data-kosong/SKILL.md` | Diubah | Aturan 2: retry wajib `ref.refresh`, bukan `invalidate`; metadata + Sumber Evaluasi |
| `.agents/rules/code.md` | Diubah | Aturan #24 baru (retry wajib `ref.refresh`) |

## Sinkronisasi ke MEMORI.md

Sudah disinkronkan (sesi 54): MEMORI.md header tanggal diperbarui ke `(sesi 54)`; Status "Sesi terakhir" diperbarui ke sesi 54; Catatan Teknis ditambah entri sesi 54.
