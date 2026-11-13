# Hasil Diskusi 1 — Perluasan Cakupan Command `perbarui_readme`

## Status

- Dokumen: Final
- Implementasi: Sudah Diimplementasikan
- Tanggal: 2026-11-14
- Topik: Command `.kilo/commands/perbarui_readme.md` hanya memperbarui `README.md` root, perlu diperluas agar semua README submodule ikut diperbarui.

## Latar Belakang

Command `perbarui_readme.md` sebelumnya membatasi pekerjaan pada `README.md` di root repositori. Repositori `workspace` memiliki dua submodule (`base_coc`, `share_global_saya`) yang masing-masing memiliki README sendiri, sehingga dokumentasi submodule dapat tertinggal ketika command dijalankan. Pengguna meminta cakupan command diperluas ke seluruh README submodule.

## Poin Diskusi

### 1. Target README yang harus diperbarui

- Tanya: Apakah command cukup memperbarui README root, atau juga README setiap submodule?
- Kesimpulan: Command wajib memperbarui README root dan README pada root setiap submodule yang terdaftar di `.gitmodules`, termasuk submodule bertingkat bila ada.

### 2. Cara menentukan daftar submodule

- Tanya: Bagaimana command mengetahui submodule yang harus diproses?
- Kesimpulan: Daftar dibaca dinamis dari `.gitmodules` dan diverifikasi dengan `git submodule status`; daftar tidak dihafal atau ditulis tetap di dalam command agar tetap benar saat submodule berubah.

### 3. Batasan agar submodule tidak rusak

- Tanya: Apa yang harus dilarang saat memperbarui README submodule?
- Kesimpulan: Dilarang mengubah kode/konfigurasi, mengubah pointer submodule, serta melakukan commit atau push di root maupun submodule. Perubahan hanya pada README target dan pencatatan memori proyek yang diwajibkan aturan.

## Keputusan

- K-1: Command `perbarui_readme.md` mencakup README root dan README setiap submodule yang terdaftar di `.gitmodules` (termasuk submodule bertingkat).
- K-2: Daftar submodule dibaca dinamis dari `.gitmodules` dan diverifikasi dengan `git submodule status`, bukan ditulis tetap di command.
- K-3: Setiap README disusun dari investigasi independen pada repositori target; klaim fitur tidak boleh disalin antar-README tanpa verifikasi.
- K-4: Command tetap melarang perubahan kode, konfigurasi, pointer submodule, commit, dan push; pengecualian hanya untuk pencatatan memori proyek sesuai skill `memori-check`.

## Rekomendasi

- R-1: Jalankan command ini setelah ada perubahan fitur/struktur pada root atau submodule agar dokumentasi tidak usang.
- R-2: Laporkan hasil per target (Dibuat/Diperbarui/Tidak berubah) agar status dokumentasi tiap repositori jelas.
- R-3: Verifikasi `git status` di root dan setiap submodule sebelum melaporkan selesai, untuk memastikan hanya README target yang berubah.

## Tindak Lanjut

| No | Tindakan | File Terdampak | Status |
| --- | --- | --- | --- |
| 1 | Perluas cakupan command ke seluruh README submodule | `.kilo/commands/perbarui_readme.md` | selesai |
| 2 | Catat hasil diskusi dan perbarui memori proyek | `hasil_diskusi/diskusi_1.md`, `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/sesi_12.md` | selesai |

## File Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `.kilo/commands/perbarui_readme.md` | Diubah | Menambah target README submodule, alur identifikasi submodule dinamis, verifikasi per target, serta larangan terkait submodule. |
| `hasil_diskusi/diskusi_1.md` | Dibuat | Dokumen hasil diskusi ini. |
| `MEMORI.md` | Diubah | Menambah bagian `Hasil Diskusi` dan catatan pembaruan command. |
| `memori/riwayat_perubahan.md` | Diubah | Entri riwayat perubahan command dan hasil diskusi. |
| `memori/sesi/sesi_12.md` | Diubah | Catatan sesi dan status sinkronisasi. |

## Pertanyaan Terbuka

Belum ada

## Riwayat Perubahan

| Tanggal | Perubahan |
| --- | --- |
| 2026-11-14 | Dokumen dibuat; command `perbarui_readme.md` diperluas ke README root dan seluruh submodule. |
