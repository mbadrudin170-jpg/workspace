diperbarui : Mon Nov 16 2026 13:37 WIB
ditimpa ke : `AGENTS.md` (root)

1. Di awal sesi wajib membaca `MEMORI.md`, lalu membuat berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1).
2. Setiap `SKILL.md` di `.agents/skills/` wajib diperlakukan sebagai aturan yang mengikat, setara dengan `.agents/rules/`.
3. Root workspace bukan proyek Flutter; `lib/main.dart` berada di submodule (bukan root).
4. Semua aturan berlaku untuk semua repo.
5. Baca seluruh berkas di `.agents/rules/global/` sebelum bekerja; sesi tidak dilanjutkan bila belum dibaca (fatal bagi kode).
6. setiap memulai percakapan wajib buat dulu file sesi nya