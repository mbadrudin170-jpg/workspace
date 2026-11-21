---
description: Audit seluruh file Dart di `lib/` satu per satu terhadap `AGENTS.md`, catat progres dengan `todowrite`, dan perbarui `task.md` (sesuai skill `format-task-md`) tanpa mengubah kode Dart.
agent: code
---

<!-- Path: .kilo/commands/scan.md -->

# Scan

## Tujuan

MODE: AUDIT MENYELURUH KODE FLUTTER — STRICT READ-ONLY.

Audit seluruh file kode Dart di `lib/` secara langsung, satu per satu, untuk menemukan masalah yang terbukti berdasarkan implementasi dan aturan proyek. Hasil audit digunakan untuk memperbarui `task.md` dan, jika ditemukan ide fitur baru yang benar-benar layak, `rencana_fitur_baru.md`.

Audit mencakup:

- Pelanggaran terhadap aturan dalam `AGENTS.md` (root proyek) dan aturan/skill yang dirujuknya.
- Bug runtime dan masalah keandalan implementasi.
- Masalah UX.
- Masalah UI, terutama padding, margin, spacing, ukuran, layout, overflow, dan widget yang berpotensi menyentuh tepi layar secara tidak semestinya.
- Task lama yang sudah tidak sesuai dengan aturan atau kode terbaru.
- Ide fitur baru yang relevan dan memiliki alasan yang jelas.

Perintah ini hanya untuk audit dan pembaruan dokumentasi. Dilarang mengubah kode Dart.

## Ketentuan Umum

1. Baca `AGENTS.md` di root proyek terlebih dahulu dan patuhi seluruh aturannya. `AGENTS.md` adalah gabungan aturan; sumbernya berada di `.agents/rules/global/` (mis. `alur_git_commit.md`, `format_hasil_diskusi.md`, `kelompok_skill_wajib.md`) dan skill di `.agents/skills/custom/`. Catatan: `.agents/rules/AGENTS.md` tidak ada dan tidak boleh dirujuk; gunakan `AGENTS.md` di root.
2. Muat skill berikut melalui tool `skill` sebelum bekerja:
   - `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) — alur sesi dan memori;
   - `format-task-md` (`.agents/skills/custom/format-task-md/SKILL.md`) — wajib untuk setiap penulisan atau pembaruan `task.md`;
   - `bug-runtime` (`.agents/skills/custom/bug-runtime/SKILL.md`) — indeks pencegahan bug runtime Flutter.
     Muat juga skill sesuai kode yang diperiksa saat audit menemukan konteksnya, mis. `riverpod-pola`, `notifier-crud-database`, `penanganan-async`, `penanganan-error-unawaited` (Riverpod/Async), `migrasi-skema-sqlite`, `aturan-penamaan`, `parsing-nullable-int` (SQLite), `model-state-freezed-abstract` (Freezed), `normalisasi-tanggal`, `type-promotion-null-safety`, `exception-khusus-deteksi-error`, `gaya`, `theme-data-color-schema`, `tipografi`, `spacing`, `gaya`, `pola-ui`, `pola-ux` (UI/UX), dan `aturan-testing` (file test). Skill yang trigger-nya terpenuhi adalah aturan yang mengikat.
3. Gunakan bahasa Indonesia baku pada seluruh keluaran, laporan, dan dokumentasi.
4. Jangan menggunakan terminal atau tool bash dalam bentuk apa pun (lihat Larangan).
5. Pola Analyze → Plan → Execute → Review diterapkan pada Alur Kerja: TAHAP 1–3 = Analyze/Plan, TAHAP 4–7 = Execute, TAHAP 8–10 = Review.

## Cakupan

A1. Cakupan file

- Periksa seluruh file Dart di dalam `lib/` secara rekursif, termasuk semua subfolder.
- Kecualikan hanya file yang nama akhirnya sesuai dengan pola `*.g.dart` atau `*.freezed.dart`.
- Jangan mengecualikan file Dart lain, termasuk file generated lain, file test yang kebetulan berada di `lib/`, atau file yang dianggap tidak penting.
- Jangan membatasi audit pada file yang ditemukan melalui pencarian pola. Setiap file dalam cakupan harus dibaca langsung.
- Catat jumlah file yang ditemukan, dikecualikan, berhasil dibaca, dan belum berhasil dibaca.

A2. Batas berkas yang boleh diperbarui

- Berkas yang boleh diperbarui oleh command ini hanya:
  - `task.md` di root proyek.
  - `rencana_fitur_baru.md` di root proyek, hanya jika ada ide fitur baru yang layak.
- Jika path berkas dokumentasi tidak ditemukan, cari keberadaannya menggunakan glob. Jangan membuat berkas pengganti di lokasi lain tanpa alasan dan jangan mengubah berkas lain sebagai gantinya.

## Parameter

- `$ARGUMENTS` (opsional): subfolder atau berkas Dart tertentu di `lib/` yang ingin diaudit.
- Jika `$ARGUMENTS` kosong: audit seluruh `lib/`.
- Jika `$ARGUMENTS` menunjuk path yang tidak ada atau ambigu: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

### TAHAP 1 — BACA ATURAN PROYEK

1. Baca seluruh isi `AGENTS.md` di root proyek menggunakan `read`.
2. `AGENTS.md` adalah gabungan aturan; berkas sumbernya berada di `.agents/rules/global/*.md` dan skill di `.agents/skills/custom/*/SKILL.md` (direferensikan melalui penanda `// SKILL:` dan `// FILE:` di dalam `AGENTS.md`).
3. Jika `AGENTS.md` merujuk ke berkas aturan lain, buka dan baca seluruh aturan yang relevan.
4. Catat nama berkas aturan, judul bagian, nomor poin jika tersedia, dan maksud setiap aturan yang relevan.
5. Bedakan ketentuan wajib, larangan, rekomendasi, dan pengecualian.
6. Periksa apakah terdapat aturan yang saling bertentangan. Jangan memilih salah satu berdasarkan dugaan. Catat konflik beserta lokasi aturannya untuk dilaporkan.
7. Jangan menyatakan suatu kode melanggar aturan sebelum memastikan aturan tersebut berlaku pada konteks kode yang diperiksa.

