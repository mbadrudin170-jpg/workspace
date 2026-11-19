# Sesi 117

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-20 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: Menghapus section "Sumber Evaluasi" dari seluruh skill dan aturan pembuatan skill

## Catatan Sesi

- Awal sesi: baca MEMORI.md, seluruh .agents/rules/, skill memori-check, aturan-folder-prompt, penggunaan-tool-question.
- Catch-up: berkas Belum Sinkron ambigu tetap tidak disentuh.
- Pengguna meminta skill jangan menyertakan sumber evaluasi; cakupan "semua skill" dipilih.
- Poin 8 aturan-pembuatan-skill diubah menjadi larangan `## Sumber Evaluasi`; poin 12/16 disesuaikan.
- Section `## Sumber Evaluasi` dihapus dari seluruh `SKILL.md` (74 berkas) via skrip Node.
- Prettier dijalankan.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| prompt/skill/aturan-pembuatan-skill.md | Diubah | Poin 8/12/16 disesuaikan + timestamp |
| .agents/skills/non-code/aturan-pembuatan-skill/SKILL.md | Diubah | Aturan 8/12/16 disesuaikan |
| .agents/skills/**/SKILL.md (74 berkas) | Diubah | Hapus section `## Sumber Evaluasi` |
| memori/sesi/sesi_117.md | Dibuat | Berkas sesi aktif |

## Sinkronisasi ke MEMORI.md

Sinkronisasi akhir sesi: tidak ada perubahan durable pada konvensi/aturan proyek yang perlu dipromosikan ke MEMORI.md (rujukan skill via indeks). Entri riwayat perubahan ditambahkan ke `memori/riwayat_perubahan.md` (sesi 117).
