diperbarui : Tue Nov 17 2026 21:55 WIB
file : [aturan-folder-prompt](../../.agents/skills/non-code/aturan-folder-prompt/SKILL.md)

1. Setiap berkas di `prompt/` wajib memuat header: `diperbarui :` (tanggal lengkap + jam) dan `ditimpa ke :` (path tujuan) atau `file :` (link ke berkas target).
2. Nama berkas di `prompt/<subfolder>/` wajib sama dengan nama target (mis. `prompt/skill/aturan-folder-prompt.md` ↔ `.agents/skills/non-code/aturan-folder-prompt/SKILL.md`).
3. Berkas di `prompt/` hanya berisi poin-poin penting (ringkas); dilarang memuat isi final/lengkap — isi final tetap di target (`.agents/`, `.kilo/`).
4. Setiap memperbarui isi berkas di `prompt/`, wajib memperbarui field `diperbarui :` (tanggal + jam).
5. Subfolder `prompt/` mengikuti jenis target: `prompt/skill/` (skill), `prompt/rules/` (aturan), `prompt/commands/` (command), `prompt/mode/` (mode command).
6. Catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta link referensi) wajib di akhir berkas dan tidak boleh dimasukkan ke skill target.
7. Tanggal wajib memakai zona waktu Asia/Jakarta.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com