### TAHAP 2 — INVENTARISASI FILE DART

1. Gunakan glob untuk menemukan seluruh file `*.dart` di `lib/` dan seluruh subfoldernya.
2. Dari daftar tersebut, keluarkan hanya file dengan akhiran `.g.dart` dan `.freezed.dart`.
3. Jangan mengandalkan jumlah file dari hasil pencarian isi kode.
4. Susun daftar final seluruh file yang wajib dibaca beserta path relatif dari root proyek.
5. Pastikan tidak ada path yang terlewat, terduplikasi, atau tidak termasuk folder `lib/`.

Ketentuan daftar file:

- Daftar inventaris harus menjadi dasar checklist todowrite. Jangan membuat checklist hanya berisi tahapan umum; setiap file Dart wajib memiliki item checklist tersendiri.

### TAHAP 3 — BUAT TODO DENGAN todowrite

1. Gunakan tool todowrite untuk membuat checklist audit.
2. Buat satu item terpisah untuk setiap file Dart yang wajib diperiksa.
3. Cantumkan path relatif lengkap pada setiap item, bukan hanya nama file.
4. Tambahkan item tahapan audit dan pembaruan dokumentasi yang diperlukan.
5. Jangan menggabungkan beberapa file menjadi satu item checklist.
6. Seluruh item file dimulai dengan status belum selesai.
7. Jangan menandai file selesai hanya karena file sudah ditemukan melalui glob.

Ketentuan memperbarui checklist:

