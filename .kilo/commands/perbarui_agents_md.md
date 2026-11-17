---
description: Memperbarui `AGENTS.md` in-place dari penanda blok, menyalin ulang isi berkas sumber (aturan `.agents/rules/` dan skill `.agents/skills/`) ke blok masing-masing, setelah konfirmasi pengguna.
---

# Memperbarui AGENTS.md dari Sumber

## Tujuan

Meregenerasi `AGENTS.md` (root proyek) secara in-place: header dan baris di luar blok dipertahankan, sedangkan isi setiap blok ber-penanda diganti dengan isi terkini dari berkas sumber yang ditunjuk penanda tersebut. Command ini lahir karena `AGENTS.md` adalah gabungan berkas aturan (`.agents/rules/`) dan sebagian konten skill (`.agents/skills/`) yang sebelumnya disinkronkan manual per blok, sehingga rawan usang.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu (tool `read`) dan pahami strukturnya sebelum bertindak.
2. Muat skill `memori-check` (`.agents/skills/custom/memori-check/SKILL.md`) melalui tool `skill` sebelum bekerja. Tidak ada skill lain yang trigger-nya terpenuhi untuk command ini (command tidak membuat/mengubah skill, PRD, atau `task.md`).
3. Gunakan bahasa Indonesia baku untuk seluruh laporan.
4. Jangan menggunakan terminal untuk membaca berkas; gunakan tool `read`/`glob`/`grep`.
5. Jangan mengarang isi sumber; jika berkas sumber tidak dapat dibaca, hentikan proses (lihat Kriteria Selesai / STOP).

## Cakupan

- Berkas yang boleh ditulis: `AGENTS.md` di root proyek saja.
- Sumber isi blok: berkas pada path yang dicantumkan di penanda blok (relatif terhadap root proyek).
- Header `AGENTS.md` (seluruh baris sebelum penanda pembuka pertama) **tidak diubah**.
- Baris di luar blok (mis. baris penanda satu-baris `// Format PRD ...` / `// Format task.md ...` di akhir berkas) **dipertahankan apa adanya**.
- Blok yang dikenali hanya dua jenis penanda pembuka:
  - `// SKILL: <path>` → path menuju `SKILL.md` (mis. `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`)
  - `// FILE: <path>` → path menuju berkas aturan (mis. `.agents/rules/global/format_hasil_diskusi.md`)
- Penanda pembuka selalu berupa tiga baris berurutan: baris `// ============================================================`, baris `// SKILL: <path>` atau `// FILE: <path>`, baris `// ============================================================`.
- Isi blok = baris-baris setelah penanda pembuka sampai sebelum penanda pembuka blok berikutnya atau sebelum akhir berkas/baris di luar blok.
- Satu baris kosong setelah penanda pembuka dan satu baris kosong sebelum penanda blok berikutnya dipertahankan agar hasil idempoten.
- Command ini **tidak menambahkan blok baru** untuk sumber yang belum diblokir (mis. `.agents/rules/global/alur_git_commit.md` tetap di luar `AGENTS.md`), **tidak menghapus blok**, dan **tidak mengubah urutan blok**.

## Parameter

- `$ARGUMENTS` (opsional): path berkas target yang akan diregenerasi. Default: `AGENTS.md` di root proyek.
- Jika argumen diisi dan berkas tidak ada atau tidak terbaca → **STOP** dan laporkan.
- Jika argumen ambigu (mis. menyebut path selain `AGENTS.md`) → tanyakan kepada pengguna dengan tool `question` sebelum menulis apa pun.

## Alur Kerja

1. **Analyze**
   - Baca `AGENTS.md`; tentukan batas header (baris sebelum penanda pembuka pertama).
   - Temukan seluruh penanda pembuka blok beserta jenisnya (`SKILL` / `FILE`) dan path sumber masing-masing.
   - Baca setiap berkas sumber; catat untuk tiap blok: path sumber, ada/tidaknya berkas, dan apakah isi blok saat ini identik dengan isi sumber.
   - Bila ada sumber yang hilang/tidak terbaca → **STOP**, laporkan daftar sumber bermasalah, jangan menulis apa pun.
2. **Plan**
   - Susun tabel per blok: nomor blok, jenis penanda, path sumber, status (`Identik` / `Berubah` / `Sumber hilang`).
   - Bila semua blok `Identik`, laporkan "`AGENTS.md` sudah sinkron" dan hentikan tanpa menulis.
   - Bila ada blok `Berubah`, tampilkan ringkasan perubahan per blok (jumlah baris berubah dan ringkasan isi yang berbeda) kepada pengguna.
3. **Konfirmasi**
   - Tanyakan kepada pengguna dengan tool `question` apakah `AGENTS.md` boleh ditulis dengan hasil regenerasi tersebut (pilihan: tulis / batal). Sebutkan berkas target pada pertanyaan.
4. **Execute** (hanya setelah pengguna menyetujui)
   - Tulis `AGENTS.md` baru: header + baris di luar blok dipertahankan persis; isi setiap blok diganti dengan satu baris kosong + isi sumber + satu baris kosong sebelum penanda blok berikutnya (atau sebelum akhir berkas).
5. **Review**
   - Baca ulang `AGENTS.md` hasil tulis; verifikasi: jumlah blok sama dengan sebelum penulisan, seluruh path sumber valid, tidak ada penanda/baris yang rusak, tidak ada blok yang hilang.
   - Jalankan `git diff -- AGENTS.md` dan laporkan ringkasan (jumlah baris berubah) sebagai bukti.
   - Catat perubahan ke berkas sesi `memori/sesi/sesi_N.md` dan perbarui `MEMORI.md` serta `memori/riwayat_perubahan.md` sesuai skill `memori-check`.

## Format Laporan

| Blok | Jenis Penanda | Path Sumber | Status                            | Baris (sebelum → sesudah) |
| ---- | ------------- | ----------- | --------------------------------- | ------------------------- |
| 1    | `SKILL`       | `<path>`    | Identik / Berubah / Sumber hilang | `<n>` → `<m>`             |

Di bawah tabel, cantumkan: status penulisan (`Ditulis` / `Tidak ditulis (dibatalkan pengguna)` / `Sudah sinkron` / `STOP`), ringkasan `git diff` bila terjadi penulisan, dan catatan tindak lanjut memori.

## Larangan

- DILARANG menambah blok baru untuk sumber yang belum diblokir di `AGENTS.md`.
- DILARANG menghapus blok, mengubah urutan blok, atau mengubah header `AGENTS.md`.
- DILARANG mengubah baris di luar blok (mis. baris penanda satu-baris `// Format ...` di akhir berkas).
- DILARANG menulis `AGENTS.md` sebelum pengguna menyetujui lewat tool `question`.
- DILARANG mengubah berkas sumber (`.agents/rules/`, `.agents/skills/`) dengan alasan apa pun.
- DILARANG mengubah kode Dart, berkas hasil generate, konfigurasi Kilo (`.kilo/kilo.jsonc`), atau commit/push.
- DILARANG mengarang atau "memperbaiki" isi sumber; sumber hilang/tidak terbaca berarti **STOP**.

## Kriteria Selesai / STOP

- Selesai bila seluruh blok diverifikasi (`Identik` atau `Berubah` yang sudah ditulis atas persetujuan pengguna), laporan disampaikan, dan sinkronisasi memori dicatat.
- STOP bila: `AGENTS.md` tidak ditemukan/tidak terbaca; ada sumber blok yang hilang/tidak terbaca; pengguna membatalkan penulisan; atau verifikasi pasca-tulis menemukan blok hilang/rusak (laporkan dan jangan klaim berhasil).
