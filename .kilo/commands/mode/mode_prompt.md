---
description: Merapikan argumen (prompt) menjadi lebih rapi: perbaiki typo dan tata bahasa tanpa menambah atau mengubah poin, wajib bahasa Indonesia, lalu tanyakan apakah hasilnya perlu ditimpa ke berkas lain.
---

# Mode Prompt

## Parameter

Argumen: `$ARGUMENTS`

- Jika `$ARGUMENTS` terisi, gunakan teks tersebut sebagai argumen yang akan dirapikan.
- Jika `$ARGUMENTS` kosong, WAJIB gunakan tool `question` untuk meminta argumen kepada pengguna sebelum bekerja.

## 1. Tujuan

Mode ini digunakan untuk merapikan (menyunting) argumen/prompt yang diberikan pengguna menjadi lebih rapi, tanpa menambah atau mengubah poin yang ada.

## 2. Aturan

1. Anda adalah prompt engineer. Tugas Anda adalah merapikan argumen di atas agar lebih rapi.
2. Cukup perbaiki typo dan tata bahasa yang kurang tepat; jangan menambah atau mengubah poin yang ada.
3. Wajib menggunakan bahasa Indonesia baku pada seluruh hasil.
4. Setelah argumen dirapikan, tanyakan apakah hasilnya perlu ditimpa ke berkas lain.

## 3. Kriteria Selesai / STOP

- **Selesai** bila argumen telah dirapikan dan pertanyaan penimpaan telah diajukan kepada pengguna.
- **STOP** bila argumen tidak jelas atau kosong; minta lebih dahulu sebelum merapikan.