- `todowrite` mengganti seluruh checklist dengan versi terbaru. Tidak ada tool `todoread`; status terakhir dibaca dari konteks percakapan.
- Saat memanggil todowrite, pertahankan seluruh item yang masih relevan beserta statusnya.
- Jangan menghilangkan item yang masih tertunda atau sudah selesai hanya karena sedang memperbarui satu item.
- Ubah status item file menjadi selesai hanya setelah seluruh isi file berhasil dibaca dan diperiksa terhadap aturan yang relevan.
- Jika file baru ditemukan setelah inventarisasi, tambahkan item file tersebut dan pertahankan semua item sebelumnya.
- Jika pembacaan file gagal atau hanya sebagian isi yang terbaca, biarkan item belum selesai dan catat hambatannya.
- Jangan menandai seluruh checklist selesai jika masih ada file yang belum dibaca atau tahapan wajib yang belum diselesaikan.
- Satu tanda selesai pada checklist harus berarti file tersebut benar-benar sudah dibaca secara langsung, bukan sekadar terdeteksi atau dicari polanya.

### TAHAP 4 — BACA DAN AUDIT SETIAP FILE SATU PER SATU

Untuk setiap item file Dart dalam checklist:

1. Buka file menggunakan tool read.
2. Baca seluruh isi file dari awal sampai akhir.
3. Jika hasil read terpotong atau file terlalu panjang, lanjutkan membaca bagian berikutnya sampai seluruh isi file tercakup. Jangan menganggap cuplikan awal sudah mewakili seluruh file.
4. Periksa isi implementasi secara langsung terhadap aturan yang berlaku.
5. Periksa import, deklarasi, fungsi, class, widget, state, alur asynchronous, penanganan error, serta hubungan dengan file lain jika relevan.
6. Catat bukti pelanggaran beserta nomor baris yang ditampilkan oleh read.
7. Setelah seluruh isi file selesai dibaca dan diperiksa, perbarui checklist dengan menandai item file tersebut selesai.
8. Lanjutkan ke file berikutnya sampai semua item selesai atau hambatan akses dilaporkan.

Pembagian pekerjaan jika file sangat banyak:

- Boleh membagi audit ke beberapa kelompok kecil agar pembacaan dan evaluasi tetap akurat.
- Pembagian kelompok hanya untuk mengatur urutan kerja, bukan untuk mengurangi cakupan.
- Jangan mengabaikan file, melompati subfolder, atau memilih hanya file yang dianggap penting.
- Jangan menyimpulkan AI kewalahan hanya berdasarkan jumlah file. Lanjutkan secara bertahap dengan checklist.
- Jangan memasukkan seluruh isi semua file ke dalam satu ringkasan besar. Baca, evaluasi, dan catat temuan per file agar bukti tidak tercampur.
- Jika batas konteks, batas tool, atau kegagalan pembacaan benar-benar menghalangi kelanjutan, catat file yang belum selesai. Jangan mengklaim audit 100% selesai.

### TAHAP 5 — PEMERIKSAAN PELANGGARAN DAN BUKTI

Periksa setiap file berdasarkan isi aktual dan seluruh aturan yang berlaku. Area pemeriksaan mencakup, tetapi tidak terbatas pada:

- Lifecycle widget dan pengelolaan resource.
- State management dan penggunaan Riverpod.
- Operasi asynchronous dan penanganan error.
- Null safety, tipe data, parsing, dan validasi.
- Database, transaksi, serta integritas data.
- Struktur kode dan arsitektur proyek.
- Penggunaan Flutter SDK, Dart SDK, dan paket pihak ketiga.
- Penggunaan widget, layout, constraints, dan responsive design.
- Konsistensi desain, spacing, padding, margin, dan ukuran.
- Interaksi, feedback, konfirmasi, serta alur pengguna.

Setiap temuan harus mempunyai bukti yang dapat diperiksa. Jangan membuat temuan hanya karena pencarian pola menunjukkan suatu kata atau sintaks tertentu.

