diperbarui : Tue Nov 17 2026 16:09 WIB
ditimpa ke : `.kilo/commands/mode/mode_diskusi.md`

1. Parameter `$ARGUMENTS`: jika terisi gunakan sebagai topik; jika kosong WAJIB tanya pengguna via tool `question`.
2. Tujuan: mendampingi diskusi terfokus dan mendokumentasikan ke `hasil_diskusi/diskusi_N.md` tanpa mengubah kode.
3. Aturan Diskusi: fokus diskusi saja, bahasa Indonesia, beri saran/rekomendasi relevan, muat skill wajib (`memori-check`, `penggunaan-tool-question`, `format_hasil_diskusi.md`, `aturan-pembuatan-skill` bila dibahas skill).
4. Aturan File Hasil Diskusi: ikuti `.agents/rules/global/format_hasil_diskusi.md` (lokasi, penamaan `diskusi_N.md`, penomoran tertinggi+1, struktur wajib: Status, Latar Belakang, Poin Diskusi, Keputusan, Rekomendasi, Tindak Lanjut, File Terdampak, Pertanyaan Terbuka, Riwayat Perubahan; Status Dokumen = Draft/Batal/Final; Implementasi = kondisi aktual).
5. Aturan Tool `question`: header ≤30 char, opsi jelas, hindari ambigu, WAJIB pakai tool `question` (bukan teks biasa).
6. Kriteria Selesai: topik selesai didiskusikan + hasil tercatat + memori disinkronkan; STOP jika topik tidak jelas.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.
