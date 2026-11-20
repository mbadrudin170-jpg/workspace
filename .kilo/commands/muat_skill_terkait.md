description: Memuat skill yang relevan sebelum mengerjakan tugas (indeks non-code + code.md + pemindaian skill code/).

# Muat Skill Terkait

1. Baca terlebih dahulu `.agents/rules/kelompok_skill_wajib_non_code.md` (indeks skill non-code) dan `.agents/rules/code.md` (aturan khusus kode beserta skill terkaitnya); bila kedua berkas tidak tersedia, gunakan daftar skill yang tersedia (available_skills).

2. Bila pekerjaan yang sedang atau akan dikerjakan berkaitan dengan kode, pindai `.agents/skills/code/*/SKILL.md` — cocokkan `description`/Trigger tiap skill dengan pekerjaan tersebut; muat semua yang relevan dan yang sedikit kurang relevan (deskripsi skill belum tentu detail), termasuk yang tidak dirujuk code.md. Jika deskripsi skill menyebut satu kata yang sama dengan pekerjaan yang akan dikerjakan, wajib muat skill itu.

3. Dari berkas pada poin 1–2, cari skill yang relevan (dan yang sedikit kurang relevan) dengan pekerjaan yang sedang atau akan dikerjakan; bila ada, muat semua skill itu via tool `skill`; bila tidak ada, laporkan ke pengguna. Jika deskripsi skill menyebut satu kata yang sama dengan pekerjaan yang akan dikerjakan, wajib muat skill itu.

4. Sebelum menyebut nama/path skill, verifikasi keberadaannya (glob/read); jangan menyebut skill yang tidak ada.

5. Muat juga skill yang berkaitan dengan topik percakapan saat ini (termasuk skill non-code yang relevan), meskipun tidak muncul dari pemindaian code/ pada poin 2.