Bukti wajib untuk setiap temuan:

- File dan nomor baris yang benar-benar menunjukkan masalah.
- Penjelasan perilaku atau implementasi yang bermasalah.
- Aturan yang dilanggar, jika memang ada.
- Alasan spesifik mengapa implementasi bertentangan dengan aturan tersebut.
- Dampak atau risiko nyata yang dapat dijelaskan.
- Solusi yang direkomendasikan dan dasar verifikasinya.

Jangan membuat nomor baris, bukti, dampak, atau identitas aturan berdasarkan perkiraan.

Identitas aturan yang dilanggar:

- Untuk setiap task yang merupakan pelanggaran aturan, cantumkan path berkas aturan dan judul bagian atau nomor poinnya (`AGENTS.md` untuk aturan gabungan; path skill, mis. `.agents/skills/custom/<nama>/SKILL.md`, untuk aturan skill; `.agents/rules/global/<berkas>.md` untuk berkas sumber aturan non-skill).
- Jika aturan tidak memiliki nomor, gunakan judul bagian dan kutipan singkat yang relevan.
- Jika aturan berasal dari berkas lain yang dirujuk `AGENTS.md`, sebutkan path berkas aturan yang sebenarnya.
- Jika masalah bukan pelanggaran aturan tertulis, tulis `Bukan pelanggaran aturan tertulis` dan jelaskan dasar masalahnya.
- Jangan mengarang aturan baru atau mengubah rekomendasi menjadi kewajiban.

### TAHAP 6 — VERIFIKASI SOURCE SDK DAN PAKET

Solusi tidak boleh didasarkan pada asumsi, ingatan model, atau pola umum yang belum diverifikasi.

Untuk setiap temuan yang solusinya bergantung pada perilaku SDK atau paket:

1. Identifikasi API, class, method, widget, atau paket yang berhubungan langsung dengan masalah.
2. Periksa versi Flutter, Dart, dan paket yang digunakan melalui file konfigurasi proyek yang dapat dibaca, seperti `pubspec.yaml`, `pubspec.lock`, dan `.dart_tool/package_config.json` jika tersedia.
3. Gunakan glob untuk menemukan lokasi source yang relevan jika path-nya belum diketahui.
4. Gunakan read untuk membaca source Flutter SDK, Dart SDK, atau source paket pihak ketiga yang berkaitan langsung dengan temuan.
5. Pastikan solusi sesuai dengan versi yang digunakan proyek, bukan versi dokumentasi yang berbeda.
6. Periksa signature API, parameter, tipe data, lifecycle, dan perilaku implementasi yang relevan.
7. Jangan membaca seluruh SDK atau seluruh cache paket tanpa alasan. Baca bagian source yang benar-benar berkaitan dengan masalah.
8. Dilarang menggunakan terminal untuk mencari lokasi source atau membaca source.
9. Jika source berada di luar workspace dan akses read ditolak, jangan menggunakan terminal sebagai jalan pintas. Catat bahwa source belum dapat diakses.
10. Jika source tidak dapat ditemukan atau dibaca, nyatakan bahwa solusi belum terverifikasi. Jangan menyajikan dugaan sebagai solusi yang sudah pasti.
11. Untuk temuan yang tidak bergantung pada perilaku SDK atau paket, jelaskan dasar teknisnya dari implementasi proyek dan aturan yang relevan. Jangan memaksakan klaim bahwa source SDK sudah diperiksa jika memang tidak diperlukan.

### TAHAP 7 — AUDIT UI DAN UX SECARA LANGSUNG

Baca implementasi widget dan telusuri hubungan antara widget anak dengan parent, layout halaman, serta constraints yang memengaruhinya. Jangan hanya mencari nilai padding, margin, atau `SizedBox`.

Pemeriksaan UI:

