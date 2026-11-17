1. Baca secara eksplisit (tool Read) seluruh berkas di `.agents/rules/global/` sebelum bekerja; sesi tidak dilanjutkan bila belum dibaca (fatal bagi kode). Jangan hanya mengandalkan pemuatan via `instructions`.
2. Di awal sesi, baca `MEMORI.md`, lalu buat satu berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1) sebelum tindakan yang mengubah proyek.
3. Setiap `SKILL.md` di `.agents/skills/` wajib diperlakukan sebagai aturan yang mengikat, setara dengan `.agents/rules/`.
4. Root workspace bukan proyek Flutter; `lib/main.dart` berada di submodule (bukan root).
5. Setiap memulai percakapan wajib membuat dulu berkas sesinya.
6. Baca skill `memori-check` terlebih dahulu sebelum memulai percakapan.
7. Checklist wajib awal sesi (lakukan berurutan, jangan lewati):
   - baca `MEMORI.md` (tool Read)
   - baca seluruh berkas di `.agents/rules/global/` (tool Read)
   - buat berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1)
   - muat skill `memori-check` (tool `skill`)
