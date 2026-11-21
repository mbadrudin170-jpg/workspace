diperbarui : Fri Nov 20 2026 04:16 WIB
ditimpa ke : `.agents/rules/lainnya.md`

1. Setiap aksi mengedit, menambah, menghapus, atau memindahkan wajib mengikuti aturan yang berlaku; baca/patuhi aturan, rules, dan command terkait sebelum bertindak.

2. Sebelum melakukan aksi, cek dahulu berkas-berkas lain; bila ada berkas yang merujuk ke isi/berkas yang sedang diaksinya, jangan sampai ada referensi yang rusak/mismatch setelah aksi dilakukan.

3. Skill di `.agents/skills/` hanya boleh ditambah atau diedit dari riwayat commit, baik dari worktree maupun submodule.

4. AI dilarang menyebut nama/path skill/command/aturan yang tidak ada atau jenis aset yang salah; wajib verifikasi keberadaan (mis. glob/read) sebelum menyebutnya dan sebut jenis yang benar.

5. Saat AI mengidentifikasi pelanggaran aturan di code.md/rules lain, AI wajib memuat skill terkait yang dirujuk dan menawarkan perbaikan eksplisit (bukan hanya "di luar cakupan"); bila tidak dilakukan, catat sebagai tindak lanjut.

6. Saat menerima command Kilo yang mencantumkan bagian `# Skill Terkait`, AI wajib memuat semua skill yang tercantum (via tool `skill`) sebelum melaksanakan langkah command; DILARANG melaksanakan langkah tanpa memuat skill terkait yang tersedia.

7. Bila tugas tidak dapat dilanjutkan (transkrip terputus, tidak ada respons AI, prasyarat tidak terpenuhi, atau berkas tidak tersedia), AI wajib melaporkan secara eksplisit kepada pengguna alih-alih berhenti diam-diam.

8. Sebelum menjalankan perintah yang mengubah state repositori (commit, hapus berkas, jalankan workflow build, dll.), AI wajib memeriksa prasyarat terlebih dahulu: identitas Git (`user.name`/`user.email` terisi), akses jaringan/autentikasi, kompatibilitas versi (Java/Gradle, SDK, dll.), dan ketersediaan berkas/prasyarat workflow. Hasil pemeriksaan wajib dilaporkan kepada pengguna. Untuk aksi destruktif (hapus berkas), wajib konfirmasi eksplisit pengguna melalui tool `question` sebelum dieksekusi.
