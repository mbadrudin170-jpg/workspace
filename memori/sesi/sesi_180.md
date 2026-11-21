# Sesi 180

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-21
- Command: interaksi langsung (tanpa command)
- Topik: Merapikan skill-skill yang ada.

## Catatan Sesi

- Pengguna meminta merapikan skill-skill yang ada.
- Permintaan spesifik: ubah nama skill `.agents/skills/code/supabase-crud` menjadi `.agents/skills/code/supabase` (tanpa kata `crud`). Folder direname via `mv`; frontmatter `name` dan judul `# Skill:` diperbarui ke `supabase`; referensi komentar di `admin_wifi/lib/main.dart` diperbarui.
- Belum ada detail cakupan lain (indeks, frontmatter massal, prompt/) — menunggu klarifikasi.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `.agents/skills/code/supabase/` (dari `supabase-crud/`) | Diubah (rename) | Folder skill direname; `SKILL.md` frontmatter `name` dan judul diperbarui ke `supabase`. |
| `admin_wifi/lib/main.dart` | Diubah | Komentar referensi skill diperbarui ke `supabase`. |
| `.agents/skills/code/aturan-testing/` (dari `pola-testing/`) | Diubah (rename) | Folder skill direname; frontmatter `name` dan judul diperbarui ke `aturan-testing`. |
| `.agents/skills/code/data-dummy/SKILL.md` | Diubah | Referensi skill diperbarui. |
| `.kilo/commands/scan.md` | Diubah | Referensi skill diperbarui. |
| `admin_wifi/test/mocks.dart` | Diubah | Komentar referensi skill diperbarui. |
| `share_global_saya/test/mocks.dart` | Diubah | Komentar referensi skill diperbarui. |
| `.agents/skills/code/aturan_riverpod/` (dari `riverpod-pola/`) | Diubah (rename) | Folder skill direname; frontmatter `name` diperbarui ke `aturan_riverpod`. |
| `.agents/skills/code/withvalues-opacity-warna/` | Dihapus | Digabung ke `gaya` (indeks dihapus). |
| `.agents/skills/code/penamaan-konstanta-snake-case/` | Dihapus | Digabung ke `konstanta-skema-tabel`. |
| `.agents/skills/code/aturan-penamaan/` (dari `konstanta-skema-tabel/`) | Diubah (rename) | Folder skill direname; frontmatter `name` diperbarui ke `aturan-penamaan`. |
| `.agents/skills/code/scaffold-struktur-layar/` | Dihapus | Skill dihapus atas permintaan pengguna. |
| `.agents/skills/code/struktur-class-ui/` | Dibuat | Skill baru atas permintaan pengguna. |
| `.agents/skills/code/sqlite/` (dari `dukungan-sqlite-web/`) | Diubah (rename) | Folder skill direname; frontmatter `name` diperbarui ke `sqlite`. |
| `.agents/skills/code/buildcontext-inherited/` | Dihapus | Skill dihapus atas permintaan pengguna. |
| `.agents/skills/code/penanganan-data-null/` | Dibuat | Skill baru indeks penanganan data null. |
| `type-promotion-null-safety`, `parsing-nullable-int`, `penanganan-async`, `validasi-form-sebelum-penyimpanan` | Diubah | Rujukan ke `penanganan-data-null` ditambahkan. |
| `.agents/rules/code.md` | Diubah | Referensi skill dihapus. |
| `.agents/rules/code.md` | Diubah | Referensi skill diperbarui. |
| `.kilo/commands/scan.md` | Diubah | Referensi skill diperbarui. |
| `.agents/skills/code/konstanta-skema-tabel/SKILL.md` | Diubah | Referensi diperbarui. |
| `.kilo/commands/scan.md` | Diubah | Referensi diperbarui. |
| `.agents/skills/code/pola-ui/SKILL.md` | Diubah | Referensi diperbarui. |
| `.kilo/commands/scan.md` | Diubah | Referensi diperbarui. |
| `.agents/skills/code/penanganan-async/` (gabungan) | Dibuat | Skill baru gabungan dari `penanganan-async-data-kosong` + `penanganan-asyncvalue-berkali`; folder lama dihapus. |
| `.agents/rules/code.md` | Diubah | Referensi skill diperbarui ke `penanganan-async`. |
| `.kilo/commands/scan.md` | Diubah | Referensi skill diperbarui. |
| `.agents/skills/code/bug-runtime/SKILL.md` | Diubah | Referensi + tabel indeks diperbarui. |
| `.agents/skills/code/pola-ux/SKILL.md` | Diubah | Referensi diperbarui. |
| `.agents/skills/code/aturan_riverpod/SKILL.md` | Diubah | Referensi diperbarui. |
| `.agents/rules/code.md` | Diubah | Referensi skill `riverpod-pola` → `aturan_riverpod` (5 lokasi) + path. |
| `.agents/skills/code/performa-aplikasi/SKILL.md` | Diubah | Referensi skill diperbarui. |
| `.agents/skills/non-code/penggunaan-tool-bawaan-kilo/SKILL.md` | Diubah | Referensi skill diperbarui. |
| `memori/sesi/sesi_180.md` | Dibuat | Berkas sesi aktif (Belum Sinkron). |

- Permintaan pengguna: setiap merubah skill, perbarui juga deskripsinya agar sinkron. Catatan dicatat untuk sesi berikutnya.

Belum disinkronkan.