- Apakah konten atau widget berpotensi menempel ke tepi layar tanpa alasan desain yang jelas?
- Apakah padding tepi halaman konsisten?
- Apakah padding antarhalaman dan antarkomponen serasi?
- Apakah spacing terlalu rapat, terlalu renggang, atau tidak konsisten?
- Apakah ukuran komponen mengikuti referensi desain?
- Apakah layout memiliki risiko overflow atau konten terpotong?
- Apakah layout menangani ukuran layar dan constraints dengan benar?
- Apakah penggunaan `SafeArea`, `ScrollView`, padding parent, dan padding child sudah tepat?
- Apakah terdapat padding ganda atau tidak ada padding pada area yang membutuhkannya?
- Apakah implementasi mengikuti `optimasi_ui.md`, `desain.md`, atau `DESAINS.md` jika file tersebut tersedia dan berlaku di proyek?
- Baca dokumen referensi desain yang benar-benar tersedia. Jangan menganggap nama atau isi file desain tertentu pasti ada.

Pemeriksaan UX:

- Apakah tujuan setiap tombol dan tindakan dapat dipahami?
- Apakah konsekuensi tindakan penting dijelaskan?
- Apakah tindakan penghapusan memiliki konfirmasi yang sesuai?
- Apakah proses berjalan, berhasil, gagal, atau membutuhkan perhatian memberikan feedback yang jelas?
- Apakah pengguna dapat memahami bahwa suatu proses sedang berlangsung?
- Apakah tindakan berulang yang tidak disengaja dicegah jika diperlukan?
- Apakah proses yang membutuhkan waktu lama menghambat interaksi tanpa alasan?
- Apakah teks yang ditampilkan kepada pengguna mengikuti bahasa yang formal dan baku sesuai ketentuan proyek?

Batas verifikasi tampilan:

- Pembacaan source dapat membuktikan struktur dan konfigurasi layout, tetapi tidak selalu membuktikan hasil render aktual.
- Jangan mengklaim telah melihat tampilan aplikasi jika tidak benar-benar menggunakan preview atau bukti visual.
- Jika hanya source code yang tersedia, tulis temuan sebagai masalah struktural atau potensi masalah visual yang didukung kode.
- Jika hasil visual belum dapat dipastikan, tandai bahwa verifikasi visual masih diperlukan.
- Jangan menganggap widget yang menyentuh tepi layar sebagai kesalahan jika hal tersebut memang disengaja oleh desain dan konsisten dengan referensi proyek.

### TAHAP 8 — AUDIT DAN PERBARUI task.md

Setelah seluruh file dalam cakupan selesai diaudit, baca seluruh isi `task.md` di root proyek menggunakan `read`.

Jangan sekadar menambahkan temuan baru di bagian bawah. Evaluasi ulang seluruh task lama berdasarkan aturan dan kode terbaru.

Evaluasi setiap task lama:

- Periksa apakah file terkait masih ada.
- Periksa apakah masalahnya masih ditemukan pada implementasi terbaru.
- Periksa apakah nomor baris dan lokasi kode masih benar.
- Periksa apakah task masih sesuai dengan `AGENTS.md` dan skill `format-task-md`.
- Periksa apakah solusi lama masih benar dan dapat diterapkan pada versi SDK atau paket sekarang.
- Periksa apakah task sudah diselesaikan oleh perubahan kode terbaru.
- Periksa apakah task merupakan duplikasi dari task lain.

Keputusan terhadap task lama:

- Pertahankan task jika masalahnya masih terbukti ada.
- Perbaiki deskripsi, bukti, prioritas, aturan yang dilanggar, path, dan nomor baris jika sudah tidak akurat.
- Perbarui solusi jika solusi lama tidak lagi sesuai dengan source atau versi SDK/paket.
- Hapus task yang terbukti sudah tidak terjadi atau sudah diselesaikan.
- Hapus task yang terbukti merupakan duplikasi, dengan tetap mempertahankan seluruh file terkait pada satu task gabungan jika penyebabnya sama.
- Hapus atau revisi task yang bertentangan dengan aturan terbaru berdasarkan bukti aturan yang jelas.
- Jangan menghapus task hanya karena belum berhasil diverifikasi. Pertahankan dengan status `Perlu diverifikasi` dan jelaskan penyebabnya.
- Jangan mempertahankan task lama hanya karena sebelumnya pernah dicatat.

Ketentuan task baru:

- Satu task mewakili satu masalah utama yang dapat ditindaklanjuti.
- Beberapa file boleh dimasukkan ke satu task jika terbukti memiliki satu akar masalah yang sama.
- Jangan menggabungkan masalah berbeda hanya karena berada dalam file atau fitur yang sama.
- Jangan membuat task dari dugaan yang tidak memiliki bukti.
- Jangan memasukkan ide fitur baru ke kategori bug, UX, atau UI.

### TAHAP 9 — FORMAT task.md

WAJIB mengikuti skill `format-task-md` (`.agents/skills/custom/format-task-md/SKILL.md`, dimuat melalui tool `skill`) untuk setiap penambahan atau pembaruan `task.md`. Jangan memakai format selain itu dan jangan mendefinisikan format baru di dalam command ini.

Ringkasan yang mengikat (rincian lengkap lihat skill):

- Struktur: `# Kelompok N` → `## file terdampak` (daftar berkas sebagai link markdown) → prioritas `## Tinggi` atau `## Rendah` → `#### Task N`.
- Kelompokkan berdasarkan file terdampak: task yang menyentuh file yang sama berada dalam satu kelompok.
- Kolom per task (kelompok `Tinggi`), dalam urutan: `Status` (`selesai` / `belum` / `setengah` / `kerjakan`), `Masalah`, `Solusi`, `aturan dilanggar`, `file bermasalah`, `prompt`.
- Kolom per task (kelompok `Rendah`): minimal `Status` dan `Masalah`; kolom lain boleh ditambahkan bila relevan.
- Skill yang trigger-nya terpenuhi dicatat pada kolom `aturan dilanggar` bila relevan.
- Kolom `prompt` hanya diisi oleh pengguna; AI dilarang mengisi atau mengubah kolom tersebut.
- `Masalah`, `Solusi`, `aturan dilanggar`, dan `file bermasalah` yang datanya belum tersedia wajib ditulis eksplisit (mis. `belum diketahui`); dilarang mengarang.
- Skill `format-task-md` tidak mengenal kategori Bug runtime/UX/UI maupun prioritas Sedang; jangan menambahkan keduanya ke `task.md`.

Penentuan prioritas (skill hanya mengenal `Tinggi`/`Rendah`):

- `Tinggi`: berpotensi menyebabkan aplikasi crash atau fitur utama gagal; berpotensi menyebabkan kehilangan, kerusakan, atau ketidakkonsistenan data yang serius; menimbulkan risiko keamanan atau integritas data yang serius; menghalangi alur utama aplikasi secara signifikan.
- `Rendah`: masalah minor yang tidak mengganggu fungsi utama, ketidakkonsistenan visual kecil, dan penyempurnaan kualitas implementasi yang tidak mendesak.

Tentukan prioritas berdasarkan dampak dan risiko nyata, bukan semata-mata karena aturan dilanggar.

### TAHAP 10 — IDE FITUR BARU

Jika ditemukan ide fitur baru yang relevan:

