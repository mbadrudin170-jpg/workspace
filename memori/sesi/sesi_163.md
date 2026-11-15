# Sesi 163 — Command `diskusi_fitur_baru` parameter C38 (PRD Sorter Baru/Populer/Pilihan)

## Status
- Status Sinkron: Belum Sinkron
- Tanggal: Sun Nov 15 2026 (WIB; UTC ~20:33)
- Command: diskusi_fitur_baru (parameter `C38`)
- Topik: Membuat PRD untuk item C38 pada `refrensi_apk.md` — Sorter "Baru / Populer / Pilihan" pada daftar base — lalu berdiskusi hingga PRD dinyatakan Final

## Catatan Sesi
- `MEMORI.md` dibaca (header `Diperbarui: Mon Nov 16 2026 03:45 WIB (sesi 161)`).
- Catch-up sync awal sesi: pemindaian `^- Status Sinkron: Belum Sinkron$` menemukan `sesi_81.md`, `sesi_122.md`, `sesi_123.md`, `sesi_139.md`, `sesi_147.md`, `sesi_150.md` (keputusan pengguna sesi 131–132: biarkan apa adanya), serta `sesi_161.md` dan `sesi_162.md` (sesi paralel aktif — `sesi_161` topik command `build_apk`, `sesi_162` topik `analisa_commit_skill`; ambigu). Seluruhnya **tidak disentuh**, dilaporkan ke pengguna. `sesi_155`–`sesi_160` sudah `Sudah Sinkron`.
- Skill dimuat: `memori-check`, `format-prd`.
- Parameter `C38` cocok dengan item pada `refrensi_apk.md` baris 1014–1020 (`#### C38. Sorter "Baru / Populer / Pilihan" pada daftar base`; prioritas Sedang; tabel prioritas gabungan baris 1293).
- `prd/` kosong (glob `prd/*.md` tidak menemukan berkas) — tidak ada tumpang tindih PRD lain.
- Verifikasi implementasi di `base_coc`: tidak ada sortir pada daftar base (`filteredBasesProvider` di `katalog_provider.dart` hanya filter, tanpa urutan); tidak ada penghitung salin/buka lokal (A36 belum diimplementasikan); katalog `assets/data/base_katalog.json` tidak memiliki field tanggal rilis per base (hanya `terakhirDiperiksa` yang seragam 2026-11-14).
- Tautan referensi diverifikasi via `webfetch`: ClashLy (`np.com.sangams.cocbase`, 4.2★, 100K+ unduhan, diperbarui 2026-11-14) — "Filters: search by Town Hall or Builder Hall level, refine by New, Hot or Top and by base type".

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| memori/sesi/sesi_163.md | Dibuat | Berkas sesi ini |

## Sinkronisasi ke MEMORI.md
Belum disinkronkan
