description: Memantau transkrip sesi Kilo (ses_...) atau lampiran transkrip yang diberikan pengguna, mengamati pekerjaan AI di dalamnya, dan mengevaluasi kesalahan/pelanggaran yang perlu ditambahkan/diperbarui pada aturan/skill.

# Pantau dan Evaluasi Transkrip

1. `$ARGUMENTS`: satu atau lebih ID transkrip Kilo (`ses_...`) atau lampiran transkrip sesi yang diberikan pengguna; jika kosong, tanyakan transkrip/ID yang dimaksud.

2. Baca `AGENTS.md` dan `instructions` pada `.kilo/kilo.jsonc`; patuhi aturan yang terdaftar.

3. Jika pengguna memberikan ID `ses_...`: gunakan `kilo_local_recall` mode `read` untuk mengambil dump penuh transkrip dan baca seluruhnya sampai tuntas (untuk transkrip besar, delegasikan ekstraksi bukti — kutipan + lokasi — ke agen explore); jika pengguna memberikan lampiran transkrip langsung, gunakan lampiran tersebut dan baca seluruhnya sampai tuntas.

4. Amati pekerjaan AI di dalam transkrip: identifikasi kesalahan/pelanggaran terhadap aturan dan skill yang berlaku — rujuk `.agents/rules/code.md`, `.agents/rules/lainnya.md`, `.agents/rules/kelompok_skill_wajib_non_code.md`, serta seluruh skill di `.agents/skills/code/` dan `.agents/skills/non-code/`; abaikan temuan yang sudah tercakup aturan/skill yang ada, dan tandai sisanya sebagai celah.

5. Jika celah ditemukan dan aturan/skill relevan ada: siapkan draf perubahan (tambah/perbarui). Tampilkan draf, lalu tunggu persetujuan eksplisit sebelum mengedit; jangan menghapus poin penting yang ada.

6. Jika tidak ditemukan aturan/skill yang relevan: tanyakan kepada pengguna apakah perlu membuat aturan/skill baru; tanpa persetujuan, berhenti dan jangan mengubah apa pun.

7. Perubahan/pembuatan skill wajib mengikuti `aturan-pembuatan-skill` (nama folder = `name`, frontmatter `name` + `description`, bahasa Indonesia, berkas poin `prompt/skill/<nama>.md` sesuai `aturan-pembuatan-skill` Aturan 11) dan memperbarui `.agents/rules/kelompok_skill_wajib_non_code.md` (untuk skill non-code) bila ada skill baru atau skill yang berubah. Bila penerapan Aturan 11 pada skill `code/` tidak jelas dalam konteks ini, laporkan dan minta keputusan pengguna sebelum bertindak.

8. Skill di `.agents/skills/code/` hanya boleh diubah dari riwayat commit (aturan `.agents/rules/lainnya.md`), kecuali atas persetujuan eksplisit pengguna di luar alur commit-history (dicatat: "di luar alur commit-history atas persetujuan pengguna (sesi N)"). Jika kode relevan ke skill `code/` tetapi tidak berasal dari alur riwayat commit yang sah: jelaskan batasan, tampilkan draf/rekomendasi, dan jangan mengedit skill `code/`; lanjutkan hanya pada bagian yang diizinkan (mis. skill `non-code/` atau aturan relevan) bila disetujui pengguna.

9. Jika sudah memiliki gambaran kandidat perubahan: tampilkan dulu setiap potongan kode/kandidat perubahan yang akan ditambahkan, lalu gunakan tool `question` dengan parameter `multiple: true` untuk menanyakan potongan mana yang ingin dimasukkan. Setiap opsi wajib memuat satu potongan kode/kandidat saja (jangan menggabungkan beberapa kode, mis. "A+B"), sertakan satu opsi "Skip", dan tunggu pilihan sebelum mengedit.

10. Jika perubahan/pembuatan menyentuh skill `code/` atau berdampak pada pola/aturan kode: tambahkan atau perbarui aturan terkait di `.agents/rules/code.md` dan setiap aturan wajib menyertakan skill terkaitnya (rujuk skill yang diperbarui/dibuat); dilarang menambah aturan tanpa skill terkait. Jika hanya menyentuh skill `non-code/` tanpa dampak aturan kode, jangan ubah `.agents/rules/code.md`.

11. Setelah mengedit (bila disetujui): verifikasi (a) nama folder skill sesuai `name`/isi berkas, (b) `description` memicu (trigger) temuan/kode/baris yang diperbarui, lalu jalankan `formatmd` (alias: `npx prettier --write "**/*.md"`) untuk merapikan berkas Markdown.

12. Tujuannya agar sebuah AI tidak mengulang kesalahan yang sama di masa mendatang: pemantauan transkrip menghasilkan aturan/skill yang menjaga kualitas sesi AI setelahnya.

13. Sebelum menetapkan (memilih) kandidat perubahan, tampilkan dulu setiap kandidat beserta penjelasan dan potongan kode; baru tanyakan pilihan pengguna (lihat poin 9).

# Skill Terkait

- memori-check
- aturan-pembuatan-skill
- penggunaan-tool-question
- penggunaan-tool-bawaan-kilo
