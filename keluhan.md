- Gejala: AI tidak membaca MEMORI.md di awal sesi (percakapan ini).
- Terkait: memori-check
- Tindak lanjut: Perkuat checklist awal sesi pada AGENTS.md (akar masalah: lupa memuat skill memori-check sebelum interaksi).

- Gejala: AI tidak membaca berkas yang ada di .agents/rules/global/ sebelum bekerja.
- Terkait: AGENTS.md
- Tindak lanjut: Perkuat checklist baca rules global di AGENTS.md (akar masalah: lupa memuat/baca rules global sebelum bekerja).

- Gejala: AI tidak membaca MEMORI.md, tidak membuat sesi, tidak membaca rules global, dan tidak memuat skill memori-check di awal sesi (percakapan ini).
- Terkait: AGENTS.md, memori-check
- Tindak lanjut: Perkuat checklist awal sesi pada AGENTS.md dan wajib memuat skill memori-check sebelum interaksi (akar masalah: lupa menjalankan prosedur awal sesi).

- Gejala: Pada sesi 217 (2026-11-16, ~17:39 WIB), AI kembali tidak menjalankan prosedur awal sesi: tidak membuat berkas sesi di `memori/sesi/`, tidak memuat skill `memori-check`, dan tidak membaca berkas `.agents/rules/global/` melalui tool (hanya mengandalkan aturan global yang diinjeksikan secara otomatis ke konteks). MEMORI.md dan AGENTS.md baru dibaca setelah permintaan pengguna ("baca keluhan.md dan aturan global sebelum menambahkan entri").
- Terkait: AGENTS.md (aturan 1, 2, 6, 7), memori-check
- Tindak lanjut: Karena `.agents/rules/global/` tidak ditemukan di working tree ini (glob `**/.agents/rules/global/*.md` mengembalikan tidak ada), aturan global yang berlaku saat ini hanya yang diinjeksikan melalui `instructions` pada `.kilo/kilo.jsonc`. Akar masalah: prosedur awal sesi (baca MEMORI.md → buat sesi → baca rules global → muat skill memori-check) masih diabaikan pada interaksi pendek. Pertimbangkan penambahan guard otomatis pada command/agent Kilo.
