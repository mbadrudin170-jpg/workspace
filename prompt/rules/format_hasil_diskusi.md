diperbarui : Wed Nov 18 2026 02:09 WIB
ditimpa ke : `.agents/rules/format_hasil_diskusi.md`

1. Berlaku untuk berkas hasil diskusi `hasil_diskusi/diskusi_N.md` di root proyek (catatan proses/keputusan, bukan PRD); penamaan `diskusi_N.md` (N bulat positif tanpa awalan nol); penomoran nomor tertinggi + 1; gap tidak diisi; berkas baru selalu bernomor berikutnya, tidak menimpa/gap.

2. Struktur wajib berurutan, teks judul persis (tanpa penomoran): `# Hasil Diskusi <N> — <judul topik>` → `## Status` → `## Latar Belakang` → `## Poin Diskusi` → `## Keputusan` → `## Rekomendasi` → `## Tindak Lanjut` → `## File Terdampak` → `## Pertanyaan Terbuka` → `## Riwayat Perubahan`. Jumlah dan judul bagian dilarang diubah tanpa pembaruan aturan ini.

3. Isi bagian: `## Status` memuat `Dokumen` (Draft/Final/Batal), `Implementasi` (sesuai kondisi aktual; bila belum diketahui tulis eksplisit, dilarang mengarang), `Tanggal`, `Topik`; `## Keputusan` kode `K-N`; `## Rekomendasi` kode `R-N`; `## Tindak Lanjut` tabel `No | Tindakan | File Terdampak | Status`; `## File Terdampak` tabel `Lokasi File | Status Perubahan | Deskripsi`; `## Riwayat Perubahan` tabel `Tanggal | Perubahan`.

4. `## Pertanyaan Terbuka` hanya memuat pertanyaan (bukan catatan status/implementasi); pertanyaan yang terjawab wajib dihapus dari daftar dan dicatat sebagai jejak di `## Riwayat Perubahan`; bila tidak ada, tulis `Belum ada`; daftar wajib diperbarui setiap kali status/isi berkas berubah.

5. Bagian yang belum dibahas wajib keterangan eksplisit (`Belum dibahas`/`Belum diketahui`); dilarang menebak, mengisi fiktif, atau mengosongkan tanpa keterangan; seluruh isi bahasa Indonesia, gaya teknis ringkas, dilarang mengarang informasi.

6. Teks judul `## Status`, `## Keputusan`, `## Tindak Lanjut` wajib dipertahankan apa adanya (titik baca `.kilo/commands/kerjakan_hasil_diskusi.md`).

7. Setelah berkas dibuat/diperbarui/dihapus: perbarui `MEMORI.md` bagian `Lokasi Hasil Diskusi` (lokasi, daftar berkas, nomor tertinggi) dan `Riwayat Diskusi` + `memori/riwayat_perubahan.md`; sinkronisasi wajib lewat berkas sesi (`memori/sesi/sesi_N.md`, `Belum Sinkron` → `Sudah Sinkron`); awal sesi wajib catch-up sync; berkas sesi tidak boleh dihapus; berkas sebelum aturan berlaku (mis. `diskusi_1.md`–`diskusi_4.md`) arsip, dilarang diubah tanpa persetujuan pengguna.
