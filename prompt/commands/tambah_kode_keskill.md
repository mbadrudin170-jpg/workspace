diperbarui : Wed Nov 18 2026 09:11 WIB
ditimpa ke : `.kilo/commands/tambah_kode_keskill.md`

1. `$ARGUMENTS`: potongan kode yang diberikan pengguna; jika kosong, tanyakan kode yang dimaksud.

2. Baca `AGENTS.md` dan `instructions` pada `.kilo/kilo.jsonc`; patuhi aturan yang terdaftar.

3. Identifikasi skill yang relevan dengan kode tersebut di `.agents/skills/code/` dan `.agents/skills/non-code/` (rujuk indeks `.agents/rules/kelompok_skill_wajib.md`).

4. Jika skill yang relevan ditemukan: tambahkan atau perbarui skill itu berdasarkan kode pengguna. Tampilkan draf perubahan, lalu tunggu persetujuan eksplisit sebelum mengedit; jangan menghapus poin penting yang ada.

5. Jika tidak ditemukan skill yang relevan: tanyakan kepada pengguna apakah perlu membuat skill baru; tanpa persetujuan, berhenti dan jangan mengubah apa pun.

6. Perubahan/pembuatan skill wajib mengikuti `aturan-pembuatan-skill` (nama folder = `name`, frontmatter `name` + `description`, bahasa Indonesia, berkas poin `prompt/skill/<nama>.md` (kecuali skill di `.agents/skills/code/`)) dan memperbarui `.agents/rules/kelompok_skill_wajib.md` bila ada skill baru atau skill yang berubah.

7. Skill di `.agents/skills/code/` hanya boleh diubah dari riwayat commit (aturan `.agents/rules/lainnya.md`); jangan mengedit skill `code/` di luar alur tersebut.

8. Setelah mengedit, jalankan `formatmd` untuk merapikan berkas Markdown.

9. Setelah memperbarui atau menambah ke berkas skill yang ada, wajib cek kedua item berikut:
   - Nama folder skill: wajib cek apakah nama folder sudah sesuai dengan isi berkas yang baru.
   - Description: wajib cek apakah description dapat memicu (trigger) kode atau baris yang baru saja diperbarui.

10. Tambahkan juga aturan (rule) terkait ke `.agents/rules/code.md`; setiap aturan wajib menyertakan skill terkaitnya (rujuk skill yang baru diperbarui/dibuat); dilarang menambah aturan tanpa skill terkait.
