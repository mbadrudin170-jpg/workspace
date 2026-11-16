diperbarui : Mon Nov 16 2026 10:51 WIB
ditimpa ke : `.agents/rules/global/kelompok_skill_wajib.md`

# Ringkasan

- Jika kode pada proyek menggunakan kriteria di bawah ini, semua perubahan kode wajib mengikuti skill yang telah ditentukan.

1. Setiap provider wajib menggunakan Riverpod annotation; jalankan build runner hanya pada berkas yang berubah jika diperlukan.
2. Setiap model yang digunakan untuk menyimpan data ke database wajib menggunakan Freezed.
3. Setiap state yang dapat diubah dan memiliki method/getter wajib menggunakan Freezed.
4. Jarak antar anak di dalam parent Column, Row, dan Wrap wajib menggunakan spacing, kecuali untuk jarak khusus tertentu.
5. Setiap pemanggilan provider untuk mengambil data wajib menangani status loading, error, dan data secara eksplisit.
6. Semua proyek wajib memuat skill kelompok sesuai teknologi yang digunakan: Riverpod, SQLite, Freezed, model database, provider CRUD, null/nullable, testing/mocktail, UI tema, dan feedback `AppToast`.
7. Sumber kebenaran daftar dan trigger skill: `SKILLS_INDEX.md`.
8. Jika skill tidak tersedia, laporkan; jangan mengarang.
9. 

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.
