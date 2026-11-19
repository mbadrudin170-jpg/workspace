# Sesi 57

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-19
- Command: pantau_dan_evaluasi_transkrip (ses_e0f09a7f5ffeYhZ7Bm6b1qJJK6)
- Topik: Evaluasi transkrip "Error getById pada Refreshable PaketState" → tambah aturan akses `.future` provider

## Catatan Sesi

- Baca `MEMORI.md`, seluruh `.agents/rules/`, muat skill `memori-check`.
- Mengevaluasi transkrip sesi 56: temuan utama error `getById` tidak ditemukan pada `Refreshable<Future<PaketState>>` karena `await (paketProvider.future)` tanpa `ref`. Temuan lain (SnackBar vs AppToast, log narasi/banner, retry invalidate vs refresh, lifecycle initState) sudah tercakup aturan/skill yang ada.
- Celah: pola anti `provider.future` tanpa `ref` belum didokumentasikan. Diterapkan atas persetujuan pengguna ("ya"):
  - `.agents/skills/code/riverpod-pola/SKILL.md`: versi 1.5.0 → 1.6.0; deskripsi trigger diperluas; poin 22 baru (akses `.future` via `ref.read`/`ref.watch`, dilarang langsung pada objek provider); Sumber Evaluasi ditambah commit `6864dea`.
  - `.agents/rules/code.md`: aturan #25 baru (paritas dengan #24; tidak menghapus #24).
- Verifikasi: `npx prettier --write` pada kedua berkas (code.md unchanged setelah format; riverpod-pola diformat). Tidak ada kode Dart diubah pada sesi ini.

## Berkas Terdampak

| Lokasi File                                  | Status Perubahan | Deskripsi                                             |
| -------------------------------------------- | ---------------- | ----------------------------------------------------- |
| `memori/sesi/sesi_57.md`                     | Dibuat           | Berkas sesi ini (Sudah Sinkron)                       |
| `.agents/skills/code/riverpod-pola/SKILL.md` | Diubah           | v1.6.0, poin 22 baru, Sumber Evaluasi +commit 6864dea |
| `.agents/rules/code.md`                      | Diubah           | Aturan #25 baru (akses `.future` provider)            |

## Sinkronisasi ke MEMORI.md

Sudah disinkronkan (entri singkat di bawah).
