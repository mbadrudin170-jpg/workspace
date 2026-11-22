diperbarui : Sun Nov 22 2026 10:35 WIB
file : [memori-check](../../.agents/skills/non-code/memori-check/SKILL.md)

1. Sebelum interaksi apa pun, baca `MEMORI.md` root proyek; bila belum ada, tanyakan inisialisasi.

2. Di awal sesi, lakukan catch-up sync: pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` dari sesi sebelumnya; yatim/kosong → tandai `Sudah Sinkron` dengan catatan eksplisit; berisi perubahan nyata → sinkronkan; ambigu → laporkan; jangan tandai berkas sesi yang sedang aktif.

3. Buat satu berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1) sebelum tindakan yang mengubah proyek; satu berkas untuk seluruh percakapan/tugas; jangan buat baru untuk pesan/tindakan kecil.

4. Setiap berkas sesi wajib memuat: `## Status` (Status Sinkron, Tanggal Jakarta, Command, Topik), `## Catatan Sesi`, `## Berkas Terdampak`, `## Sinkronisasi ke MEMORI.md`.

5. Status Sinkron hanya `Belum Sinkron` atau `Sudah Sinkron`; saat pembuatan awal wajib `Belum Sinkron`.

6. Perbarui berkas sesi aktif selama sesi; pada akhir sesi, tanyakan kepada pengguna apakah sesi akan diakhiri; jika ya, perbarui `MEMORI.md` + `memori/riwayat_perubahan.md`, isi `## Sinkronisasi ke MEMORI.md`, lalu tandai `Sudah Sinkron`.

7. Tabel `## Berkas Terdampak` wajib mencakup seluruh perubahan (root + submodule) dan cocok dengan `git status` sebelum penandaan `Sudah Sinkron`.

8. Berkas sesi `Sudah Sinkron` adalah arsip: dilarang diubah/diedit; koreksi/klarifikasi dicatat pada berkas sesi baru (N tertinggi + 1) yang merujuk berkas lama.

9. Jangan hapus berkas sesi dengan alasan apa pun tanpa perintah eksplisit pengguna.

10. Perbarui `MEMORI.md` sesuai kriteria promosi (permintaan eksplisit pengguna atau sinyal berulang konsisten) dan pengetahuan baru yang bermanfaat; pada sinkronisasi wajib konsolidasi/resolusi konflik, hormati pinning fakta eksplisit pengguna, tinjau entri volatil, dan cek batas ukuran `MEMORI.md`.

11. `MEMORI.md` wajib memuat section kategori yang sesuai isi proyek (mis. Informasi Proyek, Struktur, Status Kerja); jangan hapus bagian yang tidak relevan tanpa alasan.

12. Penandaan `Sudah Sinkron` hanya boleh dilakukan oleh sesi pembuat berkas tersebut; sesi lain dilarang mengubah berkas sesi milik sesi lain.

13. Pengecualian pengguna: entri `memori/riwayat_perubahan.md` tidak ditambahkan (preferensi pengguna); nyatakan eksplisit pada sesi yang bersangkutan.

14. Selama satu percakapan/task belum ditutup, gunakan berkas sesi aktif yang sama; jangan buat berkas sesi baru untuk pesan/tindakan kecil.

15. Sebelum menyinkronkan sesi ke memori, cek dulu sesi yang masih berjalan agar sesi yang masih berjalan jangan dulu disinkronkan.

16. Setiap isi memori wajib dipisah per section agar lebih terarah.

17. Jangan menulis nomor sesi pada isi memori; cukup ringkasan info jangka panjang yang penting.

18. Klasifikasi memori: `MEMORI.md` = semantic (ringkas, diinjeksikan utuh); `memori/sesi/*.md` + `memori/riwayat_perubahan.md` = episodic (diarsipkan/dirujuk); skills + rules = procedural (dimuat sesuai trigger). Kronologi mentah termasuk episodic, bukan semantic — dilarang menduplikasi kronologi sesi ke `MEMORI.md`.

