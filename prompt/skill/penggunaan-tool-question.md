diperbarui : Wed Nov 18 2026 01:23 WIB
file : [penggunaan-tool-question](../../.agents/skills/non-code/penggunaan-tool-question/SKILL.md)

1. Gunakan tool `question` setiap kali perlu bertanya, meminta klarifikasi, atau meminta keputusan/input dari pengguna; jangan menyisipkan pertanyaan sebagai teks biasa.

2. Setiap pertanyaan WAJIB memiliki `header` singkat, maksimal 30 karakter, yang melabeli pertanyaan.

3. Setiap opsi jawaban WAJIB memiliki `label` ringkas (1-5 kata) dan `description` yang menjelaskan pilihan/konsekuensinya.

4. `question` WAJIB berupa pertanyaan lengkap dan tidak ambigu.

5. Jika `multiple` tidak diset atau bernilai `false`, pertanyaan bersifat single-select (satu jawaban); set `multiple: true` hanya bila pengguna memang boleh memilih lebih dari satu opsi.

6. Bila memberi rekomendasi, letakkan opsi rekomendasi di urutan pertama dan akhiri `label` dengan "(Recommended)".

7. Jangan membuat opsi catch-all (mis. "Other", "Lainnya") karena opsi "Type your own answer" tersedia otomatis. Pengecualian: opsi "Skip" wajib di setiap pertanyaan (lihat poin 11).

8. Bila keputusan bergantung pada input pengguna, jangan berikan jawaban/keputusan final sebelum input diterima melalui tool `question`.

9. Langkah penyusunan: tentukan apakah input pengguna benar-benar diperlukan (bukan dapat diputuskan dari skill/rules/konteks) → susun `header` ≤ 30 karakter dan `question` lengkap → daftarkan opsi `label` + `description` (opsi rekomendasi pertama dengan "(Recommended)") → tentukan `multiple` (default single-select) dan `default` bila perlu praseleksi → panggil tool dan tunggu jawaban sebelum melanjutkan.

10. Parameter i18n opsional tersedia: `questionKey`, `headerKey`, `labelKey`, `descriptionKey`.

11. Setiap pemanggilan tool `question` wajib menyertakan satu opsi "Skip" agar pengguna dapat melewati pertanyaan bila tidak ingin menjawabnya (opsi "Skip" bukan catch-all; dikecualikan dari poin 7).
