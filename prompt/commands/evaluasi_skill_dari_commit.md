diperbarui : Tue Nov 17 2026 21:38 WIB
ditimpa ke : `.kilo/commands/evaluasi_skill_dari_commit.md`

1. Baca `AGENTS.md`; sumber kebenaran hanya commit (`git log`, `git show`, `git diff`), bukan working tree/staging/untracked.
2. Cakupan: repositori root + tiap submodule dari `.gitmodules`.
3. Tentukan rentang: commit terakhir yang tercatat di `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` (per repo); fallback 5 commit terakhir per repo; STOP + `question` bila ambigu.
4. Evaluasi perubahan kode Dart untuk menentukan skill/aturan yang perlu ditambah/diperbarui; jangan ubah skill.
5. Setiap pola/temuan pada hasil wajib mencantumkan hash commit sumber (dan subjek singkat); jangan mengarang hash.
6. Perbarui penanda commit terakhir yang dievaluasi per repo; jangan menumpuk daftar commit.
7. Tulis output ke `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` (tabel per repo), urut prioritas tertinggi.
8. Bila berkas hasil sudah memuat entri untuk kode/pola yang sama, perbarui entri tersebut; jangan menambah entri baru.
9. STOP bila rentang commit atau target repositori tidak jelas; tanyakan via tool `question`.