# Sesi 39

- Status: Berjalan
- Tgl: 2026-11-18

## Checklist Awal Sesi

- [x] Baca `MEMORI.md` (tool Read, tanpa offset/limit)
- [x] Baca seluruh berkas `.agents/rules/` (6 berkas)
- [x] Buat berkas sesi `memori/sesi/sesi_39.md`
- [x] Muat skill `memori-check`, `aturan-pembuatan-skill`, `penggunaan-tool-question`

## Catatan Sesi

Command `tambah_kode_kesill`: menambahkan atau memperbarui skill yang relevan dengan potongan kode yang diberikan pengguna.

1. Potongan kode 1 (`pengguna_aktif_notifier.dart:21-29` — `muatUlang()`): pengguna meminta ubah skill `riverpod-pola` Aturan 19 + Contoh Benar dari `AsyncValue.loading()`/`AsyncValue.guard` menjadi `AsyncValue.data(await _ambilSemua())` + `catch (e, s)` + `L.e(...)` + `rethrow;`. Draf ditampilkan, persetujuan eksplisit "sekarang jangan pakai loading dan guard jadi cukup data dan rethrow saja" → diterapkan.
2. Potongan kode 2 (`pengguna_aktif_notifier.dart:43-44` — `L.e('Gagal menambahkan pelanggan aktif: $e\n$s')`): pengguna meminta tambahkan poin wajib `L.e` menyertakan `e` dan `s` di semua repo. Diterapkan ke skill `logging-debug` Aturan 10 + `.agents/rules/code.md` aturan #6 baru.
3. Potongan kode 3 (lanjutan): pengguna meminta tambahkan poin wajib `rethrow` agar UI tahu error. Diterapkan ke `riverpod-pola` Aturan 16 (contoh `simpan` diperbarui + `rethrow` wajib) dan Aturan 19 (teks ditegaskan `rethrow` wajib).

## Berkas Terdampak

| Lokasi File                                  | Status Perubahan | Deskripsi                                                                                              |
| -------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------ |
| `.agents/skills/code/riverpod-pola/SKILL.md` | Diubah           | Aturan 16/19 + Contoh Benar `muatUlang`/`simpan` diperbarui; description + versi/diperbarui diperbarui |
| `.agents/skills/code/logging-debug/SKILL.md` | Diubah           | Aturan 10: `L.e` wajib `$e $s`; description + versi/diperbarui diperbarui                              |
| `.agents/rules/code.md`                      | Diubah           | Aturan #2 diperbarui; aturan #6 baru (`L.e` wajib `$e $s`)                                             |
| `.agents/rules/kelompok_skill_wajib.md`      | Diubah           | #19 logging-debug + #40 riverpod-pola timestamp/description diperbarui                                 |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan
