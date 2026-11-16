diperbarui : Mon Nov 16 2026 13:02 WIB
file : [memori-check](../../.agents/skills/custom/memori-check/SKILL.md)

1. Sebelum interaksi apa pun, baca `MEMORI.md` root proyek; bila belum ada, tanyakan inisialisasi.
2. Di awal sesi, lakukan catch-up sync: pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` dari sesi sebelumnya; yatim/kosong → tandai `Sudah Sinkron` dengan catatan eksplisit; berisi perubahan nyata → sinkronkan; ambigu → laporkan; jangan tandai berkas sesi yang sedang aktif.
3. Buat satu berkas sesi `memori/sesi/sesi_N.md` (N = tertinggi + 1) sebelum tindakan yang mengubah proyek; satu berkas untuk seluruh percakapan/tugas; jangan buat baru untuk pesan/tindakan kecil.
4. Setiap berkas sesi wajib memuat: `## Status` (Status Sinkron, Tanggal Jakarta, Command, Topik), `## Catatan Sesi`, `## Berkas Terdampak`, `## Sinkronisasi ke MEMORI.md`.
5. Status Sinkron hanya `Belum Sinkron` atau `Sudah Sinkron`; saat pembuatan awal wajib `Belum Sinkron`.
6. Perbarui berkas sesi aktif selama sesi; pada akhir sesi, tanyakan kepada pengguna apakah sesi akan diakhiri; jika ya, perbarui `MEMORI.md` + `memori/riwayat_perubahan.md`, isi `## Sinkronisasi ke MEMORI.md`, lalu tandai `Sudah Sinkron`.
7. Tabel `## Berkas Terdampak` wajib mencakup seluruh perubahan (root + submodule) dan cocok dengan `git status` sebelum penandaan `Sudah Sinkron`.
8. Berkas sesi `Sudah Sinkron` adalah arsip: dilarang diubah/diedit; koreksi/klarifikasi dicatat pada berkas sesi baru (N tertinggi + 1) yang merujuk berkas lama.
9. Jangan hapus berkas sesi dengan alasan apa pun tanpa perintah eksplisit pengguna.
10. Perbarui `MEMORI.md` sesuai kriteria promosi (permintaan eksplisit pengguna atau sinyal berulang konsisten) dan pengetahuan baru yang bermanfaat; setiap entri durable wajib provenance `sesi N`.
11. `MEMORI.md` wajib memuat section kategori yang sesuai isi proyek (mis. Informasi Proyek, Struktur, Status Kerja); jangan hapus bagian yang tidak relevan tanpa alasan.
12. Penandaan `Sudah Sinkron` hanya boleh dilakukan oleh sesi pembuat berkas tersebut; sesi lain dilarang mengubah berkas sesi milik sesi lain.
13. Pengecualian pengguna: entri `memori/riwayat_perubahan.md` tidak ditambahkan (preferensi pengguna); nyatakan eksplisit pada sesi yang bersangkutan.
14. Selama satu percakapan/task belum ditutup, gunakan berkas sesi aktif yang sama; jangan buat berkas sesi baru untuk pesan/tindakan kecil.
