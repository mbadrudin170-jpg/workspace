---
name: standar-pembuatan-skill
description: Gunakan setiap kali membuat, merancang, menulis, meninjau, menerjemahkan, atau memperbarui skill agar nama, deskripsi, isi, dan tujuannya mudah dipahami pengguna dalam bahasa Indonesia.
---

# Standar Pembuatan dan Pemeliharaan Skill

## 1. Tujuan dan cakupan

Memastikan setiap skill yang dibuat atau dikelola mudah dipahami pengguna tanpa harus menerjemahkan sendiri nama, deskripsi, maupun instruksinya. Bahasa utama seluruh bagian skill wajib bahasa Indonesia yang jelas, alami, dan konsisten.

Standar ini berlaku untuk:
- Skill baru di plugin Custom atau plugin lain yang sedang dikelola.
- Skill yang diperbarui, diperbaiki, diterjemahkan, atau digabung.
- Skill proyek/repo, termasuk file `SKILL.md` di dalam workspace.
- Nama skill, nama folder skill, deskripsi pemicu, isi instruksi, referensi, contoh penjelasan, checklist, dan dokumentasi pendukung.

## 2. Kewajiban bahasa Indonesia

1. Tulis nama, deskripsi, judul, penjelasan, langkah kerja, aturan, checklist, contoh narasi, dan keterangan keluaran dalam bahasa Indonesia.
2. Jangan menggunakan nama atau deskripsi bahasa Inggris hanya karena istilah tersebut lazim di dunia teknis. Pilih padanan bahasa Indonesia yang jelas selama tidak melanggar format teknis.
3. Istilah teknis bahasa Inggris boleh dipertahankan jika merupakan nama resmi, istilah industri yang tidak memiliki padanan yang tepat, nama API, nama package, nama class/function/variable, command, path, key konfigurasi, protokol, atau teks yang harus persis agar dapat dieksekusi.
4. Setiap istilah teknis yang berpotensi membingungkan harus diberi penjelasan bahasa Indonesia saat pertama kali digunakan.
5. Jangan menerjemahkan identifier, sintaks, nama properti, nilai enum, command, nama file, URL, atau teks protokol yang diwajibkan platform. Jelaskan fungsinya dalam bahasa Indonesia di sekitarnya.
6. Bila template atau keluaran wajib menggunakan bahasa lain karena format sistem, kebutuhan integrasi, atau permintaan pengguna, jelaskan pengecualian tersebut dalam bahasa Indonesia dan batasi hanya pada bagian yang memang wajib.
7. Isi referensi pendukung seperti `references/*.md`, panduan, template, dan dokumentasi skill juga wajib berbahasa Indonesia.

## 3. Standar nama skill, folder, dan deskripsi

Setiap skill wajib memiliki YAML frontmatter yang valid dengan `name` dan `description`.

### Nama skill (`name`)

- Wajib memakai kata bahasa Indonesia, bukan nama bahasa Inggris.
- Gunakan `kebab-case`: huruf kecil, angka bila perlu, dan tanda hubung sebagai pemisah kata.
- Gunakan slug bahasa Indonesia tanpa spasi. Contoh: `observabilitas-aplikasi`, `auditor-kode-flutter`, `pembuat-prd`, dan `pencari-paket-pub-dev`.
- Buat nama singkat, unik, stabil, dan langsung menjelaskan bidang tugasnya.
- Akronim atau nama produk resmi boleh dipertahankan jika memang dikenal dengan nama tersebut, misalnya `PRD`, `Flutter`, atau `pub.dev`; kata penjelas di sekitarnya tetap bahasa Indonesia.
- Jangan gunakan nama generik seperti `helper`, `tools`, `assistant`, `misc`, atau `workflow` jika tersedia nama Indonesia yang menjelaskan fungsi.

### Nama folder skill

- Folder harus menggunakan slug bahasa Indonesia yang sama dengan nilai `name`.
- Simpan file utama pada `skills/<name>/SKILL.md`.
- Jika nama skill berubah, pindahkan foldernya dan perbarui referensi internal yang menunjuk ke jalur lama. Jangan meninggalkan dua salinan skill aktif dengan fungsi yang sama.

### Deskripsi (`description`)

- Wajib ditulis dalam bahasa Indonesia.
- Jelaskan kapan skill harus digunakan, jenis permintaan yang memicunya, dan ruang lingkup tugasnya.
- Buat spesifik dan mudah dipahami; hindari deskripsi generik seperti "membantu berbagai tugas".
- Pertahankan nama teknis resmi bila diperlukan, tetapi jelaskan konteksnya dalam kalimat bahasa Indonesia.

Contoh frontmatter yang benar:

```yaml
---
name: analisis-log-aplikasi
description: Gunakan saat pengguna meminta analisis log runtime Flutter/Dart, pencarian penyebab error, atau penentuan instrumentasi diagnostik yang belum tersedia.
---
```

Contoh yang tidak sesuai:

```yaml
---
name: application-debugging
description: Use when debugging application logs and runtime issues.
---
```

Jangan menambahkan field frontmatter yang tidak didukung format skill. Pastikan nama skill unik di dalam plugin.

## 4. Struktur isi yang disarankan

Pilih struktur sesuai kebutuhan; jangan memaksakan bagian yang tidak relevan. Skill prosedural umumnya mencakup:

