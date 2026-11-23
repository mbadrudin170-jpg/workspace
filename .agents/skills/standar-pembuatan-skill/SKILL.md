---
name: standar-pembuatan-skill
description: Standar dan panduan penyusunan skill (SKILL.md) yang ringkas, terstruktur, dan jelas pemicunya. Gunakan saat membuat, merancang, merapikan, atau meninjau aturan pembuatan skill maupun draf SKILL.md.
---

# Standar Pembuatan Skill

Panduan ini menetapkan struktur, gaya penulisan, dan pengecekan kualitas untuk menyusun `SKILL.md` agar efektif dipakai dan mudah dipicu pada konteks yang tepat.

## Kapan Digunakan

- Membuat skill baru dari alur kerja atau aturan yang berulang dan stabil.
- Merapikan atau meninjau draf `SKILL.md` sebelum disimpan.
- Menentukan isi frontmatter (`name` dan `description`) serta bagian tubuh instruksi.

## Langkah Kerja

1. Pastikan alur kerja memang layak dijadikan skill (berulang, stabil, dan membutuhkan konteks atau prosedur yang tidak otomatis ditangani model), bukan tugas sekali pakai yang cukup dijawab langsung.
2. Tulis `name` menggunakan huruf kecil, angka, dan tanda hubung saja (1 sampai 5 kata, maksimal 64 karakter, tanpa tanda hubung di awal atau akhir).
3. Susun `description` secara padat (di bawah 1024 karakter) yang menjelaskan fungsi utama skill dan kondisi atau kata kunci pemicunya secara spesifik agar tidak salah atau terlewat memicu.
4. Atur body `SKILL.md` (di bawah 500 baris) dengan judul utama, ringkasan singkat, skenario penggunaan, langkah kerja atau aturan utama beserta alasannya, serta contoh atau jebakan umum bila diperlukan.
5. Periksa hasil akhir sebelum disimpan: pastikan YAML frontmatter valid, tidak ada tanda hubung em/en (`—` atau `–`), dan setiap daftar memiliki baris kosong di atasnya.

## Aturan Utama

- Utamakan keringkasan dan kejelasan alasan di balik aturan agar instruksi tidak memboroskan konteks atau terkesan kaku tanpa sebab.
- Letakkan detail teknis, API, dan contoh panjang di body `SKILL.md`, bukan menumpuk semuanya di dalam `description`.
- Gunakan istilah yang konsisten di seluruh dokumen dan hindari informasi yang mudah kedaluwarsa.

## Jebakan Umum

- Menulis `description` yang terlalu samar (sehingga jarang terpanggil) atau terlalu luas (sehingga terpanggil di topik yang tidak relevan).
- Memasukkan kutipan atau karakter khusus yang tidak aman di YAML frontmatter tanpa penulisan yang bersih.
- Menjadikan tugas sekali pakai atau alur yang sering berubah-ubah sebagai skill permanen.
