diperbarui : Sat Nov 21 2026 15:59 WIB
file : [cek-kesehatan-sistem-kerja](../../.agents/skills/non-code/cek-kesehatan-sistem-kerja/SKILL.md)

1. Prosedur audit read-only untuk memeriksa konsistensi aset pendukung agen AI lintas proyek.

2. Klasifikasikan temuan ke tingkat `GALAT` dan `PERINGATAN`; laporkan hasil hanya di sesi tanpa mengubah berkas.

3. Aset yang diperiksa: struktur folder/berkas wajib, indeks skill `.agents/rules/kelompok_skill_wajib_*.md`, metadata frontmatter `SKILL.md`, berkas command `.kilo/commands/**.md`, berkas sesi `memori/sesi/sesi_N.md`, kondisi repositori (submodule, pointer, `.gitignore` vs working tree), dan penomoran/pencatatan `hasil_diskusi/diskusi_N.md`.