1. **Tujuan:** masalah yang ditangani dan hasil yang ingin dicapai.
2. **Pemicu penggunaan:** kondisi konkret yang membuat skill harus dipilih.
3. **Batas cakupan:** hal yang termasuk dan tidak termasuk.
4. **Prasyarat:** konteks, file, aturan, akses, atau informasi yang perlu diperiksa.
5. **Prinsip wajib:** aturan yang tidak boleh dilanggar.
6. **Alur kerja:** langkah yang berurutan dan dapat dilaksanakan.
7. **Penanganan kondisi khusus:** kegagalan, data tidak lengkap, konflik, atau pengecualian.
8. **Format keluaran:** susunan hasil yang diharapkan.
9. **Checklist verifikasi:** cara memastikan pekerjaan benar-benar selesai.
10. **Referensi:** dokumentasi atau file pendukung yang relevan.

Untuk skill sederhana, gabungkan atau hilangkan bagian yang tidak diperlukan. Hindari boilerplate dan pengulangan aturan.

## 5. Kualitas instruksi

1. Gunakan instruksi yang dapat ditindaklanjuti, bukan kalimat abstrak seperti "lakukan dengan baik" atau "pastikan optimal" tanpa kriteria.
2. Bedakan kewajiban, rekomendasi, dan pilihan. Gunakan kata seperti **wajib**, **jangan**, **sebaiknya**, dan **boleh** secara konsisten.
3. Jelaskan urutan prioritas jika skill berinteraksi dengan aturan proyek, memori, perintah pengguna, atau skill lain.
4. Jelaskan apa yang harus dilakukan ketika informasi tidak tersedia. Jangan mendorong AI mengarang nilai atau menganggap asumsi sebagai fakta.
5. Gunakan contoh yang sesuai dengan tujuan skill. Tandai contoh kode sebagai ilustrasi bila API atau implementasinya bergantung pada proyek.
6. Hindari instruksi yang bertentangan, pengulangan panjang, pertanyaan yang tidak perlu, dan langkah yang tidak dapat dilakukan oleh lingkungan eksekusi.
7. Jangan menambahkan batasan baru yang tidak diperlukan atau mengurangi kemampuan AI tanpa alasan yang jelas.

## 6. Standar contoh dan kode

- Narasi sebelum dan sesudah contoh wajib bahasa Indonesia.
- Komentar kode yang ditulis oleh skill wajib bahasa Indonesia, kecuali format atau konvensi proyek mengharuskan bahasa lain.
- Nama identifier dan sintaks harus mengikuti bahasa pemrograman atau API aslinya; jangan menerjemahkannya.
- Beri label apakah contoh bersifat konseptual, pseudocode, atau siap digunakan.
- Jangan menyajikan API, package, opsi command, atau field konfigurasi yang belum diverifikasi seolah-olah pasti tersedia.
- Bila contoh memakai istilah Inggris yang perlu diketahui, berikan arti atau penjelasan singkat dalam bahasa Indonesia.

## 7. Pembaruan skill yang sudah ada

1. Baca seluruh skill yang akan diperbarui sebelum mengubahnya.
2. Saat skill disentuh untuk revisi, periksa nama, folder, deskripsi, dan seluruh isinya. Selaraskan semuanya dengan standar bahasa Indonesia.
3. Jika nama masih bahasa Inggris, ubah menjadi slug bahasa Indonesia dan pindahkan folder ke `skills/<name>/SKILL.md` yang baru.
4. Perbarui semua referensi internal ke nama atau jalur lama. Hapus file lama hanya setelah file pengganti dan seluruh referensinya siap.
5. Pertahankan identifier teknis, kontrak format, nama API, path eksternal, dan perilaku yang masih benar.
6. Periksa apakah perubahan bahasa mengubah makna aturan, urutan prosedur, atau contoh. Jangan sampai penerjemahan mengubah perilaku yang dimaksud.
7. Jangan menghapus ketentuan lama yang masih berlaku tanpa alasan dan ruang lingkup yang jelas.
8. Jika isi terlalu panjang, pecah ke referensi pendukung berbahasa Indonesia dan pastikan tautan/path-nya benar.

## 8. Pemeriksaan sebelum menyimpan skill

- [ ] Nilai `name` memakai slug bahasa Indonesia dan unik.
- [ ] Nama folder sama dengan nilai `name`.
- [ ] Nilai `description` ditulis dalam bahasa Indonesia dan menjelaskan pemicu penggunaan.
- [ ] Semua judul, penjelasan, instruksi, checklist, dan narasi menggunakan bahasa Indonesia.
- [ ] Istilah Inggris hanya dipakai untuk identifier atau istilah teknis yang memang perlu.
- [ ] Istilah teknis yang sulit diberi penjelasan bahasa Indonesia.
- [ ] Frontmatter YAML dan struktur file valid.
- [ ] Instruksi spesifik, tidak saling bertentangan, dan dapat dilaksanakan.
- [ ] Contoh tidak menggunakan API atau fitur yang dikarang.
- [ ] Referensi, nama, dan path yang disebut benar-benar tersedia.
- [ ] Tujuan, pemicu, prosedur, batasan, dan hasil skill mudah dipahami pengguna.
- [ ] Skill lama yang diperbarui tidak menyisakan nama, deskripsi, atau penjelasan bahasa Inggris yang tidak diperlukan.

## 9. Bahasa komunikasi kepada pengguna

Saat menyerahkan skill, jelaskan dalam bahasa Indonesia:
- Nama skill dan kegunaannya.
- Kondisi kapan skill akan digunakan.
- Pekerjaan yang dapat dilakukan skill.
- Batasan penting dan hal yang belum diverifikasi.
- Lokasi file atau tautan plugin jika tersedia.

Jangan hanya mengatakan "skill berhasil dibuat" tanpa menjelaskan isi dan tujuan skill secara ringkas.
