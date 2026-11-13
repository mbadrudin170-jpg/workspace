# Tujuan

Buat atau perbarui berkas `README.md` pada **root repositori dan setiap submodule** agar seluruh proyek memiliki dokumentasi yang profesional, informatif, sistematis, dan mudah dipahami.

README harus menjelaskan identitas proyek, tujuan, fitur, teknologi, serta kelebihan proyek berdasarkan kondisi implementasi yang sebenarnya pada masing-masing repositori.

# Target README

1. `README.md` pada root repositori utama.
2. `README.md` pada root **setiap submodule** yang terdaftar di `.gitmodules` (verifikasi dengan `git submodule status`).
3. Submodule bertingkat: bila submodule memiliki `.gitmodules` sendiri, ikuti secara rekursif hingga tidak ada submodule baru.
4. Bila `README.md` target belum ada, buat; bila sudah ada, perbarui bagian yang usang dan pertahankan bagian yang masih akurat.
5. Daftar submodule tidak boleh dihafal atau ditulis tetap; selalu baca dari `.gitmodules` pada saat command dijalankan.

# Alur Kerja

1. **Identifikasi seluruh target README.**
   - Baca `.gitmodules` di root dan jalankan `git submodule status` untuk memastikan submodule yang benar-benar terpasang.
   - Catat daftar target: root + setiap path submodule (termasuk submodule bertingkat).
   - Jangan melewati submodule yang belum ter-`init`; laporkan bila tidak dapat diperiksa.

2. **Investigasi setiap target secara terpisah.**
   - Untuk root repositori: periksa struktur direktori, konfigurasi, skrip, dokumentasi, dan komponen yang benar-benar ada. Jangan menganggap root sebagai proyek Flutter bila tidak memiliki `pubspec.yaml`/`lib/`.
   - Untuk target yang merupakan proyek Flutter: periksa `pubspec.yaml`, dependensi, entrypoint, direktori `lib/`, folder platform, serta konfigurasi lain yang relevan.
   - Untuk target non-Flutter: periksa struktur direktori, konfigurasi, dan komponen utamanya.
   - Baca README target yang sudah ada sebagai pembanding, bukan sebagai sumber kebenaran.
   - Jangan menyalin klaim dari README proyek lain tanpa memverifikasinya langsung pada target tersebut.

3. **Pahami kondisi setiap target.**
   - Identifikasi tujuan utama proyek pada target tersebut.
   - Identifikasi fitur yang sudah diimplementasikan.
   - Identifikasi teknologi dan dependensi yang benar-benar digunakan.
   - Pahami fungsi dan kegunaan setiap fitur utama.
   - Identifikasi kelebihan proyek berdasarkan implementasi, arsitektur, dan kemampuan yang benar-benar tersedia.

4. **Susun README setiap target.**
   - Gunakan hasil investigasi target tersebut sebagai dasar penulisan.
   - Susun informasi secara sistematis dan profesional.
   - Pastikan setiap informasi sesuai dengan kondisi proyek pada target tersebut.
   - Jelaskan kelebihan proyek berdasarkan fakta yang ditemukan, bukan berdasarkan asumsi.
   - Bila relevan, tautkan README root ke README submodule memakai path relatif yang benar (dan sebaliknya).

5. **Periksa hasil dokumentasi setiap target.**
   - Pastikan tidak ada informasi yang dikarang.
   - Pastikan seluruh fitur yang dicantumkan benar-benar tersedia.
   - Pastikan penjelasan sesuai dengan implementasi proyek.
   - Pastikan dokumentasi mudah dibaca dan tidak mengandung pengulangan yang tidak diperlukan.
   - Pastikan tidak ada klaim fitur milik proyek lain yang tercampur ke README target.

6. **Verifikasi tidak ada perubahan di luar README target.**
   - Jalankan `git status` di root dan `git -C <path-submodule> status` untuk setiap submodule.
   - Perubahan yang terlihat hanya boleh pada README target (dan pencatatan memori proyek bila diwajibkan aturan proyek).

# Ketentuan Penulisan

