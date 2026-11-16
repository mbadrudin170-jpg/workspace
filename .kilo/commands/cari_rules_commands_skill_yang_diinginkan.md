---
description: Mencari rules, skill, command, dan AGENTS.md yang sesuai dengan kebutuhan pengguna, lalu menampilkannya sebagai daftar beserta path berkas yang ditemukan.
agent: code
---

# Cari Rules, Commands, dan Skill yang Diinginkan

## Tujuan

Membantu pengguna menemukan berkas rules, skill, command, atau `AGENTS.md` yang relevan dengan kebutuhannya, beserta path lengkapnya.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca bagian `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar di dalamnya.
3. Gunakan tool bawaan Kilo (`read`, `glob`, `grep`) untuk mencari berkas; gunakan shell hanya bila tidak ada padanan tool bawaan.
4. Gunakan bahasa Indonesia baku pada interaksi dan laporan.
5. Tidak ada skill terkait yang trigger-nya terpenuhi oleh tujuan command ini; nyatakan secara eksplisit bila relevan.

## Parameter

- `$ARGUMENTS` (opsional): kata kunci atau kebutuhan pengguna yang ingin dicari.
- Jika `$ARGUMENTS` kosong, WAJIB gunakan tool `question` untuk menanyakan apa yang ingin dicari kepada pengguna; jangan menebak.

## Alur Kerja

1. Tentukan kata kunci dari `$ARGUMENTS` atau dari jawaban pengguna.
2. Cari padanan yang relevan pada:
   - `.agents/rules/**/*.md` (aturan),
   - `.agents/skills/**/SKILL.md` (skill),
   - `.kilo/commands/**/*.md` (command),
   - `AGENTS.md` (root).
3. Untuk setiap kandidat yang cocok, baca berkasnya dan pastikan relevan dengan kata kunci; jangan tampilkan hasil insidenal yang tidak relevan.
4. Tampilkan hasil sebagai daftar: nama berkas, path, jenis (rules/skill/command/AGENTS.md), dan alasan singkat relevansinya.

## Format Laporan

Daftar bernomor:

```text
1. <nama> — <jenis> — <path> — <alasan singkat relevan>
2. ...
```

Jika tidak ada padanan yang cocok, nyatakan secara eksplisit bahwa tidak ada rules, skill, command, atau `AGENTS.md` yang sesuai.

## Larangan

- DILARANG mengarang path atau nama berkas yang tidak ditemukan/diverifikasi.
- DILARANG menampilkan kandidat yang tidak relevan hanya karena cocok pada satu kata kunci umum.
- DILARANG mengubah berkas mana pun; command ini read-only.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila pencarian dilakukan pada rules, skill, command, dan `AGENTS.md`, lalu daftar path yang ditemukan disampaikan (atau dinyatakan tidak ada padanan).
- STOP bila argumen kosong dan pengguna tidak menjawab pertanyaan, atau bila lokasi pencarian tidak dapat diakses; sebutkan alasan dan tindakan yang disarankan.
