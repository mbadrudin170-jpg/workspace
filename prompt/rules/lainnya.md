diperbarui : Thu Nov 19 2026 11:48 WIB
ditimpa ke : `.agents/rules/lainnya.md`

1. Setiap aksi mengedit, menambah, menghapus, atau memindahkan wajib mengikuti aturan yang berlaku; baca/patuhi aturan, rules, dan command terkait sebelum bertindak.

2. Sebelum melakukan aksi, cek dahulu berkas-berkas lain; bila ada berkas yang merujuk ke isi/berkas yang sedang diaksinya, jangan sampai ada referensi yang rusak/mismatch setelah aksi dilakukan.

3. Skill di `.agents/skills/code/` hanya boleh ditambah atau diedit dari riwayat commit, baik dari worktree maupun submodule.

4. AI dilarang menyebut nama/path skill/command/aturan yang tidak ada atau jenis aset yang salah; wajib verifikasi keberadaan (mis. glob/read) sebelum menyebutnya dan sebut jenis yang benar.
