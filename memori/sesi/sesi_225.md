## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Tue Nov 17 2026 18:22 WIB
- Command: salin_prompt_ke_target (parameter "prompt/skill/aturan-pembuatan-commands.md, prompt/skill/riverpod-pola.md")
- Topik: Sinkronisasi 2 berkas `prompt/skill/` ke target masing-masing

## Catatan Sesi

- Memproses 2 berkas skill yang diminta pengguna: `aturan-pembuatan-commands` dan `riverpod-pola`
- Perbaikan typo pada source: "agaents.md" → "AGENTS.md" (aturan-pembuatan-commands)
- Penambahan aturan baru ke target: aturan 8 (baca AGENTS.md) untuk aturan-pembuatan-commands
- Penambahan aturan 18 (`await ref.watch(provider.future)`) untuk riverpod-pola
- Frontmatter target riverpod-pola diperbarui: versi 1.1.0 → 1.2.0, tanggal diperbarui
- Catch-up sinkron (sesi 228): perubahan nyata telah disinkronkan — entri ditambahkan ke `memori/riwayat_perubahan.md` (sesi 225), header `MEMORI.md` diperbarui. Berkas yang terlibat: `.agents/skills/custom/aturan-pembuatan-commands/SKILL.md` (Ditimpa), `.agents/skills/custom/riverpod-pola/SKILL.md` (Ditimpa), `prompt/skill/aturan-pembuatan-commands.md` (Diperbaiki), `prompt/skill/riverpod-pola.md` (Diperbaiki). Tidak ada kode Dart yang diubah; tidak ada commit/push.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| .agents/skills/custom/aturan-pembuatan-commands/SKILL.md | Ditimpa | Tambah aturan 8 (baca AGENTS.md), perbaiki deskripsi skill |
| .agents/skills/custom/riverpod-pola/SKILL.md | Ditimpa | Tambah aturan 18, update versi 1.2.0, tanggal |
| prompt/skill/aturan-pembuatan-commands.md | Diperbaiki | Fix typo "agaents.md" → "AGENTS.md", update timestamp |
| prompt/skill/riverpod-pola.md | Diperbaiki | Update timestamp |

## Sinkronisasi ke MEMORI.md

Sinkronisasi selesai (sesi 228): entri riwayat perubahan ditambahkan; header `MEMORI.md` diperbarui (Diperbarui: Tue Nov 17 2026 18:48 WIB). Perubahan dokumentasi/skill tidak dipromosi ke isi inti `MEMORI.md` (belum memenuhi kriteria promosi Aturan 14).