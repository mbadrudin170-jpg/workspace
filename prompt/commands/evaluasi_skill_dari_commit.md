diperbarui : Mon Nov 16 2026 10:27 WIB
ditimpa ke : `.kilo/commands/evaluasi_skill_dari_commit.md`

1. Ambil daftar commit dan diff kode Dart yang sudah di-commit pada repositori utama dan submodule.
2. Tentukan rentang commit sejak commit terakhir yang tercatat di `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md`; jika tidak ada, gunakan 5 commit terakhir dari masing-masing repositori.
3. Analisa perubahan kode untuk menentukan skill/aturan yang perlu ditambah atau diperbarui.
4. Setelah analisa, perbarui penanda commit terakhir yang dievaluasi pada file laporan; jangan menumpuk daftar commit.
5. Tambahkan atau perbarui hasil analisa pada `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md`, tanpa mengubah skill secara otomatis.
6. STOP bila rentang commit atau target repositori tidak jelas; tanyakan via tool `question`.
7. 