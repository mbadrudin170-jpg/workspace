---
name: aturan-pembuatan-rules
description: Trigger: saat membuat atau memperbarui aturan (rules) Kilo | Panduan pembuatan aturan global/portabel: aturan wajib bersifat global, izin deny dan pembatasan platform ditulis generik, dan setiap berkas rules wajib didaftarkan di instructions kilo.jsonc.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Mon Nov 16 2026 13:26:16 WIB"
---

# Aturan Pembuatan Rules

Panduan pembuatan aturan (rules) Kilo yang bersifat global dan portabel lintas repo.

## Cakupan yang Di-Cover

- Pembuatan dan pembaruan berkas rules (`.md`) untuk Kilo.
- Pendaftaran rules pada `instructions` di `kilo.jsonc` (proyek) atau `~/.config/kilo/kilo.jsonc` (global).
- Portabilitas: aturan tidak boleh terikat pada repo/proyek tertentu.

## Aturan

1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat digunakan di semua repo.
2. Izin `deny` dan pembatasan platform harus ditulis secara generik (tanpa menyebut path repo tertentu) agar portabel.
3. Setiap berkas rules wajib didaftarkan pada bagian `instructions` di `.kilo/kilo.jsonc` (proyek) atau `~/.config/kilo/kilo.jsonc` (global).

## Larangan

- DILARANG menulis aturan yang terikat pada path/nama repo tertentu (kecuali sebagai contoh/rujukan).
- DILARANG menulis izin `deny` dengan path absolut repo tertentu.
- DILARANG membuat berkas rules tanpa mendaftarkannya di `instructions`.

## Contoh Benar

```markdown
# Aturan Global

- Gunakan tool bawaan Kilo (`read`, `grep`, `glob`) sebelum shell.
- Izin `deny` pada `.kilo/kilo.jsonc` bersifat mutlak.

// kilo.jsonc
{
  "instructions": [".kilo/rules/aturan-global.md"]
}
```

## Contoh Salah

```markdown
# Aturan

- DILARANG membaca /home/user/proyek-x/secrets.txt
- Path repo /home/user/proyek-x wajib ...

// DILARANG: terikat pada repo tertentu
```

## Sumber Evaluasi

- Berkas sumber (commit `de0cff5`): `prompt/skill/aturan-pembuatan-rules.md` — 3 aturan pembuatan rules.
- Dokumen resmi Kilo:
  - https://kilo.ai/docs/customize/custom-rules
  - https://kilo.ai/docs/customize/custom-instructions
  - https://kilo.ai/docs/customize/agents-md
- Skill terkait: `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`.
