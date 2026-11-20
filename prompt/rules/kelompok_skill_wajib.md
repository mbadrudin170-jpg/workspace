diperbarui : Fri Nov 20 2026 22:54 WIB
ditimpa ke : `.agents/rules/kelompok_skill_wajib_non_code.md`

1. Berkas indeks skill (`.agents/rules/kelompok_skill_wajib_non_code.md` untuk non-code) adalah indeks skill custom proyek: daftar `SKILL.md` di bawah section `## non-code` (`.agents/skills/non-code/<nama>/SKILL.md`).

2. Setiap skill pada indeks wajib memiliki path file yang valid, trigger yang jelas, dan tanggal diperbarui lengkap beserta jam.

3. Setiap skill yang diubah wajib memperbarui tanggal diperbaruinya pada indeks; bila ada skill baru atau pembaruan `SKILL.md`, wajib perbarui indeks juga.

4. Trigger pada indeks wajib ditulis detail dan spesifik agar AI dapat memuat `SKILL.md` yang tepat; susun daftar berdasarkan abjad A-Z; jangan mengarang path/tanggal dan jangan cantumkan skill yang tidak tersedia tanpa laporan; muat skill `kelompok-skill-wajib` sebelum mengubah indeks.

5. Indeks ini hanya untuk menemukan skill teknis, bukan pengganti pemuatan isi skill teknis. Sebelum bekerja, cocokkan pemicu (Trigger) pada setiap skill dengan tugas yang sedang/akan dikerjakan. Wajib memuat (via tool `skill`) seluruh skill yang pemicunya cocok, termasuk yang sedikit kurang relevan dan yang menyebut satu kata yang sama. Pemuatan selektif berdasarkan kategori dan pemicu tugas. Verifikasi keberhasilan pemuatan sebelum pekerjaan dimulai; bila skill gagal ditemukan/dimuati, laporkan ke pengguna. Jangan menduplikasi isi skill teknis di indeks ini.
