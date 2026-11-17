description: Evaluasi commit terakhir per repo untuk menentukan skill/aturan yang perlu ditambah/diperbarui.

# Evaluasi Skill Dari Commit

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Sumber kebenaran hanya commit (`git log`, `git show`, `git diff`), bukan working tree/staging/untracked.
4. Cakupan: repositori root + tiap submodule dari `.gitmodules`.
5. Tentukan rentang: commit terakhir yang tercatat di `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` (per repo); fallback 5 commit terakhir per repo; STOP + `question` bila ambigu.
6. Muat skill `aturan-pembuatan-skill` sebelum menentukan skill; muat `aturan-pembuatan-rules` bila menentukan aturan.
7. Evaluasi perubahan kode Dart untuk menentukan skill/aturan yang perlu ditambah/diperbarui; jangan ubah skill.
8. Setiap pola/temuan pada hasil wajib mencantumkan hash commit sumber (dan subjek singkat); jangan mengarang hash.
9. Perbarui penanda commit terakhir yang dievaluasi per repo; jangan menumpuk daftar commit.
10. Tulis output ke `docs/hasil_analisa/hasil_evaluasi_skill_dari_commit.md` (tabel per repo), urut prioritas tertinggi.
11. Bila berkas hasil sudah memuat entri untuk kode/pola yang sama, perbarui entri tersebut; jangan menambah entri baru.
12. STOP bila rentang commit atau target repositori tidak jelas; tanyakan via tool `question`.
13. Wajib menyertakan potongan kode yang dievaluasi pada hasil, agar pengguna dapat meninjau.

# Skill Terkait

- aturan-pembuatan-skill
- aturan-pembuatan-rules
- memori-check
