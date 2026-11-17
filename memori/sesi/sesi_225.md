## Status

- Status Sinkron: Belum Sinkron
- Tanggal: Tue Nov 17 2026 18:22 WIB
- Command: salin_prompt_ke_target (parameter "prompt/skill/aturan-pembuatan-commands.md, prompt/skill/riverpod-pola.md")
- Topik: Sinkronisasi 2 berkas `prompt/skill/` ke target masing-masing

## Catatan Sesi

- Memproses 2 berkas skill yang diminta pengguna: `aturan-pembuatan-commands` dan `riverpod-pola`
- Perbaikan typo pada source: "agaents.md" → "AGENTS.md" (aturan-pembuatan-commands)
- Penambahan aturan baru ke target: aturan 8 (baca AGENTS.md) untuk aturan-pembuatan-commands
- Penambahan aturan 18 (await ref.watch(provider.future)) untuk riverpod-pola
- Frontmatter target riverpod-pola diperbarui: versi 1.1.0 → 1.2.0, tanggal diperbarui

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| .agents/skills/custom/aturan-pembuatan-commands/SKILL.md | Ditimpa | Tambah aturan 8 (baca AGENTS.md), perbaiki deskripsi skill |
| .agents/skills/custom/riverpod-pola/SKILL.md | Ditimpa | Tambah aturan 18, update versi 1.2.0, tanggal |
| prompt/skill/aturan-pembuatan-commands.md | Diperbaiki | Fix typo "agaents.md" → "AGENTS.md", update timestamp |
| prompt/skill/riverpod-pola.md | Diperbaiki | Update timestamp |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan