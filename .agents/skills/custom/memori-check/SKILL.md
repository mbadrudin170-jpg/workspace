---
name: memori-check
description: "Trigger: saat memulai percakapan atau tugas di proyek mana pun | Panduan wajib baca MEMORI.md di root proyek sebelum interaksi dan perbarui bagian relevan setelahnya (kode, dokumen, state). Berlaku lintas repositori; tidak terikat satu proyek/path. Satu berkas sesi (`memori/sesi/sesi_N.md`) per percakapan/tugas, bukan per pesan; berkas sesi baru hanya dibuat bila percakapan/tugas baru dimulai atau ada pekerjaan nyata yang belum tercatat. Sinkronisasi disertai konsolidasi konflik, klasifikasi semantic/episodic/procedural, provenance sesi, dan pinning fakta eksplisit pengguna. Catch-up sync berkas `Belum Sinkron` dari sesi sebelumnya (yatim/kosong → `Sudah Sinkron` + catatan eksplisit; berisi perubahan → prosedur akhir sesi; ambigu → lapor pengguna). Di akhir percakapan/tugas AI wajib memperbarui `MEMORI.md` lalu menandai berkas sesi `Sudah Sinkron`. Berkas `sesi_N.md` tidak boleh dihapus (arsip permanen); berkas `Sudah Sinkron` bersifat arsip — koreksi/klarifikasi WAJIB dicatat pada berkas sesi baru."
metadata:
  kategori: "custom"
  versi: "1.12.0"
  diperbarui: "Mon Nov 16 2026 22:10 WIB"
---

# Memeriksa File MEMORI.md dan Berkas Sesi

Setiap kali model (AI) memulai percakapan atau tugas dengan proyek apa pun yang memiliki `MEMORI.md` di root proyek, **wajib** membaca file `MEMORI.md` di root proyek tersebut sebelum interaksi apa pun (bukan hanya task; termasuk pertanyaan, diskusi, review, penelusuran), **dan wajib membuat/aktifkan berkas sesi `memori/sesi/sesi_N.md` (nomor tertinggi + 1) sebelum bertindak atau mengubah kode/dokumen apa pun**, lalu **wajib** memperbarui bagian yang relevan di `MEMORI.md` setelah interaksi yang mengubah proyek (kode, dokumen, state). Skill ini berlaku untuk SEMUA percakapan/tugas di proyek mana pun; tidak terikat satu proyek, satu path, atau satu jenis proyek (bukan khusus proyek Flutter). Project root ditentukan dari direktori kerja aktif atau root repositori tempat interaksi berlangsung. **Satu berkas sesi** (`memori/sesi/sesi_N.md`) mewakili **satu percakapan/tugas** — bukan satu pesan atau satu tindakan kecil.

Bila proyek belum memiliki `MEMORI.md` di root, jangan mengarang konteks proyek dan jangan menulis memori sembarangan: tanyakan kepada pengguna apakah ingin menginisialisasi `MEMORI.md` dan folder `memori/sesi/` terlebih dahulu.

Memori bersifat **per root proyek** (per repositori); fakta, konvensi, dan status satu proyek tidak menular secara implisit ke proyek lain (mencegah *context collapse* lintas domain). Klasifikasi memori yang dipakai:

- **Semantic memory** = `MEMORI.md` — fakta durable (konvensi, keputusan, status, konteks proyek). Cukup kecil untuk diinjeksikan utuh ke konteks agen; diringkas, bukan arsip kronologi.
- **Episodic memory** = `memori/riwayat_perubahan.md` dan `memori/sesi/sesi_N.md` — catatan peristiwa ber-timestamp; dicari/dirujuk saat perlu, tidak diinjeksikan utuh ke konteks.
- **Procedural memory** = skills (`.agents/rules/global/kelompok_skill_wajib.md`) dan aturan (`.agents/rules/`) — pola kerja yang mengikat; dimuat sesuai trigger.

Kronologi mentah termasuk episodic memory, bukan semantic memory: `MEMORI.md` hanya memuat ringkasan durable, bukan transkrip sesi.

Mulai 2026-11-13, setiap sesi (percakapan/tugas) wajib dicatat ke berkas sesi `memori/sesi/sesi_N.md` (bernomor, `sesi_1.md`, `sesi_2.md`, …; penomoran nomor tertinggi + 1, gap tidak diisi). Berkas sesi menjadi perantara antara sesi kerja dan `MEMORI.md`: AI tidak boleh mengubah `MEMORI.md` secara langsung tanpa mencatat sesi ke berkas sesi terlebih dahulu, dan di akhir sesi AI wajib memperbarui `MEMORI.md` dengan catatan yang relevan dari berkas sesi lalu menandai berkas sesi `Sudah Sinkron`. Berkas `sesi_N.md` **tidak boleh dihapus** dengan alasan apa pun (diarsipkan permanen).

Pada setiap **awal sesi**, setelah membaca `MEMORI.md` dan sebelum membuat berkas sesi baru, AI wajib melakukan **catch-up sync**: memindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya dan menyinkronkannya. Sinkronisasi akhir sesi tetap dipertahankan sebagai penyelesaian normal; catch-up berfungsi sebagai **jaring pengaman**. Berkas yatim/kosong tanpa perubahan nyata ditandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan"; berkas berisi perubahan nyata disinkronkan dengan prosedur akhir sesi; bila isi ambigu/tidak dapat diverifikasi → laporkan ke pengguna, jangan diputuskan sendiri. Pemindaian dibatasi pada berkas `Belum Sinkron` saja (bukan seluruh riwayat). Berkas sesi yang sedang aktif di sesi ini tidak boleh ditandai pada langkah catch-up.

Berkas sesi ber-status `Sudah Sinkron` bersifat **arsip permanen** dan DILARANG diubah dengan alasan apa pun (isi, `Status Sinkron`, catatan, tabel `Berkas Terdampak`, maupun bagian lain). Koreksi, klarifikasi, atau tindak lanjut atas isi berkas sesi lama WAJIB dicatat pada berkas sesi **baru** (nomor tertinggi + 1) yang merujuk berkas lama. Yang boleh disentuh hanya berkas ber-status `Belum Sinkron` (catch-up) dan berkas sesi yang sedang aktif di sesi ini.

## Cakupan yang Di-Cover

- **File utama**: `MEMORI.md` di root proyek mana pun (`<root-proyek>/MEMORI.md`); root proyek = root repositori/direktori kerja aktif tempat interaksi berlangsung
- **File sesi**: `memori/sesi/sesi_N.md` di root proyek (folder `memori/sesi/`; bernomor, diarsipkan permanen)
- **File episodic**: `memori/riwayat_perubahan.md` di root proyek (catatan peristiwa ber-timestamp; rujuk saat perlu, bukan diinjeksikan utuh)
- **Objek**: Seluruh isi `MEMORI.md` sebagai konteks hidup proyek (status, konvensi, aturan, catatan teknis, riwayat, dan bagian lain yang ada di dalamnya)
- **Sifat**: `MEMORI.md` adalah dokumen yang **berubah seiring waktu**, bukan kontrak tetap; berkas sesi diarsipkan permanen sebagai jejak per sesi
- **Method**: (1) di awal sesi, membaca `MEMORI.md` lalu melakukan catch-up sync (memindai `memori/sesi/sesi_N.md` `Belum Sinkron` dari sesi sebelumnya dan menyinkronkannya), kemudian membuat berkas `sesi_N.md` dengan status `Belum Sinkron`; (2) selama sesi, mencatat poin penting/perubahan ke berkas sesi; (3) di akhir sesi, memperbarui bagian yang relevan di `MEMORI.md` berdasarkan catatan berkas sesi (disertai konsolidasi konflik, promosi sesuai kriteria, dan peninjauan entri volatil), lalu menandai berkas sesi `Sudah Sinkron`

## Aturan

1. **Wajib baca `MEMORI.md` terlebih dahulu** sebelum interaksi apa pun di proyek mana pun yang memiliki `MEMORI.md` di root proyek (task, pertanyaan, diskusi, review, penelusuran). **Sebelum interaksi apa pun yang mengubah proyek, wajib membuat/aktifkan berkas sesi `memori/sesi/sesi_N.md` (nomor tertinggi + 1) terlebih dahulu**; bila `MEMORI.md` belum ada, tanyakan kepada pengguna apakah ingin menginisialisasi; jangan mengarang konteks proyek.
2. **Catch-up sync di awal sesi.** Setelah membaca `MEMORI.md` dan sebelum membuat berkas sesi baru, pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya (pemindaian dibatasi pada berkas `Belum Sinkron` saja, bukan seluruh riwayat). Tindak lanjutnya:
   - Berkas yatim/kosong tanpa perubahan nyata → tandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan" (jejak diarsipkan permanen, tidak dihapus).
   - Berkas berisi perubahan nyata → sinkronkan dengan prosedur yang sama seperti sinkronisasi akhir sesi (perbarui `MEMORI.md` + `memori/riwayat_perubahan.md` → isi `## Sinkronisasi ke MEMORI.md` → tandai `Sudah Sinkron`).
   - Berkas sesi yang sedang aktif di sesi ini → **tidak boleh ditandai** pada langkah catch-up.
   - Isi ambigu/tidak dapat diverifikasi → jangan diputuskan sendiri; laporkan ke pengguna. Sesi paralel: best-effort; bila ambigu, lapor.
   - Alur akhir sesi **tetap dipertahankan**; catch-up hanya jaring pengaman.
3. **Wajib buat satu berkas sesi per percakapan/tugas.** Pada awal percakapan/tugas, sebelum tindakan apa pun yang mengubah proyek, buat `memori/sesi/sesi_N.md` dengan `N` = nomor tertinggi yang ada + 1 (gap tidak diisi; jika folder kosong, buat `sesi_1.md`). **Satu berkas sesi digunakan untuk seluruh percakapan/tugas tersebut**; DILARANG membuat berkas sesi baru hanya karena ada pesan, pertanyaan, atau tindakan kecil berikutnya dalam percakapan yang sama. Berkas sesi baru hanya dibuat bila: (a) percakapan/tugas baru dimulai, atau (b) ada pekerjaan nyata yang belum tercatat pada berkas sesi aktif. Berkas sesi wajib memuat (struktur lengkap):
   - `## Status` — `Status Sinkron: Belum Sinkron`, `Tanggal` (tanggal Jakarta), `Command` (command yang memerintahkan sesi — mis. `/kerjakan_task` atau path command; bila tidak ada command yang dijalankan, tulis `interaksi langsung (tanpa command)`), `Topik` sesi. Field `Command` wajib diisi pada setiap berkas sesi.
   - `## Catatan Sesi` — kronologi/poin penting/keputusan sesi (diperbarui selama sesi).
   - `## Berkas Terdampak` — tabel `Lokasi File | Status Perubahan | Deskripsi` (kelengkapan dan verifikasi tabel diatur pada Aturan 22 dan Aturan 23).
   - `## Sinkronisasi ke MEMORI.md` — ringkasan penyesuaian `MEMORI.md` pada akhir sesi, atau `Belum disinkronkan` selama sesi berlangsung.
4. **Catat ke berkas sesi selama sesi berlangsung.** Setiap perubahan penting (file dibuat/diubah/dihapus, keputusan, temuan) wajib dicatat ke berkas sesi yang aktif; berkas sesi menjadi bahan sinkronisasi `MEMORI.md`, bukan duplikasi penuh `MEMORI.md`. Selama sesi, bandingkan tabel `## Berkas Terdampak` dengan `git status --short` (root + setiap submodule yang terlibat) pada setiap titik perubahan substantif — bukan hanya di akhir sesi — agar selisih terdeteksi lebih dini.
5. **Pahami konteks dari keseluruhan isi `MEMORI.md`** — termasuk (jika ada) status proyek, struktur, konvensi penamaan, konfigurasi/berkas penting, daftar atau rujukan skill dan aturan, catatan teknis, riwayat, serta bagian lain yang tersedia. Jangan berasumsi hanya ada bagian tertentu.
6. **Terapkan konteks/aturan yang relevan** dari isi `MEMORI.md` pada pekerjaan yang akan dilakukan.
7. **Catat poin-poin penting** dari `MEMORI.md` yang relevan dengan interaksi/task yang akan dikerjakan.
8. **Jangan mulai implementasi** sebelum konteks dari `MEMORI.md` tercerna dan poin-poin relevan tercatat.
9. **Sinkronkan di akhir sesi.** Pada akhir sesi, tanyakan kepada pengguna apakah sesi akan diakhiri; jika ya, setelah interaksi yang mengubah proyek selesai, **perbarui bagian yang relevan** di `MEMORI.md` (tentukan berdasarkan isi `MEMORI.md` saat itu, bukan daftar nama bagian yang di-hardcode), tambah entri `memori/riwayat_perubahan.md`, isi bagian `## Sinkronisasi ke MEMORI.md` pada berkas sesi dengan ringkasan penyesuaian, lalu ubah `Status Sinkron` menjadi `Sudah Sinkron`. Pada sinkronisasi ini juga wajib dijalankan:
   - **Promosi sesuai kriteria** (aturan 14) — hanya fakta yang lolos kriteria yang masuk `MEMORI.md`.
   - **Provenance** (aturan 15) — klaim/keputusan durable merujuk berkas sesi sumber.
   - **Konsolidasi & resolusi konflik** (aturan 16) — kontradiksi diselesaikan, bukan dibiarkan berdampingan.
   - **Peninjauan entri volatil** (aturan 17) — entri basi ditandai usang atau diperbarui.
   - **Cek batas ukuran** (aturan 20) — bila `MEMORI.md` terlalu besar, konsolidasi dahulu.
10. **Tanggal diperbarui `MEMORI.md`.** Setiap sinkronisasi `MEMORI.md` (akhir sesi maupun catch-up) wajib memperbarui field tanggal diperbarui di header `MEMORI.md` proyek yang bersangkutan sesuai sesi yang melakukan sinkronisasi, dengan format `Diperbarui: <tanggal Jakarta> (sesi N)`. Field ini berada tepat di bawah judul `# MEMORI …` pada berkas tersebut (teks judul boleh bervariasi per proyek).
11. **Anggap `MEMORI.md` dan berkas sesi bisa berubah strukturnya.** Bila bagian yang biasa diperbarui tidak ada, tambahkan bagian yang sesuai kebutuhan; bila ada bagian baru, ikuti strukturnya. Jangan menghapus bagian yang tidak relevan dengan interaksi.
12. **Jika `MEMORI.md` memuat rujukan ke sumber kebenaran lain** (mis. indeks skill atau rules), patuhi rujukan itu dan jangan menggantinya dengan salinan di `MEMORI.md`.
13. **Berkas sesi `Sudah Sinkron` adalah arsip.** DILARANG mengubah berkas sesi ber-status `Sudah Sinkron` dengan alasan apa pun (isi, `Status Sinkron`, catatan koreksi, tabel `Berkas Terdampak`). Koreksi/klarifikasi/tindak lanjut atas isi berkas sesi lama WAJIB dicatat pada berkas sesi baru (nomor tertinggi + 1) yang merujuk berkas lama; berkas lama tetap apa adanya. Yang boleh diubah hanya: berkas `Belum Sinkron` (catch-up) dan berkas sesi yang sedang aktif di sesi ini.
14. **Kriteria promosi ke `MEMORI.md`.** Hanya fakta/keputusan yang lolos salah satu kriteria berikut boleh dipromosikan dari berkas sesi ke `MEMORI.md`: (a) pengguna **eksplisit** meminta agar sesuatu dicatat/diingat; atau (b) sinyal berulang yang konsisten lintas sesi (mis. konvensi atau keputusan yang sama muncul berkali-kali tanpa kontradiksi). Sebutiran insidental tanpa niat eksplisit atau pengulangan cukup dicatat di berkas sesi dan tidak dipromosikan.
15. **Provenance wajib.** Setiap klaim/keputusan durable yang ditulis di `MEMORI.md` wajib merujuk berkas sesi sumbernya (mis. `(sesi 62)`), sehingga entri dapat diverifikasi ulang dan dideteksi kekeliruannya setelah fakta.
16. **Konsolidasi & resolusi konflik saat sinkronisasi.** Pada akhir sesi dan catch-up, bandingkan isi baru dengan `MEMORI.md`; bila ada kontradiksi, pernyataan yang lebih baru dan berkeyakinan lebih tinggi **menggantikan** yang lama — keduanya DILARANG berdampingan. Hasil penggantian dicatat sebagai entri baru di `memori/riwayat_perubahan.md` (bukan menghapus jejak).
17. **Entri volatil wajib bertanggal dan ditinjau.** Status yang dapat basi (mis. "`pub get` dijalankan per 2026-11-14", daftar berkas belum di-commit, versi yang terpasang) wajib memuat tanggal. Pada setiap sinkronisasi, entri volatil yang sudah lewat verifikasi wajib diperbarui, atau ditandai usang secara eksplisit (mis. "usang per \<tanggal\>, menunggu verifikasi") — bukan dibiarkan tampak mutlak.
18. **Pinning fakta eksplisit pengguna.** Fakta/keputusan yang pengguna eksplisit minta diingat/dicatat ditandai `dipatok pengguna` di `MEMORI.md`; entri tersebut DILARANG dikonsolidasi, dipersingkat, ditandai usang, atau dihapus tanpa perintah eksplisit pengguna.
19. **Decay = demote, bukan hapus.** Entri `MEMORI.md` yang tidak lagi relevan DILARANG dihapus begitu saja; tandai usang secara eksplisit atau pindahkan ringkasan historisnya ke `memori/riwayat_perubahan.md`, lalu rapikan bagian `MEMORI.md`. Kebijakan demote ini sejalan dengan larangan penghapusan berkas sesi.
20. **Batas ukuran `MEMORI.md`.** `MEMORI.md` wajib cukup kecil untuk diinjeksikan utuh ke konteks; bila mendekati ±200 baris (atau bagian status membengkak tanpa terkendali), lakukan **konsolidasi** (gabung entri usang, pindahkan detail ke `riwayat_perubahan.md`, ringkas) — bukan membiarkannya membesar tanpa batas (*fading memory*: sinyal tenggelam di kebisingan).
21. **Klasifikasi memori.** Gunakan klasifikasi semantic/episodic/procedural sebagaimana dijelaskan di bagian intro: `MEMORI.md` (semantic, ringkas, diinjeksikan), `memori/sesi/*.md` dan `memori/riwayat_perubahan.md` (episodic, diarsipkan/dirujuk), skills + rules (procedural, dimuat sesuai trigger). Jangan menulis kronologi sesi ke `MEMORI.md`; jangan memasukkan detail duplikatif episodic ke `MEMORI.md`.
22. **Kelengkapan tabel `## Berkas Terdampak`.** Tabel `## Berkas Terdampak` pada berkas sesi WAJIB mencantumkan **seluruh** berkas yang dibuat/diubah/dihapus selama sesi — termasuk perubahan di dalam submodule — dengan path relatif terhadap root repositori tempat sesi berjalan (mis. `base_coc/lib/fitur/cadangan/service/cadangan_service.dart`). Tabel DILARANG hanya memuat berkas sesi bila ada perubahan lain; perubahan yang tidak tercantum pada tabel dianggap tidak tercatat dan melanggar alur sinkronisasi ini.
23. **Penandaan hanya oleh sesi pembuat.** Penandaan `Sudah Sinkron` hanya boleh dilakukan oleh sesi pembuat berkas tersebut; sesi lain dilarang mengubah berkas sesi milik sesi lain.
24. **Pengecualian pengguna (preferensi eksplisit).** Bila pengguna secara eksplisit meminta agar entri `memori/riwayat_perubahan.md` tidak ditambahkan pada sinkronisasi (preferensi pengguna), patuhi permintaan tersebut dan nyatakan eksplisit pada sesi yang bersangkutan bahwa entri tidak ditambahkan. Pengecualian ini hanya berlaku bila diminta eksplisit oleh pengguna.

## Steps

1. Awal percakapan/tugas: baca `MEMORI.md` (dan berkas pendukung lain sesuai konteks); catat poin relevan.
2. Catch-up sync (sebelum membuat berkas sesi baru): pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya; yatim/kosong → tandai `Sudah Sinkron` dengan catatan eksplisit; berisi perubahan nyata → sinkronkan dengan prosedur akhir sesi (`MEMORI.md` + `memori/riwayat_perubahan.md` → isi `## Sinkronisasi ke MEMORI.md` → tandai `Sudah Sinkron`); ambigu/tidak dapat diverifikasi atau sesi paralel → laporkan ke pengguna, jangan diputuskan sendiri; berkas sesi yang sedang aktif di sesi ini tidak ditandai.
3. Buat satu `memori/sesi/sesi_N.md` untuk percakapan/tugas ini (format lengkap, status `Belum Sinkron`) — bila folder belum ada, buat foldernya terlebih dahulu. Jangan membuat berkas sesi baru untuk pesan/tindakan berikutnya dalam percakapan yang sama.
4. Selama sesi: perbarui `## Catatan Sesi` dan `## Berkas Terdampak` setiap ada perubahan substantif.
5. Akhir sesi: perbarui `MEMORI.md` bagian relevan berdasarkan catatan berkas sesi — jalankan promosi sesuai kriteria (aturan 14), cantumkan provenance `sesi N` (aturan 15), selesaikan kontradiksi (aturan 16), tinjau entri volatil (aturan 17), hormati pinning (aturan 18), demote entri basi (aturan 19), dan cek batas ukuran (aturan 20); tambah entri `memori/riwayat_perubahan.md`; perbarui field tanggal diperbarui di header `MEMORI.md` sesuai sesi yang melakukan sinkronisasi (format `Diperbarui: <tanggal Jakarta> (sesi N)`); isi `## Sinkronisasi ke MEMORI.md`; ubah `Status Sinkron` berkas sesi menjadi `Sudah Sinkron`.
6. Verifikasi: berkas sesi bernomor benar (`tertinggi + 1`), struktur lengkap, status hasil catch-up sesuai (yatim/kosong ditandai `Sudah Sinkron`), `MEMORI.md` konsisten dengan isi berkas sesi, tidak ada kontradiksi antar bagian `MEMORI.md`, tidak ada kredensial/secret yang tertulis, dan setiap klaim baru di `MEMORI.md` memiliki provenance `sesi N`. Selain itu wajib memastikan tidak ada berkas sesi ber-status `Sudah Sinkron` yang berubah: jalankan `git status -- memori/sesi/` dan `git diff -- memori/sesi/` — yang muncul hanya berkas sesi aktif dan (bila ada) berkas `Belum Sinkron` yang disinkronkan lewat catch-up; berkas `Sudah Sinkron` tidak boleh muncul. Terakhir, sebelum menandai berkas sesi `Sudah Sinkron`, cocokkan isi tabel `## Berkas Terdampak` dengan `git status --short` / `git diff --name-only` (root + setiap submodule yang terlibat); seluruh berkas yang berubah selama sesi WAJIB tercantum pada tabel, dan selisih WAJIB diselesaikan (tabel diperbaiki) atau dilaporkan ke pengguna.

## Larangan

- DILARANG memulai interaksi/task apa pun tanpa membaca `MEMORI.md` terlebih dahulu.
- DILARANG membuat berkas sesi baru untuk setiap pesan, pertanyaan, atau tindakan kecil dalam percakapan/tugas yang sama; gunakan berkas sesi aktif yang sudah ada.
- DILARANG mengubah `MEMORI.md` secara langsung tanpa mencatat sesi ke `memori/sesi/sesi_N.md` terlebih dahulu (berkas sesi adalah satu-satunya perantara yang sah menuju `MEMORI.md`).
- DILARANG mengubah berkas `sesi_N.md` ber-status `Sudah Sinkron` dengan alasan apa pun, termasuk menambahkan catatan koreksi/klarifikasi ke dalamnya; berkas tersebut arsip, dan koreksi WAJIB dicatat pada berkas sesi baru (nomor tertinggi + 1) yang merujuk berkas lama. Yang boleh disentuh hanya berkas `Belum Sinkron` (catch-up) dan berkas sesi yang sedang aktif di sesi ini.
- DILARANG pola "hapus lalu buat ulang" untuk "membetulkan" berkas sesi lama; berkas sesi tidak boleh dihapus, koreksi bersifat aditif di berkas sesi baru.
- DILARANG menghapus berkas `sesi_N.md` dengan alasan apa pun, termasuk setelah `Sudah Sinkron` (diarsipkan permanen). Permintaan penghapusan dari pihak mana pun harus ditolak atau dikembalikan kepada pengguna untuk konfirmasi eksplisit luar biasa yang terdokumentasi.
- DILARANG menandai berkas sesi yang sedang aktif di sesi ini sebagai `Sudah Sinkron` pada langkah catch-up.
- DILARANG memutuskan sendiri bila isi berkas sesi yang disinkronkan lewat catch-up ambigu atau tidak dapat diverifikasi — laporkan ke pengguna.
- DILARANG menandai berkas sesi `Sudah Sinkron` sebelum `MEMORI.md` benar-benar diperbarui dan bagian `## Sinkronisasi ke MEMORI.md` terisi (berlaku juga untuk berkas yang disinkronkan lewat catch-up).
- DILARANG memperbarui `MEMORI.md` tanpa memperbarui field tanggal diperbarui di header (`Diperbarui: <tanggal Jakarta> (sesi N)`).
- DILARANG menandai berkas sesi `Sudah Sinkron` sebelum tabel `## Berkas Terdampak` lengkap mencakup seluruh perubahan (root + submodule yang terlibat) dan terverifikasi cocok dengan `git status --short` / `git diff --name-only` (lihat Aturan 22 dan Aturan 23).
- DILARANG mengabaikan bagian "catatan untuk model selanjutnya" (atau sebutan setara) yang ada di `MEMORI.md`.
- DILARANG menggunakan versi proyek yang sudah usang tanpa dicek di `MEMORI.md`.
- DILARANG mengabaikan aturan/konvensi yang tercantum di `MEMORI.md` setelah membacanya.
- DILARANG mengimplementasikan fitur tanpa memastikan kepatuhan terhadap konvensi yang tercantum di `MEMORI.md`.
- DILARANG menganggap daftar di `MEMORI.md` sebagai daftar lengkap bila `MEMORI.md` sendiri merujuk ke sumber kebenaran lain.
- DILARANG mengubah struktur `MEMORI.md` secara membabi buta hanya karena skill ini menyebut bagian tertentu; skill ini tidak menetapkan struktur `MEMORI.md`.
- DILARANG menulis kredensial, token, password, atau API key ke `MEMORI.md`, `memori/sesi/*.md`, atau `memori/riwayat_perubahan.md`; bila informasi tersebut terlanjur tercatat, laporkan ke pengguna dan jangan menyalinnya ke berkas lain.
- DILARANG menduplikasi kronologi mentah sesi ke `MEMORI.md`; `MEMORI.md` hanya memuat ringkasan durable, detail kronologi tetap di berkas sesi dan `riwayat_perubahan.md`.
- DILARANG mempromosikan sebutiran insidental (tanpa niat eksplisit pengguna atau pengulangan konsisten lintas sesi) ke `MEMORI.md`.
- DILARANG membiarkan dua pernyataan yang bertentangan berdampingan di `MEMORI.md`; kontradiksi wajib diselesaikan saat sinkronisasi (aturan 16).
- DILARANG menghapus entri `MEMORI.md` yang basi tanpa proses demote/penandaan usang (aturan 19).
- DILARANG mengonsolidasi, menandai usang, atau menghapus entri yang `dipatok pengguna` tanpa perintah eksplisit pengguna (aturan 18).
- DILARANG menulis entri volatil ke `MEMORI.md` tanpa tanggal (aturan 17).

## Contoh Benar

```markdown
Sebelum memulai percakapan/tugas ini, lakukan langkah berikut:

1. Buka file MEMORI.md di root proyek dan baca konteks yang relevan
2. Buat satu memori/sesi/sesi_9.md (nomor tertinggi 8 + 1) dengan Status Sinkron: Belum Sinkron untuk seluruh percakapan/tugas ini
3. Catat poin penting sesi dan berkas terdampak ke memori/sesi/sesi_9.md selama bekerja (jangan buat sesi baru untuk pesan berikutnya)
4. Mulai pekerjaan setelah konteks tercerna

Setelah selesai dan bila ada perubahan proyek:
- Perbarui bagian yang relevan di MEMORI.md (mis. status, riwayat, catatan teknis) sesuai kondisi terkini
- Tambah entri memori/riwayat_perubahan.md
- Isi bagian "Sinkronisasi ke MEMORI.md" di memori/sesi/sesi_9.md, lalu ubah Status Sinkron menjadi "Sudah Sinkron"
```

Catch-up sync pada awal sesi (setelah membaca MEMORI.md, sebelum membuat berkas sesi baru):

```markdown
1. Baca MEMORI.md
2. Pindai memori/sesi/*.md yang ber-status Belum Sinkron dari sesi sebelumnya:
   - sesi_1.md, sesi_2.md -> yatim/kosong (topik belum ditentukan, tidak ada perubahan) -> tandai Sudah Sinkron dengan catatan "tidak ada perubahan untuk disinkronkan"
   - sesi_7.md -> berisi perubahan nyata -> sinkronkan dengan prosedur akhir sesi (MEMORI.md + riwayat_perubahan.md -> isi Sinkronisasi ke MEMORI.md -> Sudah Sinkron)
   - sesi_aktif_sesi_ini.md -> JANGAN ditandai
   - isi ambigu / sesi paralel -> laporkan ke pengguna, jangan diputuskan sendiri
3. Buat memori/sesi/sesi_9.md (nomor tertinggi + 1) ...
```

Koreksi/klarifikasi atas isi berkas sesi lama yang sudah `Sudah Sinkron` (buat berkas sesi baru, jangan sentuh berkas lama):

```markdown
1. Baca MEMORI.md, lalu sesi_15.md (Status Sinkron: Sudah Sinkron) yang catatannya keliru
2. JANGAN mengedit sesi_15.md — berkas itu arsip
3. Buat memori/sesi/sesi_18.md (nomor tertinggi + 1): catat koreksi + rujuk baris/bagian sesi_15.md yang dikoreksi
4. Isi Berkas Terdampak dan Sinkronisasi ke MEMORI.md; tandai sesi_18.md Sudah Sinkron pada akhir sesi
```

Contoh promosi ke `MEMORI.md` dengan kriteria, provenance, dan pinning:

```markdown
1. Cek catatan sesi: pengguna eksplisit meminta "tolong catat: kami memakai Conventional Commits + squash merge" -> lolos kriteria (a) -> tulis di MEMORI.md dengan provenance:
   "Aturan kontribusi: Conventional Commits + squash merge (sesi 64, dipatok pengguna)."
2. Cek kontradiksi: MEMORI.md lama menyebut "merge commit diizinkan" -> pernyataan baru (dipatok pengguna, lebih baru) menggantikan -> entri di riwayat_perubahan.md mencatat penggantian tersebut.
3. Sebutiran insidental "sepertinya pubspec diurutkan alfabetis" tanpa niat eksplisit/pengulangan -> TIDAK dipromosikan; tetap di berkas sesi.
```

## Contoh Salah

```markdown
// DILARANG: mengedit berkas sesi yang sudah Sudah Sinkron untuk "mengoreksi" isinya
// Salah: "catatan catch-up di sesi_15.md keliru, jadi sesi_15.md saya edit saja agar benar"
// Benar: buat sesi_18.md (nomor tertinggi + 1), catat koreksinya di sana dengan rujukan ke sesi_15.md
```

```markdown
// DILARANG: menganggap berkas sesi lama boleh disentuh karena "hanya menambahkan catatan kecil"
// Salah: "cuma tambah satu baris koreksi ke sesi_13.md yang sudah Sudah Sinkron, tidak apa-apa"
// Benar: berkas Sudah Sinkron = arsip; setiap koreksi dicatat di berkas sesi baru
```

```markdown
// DILARANG: pola hapus lalu buat ulang untuk membetulkan berkas sesi lama
// Salah: "sesi_9.md isinya salah, saya hapus lalu buat lagi dengan konten yang benar"
```

```markdown
// DILARANG: Memulai implementasi tanpa membaca MEMORI.md
// Salah: "Aja langsung aja buat UI-nya, nggak usah baca file2 aneh"

MaterialApp(
  home: Center(child: Text('Contoh Salah')),
); // DILARANG: implementasi tanpa konteks MEMORI.md
```

```markdown
// DILARANG: mengubah MEMORI.md tanpa berkas sesi
// Salah: "Langsung edit MEMORI.md saja, nggak perlu memori/sesi/sesi_9.md"
```

```markdown
// DILARANG: menghapus berkas sesi
// Salah: "sesi_9.md sudah Sudah Sinkron, jadi boleh dihapus"
```

```markdown
// DILARANG: membiarkan berkas sesi yatim tetap Belum Sinkron selamanya
// Salah: "sesi_1.md dan sesi_2.md masih Belum Sinkron, tapi dibiarkan saja"
```

