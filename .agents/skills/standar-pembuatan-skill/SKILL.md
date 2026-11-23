---
name: standar-pembuatan-skill
description: Standar dan panduan penyusunan skill (SKILL.md) yang ringkas, terstruktur, dan jelas pemicunya. Gunakan saat membuat, merancang, merapikan, atau meninjau aturan pembuatan skill maupun draf SKILL.md.
---

# Standar Pembuatan Skill

Panduan ini menetapkan struktur, gaya penulisan, dan pengecekan kualitas untuk menyusun `SKILL.md` agar efektif dipakai dan mudah dipicu pada konteks yang tepat.

## Kapan Digunakan

- Membuat skill baru dari alur kerja atau aturan yang berulang dan stabil.
- Merapikan atau meninjau draf `SKILL.md` sebelum disimpan.
- Menentukan isi frontmatter (`name` dan `description`), file pendukung, serta bagian tubuh instruksi.

## Langkah Kerja

1.  Pastikan alur kerja memang layak dijadikan skill (berulang, stabil, dan membutuhkan konteks atau prosedur yang tidak otomatis ditangani model), bukan tugas sekali pakai yang cukup dijawab langsung.
2.  Tulis `name` menggunakan huruf kecil, angka, dan tanda hubung saja (1 sampai 5 kata, maksimal 64 karakter, tanpa tanda hubung di awal atau akhir).
3.  Susun `description` secara padat (di bawah 1024 karakter) dengan pola: jelaskan fungsi utama skill, sebutkan kondisi atau kata kunci pemicu yang spesifik, dan sertakan batas atau pengecualian bila perlu agar pemicuan akurat.
4.  Gunakan hanya field wajib (`name` dan `description`) di dalam YAML frontmatter, dan jangan menambahkan metadata tambahan (seperti `metadata`, `version`, `author`, atau `tags`) agar frontmatter tetap ringkas dan tidak membebani konteks.
5.  Atur body `SKILL.md` (di bawah 500 baris) dengan judul utama, ringkasan singkat, skenario penggunaan, langkah kerja atau aturan utama beserta alasannya, serta contoh atau jebakan umum bila diperlukan.
6.  Pisahkan detail panjang, contoh lengkap, skrip, atau referensi teknis ke file pendukung (seperti `references/`, `scripts/`, atau `assets/`) dan tautkan secara ringkas di `SKILL.md` agar konteks utama tetap hemat.
7.  Periksa hasil akhir sebelum disimpan: pastikan YAML frontmatter valid dan hanya berisi `name` serta `description`, tidak ada tanda hubung em/en (`-` atau `-`), dan setiap daftar memiliki baris kosong di atasnya.

## Aturan Utama

- Utamakan keringkasan dan kejelasan alasan di balik aturan agar instruksi tidak memboroskan konteks atau terkesan kaku tanpa sebab.
- Jangan memakai metadata tambahan di frontmatter maupun atribut pelacakan yang tidak dibutuhkan saat eksekusi skill.
- Letakkan detail teknis, API, dan contoh panjang di body `SKILL.md` atau file pendukung, bukan menumpuk semuanya di dalam `description`.
- Buat file pendukung hanya bila ada konten tambahan yang memang berulang dipakai atau terlalu panjang untuk tubuh utama `SKILL.md`, lalu jelaskan kapan file tersebut dibaca.
- Gunakan istilah yang konsisten di seluruh dokumen dan hindari informasi yang mudah kedaluwarsa.

## Jebakan Umum

- Menambahkan field metadata ekstra di frontmatter yang tidak dipakai oleh alur kerja skill.
- Menulis `description` yang terlalu samar (sehingga jarang terpanggil) atau terlalu luas/umum (sehingga terpanggil di topik yang tidak relevan atau gagal membedakan kasus serupa).
- Memasukkan kutipan atau karakter khusus yang tidak aman di YAML frontmatter tanpa penulisan yang bersih.
- Menumpuk contoh panjang atau referensi besar di `SKILL.md` atau `description` alih-alih memecahnya menjadi file pendukung yang terarah.
- Menjadikan tugas sekali pakai atau alur yang sering berubah-ubah sebagai skill permanen.
