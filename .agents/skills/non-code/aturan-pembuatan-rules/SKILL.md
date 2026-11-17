---
name: aturan-pembuatan-rules
description: Trigger: saat membuat atau memperbarui aturan (rules) Kilo | Panduan pembuatan aturan global/portabel: aturan wajib bersifat global, izin deny dan pembatasan platform ditulis generik, berkas rules tidak didaftarkan di instructions, dan berkas AGENTS.md wajib memuat perintah membaca seluruh berkas .agents/rules/.
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Wed Nov 18 2026 01:03 WIB"
---

# Aturan Pembuatan Rules

Panduan pembuatan aturan (rules) Kilo yang bersifat global dan portabel lintas repo.

## Cakupan yang Di-Cover

- Pembuatan dan pembaruan berkas rules (`.md`) untuk Kilo.
- Jalur baca rules: berkas `AGENTS.md` (terdaftar di `instructions`); berkas rules **tidak** didaftarkan satu per satu di `instructions`.
- Portabilitas: aturan tidak boleh terikat pada repo/proyek tertentu.

## Aturan

1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat digunakan di semua repo.
2. Izin `deny` dan pembatasan platform harus ditulis secara generik (tanpa menyebut path repo tertentu) agar portabel.
3. Yang terdaftar pada `instructions` hanya berkas `AGENTS.md`; berkas rules (`.agents/rules/`) **tidak** didaftarkan satu per satu di `instructions`.
4. Berkas `AGENTS.md` wajib menyertakan perintah membaca seluruh berkas di folder `.agents/rules/` dan mematuhi seluruh aturan yang ada di sana (sebelum pemuatan apa pun via `instructions`).

## Larangan

- DILARANG menulis aturan yang terikat pada path/nama repo tertentu (kecuali sebagai contoh/rujukan).
- DILARANG menulis izin `deny` dengan path absolut repo tertentu.
- DILARANG mendaftarkan berkas rules satu per satu di `instructions`; jalur baca rules adalah `AGENTS.md`.
- DILARANG membuat/memperbarui `AGENTS.md` tanpa perintah wajib membaca seluruh berkas di `.agents/rules/` dan mematuhi isinya.

## Contoh Benar

```markdown
# Aturan Global

- Gunakan tool bawaan Kilo (`read`, `grep`, `glob`) sebelum shell.
- Izin `deny` pada `.kilo/kilo.jsonc` bersifat mutlak.

# AGENTS.md

1. Baca secara eksplisit (tool Read) seluruh berkas di `.agents/rules/` sebelum bekerja; sesi tidak dilanjutkan bila belum dibaca (fatal bagi kode). Jangan hanya mengandalkan pemuatan via `instructions`.
```

```jsonc
// .kilo/kilo.jsonc
{
  "instructions": ["AGENTS.md"]
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
- Permintaan eksplisit pengguna (sesi 21, 2026-11-18): resolusi konflik — poin 3–4 sumber disesuaikan dengan `.kilo/kilo.jsonc` (hanya `AGENTS.md` terdaftar di `instructions`) dan Aturan 3–4 target direvisi mengikuti praktik yang berlaku (jalur baca rules via `AGENTS.md`).
- Dokumen resmi Kilo:
  - https://kilo.ai/docs/customize/custom-rules
  - https://kilo.ai/docs/customize/custom-instructions
  - https://kilo.ai/docs/customize/agents-md
- Skill terkait: `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`.
