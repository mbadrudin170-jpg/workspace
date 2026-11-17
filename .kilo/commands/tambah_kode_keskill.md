description: Menambahkan atau memperbarui skill yang relevan dengan potongan kode yang diberikan pengguna.

# Tambah Kode ke Skill

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. `$ARGUMENTS`: potongan kode yang diberikan pengguna; jika kosong, tanyakan kode yang dimaksud.
4. Identifikasi skill yang relevan dengan kode tersebut di `.agents/skills/code/` dan `.agents/skills/non-code/` (rujuk indeks `.agents/rules/kelompok_skill_wajib.md`).
5. Jika skill yang relevan ditemukan: tambahkan atau perbarui skill itu berdasarkan kode pengguna. Tampilkan draf perubahan, lalu tunggu persetujuan eksplisit sebelum mengedit; jangan menghapus poin penting yang ada.
6. Jika tidak ditemukan skill yang relevan: tanyakan kepada pengguna apakah perlu membuat skill baru; tanpa persetujuan, berhenti dan jangan mengubah apa pun.
7. Perubahan/pembuatan skill wajib mengikuti `aturan-pembuatan-skill` (nama folder = `name`, frontmatter `name` + `description`, bahasa Indonesia, berkas poin `prompt/skill/<nama>.md`) dan memperbarui `.agents/rules/kelompok_skill_wajib.md` bila ada skill baru atau skill yang berubah.
8. Skill di `.agents/skills/code/` hanya boleh diubah dari riwayat commit (aturan `.agents/rules/lainnya.md`); jangan mengedit skill `code/` di luar alur tersebut.
9. Setelah mengedit, jalankan `formatmd` untuk merapikan berkas Markdown.

# Skill Terkait

- aturan-pembuatan-skill
- penggunaan-tool-question
- memori-check
