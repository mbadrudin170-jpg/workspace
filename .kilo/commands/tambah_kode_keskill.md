description: Menambahkan atau memperbarui skill yang relevan dengan potongan kode yang diberikan pengguna.

# Tambah Kode ke Skill

1. `$ARGUMENTS`: potongan kode dan/atau daftar berkas yang diberikan pengguna; jika kosong, tanyakan kode/berkas yang dimaksud.

2. Baca `AGENTS.md` dan `instructions` pada `.kilo/kilo.jsonc`; patuhi aturan yang terdaftar.

3. Jika pengguna memberikan berkas (satu atau lebih): periksa diff setiap berkas pada tiga keadaan — (a) belum ter-stage: `git diff -- <berkas>`; (b) ter-stage: `git diff --cached -- <berkas>`; (c) sudah di-commit/riwayat commit: `git show HEAD -- <berkas>` dan/atau `git log -p -n 5 -- <berkas>` sesuai konteks. Jalankan perintah di root repositori atau submodule yang sesuai (gunakan `git -C <path>` bila berkas berada di submodule). Gunakan hasil diff sebagai konteks analisis.

4. Identifikasi skill yang relevan dengan kode/diff tersebut di `.agents/skills/code/` dan `.agents/skills/non-code/` (rujuk indeks `.agents/rules/kelompok_skill_wajib_non_code.md` untuk non-code).

5. Jika skill yang relevan ditemukan: siapkan draf perubahan (tambah/perbarui) berdasarkan kode/diff pengguna. Tampilkan draf, lalu tunggu persetujuan eksplisit sebelum mengedit; jangan menghapus poin penting yang ada.

6. Jika tidak ditemukan skill yang relevan: tanyakan kepada pengguna apakah perlu membuat skill baru; tanpa persetujuan, berhenti dan jangan mengubah apa pun.

7. Perubahan/pembuatan skill wajib mengikuti `aturan-pembuatan-skill` (nama folder = `name`, frontmatter `name` + `description`, bahasa Indonesia, berkas poin `prompt/skill/<nama>.md` sesuai `aturan-pembuatan-skill` Aturan 11) dan memperbarui `.agents/rules/kelompok_skill_wajib_non_code.md` (untuk skill non-code) bila ada skill baru atau skill yang berubah. Bila penerapan Aturan 11 pada skill `code/` tidak jelas dalam konteks ini, laporkan dan minta keputusan pengguna sebelum bertindak.

8. Skill di `.agents/skills/code/` hanya boleh diubah dari riwayat commit (aturan `.agents/rules/lainnya.md`). Jika kode relevan ke skill `code/` tetapi tidak berasal dari alur riwayat commit yang sah: jelaskan batasan, tampilkan draf/rekomendasi, dan jangan mengedit skill `code/`; lanjutkan hanya pada bagian yang diizinkan (mis. skill `non-code/` atau aturan relevan) bila disetujui pengguna.

9. Jika sudah memiliki gambaran kandidat perubahan: tampilkan dulu setiap potongan kode/kandidat perubahan yang akan ditambahkan, lalu gunakan tool `question` dengan parameter `multiple: true` untuk menanyakan potongan mana yang ingin dimasukkan. Setiap opsi wajib memuat satu potongan kode/kandidat saja (jangan menggabungkan beberapa kode, mis. "A+B"), sertakan satu opsi "Skip", dan tunggu pilihan sebelum mengedit.

10. Jika perubahan/pembuatan menyentuh skill `code/` atau berdampak pada pola/aturan kode: tambahkan atau perbarui aturan terkait di `.agents/rules/code.md` dan setiap aturan wajib menyertakan skill terkaitnya (rujuk skill yang diperbarui/dibuat); dilarang menambah aturan tanpa skill terkait. Jika hanya menyentuh skill `non-code/` tanpa dampak aturan kode, jangan ubah `.agents/rules/code.md`.

11. Setelah mengedit (bila disetujui): verifikasi (a) nama folder skill sesuai `name`/isi berkas, (b) `description` memicu (trigger) kode/baris yang diperbarui, lalu jalankan `formatmd` (alias: `npx prettier --write "**/*.md"`) untuk merapikan berkas Markdown.

# Skill Terkait

- aturan-pembuatan-skill
- penggunaan-tool-question
- memori-check
