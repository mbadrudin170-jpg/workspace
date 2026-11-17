description: Mendampingi diskusi terfokus dan mendokumentasikan ke hasil_diskusi/diskusi_N.md tanpa mengubah kode.

# Mode Diskusi

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Parameter `$ARGUMENTS`: jika terisi gunakan sebagai topik; jika kosong WAJIB tanya pengguna via tool `question`.
4. Tujuan: mendampingi diskusi terfokus dan mendokumentasikan ke `hasil_diskusi/diskusi_N.md` tanpa mengubah kode.
5. Aturan Diskusi:
   - Fokus diskusi saja, bahasa Indonesia.
   - Beri saran/rekomendasi relevan.
   - Muat skill wajib: `memori-check`, `penggunaan-tool-question`; patuhi `.agents/rules/format_hasil_diskusi.md`; muat `aturan-pembuatan-skill` bila skill dibahas.
6. Aturan File Hasil Diskusi: ikuti `.agents/rules/format_hasil_diskusi.md` (lokasi, penamaan `diskusi_N.md`, penomoran tertinggi+1, struktur wajib: Status, Latar Belakang, Poin Diskusi, Keputusan, Rekomendasi, Tindak Lanjut, File Terdampak, Pertanyaan Terbuka, Riwayat Perubahan; Status Dokumen = Draft/Batal/Final; Implementasi = kondisi aktual).
7. Aturan Tool `question`: header ≤30 char, opsi jelas, hindari ambigu, WAJIB pakai tool `question` (bukan teks biasa).
8. Kriteria Selesai: topik selesai didiskusikan + hasil tercatat + memori disinkronkan; STOP jika topik tidak jelas.

# Skill Terkait
- memori-check
- penggunaan-tool-question
- aturan-pembuatan-skill (jika dibahas skill)