diperbarui : Sat Nov 21 2026 15:59 WIB
file : [larangan-backup-task](../../.agents/skills/non-code/larangan-backup-task/SKILL.md)

1. Berkas cadangan (`.bak`, `.backup`, `.sebelum_*`) hanya di working tree, jangan di-commit.

2. Jangan `git add` berkas cadangan saat commit `task.md` atau file lain.

3. Simpan versi lama di luar repo atau pakai `git stash`/`git reflog`, bukan file `.bak` di-commit.

4. Commit hanya berisi perubahan yang benar-benar diperlukan; bersihkan arsip cadangan di working tree setelah commit.
