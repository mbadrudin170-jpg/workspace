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
| `.agents/rules/code.md` | Diubah | Referensi skill `riverpod-pola` → `aturan_riverpod` (5 lokasi) + path. |
| `.agents/skills/code/performa-aplikasi/SKILL.md` | Diubah | Referensi skill diperbarui. |
| `.agents/skills/non-code/penggunaan-tool-bawaan-kilo/SKILL.md` | Diubah | Referensi skill diperbarui. |
| `memori/sesi/sesi_180.md` | Dibuat | Berkas sesi aktif (Belum Sinkron). |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan.