1. **Bahasa:** Seluruh isi README wajib menggunakan bahasa Indonesia yang formal, baku, dan sesuai kaidah bahasa Indonesia.
2. **Keakuratan informasi:** Seluruh informasi yang ditulis wajib memiliki dasar yang dapat ditemukan dan diverifikasi di dalam repositori target.
3. **Cakupan per target:** Setiap README berdiri sendiri dan hanya memuat informasi proyek pada repositori tempat README tersebut berada.
4. **Fitur:** Cantumkan fitur yang benar-benar sudah diimplementasikan beserta penjelasan fungsi dan kegunaannya.
5. **Kelebihan proyek:** Jelaskan kelebihan dan nilai tambah proyek berdasarkan kemampuan, fitur, teknologi, atau implementasi yang benar-benar ditemukan.
6. **Teknologi:** Cantumkan framework, bahasa pemrograman, dependensi, dan teknologi lain yang memang digunakan.
7. **Struktur:** Gunakan heading, subheading, daftar, tabel, dan blok kode jika diperlukan agar dokumentasi mudah dipahami.
8. **Kejelasan:** Gunakan penjelasan yang ringkas, jelas, dan tidak berulang.
9. **Kesesuaian:** Bedakan fitur yang sudah tersedia dengan fitur yang masih dalam pengembangan jika keduanya ditemukan.
10. **Konsistensi:** Gunakan gaya penulisan dan urutan bagian yang seragam antar-README, tanpa memaksakan bagian yang tidak relevan bagi target tersebut.

# Larangan

1. Dilarang mengarang fitur, kelebihan, teknologi, kemampuan, atau informasi lain mengenai proyek.
2. Dilarang mencantumkan informasi yang tidak dapat diverifikasi dari isi repositori target.
3. Dilarang menyatakan fitur sudah tersedia apabila implementasinya belum ditemukan.
4. Dilarang mengubah, menghapus, atau menambahkan kode Dart di root maupun submodule.
5. Dilarang melakukan refactoring atau perbaikan implementasi aplikasi apa pun.
6. Dilarang mengubah konfigurasi proyek atau menambahkan dependensi untuk keperluan penulisan README.
7. Dilarang mengubah pointer submodule, melakukan commit, atau push di root maupun submodule.
8. Dilarang menyalin seluruh isi README root ke README submodule atau sebaliknya.
9. Dilarang melewatkan salah satu target README yang terdaftar, kecuali dilaporkan alasannya (misalnya submodule tidak ter-`init`).
10. Dilarang memakai perintah yang dilarang oleh `permission` pada `.kilo/kilo.jsonc`; gunakan tool baca berkas standar.

# Batasan Ruang Lingkup

1. Pekerjaan hanya mencakup investigasi repositori dan pembuatan atau pembaruan `README.md` pada root dan setiap submodule.
2. Pemeriksaan kode hanya dilakukan untuk memahami fitur, arsitektur, dan kemampuan proyek.
3. Jangan mengubah kode Dart selama proses investigasi maupun penulisan dokumentasi.
4. Jangan mengubah file lain di luar README target, kecuali pencatatan memori proyek (`MEMORI.md` dan `memori/sesi/sesi_N.md`) yang diwajibkan aturan proyek sesuai skill `memori-check`.
5. Jangan mengubah isi repositori submodule selain README target.
6. Jika informasi tertentu tidak dapat ditemukan atau diverifikasi, jangan membuat asumsi untuk melengkapinya; hilangkan atau tandai dengan jelas.

# Hasil Akhir

Setelah selesai:

1. Pastikan seluruh README target (root dan semua submodule) sudah tersusun secara profesional dan sistematis.
2. Pastikan seluruh informasi sesuai dengan kondisi proyek pada masing-masing repositori.
3. Pastikan kelebihan proyek dijelaskan berdasarkan implementasi nyata.
4. Pastikan tidak ada kode Dart, konfigurasi, atau file proyek lain yang berubah.
5. Laporkan hasil per target dalam bentuk daftar: path README, status (`Dibuat` / `Diperbarui` / `Tidak berubah`), dan ringkasan perubahan.
6. Laporkan target yang tidak dapat diperiksa beserta alasannya.
