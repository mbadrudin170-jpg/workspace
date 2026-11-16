diperbarui : Mon Nov 16 2026 12:54 WIB
file : [cari_apk_kompetitor](../../.kilo/commands/cari_apk_kompetitor.md)

1. Tentukan aplikasi sasaran dari dokumen proyek (`README.md`, `AGENTS.md`, PRD, atau dokumen produk); jika tidak tersedia/ambigu, STOP dan tanyakan pengguna (DILARANG menebak dari nama repositori).
2. `$ARGUMENTS` opsional: nama/kategori aplikasi sasaran atau store yang diprioritaskan; kosong → tentukan dari dokumen proyek.
3. Riset hanya aplikasi mobile (Android/iOS); satu run mencakup semua store dengan urutan Google Play → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → Vivo → Amazon → Huawei → Aurora → store lainnya.
4. Setiap store wajib dicatat hasilnya (termasuk nihil temuan) ke `apk_kompetitor.md` sebelum lanjut store berikutnya; DILARANG melewati store tanpa catatan.
5. Listing baru wajib `Status Analisa = Belum Dianalisa`; dilarang menandai `Sudah Dianalisa` (perubahan status hanya oleh `riset_kompetitor`).
6. Kolom tabel wajib: Nama Aplikasi, Ringkasan Singkat (fitur relevan dengan aplikasi sasaran), Store, Link, Status Analisa; format pipe Markdown dengan header + separator.
7. Ringkasan singkat wajib menyebut fitur relevan dengan aplikasi sasaran, bukan deskripsi umum dari store.
8. Verifikasi link secara independen (curl/iTunes/webfetch); HTTP 404 → buang entri; HTTP 403 pada APKPure/Aptoide/SlideME = anti-bot, bukan link mati.
9. Berkas wajib dibaca terlebih dahulu: `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan skill `riset-kompetitor`.
10. Jika `apk_kompetitor.md` belum ada, buat baru dengan kerangka skill `riset-kompetitor` (section per store, tabel header+separator, kolom Status Analisa).
11. Portabilitas: DILARANG menulis nama aplikasi, domain, kategori fitur, atau istilah khas satu proyek ke dalam command; konteks proyek selalu dibaca dari dokumen proyek.
12. Selesai bila seluruh store diriset dan hasilnya dicatat; STOP bila aplikasi sasaran tidak dapat ditentukan.

13. Urutan prioritas pencarian store: Tinggi (Google Play, Apple App Store, Mi/GetApps, Samsung Galaxy Store, Huawei AppGallery, Oppo App Market), Sedang (Amazon Appstore, F-Droid), Rendah (APKPure).

14. Tambahkan section "Riwayat Pencarian Store" yang mencatat berapa kali tiap store sudah diriset (mis. "Google Play: 2"); perbarui setiap run.

15. Gunakan hingga 3 subagent background task; setiap subagent hanya mencari satu APK/kandidat. Setelah subagent selesai, perbarui `apk_kompetitor.md` terlebih dahulu, baru lanjut mencari APK berikutnya.

16. Pada batch berikutnya, prioritaskan store dengan riwayat pencarian terendah, meskipun store prioritas tinggi belum selesai.
