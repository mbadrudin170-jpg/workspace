description: Commit berkas yang diubah pada sesi ini per repositori dengan pesan Conventional Commits.

# Commit File Sesi Ini

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Pastikan tugas AI sudah selesai; jika belum selesai, STOP dan jangan commit.
4. Identifikasi repositori (root + submodule) dan berkas yang diubah pada sesi ini via `git status` tiap repo.
5. Commit per repositori: hanya berkas yang diubah pada sesi ini, dengan pesan Conventional Commits.
6. Melewatkan repo yang memiliki perubahan (termasuk submodule) tidak diperbolehkan.
7. Verifikasi hasil commit per repo (`git status`, `git log -1`); laporkan hash, pesan, dan daftar berkas.
8. Tidak mencakup berkas yang tidak diubah, hasil generate, atau berkas di luar sesi.
9. `$ARGUMENTS` opsional: daftar path berkas/repo; kosong → gunakan daftar dari `git status`; jika ambigu/tidak valid, STOP dan tanyakan pengguna.
10. Skill terkait wajib disertakan bila trigger-nya terpenuhi (referensi: `.agents/rules/kelompok_skill_wajib.md`, minimal `memori-check`); bila selain `memori-check` tidak ada skill yang trigger-nya terpenuhi, nyatakan eksplisit.
11. Larangan: commit jika tugas belum selesai; menyertakan berkas di luar sesi; melewatkan repo; mengarang hasil verifikasi.

# Skill Terkait

- memori-check
