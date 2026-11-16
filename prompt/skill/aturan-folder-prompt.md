diperbarui : Mon Nov 16 2026 07:48 WIB

file : [aturan-folder-prompt](../../.agents/skills/custom/aturan-folder-prompt/SKILL.md)

1. Setiap berkas di `prompt/` wajib memuat tanggal diperbarui lengkap beserta jam (mis. `diperbarui : Mon Nov 16 2026 07:48 WIB`).
2. Setiap berkas di `prompt/` wajib memuat target "ditimpa ke" (path tujuan) atau "file" (link ke berkas target), karena folder `prompt/` hanya mencatat poin-poin penting untuk masing-masing skill, aturan, dan command.
3. Nama berkas di `prompt/<subfolder>/` wajib sama dengan nama target (mis. `prompt/skill/aturan-folder-prompt.md` ↔ `.agents/skills/custom/aturan-folder-prompt/SKILL.md`).
4. Setiap skill wajib memiliki berkas poin di `prompt/skill/<nama-skill>.md` dengan nama yang sama (sesuai skill `aturan-pembuatan-skill` Aturan 13).
5. Berkas di `prompt/` hanya berisi poin-poin penting (ringkas); isi final tetap berada di target (`.agents/`, `.kilo/`).
6. Catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta link referensi) wajib ditempatkan di akhir berkas dan tidak boleh dimasukkan ke skill target.
7. Subfolder `prompt/` mengikuti jenis target: `prompt/skill/` (skill), `prompt/rules/` (aturan), `prompt/commands/` (command), `prompt/mode/` (mode command).
8. Berkas di `prompt/` wajib hanya mencakup poin-poin penting yang ringkas; dilarang memuat isi final/lengkap. Isi final tetap berada di target (`.agents/`, `.kilo/`).

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