```markdown
// DILARANG: menandai berkas sesi yang sedang aktif di sesi ini pada catch-up
// Salah: "pada awal sesi, catch-up: sesi_9.md ditandai Sudah Sinkron padahal sesi_9.md justru sesi yang sedang berjalan"
```

```markdown
// DILARANG: memutuskan sendiri bila isi sesi yang ditemukan pada catch-up ambigu
// Salah: "sesi_7.md berisi perubahan tapi tidak jelas bagian mana yang nyata; disinkronkan asal-asalan tanpa lapor pengguna"
```

```markdown
// DILARANG: menulis kredensial ke memori
// Salah: "MEMORI.md -> catatan: password database = s3cret123"
// Benar: jangan tulis sama sekali; laporkan ke pengguna bila terlanjur tercatat
```

```markdown
// DILARANG: menduplikasi kronologi sesi ke MEMORI.md
// Salah: menyalin seluruh "## Catatan Sesi" verbatim ke MEMORI.md
// Benar: MEMORI.md hanya ringkasan durable + provenance `sesi N`; kronologi tetap di berkas sesi
```

```markdown
// DILARANG: membiarkan kontradiksi berdampingan
// Salah: "MEMORI.md: deploy tiap Senin" dan "MEMORI.md: deploy tiap Jumat" keduanya tetap ada
// Benar: selesaikan saat sinkronisasi — pernyataan lebih baru/berkeyakinan lebih tinggi menggantikan, jejaknya dicatat di riwayat_perubahan.md
```

```markdown
// DILARANG: mengonsolidasi entri yang dipatok pengguna
// Salah: entri "dipatok pengguna: nama paket tetap snake_case" dirapikan/dihapus saat konsolidasi
// Benar: entri dipatok pengguna tidak boleh disentuh tanpa perintah eksplisit pengguna
```

```markdown
// DILARANG: menganggap skill ini menetapkan bagian tertentu di MEMORI.md
// Salah: "MEMORI.md harus punya bagian X, Y, Z" lalu menghapus/menata ulang bagian lain tanpa alasan dari isi proyek
```

## Sumber Evaluasi

- File: `MEMORI.md` di root proyek mana pun (`<root-proyek>/MEMORI.md`); `memori/sesi/sesi_N.md`
- Commit rujukan: `1823940` (chore(agents): perluas kewajiban pemeriksaan MEMORI.md ke seluruh interaksi proyek), `5e2a55d` (docs(agents): perbarui path hasil diskusi ke prd/hasil_diskusi), `b7f2b05` (docs(memori): lengkapi catatan proyek dan tata ulang arsip diskusi)
- Skill terkait: `aturan-pembuatan-skill`, `validasi-platform-izin`, `gaya`, `penamaan-konvensi`
- Keputusan rujukan: `hasil_diskusi/diskusi_8.md` (K-1..K-11; alur sesi, larangan penghapusan berkas sesi), `hasil_diskusi/diskusi_1.md` (K-1..K-9, R-1..R-4; catch-up sync awal sesi)
- Rujukan perintah pengguna: sesi_18 (2026-11-14; berkas sesi `Sudah Sinkron` bersifat arsip — koreksi/tindak lanjut dicatat di berkas sesi baru); sesi_64 (2026-11-15; skill dijadikan global lintas proyek — tidak terikat satu repo/path/jenis proyek; selanjutnya seluruh rekomendasi analisis tautan arsitektur memori diterapkan — klasifikasi semantic/episodic/procedural, kriteria promosi, provenance, konsolidasi, entri volatil, pinning, demote, batas ukuran); sesi_181 (2026-11-16; satu berkas sesi per percakapan/tugas, bukan per pesan — v1.11.0).
- Rujukan arsitektur memori agen (adaptasi konsep ke memori berkas Markdown, bukan implementasi arsitektur):
  - Microsoft multi-agent-reference-architecture — Long-Term-Memory: https://github.com/microsoft/multi-agent-reference-architecture/blob/main/docs/memory/Long-Term-Memory.md
  - Microsoft multi-agent-reference-architecture — Memory-Architecture-Patterns: https://github.com/microsoft/multi-agent-reference-architecture/blob/main/docs/memory/Memory-Architecture-Patterns.md
  - JetBrains — Memory in AI Agents: Types and Implementation: https://www.jetbrains.com/pages/ai-agents/architecture/ai-agent-memory/
  - Microsoft Learn — Agent Memory in Azure Cosmos DB for NoSQL: https://learn.microsoft.com/en-us/azure/cosmos-db/gen-ai/agentic-memories
- Catatan: skill ini memuat alur sesi (bukan hanya struktur `MEMORI.md`); pembaruan berikutnya untuk perubahan alur sesi mengikuti `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`.
