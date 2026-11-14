1. disini tugas AI adalah membuatkan prd dan berdiskusi untuk menjadikan prd ini final.
2. ambil satu yang ingin di buatkan prdnya di file \`refrensi_apk.md\`,
3. file mana saja yang terdampak.
4. jika salah satu file yang terdampak ternyata sama dengan file terdampak yang ada di prd lainnya skip, cari yang jika di buatkan prd nya file terdampak nya tidak sama.
5. lalu berikan beberapa potongan contoh kode singkat mengenai jika akan diimplementasikan.
6. cek dulu apakah sudah diimplementasikan takutnya sudah diimplementasikan gitu; catat hasilnya sesuai aturan 19-20.
7. baca dulu link apk yang ada untuk fitur tersebut untuk melihat gambarannya.
8. lalu buatkan atau perbarui isi file prd nya di folder \`prd\` di root.
9. harus sertakan path dan baris ke file \`referensi_apk.md\` nya di file prd ini.
10. hanya boleh mengedit file prd terkait saja.
11. file yang harus dibaca dan patuhi isinya :bers
- AGENTS.md
- format_PRD

12. Sebelum membuat atau memperbarui PRD, AI wajib memindai daftar `available_skills` dan memuat setiap skill yang trigger-nya relevan dengan fitur atau file terdampak (mis. `migrasi-skema-sqlite`, `notifier-crud-database`, `riverpod-pola`, `model-state-freezed-abstract`, `validasi-tapering`, `flutter-local-notifications`) melalui tool `skill`, lalu patuhi aturan dan pola yang ada di skill tersebut saat menyusun PRD.

13. lalu tandai isi bagian refrensi_apk sebagai sudah dibuatkan prd nya.
14. jangan ubah code dart satu pun.
15. selalu berikan saya pertanyaan dengan menggunakan tool question yang dimiliki kilo sampai prd nya final.
16. suruh AI agar langsung membuat prd nya saja,
17. sambil diskusi sambil perbaiki prd nya.
18. pindahkan seluruh isi file yang berkaitan dengan fitur yang akan dibuatkan prd nya ke file prd nya.
19. semua penulisan prd wajib sesuai dengan aturan yang ada di `format_PRD`
20. status implementasi prd: karena sesi ini hanya membuat atau memperbarui prd dan tidak mengubah kode dart (aturan 14), header `Status Implementasi` wajib `Belum Diimplementasikan`; jangan menaikkan ke `Sedang Diimplementasikan` atau `Sudah Diimplementasikan`.
21. temuan pemeriksaan (aturan 6) bahwa sebagian fondasi fitur sudah ada di kode wajib dicatat pada `Status pengembangan` (bagian 1) dan/atau bagian `Pemeriksaan Implementasi`, bukan pada header `Status Implementasi`; status `Sedang/Sudah Diimplementasikan` hanya disetel bila implementasi fitur benar-benar dikerjakan dan diverifikasi.
