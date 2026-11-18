diperbarui : Thu Nov 19 2026 03:20 WIB
ditimpa ke : `.agents/skills/non-code/disiplin-scope-kerja/SKILL.md`

1. Kerjakan hanya berkas/cakupan yang relevan dengan tugas; perubahan tambahan di luar cakupan (opsional cleanup, format, rename) WAJIB dikonfirmasi ke pengguna sebelum dikerjakan.
2. Format hanya pada berkas yang memang bagian dari tugas (mis. `dart format <berkas>`); jangan jalankan format/linter seluruh proyek kecuali diminta eksplisit.
3. Sebelum melapor selesai, review `git diff --stat`; seluruh berkas yang berubah WAJIB tercantum di laporan/tabel berkas terdampak; berkas yang berubah di luar sesi (proses lain) dilaporkan sebagai temuan — jangan diklaim milik sesi ini dan jangan diperbaiki tanpa persetujuan.
4. Masalah di luar cakupan yang ditemukan saat bekerja (bug, impor rusak, drift dokumen) dicatat/dilaporkan sebagai usulan; jangan sekaligus diperbaiki tanpa persetujuan.
5. Perubahan kosmetik (whitespace, trailing spaces, blank line) pada berkas yang tidak terdampak tugas DILARANG.
6. Migrasi massal lintas berkas (mis. skrip codemod yang memodifikasi puluhan berkas sekaligus) WAJIB memakai persetujuan eksplisit pengguna atas cakupannya; skrip ditulis ke direktori sementara (mis. `/tmp`) dan tidak boleh menyentuh berkas di luar pola yang disetujui; setelah dieksekusi WAJIB `git diff --stat` + `dart format <berkas>` pada berkas tugas (bukan `dart format lib`) + `dart analyze`; seluruh berkas tersentuh wajib tercantum di tabel Berkas Terdampak; pola yang gagal dikonversi wajib diselesaikan manual atau dilaporkan.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Skill terkait: `penggunaan-tool-bawaan-kilo` (baca ulang sebelum sunting), `memori-check` (tabel Berkas Terdampak).
