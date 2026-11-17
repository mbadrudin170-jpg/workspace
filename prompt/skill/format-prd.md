diperbarui : Tue Nov 17 2026 23:39 WIB
file : [format-prd](../../.agents/skills/non-code/format-prd/SKILL.md)

1. PRD diawali header `**Status Dokumen:** Draft / Final` dan `**Status Implementasi:** Belum Diimplementasikan / Sedang Diimplementasikan / Sudah Diimplementasikan`, diikuti pemisah `---`.
2. PRD memuat tepat enam bagian berurutan dengan judul persis: `## 1. Informasi Produk`, `## 2. Tujuan PRD`, `## 3. Daftar Fitur`, `## 4. Alur Pengguna`, `## 5. Steps`, `## 6. File-File Terdampak`.
3. Tiap bagian (setelah header) memuat `Konteks penggunaan:`, `Aturan pengisian:`, dan isi (`**Informasi:**`, `**Isi:**`, atau tabel).
4. Bedakan status dokumen dengan status implementasi; jangan mengarang informasi yang belum diketahui — tulis secara eksplisit (mis. `Belum diketahui`).
5. Bagian 1 Informasi Produk: isi `Nama aplikasi`, `Deskripsi produk`, `Platform`, `Versi`, `Status pengembangan` berdasarkan kondisi proyek yang sebenarnya; gunakan nama yang konsisten dengan proyek; cantumkan platform dan versi target.
6. Bagian 2 Tujuan PRD: tuliskan hasil yang diharapkan dari PRD; setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; gunakan tujuan yang jelas dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.
7. Bagian 3 Daftar Fitur: satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah (`| Fitur | Deskripsi | Prioritas |`); jangan menggabungkan beberapa fitur dalam satu baris; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`; setiap fitur wajib mendukung tujuan produk dan masuk dalam ruang lingkup.
8. Bagian 4 Alur Pengguna: mulai dari kondisi awal pengguna; jelaskan langkah secara berurutan; sebutkan tindakan pengguna dan respons aplikasi; sertakan percabangan atau kondisi alternatif bila ada; jelaskan kondisi akhir yang diharapkan; pastikan alur sesuai persyaratan fitur; jangan memasukkan proses yang tidak didukung kebutuhan produk.
9. Bagian 5 Steps: buat langkah yang spesifik dan dapat diikuti; gunakan numbered list; setiap langkah harus tidak ambigu dan dapat dikerjakan; jangan memasukkan langkah yang tidak relevan atau redundan.
10. Bagian 6 File-File Terdampak: periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi file spesifik sesuai struktur proyek sebenarnya; tandai `Dibuat` / `Diubah` / `Dihapus`; jelaskan alasan dan tujuan perubahan; cantumkan hanya file yang terkait kebutuhan fitur; jika file belum dapat ditentukan, tandai sebagai belum diketahui — jangan menebak; perbarui daftar setelah analisis teknis atau implementasi bila ditemukan file terdampak tambahan.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/skills
- https://kilo.ai/docs/customize/skills?utm_source=chatgpt.com
