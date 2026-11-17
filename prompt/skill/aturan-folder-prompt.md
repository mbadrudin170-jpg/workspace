diperbarui : Wed Nov 18 2026 00:03 WIB
file : [aturan-folder-prompt](../../.agents/skills/non-code/aturan-folder-prompt/SKILL.md)

1. Setiap berkas di `prompt/` wajib memuat header `diperbarui :` (tanggal lengkap + jam, zona waktu Asia/Jakarta) dan `ditimpa ke :` atau `file :` (path/tautan target).

2. Nama berkas di `prompt/<subfolder>/` wajib sama dengan nama target (mis. `prompt/skill/aturan-folder-prompt.md` ↔ `.agents/skills/non-code/aturan-folder-prompt/SKILL.md`).

3. Berkas di `prompt/` hanya berisi poin-poin penting (ringkas); dilarang memuat isi final/lengkap. Isi final tetap di berkas target (`.agents/`, `.kilo/`).

4. Setiap kali isi berkas di `prompt/` diperbarui, field `diperbarui :` wajib diperbarui (tanggal + jam, WIB).

5. Subfolder `prompt/` mengikuti jenis target: `prompt/skill/`, `prompt/rules/`, `prompt/commands/`, `prompt/mode/` (bila ada).

6. Catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta tautan referensi) wajib ditempatkan di akhir berkas dan tidak boleh dimasukkan ke berkas target.

7. Setiap butir poin wajib dipisahkan oleh satu baris kosong.
8. setiap memperbarui isi file yang ada di folder prompt langsung perbarui juga isi file target nya tapi harus lewat izin pengguna juga gunakan question
# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
