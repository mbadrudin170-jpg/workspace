diperbarui : Fri Nov 20 2026 04:35 WIB
ditimpa ke : `.kilo/commands/diskusi_hasil_analisa_transkrip.md`

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya; baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturannya.

2. Baca `docs/hasil_analisa/hasil_analisa_transkrip.md`. Jika berkas kosong/tidak ada, lapor ke pengguna dan berhenti.

3. Pastikan daftar entri lengkap: bila ada id yang belum terdaftar, tambahkan sesuai command `analisa_transkrip` (poin 2) sebelum melanjutkan. Jika ada entri dengan status "belum dianalisa", laporkan dan hentikan (jalankan `analisa_transkrip` terlebih dahulu).

4. Evaluasi **semua** entri yang sudah dianalisa (jangan hanya satu id): tampilkan daftar entri (id, Created At, Topik, Status) dan ringkasan analisa masing-masing (ringkasan transkrip, kesalahan AI + bukti/lokasi, sumber kesalahan, saran).

5. Tanyakan keputusan pengguna (tool `question`): apakah perlu memperbarui/membuat aturan/skill/command berdasarkan saran dari seluruh entri; jika tidak, berhenti tanpa mengubah apa pun.

6. Jika disetujui: siapkan draf perubahan gabungan (tambah/perbarui aturan/skill/command), tampilkan draf, lalu tunggu persetujuan eksplisit sebelum mengedit; jangan hapus poin penting yang ada.

7. Perubahan skill wajib mengikuti `aturan-pembuatan-skill` (nama folder = `name`, frontmatter, berkas poin `prompt/skill/<nama>.md`) dan memperbarui indeks `kelompok_skill_wajib_non_code.md` bila ada skill baru/berubah.

8. Skill di `.agents/skills/code/` hanya boleh diubah dari riwayat commit kecuali persetujuan eksplisit pengguna (dicatat "di luar alur commit-history atas persetujuan pengguna (sesi N)").

9. Jika perubahan menyentuh skill `code/` atau berdampak aturan kode: tambahkan/perbarui aturan di `.agents/rules/code.md` (wajib skill terkait); jika hanya non-code, jangan ubah code.md.

10. Setelah mengedit (bila disetujui): verifikasi nama folder skill sesuai `name`, `description` memicu temuan, lalu jalankan `formatmd` (alias `npx prettier --write "**/*.md"`).

11. Laporkan hasil diskusi dan perubahan yang diterapkan.

# Skill Terkait

- memori-check
- aturan-pembuatan-skill
- penggunaan-tool-question
- penggunaan-tool-bawaan-kilo
- aturan-folder-prompt
