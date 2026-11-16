---
name: aturan-folder-prompt
description: "Trigger: saat menambah atau memperbarui file di folder prompt/ | Aturan folder prompt/: setiap file wajib memuat tanggal diperbarui (lengkap + jam) dan target 'ditimpa ke'/'file' (path tujuan), karena folder prompt/ hanya mencatat poin-poin penting untuk masing-masing skill, aturan, dan command. Subfolder: prompt/skill/, prompt/rules/, prompt/commands/ (dan prompt/mode/ bila ada). Setiap skill wajib memiliki berkas poin di prompt/skill/ dengan nama yang sama."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Mon Nov 16 2026 07:48 WIB"
---

# Aturan Folder Prompt

Folder `prompt/` di root proyek menyimpan rujukan/draft (poin-poin penting) untuk skill, aturan, dan command. Setiap berkas di folder ini **bukan** isi final, melainkan catatan poin yang akan "ditimpa" ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`).

## Cakupan yang Di-Cover

- Folder: `prompt/` (root proyek), subfolder `prompt/skill/`, `prompt/rules/`, `prompt/commands/`, dan `prompt/mode/` (bila ada).
- Berkas target: `.agents/skills/custom/<nama>/SKILL.md`, `.agents/rules/global/<nama>.md`, `.kilo/commands/<nama>.md`, `.kilo/commands/mode/<nama>.md`.
- Header wajib pada setiap berkas di `prompt/`: `diperbarui :` (tanggal lengkap + jam) dan `ditimpa ke :` / `file :` (path tujuan).

## Aturan

1. Setiap berkas di `prompt/` **wajib** memuat tanggal diperbarui lengkap beserta jam (mis. `diperbarui : Mon Nov 16 2026 07:36 WIB`).
2. Setiap berkas di `prompt/` **wajib** memuat target "ditimpa ke" (path tujuan) atau "file" (link ke berkas target), karena folder `prompt/` hanya mencatat poin-poin penting untuk masing-masing skill, aturan, dan command.
3. Nama berkas di `prompt/<subfolder>/` **wajib** sama dengan nama target (mis. `prompt/skill/aturan-pembuatan-skill.md` ↔ `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`).
4. Setiap skill wajib memiliki berkas poin di `prompt/skill/<nama-skill>.md` dengan nama yang sama (sesuai skill `aturan-pembuatan-skill` Aturan 13).
5. Berkas di `prompt/` hanya berisi poin-poin penting (ringkas); isi final tetap berada di target (`.agents/`, `.kilo/`).
6. Catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta link referensi) **wajib** ditempatkan di akhir berkas dan **tidak boleh** dimasukkan ke skill target.
7. Subfolder `prompt/` mengikuti jenis target: `prompt/skill/` (skill), `prompt/rules/` (aturan), `prompt/commands/` (command), `prompt/mode/` (mode command).

8. Berkas di `prompt/` **wajib** hanya mencakup poin-poin penting yang ringkas; DILARANG memuat isi final/lengkap. Isi final tetap berada di target (`.agents/`, `.kilo/`).

## Larangan

- Berkas di `prompt/` tanpa tanggal diperbarui (lengkap + jam).
- Berkas di `prompt/` tanpa target "ditimpa ke"/"file".
- Memasukkan link referensi dari catatan "hanya untuk penulis prompt" ke skill/aturan/command target.
- Berkas di `prompt/` memuat isi final/lengkap (bukan poin ringkas).

## Contoh Benar

```markdown
diperbarui : Mon Nov 16 2026 07:36 WIB
ditimpa ke : `.kilo/commands/mode/mode_diskusi.md`

# Judul

1. Poin penting 1
2. Poin penting 2

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/...
```

```markdown
file : [nama-skill](../../.agents/skills/custom/nama-skill/SKILL.md)

1. Poin penting 1
2. Poin penting 2

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/...
```

## Contoh Salah

```markdown
# Judul

1. Poin penting 1
```
(Tanpa tanggal diperbarui dan tanpa target "ditimpa ke"/"file".)

## Sumber Evaluasi

- Permintaan eksplisit pengguna (sesi 183, 2026-11-16): aturan yang berisi saat menambah dan memperbarui semua file yang ada di folder prompt.
- Pola nyata: `prompt/skill/aturan-pembuatan-skill.md`, `prompt/skill/aturan-pembuatan-rules.md`, `prompt/rules/AGENTS.md`, `prompt/commands/mode_diskusi.md`, `prompt/commands/commit_file_sesi_ini.md`.
- Skill terkait: `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` (Aturan 13).
