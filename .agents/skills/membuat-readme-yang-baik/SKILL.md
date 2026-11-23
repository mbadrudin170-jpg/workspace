---
name: membuat-readme-yang-baik
description: Gunakan ini saat membuat atau memperbaiki file README proyek | Panduan struktur README (judul, deskripsi, TOC, instalasi, penggunaan, kredit, lisensi, badge, kontribusi, test), prinsip what/why/how, visual (GIF/screenshot), daftar kontributor, perbedaan tipe proyek, dan referensi eksternal freeCodeCamp & DEV Community. Membuat README yang Baik Panduan menyusun file `README.md` yang informatif, terstruktur, dan memudahkan pengguna/kontributor memahami proyek. Mengacu pada praktik terbaik dari freeCodeCamp (what/why/how) dan DEV Community (visual, kontributor, perbedaan tipe proyek), serta konvensi GitHub umum. Cakupan yang Di-Cover - Bagian wajib: Judul, Deskripsi, Instalasi & Menjalankan, Penggunaan, Kredit, Lisensi - Bagian tambahan: Table of Contents, Badges, Kontribusi, Test, Daftar Kontributor, Demo Visual (GIF/screenshot) - Prinsip penulisan: menjawab what, why, how; bahasa Inggris (global), up-to-date - Perbedaan tipe proyek: aplikasi vs library vs package vs non-code - Tools pendukung: VS Code + Markdown
---

# Membuat README yang Baik

Panduan menyusun file `README.md` yang informatif, terstruktur, dan memudahkan pengguna/kontributor memahami proyek. Mengacu pada praktik terbaik dari freeCodeCamp (what/why/how) dan DEV Community (visual, kontributor, perbedaan tipe proyek), serta konvensi GitHub umum.

## Cakupan yang Di-Cover

- Bagian wajib: Judul, Deskripsi, Instalasi & Menjalankan, Penggunaan, Kredit, Lisensi
- Bagian tambahan: Table of Contents, Badges, Kontribusi, Test, Daftar Kontributor, Demo Visual (GIF/screenshot)
- Prinsip penulisan: menjawab what, why, how; bahasa Inggris (global), up-to-date
- Perbedaan tipe proyek: aplikasi vs library vs package vs non-code
- Tools pendukung: VS Code + Markdown All in One, readme.so, shields.io, contrib.rocks, bitdowntoc
- Referensi eksternal: freeCodeCamp & DEV Community (Marc Seitz)

## Aturan

1. **Judul proyek** (H1) wajib ada dan deskriptif - menggambarkan tujuan utama proyek dalam satu baris.
2. **Deskripsi** wajib menjawab: apa yang dilakukan aplikasi, mengapa teknologi tersebut dipilih, tantangan & rencana fitur.
3. **Table of Contents** ditambahkan jika README panjang (> 5 section) agar navigasi mudah; gunakan bitdowntoc atau manual.
4. **Instalasi & Menjalankan** wajib berisi langkah-langkah _step-by-step_ (dependencies, environment, perintah build/run, contoh: `git clone` → `npm install` → `cp .env.example .env` → `db push` → `run dev`).
5. **Penggunaan** wajib berisi instruksi & contoh (screenshot opsional), termasuk kredensial jika butuh auth.
6. **Demo Visual** (GIF/screenshot) **sangat direkomendasikan** - "show, don't just tell"; gunakan GIF untuk fitur interaktif.
7. **Kredit** mencantumkan kolaborator (link GitHub/sosmed) serta referensi/tutorial yang dipakai.
8. **Lisensi** wajib ada (pilih via choosealicense.com) - menentukan hak modifikasi/komersial.
9. **Badges** (opsional) dari shields.io untuk status build, versi, lisensi, stars, followers, dsb - otomatis update; taruh di atas/bawah README.
10. **Daftar Kontributor** (opsional) via contrib.rocks untuk apresiasi komunitas open source.
11. **Kontribusi** (opsional, untuk open source) menyertakan panduan CONTRIBUTING & kode etik (Contributor Covenant).
12. **Test** (opsional) menyertakan contoh kode test & cara menjalankannya.
13. **Tipe proyek** disesuaikan: aplikasi (install/run/demo), library (API docs, import contoh), package (pub.dev/npm badge), non-code (dokumentasi saja).
14. **Bahasa** gunakan **Inggris** agar global; terjemahkan jika audiens lokal non-Inggris.
15. **Pemeliharaan** README **wajib diperbarui** setiap kali ada perubahan signifikan pada proyek.
16. **Editor** gunakan VS Code + ekstensi "Markdown All in One" untuk preview real-time; atau readme.so untuk generator cepat.

