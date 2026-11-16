# Kelengkapan instructions Kilo

> Aturan global (sesi 87, 2026-11-15): seluruh berkas aturan proyek wajib dimuat Kilo melalui bagian `instructions` di `.kilo/kilo.jsonc`.

## 1. Tujuan

Menetapkan kewajiban agar setiap berkas yang menjadi sumber aturan dan indeks skill proyek selalu tersedia bagi agen melalui bagian `instructions` pada `.kilo/kilo.jsonc`, dan agar ketidakkonsistenan diperbaiki secara otomatis saat terdeteksi.

## 2. Cakupan

- Berkas wajib terdaftar:
  - seluruh `.agents/rules/**/*.md` (rekursif);
  - `AGENTS.md` di root proyek;
  - `.agents/rules/global/kelompok_skill_wajib.md`.
- Target pengecekan: bagian `instructions` pada `.kilo/kilo.jsonc` proyek yang sedang berjalan.

## 3. Aturan

1. Setiap berkas pada cakupan **WAJIB** terdaftar sebagai entri pada `instructions` di `.kilo/kilo.jsonc`.
2. Saat berkas aturan baru dibuat atau ditambahkan ke `.agents/rules/`, berkas tersebut **WAJIB** langsung didaftarkan ke `instructions` pada sesi yang sama; bila berkas aturan dipindah atau diganti nama, entri lama **WAJIB** diperbarui atau dicabut pada sesi yang sama.
3. Pengecekan dilakukan pada setiap interaksi yang membuat atau mengubah config Kilo, aturan, atau skill; dan pada setiap audit `.kilo/commands/cek_kesehatan_sistem_kerja.md`.
4. Perbaikan bersifat otomatis: bila ditemukan berkas yang wajib namun belum terdaftar, AI **WAJIB** menambahkannya ke `instructions` sebagai entri baru (satu baris per berkas, path relatif root) **tanpa menunggu konfirmasi per kasus**. Penambahan `instructions` semacam itu tidak dikategorikan sebagai perubahan config yang berdampak dan tidak memerlukan persetujuan terpisah.
5. Bila `.kilo/kilo.jsonc` tidak ada, tidak dapat dibaca, atau gagal tervalidasi setelah ditulis, laporkan sebagai `GALAT`; jangan memakai jalur lain (mis. menyalin config, mengubah `AGENTS.md` sebagai pengganti).
6. Penghapusan entri dari `instructions` hanya boleh dilakukan bila berkas targetnya terbukti sudah tidak ada, dan wajib disertai catatan pada `memori/riwayat_perubahan.md`.

## 4. Larangan

- DILARANG meninggalkan berkas di `.agents/rules/` tanpa entri pada `instructions`.
- DILARANG menghapus atau menimpa entri `instructions` yang masih menunjuk berkas yang ada tanpa bukti berkas tersebut sudah tidak ada.
- DILARANG menyalin isi berkas aturan ke dalam config; entri hanya menunjuk path.
- DILARANG commit atau push config tanpa perintah eksplisit pengguna.

## 5. Sumber Evaluasi

- Perintah pengguna (sesi 87, 2026-11-15): "tambahkan juga pengecekan bahwa semua file yang ada di .agents/rules, AGENTS.md, kelompok_skill_wajib.md, wajib ada di instructions".
- Berkas rujukan nyata: `.kilo/kilo.jsonc` (bagian `instructions`), `.agents/rules/global/` (alur_git_commit.md, format_hasil_diskusi.md, kelompok_skill_wajib.md, instructions_lengkap.md, prioritas_tool_bawaan.md), `AGENTS.md`, `.agents/rules/global/kelompok_skill_wajib.md`.
- Preseden: `kelompok_skill_wajib.md` didaftarkan ke `instructions` pada sesi 84 tanpa didaftarkan ke `AGENTS.md`.
- Skill terkait: `.agents/skills/custom/konfigurasi-kilo-proyek/SKILL.md`, `.agents/skills/custom/cek-kesehatan-sistem-kerja/SKILL.md`.
