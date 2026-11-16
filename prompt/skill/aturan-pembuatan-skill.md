1. Setiap skill wajib memiliki frontmatter, dan cukup hanya nama serta description saja; untuk nama, wajib sama seperti nama folder-nya.
2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.
3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik.
4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali jika memakai bahasa Indonesia menjadi aneh.
5. Untuk description, wajib bisa membuat skill ini dibutuhkan ketika sedang apa; jangan sampai skill sia-sia karena tidak terpakai sama sekali.
6. Name matching — field `name` harus sama persis dengan nama folder (Name Matching Rule).
7. Trigger-only description — `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat.
