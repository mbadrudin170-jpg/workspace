diperbarui : Tue Nov 17 2026 23:39 WIB
file : [membuat_prd_fitur](../../.kilo/commands/fitur/membuat_prd_fitur.md)

1. Membuat atau memperbarui PRD untuk satu item fitur dari `refrensi_apk.md`, berdiskusi hingga PRD final, tanpa mengubah kode Dart.
2. Baca `AGENTS.md` dan `.agents/skills/non-code/format-prd/SKILL.md`; patuhi keduanya.
3. Gunakan bahasa Indonesia baku.
4. Command ini hanya menghasilkan/memperbarui dokumen PRD; tidak mengubah kode.
5. Cakupan: `refrensi_apk.md` (sumber item fitur) dan berkas PRD di folder `prd/`.
6. `$ARGUMENTS`: nama fitur atau item pada `refrensi_apk.md` yang akan dibuatkan PRD; kosong atau tidak cocok → STOP dan tanyakan ke pengguna via tool `question`.
7. Alur kerja: Analyze (ambil satu item, periksa apakah sudah diimplementasikan, status tetap `Belum Diimplementasikan`), Plan (identifikasi file terdampak, periksa tautan APK referensi), Execute (susun PRD sesuai skill `format-prd`, sertakan path dan baris `refrensi_apk.md`, contoh potongan kode singkat, tandai item sudah dibuatkan PRD), Review (perbarui PRD sambil berdiskusi, gunakan tool `question` hingga final), Muat skill yang trigger-nya relevan dengan fitur sebelum menyusun PRD.
8. Format laporan: path PRD yang dibuat/diperbarui, daftar `file terdampak` dan bukti tidak bertumpang tindih dengan PRD lain, status diskusi (Draft/Final) dan pertanyaan yang masih terbuka.
9. Larangan: DILARANG mengubah kode Dart satu pun; DILARANG mengedit berkas di luar PRD terkait dan penanda pada `refrensi_apk.md`; DILARANG menaikkan `Status Implementasi` menjadi `Sedang/Sudah Diimplementasikan`; DILARANG mengarang fitur atau tautan referensi; DILARANG commit/push.
10. Kriteria selesai / STOP: selesai bila PRD tersusun sesuai skill `format-prd` dan pengguna menyatakan final; STOP bila item tidak ditemukan, seluruh item bertumpang tindih, atau informasi fitur tidak cukup.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com