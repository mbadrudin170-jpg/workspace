diperbarui : Sat Nov 21 2026 17:00 WIB
file : [aturan-penggunaan-rg](../../.agents/skills/aturan-penggunaan-rg/SKILL.md)

# Aturan Penggunaan rg (ripgrep)

1. Gunakan `rg` via tool `Bash` untuk pencarian konten (regex) di codebase; tool `Grep` bawaan Kilo hanya sebagai fallback bila `rg` tidak tersedia.
2. Format umum: `rg -n '<pola>' <path>` (flag `-n` untuk nomor baris, `-i` untuk case-insensitive, `-t <tipe>` untuk filter ekstensi).
3. Selalu sertakan `workdir` yang tepat pada pemanggilan `Bash` (biasanya root proyek atau subfolder paket).
4. Untuk pencarian kompleks (multi-pattern, logical OR/AND), gunakan `rg -e 'pola1' -e 'pola2'` atau `rg 'pola1|pola2'`.
5. Hasil `rg` bersifat streaming; cocok untuk codebase besar. Hindari piping ke `head`/`less` dalam tool — biarkan output penuh.
6. Jika `rg` mengembalikan terlalu banyak hasil, perbaiki pola regex atau batasi scope dengan `-g '*.dart'` / `--glob`.
7. `rg` menghormati `.gitignore` secara default; gunakan `--no-ignore` bila perlu mencari di folder terabaikan.
8. Verifikasi ketersediaan `rg` via `command -v rg` sebelum menggunakannya di skrip/command yang dijalankan berulang.