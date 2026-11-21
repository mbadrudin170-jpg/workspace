---
name: aturan-folder-prompt
description: 'Trigger: saat menambah atau memperbarui file di folder prompt/ | Aturan folder prompt/: setiap file wajib memuat tanggal diperbarui (lengkap + jam, zona waktu Asia/Jakarta) dan target ''ditimpa ke''/''file'' (path tujuan), karena folder prompt/ hanya mencatat poin-poin penting untuk masing-masing skill, aturan, dan command. Subfolder: prompt/skill/, prompt/rules/, prompt/commands/ (dan prompt/mode/ bila ada). Setiap skill wajib memiliki berkas poin di prompt/skill/ dengan nama yang sama. Aturan Folder Prompt Folder `prompt/` di root proyek menyimpan rujukan/draft (poin-poin penting) untuk skill, aturan, dan command. Setiap berkas di folder ini **bukan** isi final, melainkan catatan poin yang akan "ditimpa" ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`). Cakupan yang Di-Cover - Folder: `prompt/` (root proyek), subfolder `prompt/skill/`, `prompt/rules/`, `prompt/commands/`, dan `prompt/mode/` (bila ada). - Berkas target: `.agents/skills/code/<nama>/SKILL.md` atau `.agents/skills/non-code/<nama>/'
metadata:
  kategori: "custom"
  versi: "1.5.0"
  diperbarui: "Wed Nov 18 2026 01:38 WIB"
---

# Aturan Folder Prompt

Folder `prompt/` di root proyek menyimpan rujukan/draft (poin-poin penting) untuk skill, aturan, dan command. Setiap berkas di folder ini **bukan** isi final, melainkan catatan poin yang akan "ditimpa" ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`).

## Cakupan yang Di-Cover

- Folder: `prompt/` (root proyek), subfolder `prompt/skill/`, `prompt/rules/`, `prompt/commands/`, dan `prompt/mode/` (bila ada).
- Berkas target: `.agents/skills/code/<nama>/SKILL.md` atau `.agents/skills/non-code/<nama>/SKILL.md`, `.agents/rules/<nama>.md`, `.kilo/commands/<nama>.md`, `.kilo/commands/mode/<nama>.md`.
- Header wajib pada setiap berkas di `prompt/`: `diperbarui :` (tanggal lengkap + jam) dan `ditimpa ke :` / `file :` (path tujuan).

## Aturan

1. Setiap berkas di `prompt/` **wajib** memuat header: `diperbarui :` (tanggal lengkap + jam) dan `ditimpa ke :` (path tujuan) atau `file :` (link ke berkas target).
2. Tanggal `diperbarui` **wajib** memakai zona waktu Asia/Jakarta (WIB) dan **wajib** diperbarui setiap kali isi berkas di `prompt/` diperbarui.
3. Nama berkas di `prompt/<subfolder>/` **wajib** sama dengan nama target agar mudah dievaluasi (mis. `prompt/skill/aturan-folder-prompt.md` ↔ `.agents/skills/non-code/aturan-folder-prompt/SKILL.md`).
4. Setiap skill wajib memiliki berkas poin di `prompt/skill/<nama-skill>.md` dengan nama yang sama (sesuai skill `aturan-pembuatan-skill` Aturan 11).
5. Berkas di `prompt/` **wajib** hanya berisi poin-poin penting (ringkas); **dilarang** memuat isi final/lengkap. Isi final tetap berada di target (`.agents/`, `.kilo/`).
6. Subfolder `prompt/` mengikuti jenis target: `prompt/skill/` (skill), `prompt/rules/` (aturan), `prompt/commands/` (command), `prompt/mode/` (mode command).
7. Catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta link referensi) **wajib** ditempatkan di akhir berkas sumber dan **tidak boleh** dimasukkan ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`).
8. Setiap butir poin wajib dipisahkan oleh satu baris kosong.
9. Setiap kali isi berkas di `prompt/` diperbarui, langsung perbarui juga berkas targetnya — tetapi hanya setelah mendapat izin pengguna (gunakan tool `question`).

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
file : [nama-skill](../../.agents/skills/non-code/nama-skill/SKILL.md)

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
