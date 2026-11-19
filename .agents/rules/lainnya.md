ki1. Setiap tindakan mengedit, menambah, menghapus, atau memindahkan wajib mengikuti aturan yang berlaku; baca dan patuhi aturan, rules, dan command terkait sebelum bertindak.

2. Sebelum melakukan tindakan tersebut, periksa berkas-berkas lain; bila ada berkas yang merujuk ke isi atau berkas yang sedang dikenai tindakan, jangan sampai ada referensi yang rusak atau mismatch setelah tindakan dilakukan, agar seluruh berkas tetap sinkron.

3. Untuk berkas yang berada di folder `.agents/skills/code` hanya boleh ditambah dan diedit dari riwayat commit saja baik itu dari worktree maupun `submodul`.

4. **Indeks skill non-code (`.agents/rules/kelompok_skill_wajib_non_code.md`) HANYA berisi skill dari `.agents/skills/non-code/`. DILARANG memasukkan skill code ke indeks non-code. Skill code berada di indeks terpisah.**

5. AI DILARANG menyebut nama atau path skill, command, atau aturan yang tidak ada, atau menyebut jenis aset yang salah (mis. menyebut suatu command sebagai "skill"); sebelum menyebut suatu aset sebagai skill/command/aturan, verifikasi keberadaannya (mis. `glob`/`read`) dan sebut jenis yang benar.

6. Saat AI mengidentifikasi pelanggaran aturan yang tercatat di `code.md` atau rules lain (mis. code.md #18 Firebase guard `kIsWeb`), AI wajib memuat skill terkait yang dirujuk pada aturan tersebut (mis. `validasi-platform-izin`) dan menawarkan perbaikan secara eksplisit kepada pengguna, bukan hanya melaporkan "di luar cakupan"; bila perbaikan tidak dilakukan pada sesi itu, catat sebagai tindak lanjut.

7. Saat menerima command Kilo yang mencantumkan bagian `# Skill Terkait`, AI wajib memuat semua skill yang tercantum (via tool `skill`) sebelum melaksanakan langkah command; DILARANG melaksanakan langkah tanpa memuat skill terkait yang tersedia. Skill terkait: `aturan-pembuatan-commands`.

8. Bila tugas tidak dapat dilanjutkan (transkrip terputus, tidak ada respons AI, prasyarat tidak terpenuhi, atau berkas tidak tersedia), AI wajib melaporkan secara eksplisit kepada pengguna alih-alih berhenti diam-diam.

9. Sebelum menjalankan perintah yang mengubah state repositori (commit, hapus berkas, jalankan workflow build, dll.), AI wajib memeriksa prasyarat terlebih dahulu: identitas Git (`user.name`/`user.email` terisi), akses jaringan/autentikasi, kompatibilitas versi (Java/Gradle, SDK, dll.), dan ketersediaan berkas/prasyarat workflow. Hasil pemeriksaan wajib dilaporkan kepada pengguna. Untuk aksi destruktif (hapus berkas), wajib konfirmasi eksplisit pengguna melalui tool `question` sebelum dieksekusi.
