---
description: Mencari aplikasi mobile sejenis dari seluruh store relevan secara terverifikasi lalu menambahkannya ke `apk_kompetitor.md` dengan status Belum Dianalisa.
---

# Cari APK Kompetitor (Portabel Lintas Proyek)

## Parameter

- `$ARGUMENTS` (opsional): nama/kategori aplikasi sasaran atau store yang ingin diprioritaskan.
- Jika `$ARGUMENTS` kosong: tentukan aplikasi sasaran dari dokumen proyek.
- Jika dokumen proyek tidak memuat aplikasi sasaran: **STOP** dan tanyakan kepada pengguna dengan tool `question`; DILARANG menebak dari nama repositori.

Command ini bersifat global dan portabel lintas proyek. Jangan mengasumsikan nama aplikasi, domain, kategori fitur, atau model bisnis proyek tertentu; tentukan aplikasi sasaran dari dokumen proyek.

1. Cari aplikasi serupa di GitHub, F-Droid, Google Play Store, Apple App Store, Samsung Galaxy Store, Mi/GetApps, Oppo App Market, dan store lain yang relevan.
2. Hanya cari aplikasi mobile (Android/iOS); jangan sertakan aplikasi web, desktop, atau layanan non-mobile.
3. Cari sebanyak mungkin kandidat yang dapat ditemukan.
4. Setelah itu tambahkan hasilnya ke file `apk_kompetitor.md` di root proyek.
5. Sertakan kolom: nama aplikasi, ringkasan singkat (fitur relevan dengan aplikasi sasaran), nama store, link ke APK/aplikasi, dan `Status Analisa`.
6. Setiap APK/listing baru yang ditambahkan **wajib** diberi `Status Analisa = Belum Dianalisa` (dilarang menandai `Sudah Dianalisa`; analisa dan perubahan status ke `Sudah Dianalisa` hanya dilakukan oleh perintah `riset_kompetitor.md`).
7. Ikuti format tabel dan aturan pada skill `riset-kompetitor` serta struktur yang sudah ada di `apk_kompetitor.md`.
8. File yang wajib dibaca terlebih dahulu:

- `README.md`
- `AGENTS.md`
- `apk_kompetitor.md`
- `.agents/skills/custom/riset-kompetitor/SKILL.md`

9. **Satu run mencakup semua store** — setiap kali perintah ini dijalankan, riset dikerjakan store demi store dalam satu run, bukan dibatasi satu store:
   - Mulai dari store pertama (**Google Play Store** sebagai prioritas).
   - Urutan store: **Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya** (instruksi eksplisit pengguna, 2026-11-13; perubahan 2026-11-14: satu run mencakup semua store).
   - Setelah seluruh kandidat dari suatu store terverifikasi independen (curl / iTunes lookup / webfetch) dan ditambahkan ke `apk_kompetitor.md`, perbarui `apk_kompetitor.md` terlebih dahulu sebelum lanjut ke store berikutnya.
   - DILARANG melewati store tanpa mencatat hasilnya (termasuk nihil temuan) ke `apk_kompetitor.md` atau laporan; DILARANG berhenti setelah satu store bila masih ada store dalam urutan yang belum diriset.
   - Catatan: skill `riset-kompetitor` aturan #10 dan aturan #5 (urutan default) ikut disesuaikan 2026-11-14 (satu run mencakup semua store; versi 1.6.1) agar konsisten dengan command ini.
10. Acuan "aplikasi serupa" = **aplikasi sasaran yang didefinisikan pada dokumen proyek** (`README.md`, `AGENTS.md`, PRD, atau dokumen produk lain):
    - Tentukan platform, domain, dan fitur inti aplikasi sasaran dari dokumen proyek sebelum riset dimulai.
    - Ringkasan singkat setiap listing **wajib** menyebut fitur relevan dengan aplikasi sasaran (fitur inti, alur pengguna, UI/UX, atau kategori lain yang ditetapkan dari dokumen proyek), bukan deskripsi umum dari store.
    - Bila dokumen proyek tidak tersedia atau saling bertentangan, **DILARANG menebak** dari nama repositori; tanyakan kepada pengguna.
11. `apk_kompetitor.md` dibuat **baru** bila belum ada, dengan kerangka skill `riset-kompetitor` (section per store; section `# Tambahan Riset (YYYY-MM-DD)` untuk batch besar; tabel pipe Markdown dengan header+separator; kolom `Status Analisa` per baris). Semua listing baru wajib `Status Analisa = Belum Dianalisa`.
12. Riset store dilakukan berurutan dalam satu run; bila ingin mempercepat pencarian kandidat di dalam satu store boleh memakai subagen paralel, tetapi **verifikasi tetap independen** per skill `riset-kompetitor` dan perbarui `apk_kompetitor.md` sebelum lanjut store berikutnya.
13. **Aturan portabilitas:** DILARANG menulis nama aplikasi, domain, kategori fitur, atau istilah khas satu proyek ke dalam command ini; konteks proyek selalu dibaca dari dokumen proyek.

## Kriteria Selesai / STOP

- **Selesai** bila seluruh store dalam urutan sudah diriset, setiap hasil (termasuk nihil temuan) dicatat, dan listing baru masuk `apk_kompetitor.md` dengan `Status Analisa = Belum Dianalisa`.
- **STOP** bila aplikasi sasaran tidak dapat ditentukan; laporkan dan tunggu klarifikasi pengguna.
