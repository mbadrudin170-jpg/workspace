diperbarui : Fri Nov 20 2026 07:31 WIB
ditimpa ke : `AGENTS.md` (root)

1. Baca secara eksplisit (tool Read) seluruh berkas di `.agents/rules/` sebelum bekerja; sesi tidak dilanjutkan bila belum dibaca (fatal bagi kode). Jangan hanya mengandalkan pemuatan via `instructions`.
2. Di awal sesi, baca `MEMORI.md`, lalu buat satu berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1) sebelum tindakan yang mengubah proyek.
3. Setiap `SKILL.md` di `.agents/skills/` wajib diperlakukan sebagai aturan yang mengikat, setara dengan `.agents/rules/`.
4. Root workspace bukan proyek Flutter; `lib/main.dart` berada di submodule (bukan root).
5. Setiap memulai percakapan wajib membuat dulu berkas sesinya.
6. Baca skill `memori-check` terlebih dahulu sebelum memulai percakapan.
7. Checklist wajib awal sesi (lakukan berurutan, jangan lewati):
   - baca `MEMORI.md` (tool Read)
   - baca seluruh berkas di `.agents/rules/` (tool Read)
   - buat berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1)
   - muat skill `memori-check` (tool `skill`)
8. Membaca `MEMORI.md` wajib tanpa `offset` dan tanpa `limit` — baca seluruh isi berkas.
9. setiap proyek saya yang punya main.dart wajib memakai PengelolaOverlayLogDebug
10. Setiap proyek saya wajib konsisten dan mengikuti seluruh aturan yang ada di `.agents/rules/code.md`.
11. Setiap command Kilo yang mencantumkan bagian `# Skill Terkait`, AI wajib memuat semua skill yang tercantum (via tool `skill`) sebelum melaksanakan langkah command; dilarang melaksanakan langkah tanpa memuat skill terkait yang tersedia.
12. Setiap pengguna bertanya atau memerintahkan mengerjakan sesuatu, AI wajib memuat skill yang relevan (via tool `skill`) sebelum bertindak.