1. Baca `rencana_fitur_baru.md` di root proyek (path relatif root: `rencana_fitur_baru.md`) menggunakan `read`. Jangan mengandalkan perhitungan path dari lokasi command.
2. Pastikan ide tersebut belum tercatat dengan nama atau maksud yang berbeda.
3. Pastikan ide tersebut benar-benar fitur baru, bukan bug, perubahan UI, atau penyempurnaan fitur yang sudah tersedia.
4. Jelaskan tujuan, manfaat, dan gambaran implementasinya secara ringkas tetapi jelas.
5. Tambahkan hanya ide yang memiliki alasan kuat dan relevan dengan aplikasi.
6. Ikuti format serta urutan prioritas yang sudah digunakan di file tersebut. Jangan mengubah sistem prioritas yang sudah ada tanpa alasan.
7. Jangan menghapus ide lama yang masih relevan.
8. Jangan memaksakan ide fitur jika tidak ada temuan yang layak.
9. Jika berkas belum ada, pastikan terlebih dahulu bahwa path root proyek memang tidak memiliki berkas tersebut. Buat hanya jika ada ide fitur yang layak dan pembuatan berkas diperlukan untuk memenuhi tujuan ini.

## C. PENANGANAN AUDIT YANG BELUM SELESAI

Jika ada file yang tidak dapat dibaca, source yang tidak dapat diakses, atau batas tool/konteks yang menghalangi pemeriksaan:

- Jangan tandai item file tersebut selesai di todowrite.
- Catat path file dan bagian yang belum terbaca.
- Catat penyebabnya secara spesifik, misalnya akses ditolak, hasil baca terpotong dan tidak dapat dilanjutkan, atau tool tidak tersedia.
- Jangan membuat klaim bahwa seluruh `lib/` telah diaudit.
- Jangan menghapus task lama yang belum dapat diverifikasi.
- Jika `task.md` tetap perlu diperbarui, hanya ubah temuan yang sudah dapat diverifikasi dan beri status `Perlu diverifikasi` pada task lama yang belum dapat dipastikan. Jelaskan cakupan audit yang belum selesai pada laporan.
- Jangan menyembunyikan keterbatasan dengan ringkasan yang menyatakan audit selesai.

## D. PEMERIKSAAN AKHIR

Sebelum menyelesaikan pekerjaan, pastikan:

- Seluruh file Dart dalam cakupan sudah tercantum satu per satu di checklist todowrite.
- Setiap file yang ditandai selesai memang sudah dibaca seluruh isinya dengan read dan diperiksa.
- File `.g.dart` dan `.freezed.dart` saja yang dikecualikan.
- Tidak ada penggunaan terminal atau bash.
- Tidak ada file Dart atau konfigurasi proyek yang diubah.
- Setiap temuan memiliki bukti, nomor baris, dan identitas aturan yang tepat jika melanggar aturan.
- Solusi yang memerlukan verifikasi SDK/paket sudah diperiksa terhadap source yang relevan atau secara jujur ditandai belum terverifikasi.
- Pemeriksaan UI membedakan bukti struktural dari tampilan aktual yang belum dilihat.
- Seluruh task lama sudah dievaluasi terhadap kode dan aturan terbaru sejauh file terkait berhasil diperiksa.
- Tidak ada task duplikat.
- Kategori dan prioritas task sudah benar; `task.md` disusun mengikuti skill `format-task-md`.
- Path serta nomor baris pada `task.md` benar.
- `rencana_fitur_baru.md` diperiksa dan hanya diperbarui jika ada ide fitur baru yang layak.
- Checklist todowrite mencerminkan status pekerjaan yang sebenarnya.

## E. LAPORAN HASIL AUDIT

Setelah audit selesai atau terhenti karena keterbatasan, berikan laporan berikut:

1. Ringkasan inventaris:
   - Total file Dart ditemukan:
   - File yang dikecualikan (`.g.dart` dan `.freezed.dart`):
   - Total file yang wajib diperiksa:
   - Total file yang berhasil dibaca dan diperiksa:
   - Total file yang belum selesai diperiksa:
2. Hasil temuan:
   - Bug runtime: jumlah temuan.
   - UX: jumlah temuan.
   - UI: jumlah temuan.
   - Total pelanggaran aturan tertulis:
   - Total masalah yang bukan pelanggaran aturan tertulis:
