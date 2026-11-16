diperbarui : Mon Nov 16 2026 12:56 WIB
file : [commit_file_sesi_ini](../../.kilo/commands/commit_file_sesi_ini.md)

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Pastikan tugas AI sudah selesai; jika belum selesai, STOP dan jangan commit.
3. Identifikasi repositori (root + submodule) dan berkas yang diubah pada sesi ini via `git status` tiap repo.
4. Commit per repositori: hanya berkas yang diubah pada sesi ini, dengan pesan Conventional Commits.
5. Melewatkan repo yang memiliki perubahan (termasuk submodule) tidak diperbolehkan.
6. Verifikasi hasil commit per repo (`git status`, `git log -1`); laporkan hash, pesan, dan daftar berkas.
7. Tidak mencakup berkas yang tidak diubah, hasil generate, atau berkas di luar sesi.
8. `$ARGUMENTS` opsional: daftar path berkas/repo; kosong → gunakan daftar dari `git status`; jika ambigu/tidak valid, STOP dan tanyakan pengguna.
9. Tidak ada skill terkait yang trigger-nya terpenuhi; nyatakan eksplisit.
10. Larangan: commit jika tugas belum selesai; menyertakan berkas di luar sesi; melewatkan repo; mengarang hasil verifikasi.