## Steps

1. Tulis judul proyek (H1) yang jelas dan singkat.
2. Tulis deskripsi menjawab what/why/how (motivasi, masalah, solusi, pembelajaran, keunikan).
3. Tambahkan Table of Contents jika README > 5 section (gunakan bitdowntoc).
4. Tulis bagian Instalasi & Menjalankan dengan langkah berurutan (dependencies → setup env → run).
5. Tulis bagian Penggunaan dengan contoh perintah/UI/screenshot & kredensial demo jika perlu.
6. **Tambahkan Demo Visual (GIF/screenshot)** menampilkan fitur utama - "show, don't just tell".
7. Cantumkan Kredit (tim, referensi, tutorial).
8. Pilih & cantumkan Lisensi (GPL, MIT, Apache, AGPLv3, dll. via choosealicense.com).
9. Tambahkan Badges (build, version, license, stars, coverage) dari shields.io bila relevan.
10. Tambahkan Daftar Kontributor via contrib.rocks jika open source.
11. Sertakan panduan Kontribusi & kode etik jika proyek open source.
12. Tambahkan bagian Test dengan contoh & cara menjalankan test suite.
13. Sesuaikan struktur sesuai tipe proyek (aplikasi/library/package/non-code).
14. Review: pastikan bahasa Inggris, up-to-date, formatting Markdown konsisten, preview di VS Code.
15. Commit README bersama perubahan proyek terkait.

## Larangan

- DILARANG tidak menyertakan README sama sekali.
- DILARANG deskripsi kosong atau generik (mis. "project ini keren").
- DILARANG langkah instalasi tidak lengkap (mis. missing dependencies, perintah run).
- DILARANG lisensi tidak dicantumkan (hak penggunaan tidak jelas).
- DILARANG README tidak diperbarui setelah perubahan besar (versi, fitur, breaking change).
- DILARANG menggunakan bahasa non-Inggris tanpa alasan audiens lokal; hindari campur aduk bahasa.
- DILARANG badge palsu/tidak relevan (mis. build passing padahal tidak ada CI).
- DILARANG menyalin README template tanpa menyesuaikan konteks proyek sendiri.
- DILARANG hanya teks tanpa visual (GIF/screenshot) untuk proyek aplikasi/UI.
- DILARANG struktur README aplikasi dipakai untuk library/package tanpa adaptasi (API docs, import contoh).

## Contoh Benar

````markdown
# Nama Proyek

Deskripsi singkat: apa, mengapa, dan bagaimana proyek ini bekerja.

## Table of Contents

- [Instalasi](#instalasi)
- [Penggunaan](#penggunaan)
- [Kredit](#kredit)
- [Lisensi](#lisensi)

## Instalasi

```bash
# 1. Clone repo
git clone https://github.com/user/repo.git
cd repo

# 2. Install dependencies
flutter pub get

# 3. Jalankan
flutter run
```
````

## Penggunaan

Contoh penggunaan fitur utama:

```dart
// Kode contoh
void main() {
  runApp(MyApp());
}
```

Screenshot: ![Demo](assets/demo.png)

## Kredit

- [Nama Author](https://github.com/author) - Maintainer
- Referensi: [Tutorial Flutter](https://flutter.dev/docs)

## Lisensi

[MIT License](LICENSE) - lihat file LICENSE untuk detail.

---

![Build](https://img.shields.io/github/actions/workflow/status/user/repo/ci.yml)
![License](https://img.shields.io/github/license/user/repo)

````

## Contoh Salah

```markdown
# Project

Ini project saya. (DILARANG: deskripsi terlalu singkat, tidak menjawab what/why/how)

## Install

`flutter run` (DILARANG: missing dependencies, setup env, step-by-step)

## License

Tidak ada lisensi. (DILARANG: hak penggunaan tidak jelas)
````

```markdown
# My App

Aplikasi keren. (DILARANG: bahasa campur, tidak informatif)

## Cara Pakai

Buka app lalu klik tombol. (DILARANG: tidak ada contoh kode/screenshot)
```