19. Provenance wajib: setiap klaim/keputusan durable di `MEMORI.md` wajib merujuk berkas sesi sumber (`sesi N`).

20. Konsolidasi & resolusi konflik saat sinkronisasi: kontradiksi diselesaikan (pernyataan lebih baru/berkeyakinan lebih tinggi menggantikan yang lama), dicatat di `memori/riwayat_perubahan.md`; dilarang membiarkan dua pernyataan bertentangan berdampingan.

21. Kriteria promosi ke `MEMORI.md`: (a) pengguna eksplisit meminta agar sesuatu dicatat/diingat, atau (b) sinyal berulang konsisten lintas sesi; sebutiran insidental tanpa niat eksplisit/pengulangan tidak dipromosikan.

22. Entri volatil (status yang dapat basi) wajib bertanggal; pada sinkronisasi wajib diperbarui atau ditandai usang secara eksplisit. Entri basi dilarang dihapus begitu saja (decay = demote, bukan hapus); tandai usang atau pindahkan ringkasan historis ke `memori/riwayat_perubahan.md`.

23. Pinning fakta eksplisit pengguna: fakta/keputusan yang pengguna eksplisit minta diingat ditandai `dipatok pengguna` di `MEMORI.md`; entri tersebut dilarang dikonsolidasi, dipersingkat, ditandai usang, atau dihapus tanpa perintah eksplisit pengguna.

24. Batas ukuran `MEMORI.md`: wajib cukup kecil untuk diinjeksikan utuh (±200 baris); bila mendekati, lakukan konsolidasi (gabung entri usang, pindahkan detail ke `riwayat_perubahan.md`, ringkas).

25. Catch-up sync detail: yatim/kosong tanpa perubahan nyata → tandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan"; berisi perubahan nyata → sinkronkan dengan prosedur akhir sesi; ambigu/tidak dapat diverifikasi → laporkan ke pengguna, jangan diputuskan sendiri; sesi paralel best-effort; berkas sesi yang sedang aktif tidak ditandai. Verifikasi akhir: `git status -- memori/sesi/` dan `git diff -- memori/sesi/` (hanya berkas sesi aktif dan, bila ada, `Belum Sinkron` yang disinkronkan lewat catch-up; `Sudah Sinkron` tidak boleh muncul); cocokkan tabel `## Berkas Terdampak` dengan `git status --short`/`git diff --name-only` (root + submodule).

26. Larangan: menulis kredensial/token/password/API key; menduplikasi kronologi mentah sesi ke `MEMORI.md`; membiarkan kontradiksi berdampingan; menghapus entri basi tanpa demote/penandaan usang; mengonsolidasi entri `dipatok pengguna` tanpa perintah; menulis entri volatil tanpa tanggal.

27. Pengecualian pengguna: bila pengguna eksplisit meminta entri `memori/riwayat_perubahan.md` tidak ditambahkan, patuhi dan nyatakan eksplisit pada sesi yang bersangkutan.

28. Root proyek = root repositori/direktori kerja aktif tempat interaksi berlangsung; fakta/konvensi/status satu proyek tidak menular ke proyek lain. Jangan mulai implementasi sebelum konteks dari `MEMORI.md` tercerna dan poin-poin relevan tercatat.

29. Tujuan informasi yang ditambahkan ke memori: agar setiap model AI dapat mengetahui tentang pengguna (preferensi, konteks, konvensi, keputusan) tanpa pengguna harus menjelaskan ulang; informasi yang dicatat wajib cukup jelas dan tahan lama (durable) sehingga model AI mana pun dapat memahami pengguna dari memori.

30. Format isi memori wajib memakai struktur bertingkat: Section (bagian/kelompok dalam dokumen), Category (kategori yang mengelompokkan informasi), Heading (judul bagian), Subsection (bagian di dalam section), Field (satu kolom/atribut informasi). Setiap informasi ditulis pada tingkat yang sesuai agar terarah.