3. Perubahan task:
   - Task baru:
   - Task lama yang diperbarui:
   - Task yang dihapus karena sudah selesai/tidak relevan:
   - Task duplikat yang digabung atau dihapus:
   - Task yang masih perlu diverifikasi:
4. Evaluasi aturan:
   - Sebutkan aturan yang paling sering dilanggar, file terkait, dan pola masalahnya. Informasi ini digunakan pengguna untuk mengevaluasi apakah aturan perlu diperjelas atau diperbaiki.
   - Jika ditemukan konflik antaraturan, sebutkan kedua lokasi aturan dan jelaskan konfliknya. Jangan menyelesaikan konflik dengan asumsi.
5. Berkas dokumentasi yang diperbarui:
   - Sebutkan path berkas yang benar-benar berhasil diperbarui. Jangan menyatakan berkas diperbarui jika tool edit/write gagal.
6. Keterbatasan:
   - Sebutkan seluruh file atau bagian yang belum dibaca, source SDK/paket yang belum dapat diakses, dan verifikasi visual yang belum dilakukan.

## Larangan

- DILARANG mengubah, menghapus, menambah, memindahkan, memformat, atau melakukan refactoring terhadap file Dart.
- DILARANG memperbaiki implementasi yang ditemukan bermasalah.
- DILARANG mengubah konfigurasi proyek, dependensi, berkas hasil generate, atau dokumentasi lain yang tidak diizinkan.
- DILARANG menggunakan terminal atau tool bash dalam bentuk apa pun, termasuk untuk mencari, membaca, menghitung, atau memeriksa kode.
- DILARANG mengganti pembacaan langsung dengan grep, pencarian pola, ringkasan indeks, atau hasil pemindaian otomatis.
- DILARANG mengarang temuan, nomor baris, bukti, dampak, solusi, atau identitas aturan.
- DILARANG menulis `task.md` dengan format selain skill `format-task-md`; DILARANG mengisi atau mengubah kolom `prompt`.
- DILARANG merujuk tool `todoread` (tidak tersedia); gunakan status terakhir dari konteks percakapan saat memperbarui checklist todowrite.
- DILARANG menyatakan audit selesai 100% jika masih ada file yang belum diperiksa.
- DILARANG commit/push hasil audit.

## Kriteria Selesai / STOP

- Selesai bila seluruh tahap yang dapat dilakukan benar-benar selesai: seluruh file dalam cakupan sudah dibaca dan diperiksa (atau keterbatasannya dilaporkan eksplisit), `task.md` diperbarui mengikuti skill `format-task-md`, dan laporan bagian E disampaikan.
- STOP bila argumen `$ARGUMENTS` menunjuk path yang tidak ada/ambigu (setelah fallback tool `question`), bila tidak ada file Dart yang ditemukan di `lib/`, atau bila batas konteks/tool menghalangi kelanjutan; sebutkan file yang belum diperiksa beserta penyebabnya.

## KETENTUAN PALING PENTING

- Audit harus berdasarkan pembacaan langsung setiap file Dart, bukan hanya pencarian pola.
- Checklist todowrite wajib memuat satu item untuk setiap file Dart yang harus diperiksa.
- Item hanya boleh dicentang setelah seluruh isi file dibaca dan diperiksa.
- Setiap pembaruan todowrite harus mempertahankan seluruh item serta status sebelumnya karena pembaruan mengganti seluruh checklist.
- Jangan menganggap jumlah file yang banyak sebagai alasan untuk melewatkan pemeriksaan. Kerjakan bertahap.
- Jangan membuat temuan, bukti, solusi, nomor baris, atau pelanggaran aturan yang tidak dapat dibuktikan.
- Jangan mengubah file Dart.
- Jangan menggunakan terminal atau bash.
- Jangan menyatakan audit selesai 100% jika masih ada file yang belum diperiksa.
- `task.md` harus mencerminkan kondisi kode dan aturan proyek yang terbaru, bukan sekadar menyimpan daftar task lama.
