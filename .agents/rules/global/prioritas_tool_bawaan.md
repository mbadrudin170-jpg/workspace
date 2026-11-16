# Prioritas Tool Bawaan

Menetapkan kewajiban menggunakan tool bawaan Kilo sebelum perintah shell untuk operasi yang sama. Tool bawaan tidak melewati `permission.bash`, lebih terintegrasi dengan sesi, dan menghindari perintah yang berstatus `deny`.

## Tujuan

1. Menjadikan tool bawaan sebagai jalur utama untuk membaca, mencari, mendaftar, dan mengubah berkas.
2. Mengurangi pemakaian shell untuk operasi yang sudah tercakup tool.
3. Mencegah pelanggaran `deny` pada `.kilo/kilo.jsonc` dan mencegah pengakalan lewat interpreter atau alias.

## Cakupan

- Seluruh sesi dan agent Kilo di proyek ini.
- Operasi: pencarian nama/pola berkas, pencarian teks, daftar folder, baca/tulis/ubah berkas, pengambilan URL, pencarian web, subagent, skill, LSP, todo, dan pertanyaan ke pengguna.
- Berkas sumber kebenaran: `.kilo/kilo.jsonc` bagian `permission` (baca ulang setiap sesi), `AGENTS.md`, serta skill `konfigurasi-kilo-proyek` dan `aturan-pembuatan-commands`.

## Aturan

1. Gunakan tool bawaan lebih dahulu. Shell hanya dipakai bila tidak ada tool bawaan yang setara, atau tool bawaan gagal/tidak mencukupi dan alasannya dilaporkan.
2. Gunakan pemetaan berikut:
   - Nama atau pola path berkas: tool `glob`, bukan `find`, `ls`, atau `rg`.
   - Isi teks di dalam berkas: tool `grep`, bukan perintah shell `rg`/`grep`.
   - Isi satu folder: tool `list`, bukan `ls`.
   - Membaca isi berkas: tool `read` (mendukung `offset` dan `limit`), bukan `cat`, `head`, `tail`, atau `sed`.
   - Mengubah berkas: tool `edit` atau `write`, bukan `sed`, `perl`, `python3`, atau redirection shell.
   - Mengambil URL: tool `webfetch`, bukan `curl` atau `wget`.
   - Pencarian web: tool `websearch`.
   - Subagent: tool `task`; skill: tool `skill`; kode intelligence: tool `lsp`; todo: `todowrite`/`todoread`; pertanyaan: tool `question`.
3. Perintah shell yang lazim tetap dipakai bila tidak punya padanan tool, misalnya operasi git baca-saja, `flutter`/`dart` (build, test, analyze, format), package manager, `which`, `pwd`, `wc`, `sort`, `date`, `mkdir`, `cp`, dan `timeout`.
4. Sebelum menjalankan `bash`, baca `permission.bash` pada `.kilo/kilo.jsonc`. Izin `deny` bersifat mutlak dan tidak boleh dilewati, diakali, atau didelegasikan ke perintah/interpreter lain.
5. Bila tool bawaan tidak memberikan informasi yang dibutuhkan (mis. ukuran, izin, atau metadata filesystem), jelaskan keterbatasannya. Gunakan shell hanya jika perintahnya tidak berstatus `deny`; bila berstatus `deny`, laporkan dan minta arahan pengguna.
6. Skill dan command wajib menginstruksikan tool bawaan lebih dahulu. DILARANG menulis instruksi yang menyuruh `rg`, `grep`, `find`, `ls`, `cat`, `head`, atau `tail` untuk operasi yang dapat dilakukan tool bawaan.
7. Jika menemukan instruksi lama yang bertentangan dengan aturan ini, perbarui instruksi tersebut atau laporkan kepada pengguna; jangan mengikutinya.
8. Bila ragu antara tool bawaan dan shell, pilih tool bawaan.

## Larangan

- DILARANG memakai shell untuk membaca, mencari, atau mendaftar berkas bila tool `read`, `grep`, `glob`, atau `list` tersedia.
- DILARANG mengakali `deny` dengan `python3`, `perl`, `sed`, `awk`, alias, `xargs`, atau perintah lain.
- DILARANG menulis instruksi skill/command yang menjadikan shell sebagai jalur utama untuk operasi yang punya padanan tool.
- DILARANG mengulang perintah yang ditolak; beralih ke tool bawaan atau laporkan kepada pengguna.
- DILARANG menganggap `bash` sebagai pilihan pertama untuk tugas yang bisa diselesaikan tool bawaan.

## Sumber Evaluasi

- Perintah pengguna sesi 106 (2026-11-15): "perbarui sekill dan aturan agar harus pakai tools yang ada dulu dan hapus skill mengenai rg".
- File: `.kilo/kilo.jsonc` (bagian `permission.bash` dan `permission.read`), `AGENTS.md`.
- Skill terkait: `.agents/skills/custom/konfigurasi-kilo-proyek/SKILL.md`, `.agents/skills/custom/aturan-pembuatan-commands/SKILL.md`, `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md`.
- Skill yang dihapus pada sesi 106: `.agents/skills/custom/pencarian-teks-ripgrep/SKILL.md`.
