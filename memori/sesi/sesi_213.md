# Sesi 213

- Status: Sudah Sinkron
- Diperbarui: Mon Nov 16 2026 21:31 WIB
- Topik: command `salin_prompt_ke_target` (parameter kosong; pengguna memilih "Semuanya"; seluruh 21 berkas di `prompt/` diproses)

## Ringkasan
Sesi dimulai untuk menjalankan command `salin_prompt_ke_target`. Seluruh 21 berkas di `prompt/` (10 berkas `prompt/skill/`, 1 berkas `prompt/rules/`, 10 berkas `prompt/commands/`) dianalisis memiliki target. Pengguna memilih "Semuanya". Celah yang ditutup: skill `riverpod-pola` (target kosong → dibuat lengkap sesuai poin sumber); skill `aturan-pembuatan-commands` (frontmatter `name` + deskripsi trigger + section Sumber Evaluasi); command `cari_apk_kompetitor.md` (poin subagent hingga 3 task, satu kandidat per subagent, perbarui `apk_kompetitor.md` sebelum lanjut); command `cari_rules_commands_skill_yang_diinginkan.md` (target belum ada → dibuat command baru; berkas sumber typo `suer_inginkan` → `yang_diinginkan`); command `evaluasi_skill_dari_commit.md` (poin prioritas tertinggi pada format laporan); pembersihan rujukan ke `prioritas_tool_bawaan.md` yang sudah dihapus pada target yang masuk scope; pembaruan indeks skill `kelompok_skill_wajib.md` untuk skill yang diubah. Poin ambigu/blank pada sumber diperbaiki (`prompt/commands/build_apk.md` poin 1–3; `prompt/commands/cari_rules_commands_skill_yang_diinginkan.md` poin terakhir kosong). Tidak ada kode Dart yang diubah.

## Catatan Sesi
- Catch-up: hanya sesi ini yang `Belum Sinkron`; tidak ada berkas sesi sebelumnya yang perlu disinkronkan.
- `prompt/mode/` tidak ada di repositori; tidak ada berkas yang diproses pada subfolder tersebut.
- Poin ambigu `prompt/commands/build_apk.md` poin 1 (tawaran lokal vs GitHub Actions) diklarifikasi: build APK release wajib via GitHub Actions workflow pada mesin tanpa Android SDK; `prompt/skill/riverpod-pola.md` dipadatkan mengikuti aturan folder prompt (tanpa kode lengkap dan tanpa tautan `file:///home/...`).
- Berkas `prompt/commands/cari_rules_commands_skill_suer_inginkan.md` direname menjadi `prompt/commands/cari_rules_commands_skill_yang_diinginkan.md` agar nama berkas sama dengan target.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| .agents/rules/global/kelompok_skill_wajib.md | Diubah | Indeks skill diperbarui untuk skill yang diubah (aturan-pembuatan-commands, build-apk-github-workflow, penggunaan-tool-bawaan-kilo, riverpod-pola) |
| .agents/skills/custom/aturan-pembuatan-commands/SKILL.md | Diubah | Frontmatter `name` + deskripsi trigger ditambahkan; section Sumber Evaluasi ditambahkan |
| .agents/skills/custom/build-apk-github-workflow/SKILL.md | Diubah | Rujukan ke aturan prioritas lama yang sudah dihapus diganti; versi/diperbarui dinaikkan |
| .agents/skills/custom/penggunaan-tool-bawaan-kilo/SKILL.md | Diubah | Rujukan ke `prioritas_tool_bawaan.md` yang dihapus ditandai eksplisit sebagai dihapus/diserap; versi/diperbarui dinaikkan |
| .agents/skills/custom/riverpod-pola/SKILL.md | Diubah | Berkas target yang kosong diisi skill lengkap sesuai poin sumber |
| .kilo/commands/build_apk.md | Diubah | Rujukan rujukan ke aturan prioritas yang dihapus dihapus; diarahkan ke skill penggunaan-tool-bawaan-kilo |
| .kilo/commands/cari_apk_kompetitor.md | Diubah | Poin 12 diperluas: maksimal 3 subagent background, satu kandidat per subagent, perbarui `apk_kompetitor.md` sebelum lanjut |
| .kilo/commands/cari_rules_commands_skill_yang_diinginkan.md | Dibuat | Command baru untuk mencari rules/skill/command/AGENTS.md sesuai kebutuhan pengguna |
| .kilo/commands/commit_file_sesi_ini.md | Diubah | Rujukan aturan prioritas yang dihapus dihapus; diarahkan ke skill penggunaan-tool-bawaan-kilo |
| .kilo/commands/evaluasi_code_yang_baru_dicommit.md | Diubah | Rujukan aturan prioritas yang dihapus dihapus; diarahkan ke skill penggunaan-tool-bawaan-kilo |
| .kilo/commands/evaluasi_skill_dari_commit.md | Diubah | Rujukan aturan prioritas yang dihapus dihapus; poin format laporan disusun berdasarkan prioritas tertinggi |
| prompt/commands/build_apk.md | Diubah | Poin ambigu/blank diperbaiki: build wajib via GitHub Actions, pilihan repo bila ada beberapa kandidat, langkah pasca-konfirmasi |
| prompt/commands/cari_apk_kompetitor.md | Diubah | Tanggal diperbarui disinkronkan dengan perubahan target |
| prompt/commands/cari_rules_commands_skill_suer_inginkan.md | Dihapus | Direname ke `prompt/commands/cari_rules_commands_skill_yang_diinginkan.md` (typo `suer_inginkan` → `yang_diinginkan`) |
| prompt/commands/cari_rules_commands_skill_yang_diinginkan.md | Dibuat | Rename + penomoran poin ambigu dihapus; tanggal diperbarui; penomoran 1–4 dirapikan |
| prompt/skill/aturan-pembuatan-commands.md | Diubah | Tanggal diperbarui disinkronkan dengan perubahan target |
| prompt/skill/build-apk-github-workflow.md | Diubah | Catatan sumber membersihkan rujukan ke aturan lama yang dihapus; tanggal diperbarui |
| prompt/skill/penggunaan-tool-bawaan-kilo.md | Diubah | Tanggal diperbarui disinkronkan dengan perubahan target |
| prompt/skill/riverpod-pola.md | Diubah | Poin sumber dipadatkan; tautan `file:///home/...` dan kode lengkap dipindahkan ke target/diringkas |
| memori/sesi/sesi_213.md | Diubah | Catatan sesi dan tabel Berkas Terdampak diisi |
| MEMORI.md | Diubah | Header `Diperbarui` dan entri Status Kerja sesi 213 ditambahkan; pengecualian `memori/riwayat_perubahan.md` dinyatakan eksplisit |

## Sinkronisasi ke MEMORI.md
MEMORI.md diperbarui ke sesi 213: header `Diperbarui` dan entri Status Kerja sesi 213 ditambahkan. Entri `memori/riwayat_perubahan.md` tidak ditambahkan (pengecualian pengguna, preferensi pengguna; dinyatakan eksplisit pada sesi ini). Tidak ada kontradiksi baru yang perlu diselesaikan; rujukan ke aturan lama `prioritas_tool_bawaan.md` yang sudah dihapus dibersihkan pada target yang masuk scope.

