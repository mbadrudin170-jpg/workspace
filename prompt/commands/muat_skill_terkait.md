diperbarui : Fri Nov 20 2026 21:23 WIB
ditimpa ke : `.kilo/commands/muat_skill_terkait.md`

1. Baca terlebih dahulu `.agents/rules/kelompok_skill_wajib_non_code.md` (indeks skill non-code) dan `.agents/rules/code.md` (aturan khusus kode beserta skill terkaitnya); bila kedua berkas tidak tersedia, gunakan daftar skill yang tersedia (available_skills).

2. Bila pekerjaan yang sedang atau akan dikerjakan berkaitan dengan kode, pindai `.agents/skills/code/*/SKILL.md` — cocokkan `description`/Trigger tiap skill dengan pekerjaan tersebut; muat semua yang relevan dan yang sedikit kurang relevan (deskripsi skill belum tentu detail), termasuk yang tidak dirujuk code.md.

3. Dari berkas pada poin 1–2, cari skill yang relevan (dan yang sedikit kurang relevan) dengan pekerjaan yang sedang atau akan dikerjakan; bila ada, muat semua skill itu via tool `skill`; bila tidak ada, laporkan ke pengguna.

4. Sebelum menyebut nama/path skill, verifikasi keberadaannya (glob/read); jangan menyebut skill yang tidak ada.
