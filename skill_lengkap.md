
===== .agents/skills/aturan-folder-prompt/SKILL.md =====
---
name: aturan-folder-prompt
description: 'Trigger: saat menambah atau memperbarui file di folder prompt/ | Aturan folder prompt/: setiap file wajib memuat tanggal diperbarui (lengkap + jam, zona waktu Asia/Jakarta) dan target ''ditimpa ke''/''file'' (path tujuan), karena folder prompt/ hanya mencatat poin-poin penting untuk masing-masing skill, aturan, dan command. Subfolder: prompt/skill/, prompt/rules/, prompt/commands/ (dan prompt/mode/ bila ada). Setiap skill wajib memiliki berkas poin di prompt/skill/ dengan nama yang sama. Aturan Folder Prompt Folder `prompt/` di root proyek menyimpan rujukan/draft (poin-poin penting) untuk skill, aturan, dan command. Setiap berkas di folder ini **bukan** isi final, melainkan catatan poin yang akan "ditimpa" ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`). Cakupan yang Di-Cover - Folder: `prompt/` (root proyek), subfolder `prompt/skill/`, `prompt/rules/`, `prompt/commands/`, dan `prompt/mode/` (bila ada). - Berkas target: `.agents/skills/code/<nama>/SKILL.md` atau `.agents/skills/non-code/<nama>/'
metadata:
  kategori: "custom"
  versi: "1.5.0"
  diperbarui: "Wed Nov 18 2026 01:38 WIB"
---

# Aturan Folder Prompt

Folder `prompt/` di root proyek menyimpan rujukan/draft (poin-poin penting) untuk skill, aturan, dan command. Setiap berkas di folder ini **bukan** isi final, melainkan catatan poin yang akan "ditimpa" ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`).

## Cakupan yang Di-Cover

- Folder: `prompt/` (root proyek), subfolder `prompt/skill/`, `prompt/rules/`, `prompt/commands/`, dan `prompt/mode/` (bila ada).
- Berkas target: `.agents/skills/code/<nama>/SKILL.md` atau `.agents/skills/non-code/<nama>/SKILL.md`, `.agents/rules/<nama>.md`, `.kilo/commands/<nama>.md`, `.kilo/commands/mode/<nama>.md`.
- Header wajib pada setiap berkas di `prompt/`: `diperbarui :` (tanggal lengkap + jam) dan `ditimpa ke :` / `file :` (path tujuan).

## Aturan

1. Setiap berkas di `prompt/` **wajib** memuat header: `diperbarui :` (tanggal lengkap + jam) dan `ditimpa ke :` (path tujuan) atau `file :` (link ke berkas target).
2. Tanggal `diperbarui` **wajib** memakai zona waktu Asia/Jakarta (WIB) dan **wajib** diperbarui setiap kali isi berkas di `prompt/` diperbarui.
3. Nama berkas di `prompt/<subfolder>/` **wajib** sama dengan nama target agar mudah dievaluasi (mis. `prompt/skill/aturan-folder-prompt.md` ↔ `.agents/skills/non-code/aturan-folder-prompt/SKILL.md`).
4. Setiap skill wajib memiliki berkas poin di `prompt/skill/<nama-skill>.md` dengan nama yang sama (sesuai skill `aturan-pembuatan-skill` Aturan 11).
5. Berkas di `prompt/` **wajib** hanya berisi poin-poin penting (ringkas); **dilarang** memuat isi final/lengkap. Isi final tetap berada di target (`.agents/`, `.kilo/`).
6. Subfolder `prompt/` mengikuti jenis target: `prompt/skill/` (skill), `prompt/rules/` (aturan), `prompt/commands/` (command), `prompt/mode/` (mode command).
7. Catatan "hanya untuk penulis prompt, bukan untuk skill" (beserta link referensi) **wajib** ditempatkan di akhir berkas sumber dan **tidak boleh** dimasukkan ke target (`.agents/skills/`, `.agents/rules/`, `.kilo/commands/`).
8. Setiap butir poin wajib dipisahkan oleh satu baris kosong.
9. Setiap kali isi berkas di `prompt/` diperbarui, langsung perbarui juga berkas targetnya — tetapi hanya setelah mendapat izin pengguna (gunakan tool `question`).

## Larangan

- Berkas di `prompt/` tanpa tanggal diperbarui (lengkap + jam).
- Berkas di `prompt/` tanpa target "ditimpa ke"/"file".
- Memasukkan link referensi dari catatan "hanya untuk penulis prompt" ke skill/aturan/command target.
- Berkas di `prompt/` memuat isi final/lengkap (bukan poin ringkas).

## Contoh Benar

```markdown
diperbarui : Mon Nov 16 2026 07:36 WIB
ditimpa ke : `.kilo/commands/mode/mode_diskusi.md`

# Judul

1. Poin penting 1
2. Poin penting 2

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/...
```

```markdown
file : [nama-skill](../../.agents/skills/non-code/nama-skill/SKILL.md)

1. Poin penting 1
2. Poin penting 2

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/...
```

## Contoh Salah

```markdown
# Judul

1. Poin penting 1
```

(Tanpa tanggal diperbarui dan tanpa target "ditimpa ke"/"file".)


===== .agents/skills/aturan-pembuatan-commands/SKILL.md =====
---
name: aturan-pembuatan-commands
description: "Trigger: saat membuat command Kilo baru atau memperbarui command Kilo | Panduan pembuatan dan pembaruan command Kilo. Aturan Pembuatan Commands 1. Setiap `command` wajib menyertakan `description` yang ringkas, jelas, dan tidak menyesatkan AI. 2. Setiap `command` wajib memerintahkan AI untuk membaca terlebih dahulu `instructions` yang terdaftar di `.kilo/kilo.jsonc`, dan mematuhi aturan yang ada di dalamnya. 3. Setiap `command` harus singkat, namun jangan sampai membuat AI salah langkah. 4. Wajib menggunakan bahasa Indonesia. 5. Untuk nama berkas, wajib menggunakan bahasa Indonesia, kecuali istilah bahasa Inggris yang sudah umum (mis. `command`, `description`). 6. Setiap `command` wajib menyertakan skill terkait yang dibutuhkan AI jika skill tersebut tersedia (cek indeks skill `.agents/rules/kelompok_skill_wajib_*.md` atau daftar skill yang tersedia). 7. Disimpan di `.kilo/commands/` (atau subfolder satu tingkat, mis. `mode/`, `prd/`). 8. Setiap `command` wajib memerintahkan AI untuk membaca `AGENTS.md` terleb"
---

# Aturan Pembuatan Commands

1. Setiap `command` wajib menyertakan `description` yang ringkas, jelas, dan tidak menyesatkan AI.
2. Setiap `command` wajib memerintahkan AI untuk membaca terlebih dahulu `instructions` yang terdaftar di `.kilo/kilo.jsonc`, dan mematuhi aturan yang ada di dalamnya.
3. Setiap `command` harus singkat, namun jangan sampai membuat AI salah langkah.
4. Wajib menggunakan bahasa Indonesia.
5. Untuk nama berkas, wajib menggunakan bahasa Indonesia, kecuali istilah bahasa Inggris yang sudah umum (mis. `command`, `description`).
6. Setiap `command` wajib menyertakan skill terkait yang dibutuhkan AI jika skill tersebut tersedia (cek indeks skill `.agents/rules/kelompok_skill_wajib_*.md` atau daftar skill yang tersedia).
7. Disimpan di `.kilo/commands/` (atau subfolder satu tingkat, mis. `mode/`, `prd/`).
8. Setiap `command` wajib memerintahkan AI untuk membaca `AGENTS.md` terlebih dahulu dan mematuhi isinya.

## Contoh Frontmatter

```yaml
---
description: deskripsi singkat
---
```


===== .agents/skills/aturan-pembuatan-rules/SKILL.md =====
---
name: aturan-pembuatan-rules
description: Trigger: saat membuat atau memperbarui aturan (rules) Kilo | Panduan pembuatan aturan global/portabel: aturan wajib bersifat global, izin deny dan pembatasan platform ditulis generik, berkas rules tidak didaftarkan di instructions, AGENTS.md wajib memuat perintah membaca seluruh berkas .agents/rules/, berkas aturan khusus kode hanya boleh diubah berdasarkan commit dan kode yang eksplisit ditambahkan pengguna, dan setiap aturan pada berkas khusus kode wajib menyertakan skill terkaitnya. Aturan Pembuatan Rules Panduan pembuatan aturan (rules) Kilo yang bersifat global dan portabel lintas repo. Cakupan yang Di-Cover - Pembuatan dan pembaruan berkas rules (`.md`) untuk Kilo. - Jalur baca rules: berkas `AGENTS.md` (terdaftar di `instructions`); berkas rules **tidak** didaftarkan satu per satu di `instructions`. - Portabilitas: aturan tidak boleh terikat pada repo/proyek tertentu. Aturan 1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat dig
metadata:
  kategori: "custom"
  versi: "1.3.0"
  diperbarui: "Wed Nov 18 2026 09:05 WIB"
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
5. Setiap rules hanya memuat informasi/panduan ringkas; detail teknis wajib ditambahkan ke skill yang sudah ada, atau dibuatkan skill baru bila belum ada yang relevan.
6. Berkas aturan khusus kode (contoh: `.agents/rules/code.md`) hanya boleh diubah berdasarkan commit dan kode yang secara eksplisit ditambahkan pengguna.
7. Setiap aturan pada berkas aturan khusus kode wajib menyertakan skill terkaitnya; dilarang menambahkan aturan baru tanpa skill terkait.

## Larangan

- DILARANG menulis aturan yang terikat pada path/nama repo tertentu (kecuali sebagai contoh/rujukan).
- DILARANG menulis izin `deny` dengan path absolut repo tertentu.
- DILARANG mendaftarkan berkas rules satu per satu di `instructions`; jalur baca rules adalah `AGENTS.md`.
- DILARANG membuat/memperbarui `AGENTS.md` tanpa perintah wajib membaca seluruh berkas di `.agents/rules/` dan mematuhi isinya.
- DILARANG mengubah berkas aturan khusus kode (contoh: `.agents/rules/code.md`) tanpa dasar commit dan kode yang secara eksplisit ditambahkan pengguna.
- DILARANG menambahkan aturan pada berkas aturan khusus kode tanpa menyertakan skill terkaitnya.

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


===== .agents/skills/aturan-pembuatan-skill/SKILL.md =====
---
name: aturan-pembuatan-skill
description: Trigger: saat membuat skill baru atau memperbarui skill | Panduan pembuatan dan pembaruan SKILL.md. 1. Setiap skill wajib memiliki frontmatter, dan cukup hanya `name` serta `description`; `name` wajib sama dengan nama folder (Name Matching Rule). 2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`. 3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik. 4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`). 5. `description` wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; wajib menjelaskan apa yang dilakukan dan kapan dipakai; serta memenuhi batasan 1–1024 karakter, non-kosong. 6. `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpang
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 22 2026 11:00 WIB"
---

1. Setiap skill wajib memiliki frontmatter, dan cukup hanya `name` serta `description`; `name` wajib sama dengan nama folder (Name Matching Rule).

2. Untuk nama folder, gunakan nama-nama Indonesia, kecuali yang spesifik dan yang sudah umum (misalnya jangan ubah `build` menjadi `bangun` dan lainnya); serta untuk penghubung antar kata wajib menggunakan `-` bukan `_`.

3. Lokasi skill wajib berada di `.agents/skills/`, kecuali pengguna minta subfolder spesifik.

4. Untuk bahasa, wajib Indonesia pada seluruh isi skill, kecuali istilah teknis yang tidak memiliki padanan Indonesia (mis. `frontmatter`, `description`).

5. `description` wajib jelas kapan skill ini dibutuhkan; jangan sampai skill sia-sia karena tidak terpakai; wajib menjelaskan apa yang dilakukan dan kapan dipakai; batasan 1–1024 karakter adalah batas maksimum, bukan target; utamakan description ringkas, spesifik, dan pemicu penggunaan yang jelas; non-kosong.

6. `description` wajib diawali segmen trigger-only (`Trigger:` ... `|`), agar skill terpanggil saat tepat. (Trigger-only description.)

7. Setiap skill wajib menyertakan contoh; utamakan contoh benar, **contoh salah wajib**.

8. DILARANG menyertakan section `## Sumber Evaluasi` pada skill; skill hanya memuat aturan/panduan, bukan riwayat sumber.

9. Batasan `name` — 1–64 karakter; huruf kecil/angka/strip; tidak diawali/diakhiri strip; tidak boleh strip ganda (`--`).

10. Progressive disclosure — `SKILL.md` utama di bawah 500 baris; detail pindah ke file referensi di folder `references/`.

11. Setiap skill wajib memiliki berkas poin di folder `prompt/skill/` dengan nama yang sama dengan nama skill (mis. skill `penggunaan-tool-bawaan-kilo` → `prompt/skill/penggunaan-tool-bawaan-kilo.md`). Pengecualian: skill pada `.agents/skills/code/`.

12. Sumber isi skill wajib berasal dari commit yang berkaitan; bila aturan baru berasal dari permintaan eksplisit pengguna, catat provenansinya pada berkas sesi, bukan pada skill.

13. Skill pada `.agents/skills/code/` hanya boleh diubah atau ditambah dari (a) riwayat commit, atau (b) kode yang secara eksplisit diperintahkan pengguna untuk dimasukkan.

14. Wajib tanyakan dulu kepada pengguna untuk memastikan apakah kode tersebut perlu ditambahkan/diperbarui ke skill yang relevan, atau perlu dibuat berkas skill baru.

15. Saat bertanya, sertakan path berkas skill yang dimaksud agar pengguna mengetahui target dan dapat menolak bila tidak sesuai.

16. Setiap poin dan contoh pada skill tidak boleh terlalu spesifik untuk satu repo; jadikan global. Rujukan ke repo tertentu hanya boleh sebagai catatan provenance pada berkas sesi bila aturan memang berasal dari repo tersebut.

17. Frontmatter wajib YAML valid: `name:` dan `description:` wajib sejajar pada kolom yang sama (tanpa spasi/indentasi di depan salah satunya); frontmatter yang rusak membuat Kilo gagal memuat skill (mis. error "bad indentation of a mapping entry").

18. Untuk `description`, utamakan ringkas, spesifik, dan pemicu penggunaan yang jelas; batasan 1024 karakter adalah batas maksimum, bukan target; tidak wajib memenuhi hingga 1024 karakter.

19. Folder `references/` di dalam folder skill tidak wajib; gunakan hanya bila diperlukan untuk berkas detail dan referensi (progressive disclosure).

20. SKILL.md utama hanya untuk aturan/panduan. Detail tambahan dapat dipindahkan ke file referensi bila diperlukan; catatan penulis prompt (bukan untuk skill) TIDAK dimasukkan ke skill atau target.

21. **Setiap kali menambah atau memperbarui skill, wajib sinkronkan berkas-berkas yang merujuk ke skill tersebut:** indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), command yang memuat skill terkait (`.kilo/commands/**/*.md` bagian `# Skill Terkait`), dan berkas poin `prompt/skill/<nama-skill>.md`. Verifikasi konsistensi sebelum menyelesaikan.


===== .agents/skills/aturan-penamaan/SKILL.md =====
---
name: aturan-penamaan
description: "Trigger: saat membuat atau memperbarui model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) atau skema tabel | Panduan pola XxxSkema: abstract final class terpisah berisi static const String tabel dan konstanta kolom, interpolasi ${XxxSkema.*} di DDL/query/migrasi, nilai konstanta kolom cocok persis nama kolom DB, hindari kolisi dengan kolom bernama 'tabel'. Konstanta Skema Tabel untuk Model Database Setiap model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) wajib mendefinisikan konstanta nama tabel dan kolom melalui kelas `XxxSkema` terpisah, lalu memakainya (interpolasi) di DDL, query, dan migrasi — bukan string literal. Aturan 1. Untuk setiap model terkait database, buat `abstract final class <Model>Skema` di berkas model yang sama (terpisah dari model, agar tidak konflik `conflicting_static_and_instance` pada field dengan nama sama). 2. Kelas `XxxSkema` wajib memuat `static const String tabel = '<nama_tabel>'` dan satu `static const String <field> = '<nama_kolom>'` u"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Wed Nov 18 2026 11:30 WIB"
---

# Konstanta Skema Tabel untuk Model Database

Setiap model yang berkaitan dengan database (SQLite, Supabase, Firebase, dll.) wajib mendefinisikan konstanta nama tabel dan kolom melalui kelas `XxxSkema` terpisah, lalu memakainya (interpolasi) di DDL, query, dan migrasi — bukan string literal.

## Aturan

1. Untuk setiap model terkait database, buat `abstract final class <Model>Skema` di berkas model yang sama (terpisah dari model, agar tidak konflik `conflicting_static_and_instance` pada field dengan nama sama).
2. Kelas `XxxSkema` wajib memuat `static const String tabel = '<nama_tabel>'` dan satu `static const String <field> = '<nama_kolom>'` untuk setiap kolom.
3. Nama konstanta field menggunakan camelCase (sesuai identifier Dart); nilainya wajib cocok persis (case-sensitive) dengan nama kolom aktual pada skema/migrasi/query.
4. Semua referensi nama tabel/kolom di DDL (`CREATE TABLE`), query (`SELECT/INSERT/...`), dan migrasi (`ALTER TABLE`, `CREATE INDEX`) wajib menggunakan interpolasi `${XxxSkema.*}`.
5. Jika ada kolom bernama `tabel`, gunakan identifier berbeda (mis. `namaTabel`) untuk konstanta kolom tersebut agar tidak kolisi dengan konstanta nama tabel.
6. Kelas Skema tidak boleh diedit bersama berkas hasil generate; perubahan sumber lalu build_runner bila model Freezed.
7. Seluruh key database pada method `fromSqlite`/`toSqlite` (serta `fromFirebase`/`toFirebase`) wajib memakai interpolasi `${XxxSkema.*}` sebagai key map — DILARANG string literal nama kolom di method from/to.
8. Nama field Firestore wajib sama persis dengan kolom SQLite (umumnya snake_case); TIDAK ADA konstanta khusus Firestore dengan nama berbeda — pakai konstanta Skema yang sama.

## Larangan

- Jangan menggunakan string literal nama tabel/kolom di kode database.
- DILARANG string literal nama kolom sebagai key map pada method from/to (fromSqlite/fromFirebase/toSqlite/toFirebase); wajib interpolasi `${XxxSkema.*}`.
- DILARANG membuat konstanta khusus Firestore dengan nama berbeda dari kolom SQLite; samakan nama field Firestore dengan kolom SQLite.
- Jangan menempatkan konstanta Skema di dalam kelas model (konflik static/instance).
- Jangan menamai kolom konstan dengan kata "kolom" (ikuti skill `aturan-penamaan` untuk nilai).

## Contoh Benar

```dart
abstract final class DompetSkema {
  static const String tabel = 'dompet';
  static const String id = 'id';
  static const String namaDompet = 'namaDompet';
  static const String saldo = 'saldo';
}

final String _tabelDompet = '''
  CREATE TABLE ${DompetSkema.tabel}(
    ${DompetSkema.id} TEXT PRIMARY KEY,
    ${DompetSkema.namaDompet} TEXT NOT NULL,
    ${DompetSkema.saldo} REAL NOT NULL
  )
''';
```


===== .agents/skills/aturan-penggunaan-rg/SKILL.md =====
---
name: aturan-penggunaan-rg
description: Trigger: saat menggunakan rg (ripgrep) untuk pencarian konten di codebase — gunakan via tool Bash, flag standar, fallback ke Grep bawaan, verifikasi ketersediaan.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sat Nov 21 2026 17:00 WIB"
---

# Aturan Penggunaan rg (ripgrep)

Skill ini mengatur cara menggunakan `rg` (ripgrep) untuk pencarian konten (regex) di codebase melalui tool `Bash`. Berbeda dengan skill instalasi, skill ini berfokus pada aturan pemakaian harian.

## Cakupan yang Di-Cover

- Tool: `rg` (ripgrep) dipanggil via tool `Bash` Kilo
- Flag standar: `-n`, `-i`, `-t`, `-g`, `-e`, `--glob`, `--no-ignore`
- Fallback: tool `Grep` bawaan Kilo bila `rg` tidak tersedia
- Verifikasi ketersediaan sebelum penggunaan berulang

## Aturan

1. **Gunakan `rg` via tool `Bash` untuk pencarian konten**; tool `Grep` bawaan Kilo hanya sebagai fallback bila `rg` tidak tersedia atau tidak memenuhi kebutuhan.
2. **Format umum**: `rg -n '<pola>' <path>` — flag `-n` untuk nomor baris wajib dipakai agar hasil terlacak.
3. **Case-insensitive**: gunakan flag `-i` bila pencarian tidak peka huruf besar/kecil.
4. **Filter ekstensi**: gunakan `-t <tipe>` (mis. `-t dart`, `-t md`) atau `--glob '*.dart'` untuk membatasi scope.
5. **Multi-pola**: gunakan `-e 'pola1' -e 'pola2'` (logika OR) atau `rg 'pola1|pola2'` untuk alternatif regex.
6. **Hormati `.gitignore`** secara default; gunakan `--no-ignore` hanya bila perlu mencari di folder terabaikan (build, cache, dll.).
7. **Verifikasi ketersediaan** via `command -v rg` sebelum pemakaian berulang (di skrip/command).
8. **Sertakan `workdir` yang tepat** pada pemanggilan `Bash` (root proyek atau subfolder paket).
9. **Jangan pipe ke `head`/`less`** dalam tool — biarkan output penuh; pemotongan ditangani sisi klien.

## Steps

1. Cek `command -v rg` (bila pertama kali di sesi/skrip).
2. Bangun perintah `rg` dengan flag sesuai kebutuhan (`-n`, `-i`, `-t`, `-g`, `-e`).
3. Jalankan via tool `Bash` dengan `workdir` yang benar.
4. Bila `rg` tidak tersedia, gunakan tool `Grep` bawaan Kilo.

## Larangan

- DILARANG mengasumsikan `rg` selalu tersedia tanpa verifikasi.
- DILARANG menggunakan `grep -rn` via `Bash` bila `rg` tersedia (kecuali fallback eksplisit).
- DILARANG memanggil `rg` tanpa flag `-n` (nomor baris hilang → sulit lokasi).
- DILARANG mengabaikan `.gitignore` tanpa alasan (gunakan `--no-ignore` hanya saat perlu).

## Contoh Benar

```json
# Cari class di file Dart
bash: { command: "rg -n 'class\\s+\\w+' lib/", workdir: "base_coc" }

# Cari import package:flutter_riverpod (case-insensitive, filter .dart)
bash: { command: "rg -ni 'package:flutter_riverpod' -t dart lib/", workdir: "." }

# Multi-pola: cari 'Notifier' ATAU 'Provider' di folder fitur
bash: { command: "rg -n -e 'Notifier' -e 'Provider' lib/fitur/", workdir: "." }
```

## Contoh Salah

```bash
# SALAH: grep via Bash saat rg tersedia
bash: { command: "grep -rn 'foo' lib/" }

# SALAH: rg tanpa nomor baris
rg 'class Foo' lib/

# SALAH: pipe ke head di dalam tool
bash: { command: "rg 'foo' lib/ | head -20" }
```


===== .agents/skills/aturan-pubspec/SKILL.md =====
---
name: aturan-pubspec
description: Trigger: saat menambah, menghapus, atau meng-upgrade paket pada pubspec.yaml, atau mengurutkan dependensi pubspec.yaml secara abjad | Panduan pengelolaan paket Flutter/Dart: `flutter pub add`/`remove`/`pub upgrade`, larangan penyuntingan manual pubspec.yaml (kecuali kasus `path:`/`git:` dan reorder urutan abjad sesuai `pengurutan-paket-pubspec`), dan kewajiban bertanya ke pengguna saat konflik. Aturan Pubspec 1. Menambahkan paket wajib memakai `flutter pub add`; dilarang menambahkan paket secara manual ke `pubspec.yaml`. 2. Menghapus paket wajib memakai `flutter pub remove`. 3. `pubspec.yaml` hanya boleh disunting manual bila `flutter pub add`/`flutter pub remove` tidak dapat menangani kasusnya (mis. dependensi `path:`/`git:`), atau bila hanya memindahkan posisi entri demi urutan abjad `dependencies`/`dev_dependencies` sesuai skill `pengurutan-paket-pubspec` (tanpa mengubah nama/versi paket, tidak menambah/menghapus paket); selain itu wajib memakai kedua perintah tersebut. Setelah penyuntingan manual, wajib v
---

# Aturan Pubspec

1. Menambahkan paket wajib memakai `flutter pub add`; dilarang menambahkan paket secara manual ke `pubspec.yaml`.
2. Menghapus paket wajib memakai `flutter pub remove`.
3. `pubspec.yaml` hanya boleh disunting manual bila `flutter pub add`/`flutter pub remove` tidak dapat menangani kasusnya (mis. dependensi `path:`/`git:`), atau bila hanya memindahkan posisi entri demi urutan abjad `dependencies`/`dev_dependencies` sesuai skill `pengurutan-paket-pubspec` (tanpa mengubah nama/versi paket, tidak menambah/menghapus paket); selain itu wajib memakai kedua perintah tersebut. Setelah penyuntingan manual, wajib verifikasi `flutter pub get` berhasil.
4. Upgrade paket wajib memakai `flutter pub upgrade` (hanya memajukan versi di dalam constraint `pubspec.yaml`); dilarang upgrade ke versi mayor tanpa persetujuan pengguna (mis. `flutter pub upgrade --major-versions`).
5. Jika terjadi konflik versi atau masalah apa pun terkait paket, wajib tanyakan ke pengguna terlebih dahulu.

## Contoh Benar

```bash
flutter pub add http
flutter pub remove http
flutter pub upgrade
```

## Contoh Salah

```yaml
# pubspec.yaml — DILARANG: menambahkan paket manual
dependencies:
  http: ^1.2.0
```


===== .agents/skills/aturan-riverpod/SKILL.md =====
---
name: aturan-riverpod
description: "Trigger: saat memakai Riverpod | Panduan pola Riverpod (notifier CRUD, notifier sinkron, ref.watch/read, ConsumerWidget/ConsumerStatefulWidget pemilihan, family, autoDispose, ProviderScope, select, AsyncValue, muatUlang, penamaan provider, akses state di AsyncNotifier via `await future` bukan `state.value`)."
metadata:
  kategori: "custom"
  versi: "1.9.0"
  diperbarui: "Sun Nov 22 2026 18:10 WIB"
---

# Aturan Riverpod

Ringkasan pola Riverpod. Detail tiap topik ada di bagian referensi di bawah.

---

# Referensi Detail (dipindahkan dari folder references)


## async-value.md

# AsyncValue (Riverpod)

Referensi detail penanganan `AsyncValue` dari skill `aturan-riverpod`.

## Pola

- Di dalam `build()`, `AsyncValue` wajib ditangani `isLoading` → `hasError` → `requireValue`.
- `asData?.value`/`valueOrNull` hanya untuk akses opsional (bukan konten utama) dengan penanganan kegagalan eksplisit.
- Pemakaian `.when` pada `AsyncValue` DILARANG.

## Contoh Benar

```dart
final async = ref.watch(provider);
if (async.isLoading) return const LoadingView();
if (async.hasError) return ErrorView(error: async.error);
final data = async.requireValue;
return DataView(data: data);
```

## Contoh Salah

```dart
// DILARANG: .when pada AsyncValue
return ref.watch(provider).when(
  loading: () => const LoadingView(),
  error: (e, s) => ErrorView(error: e),
  data: (d) => DataView(data: d),
);
```

## class-notifier.md

# Class Notifier (Riverpod)

Referensi detail pola Notifier Riverpod (CRUD database) yang diserap dari skill `notifier-crud-database`.

## Pola

- `@Riverpod(keepAlive: true)` pada class Notifier.
- `build()` memanggil `_ambilSemua()` (ambil semua data DB → model).
- CRUD: log awal → `await future` → operasi DB → `state = AsyncValue.data(...)` → log sukses → `on Exception catch (e, s)` + `L.e` + `rethrow`.
- Akses DB via `SqfliteOp`; batch via `op.batch(...)`.
- Update parsial kolom via `op.ubah(... where: 'id = ?', whereArgs: [...])` + `copyWith`.
- Konflik insert: `ConflictAlgorithm.abort` (default); `replace` hanya untuk upsert disengaja.
- Setelah `await future` di dalam method CRUD, jangan akses provider lain yang bisa memicu rebuild tidak perlu; state diperbarui murni dari `dataLama` + model baru.

## Larangan

- Jangan update `state` sebelum DB selesai (kecuali optimistic update).
- Jangan menelan exception; wajib `rethrow`.
- Jangan buat instance DB baru di notifier.
- Jangan persistenkan `id` yang tidak di-generate (mis. dari input pengguna) tanpa keputusan eksplisit.

## Contoh Benar

```dart
@Riverpod(keepAlive: true)
class DiaryCravingNotifier extends _$DiaryCravingNotifier {
  @override
  Future<DiaryCravingState> build() async {
    return _ambilSemua();
  }

  Future<DiaryCravingState> _ambilSemua() async {
    final op = const SqfliteOp();
    final rows = await op.ambilSemua(NamaTabel.diaryCraving);
    return DiaryCravingState(
      listCraving: rows.map((r) => DiaryCravingModel.fromSqflite(r)).toList(),
      jumlahCraving: rows.length,
    );
  }

  Future<void> tambah(DiaryCravingModel craving) async {
    L.i('craving.id=${craving.id}');
    try {
      final dataLama = await future;
      final op = const SqfliteOp();
      await op.tambah(NamaTabel.diaryCraving, craving.toSqflite(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      state = AsyncValue.data(
        DiaryCravingState(
          listCraving: [craving, ...dataLama.listCraving],
          jumlahCraving: dataLama.jumlahCraving + 1,
        ),
      );
      L.s('Diary craving berhasil disimpan');
    } on Exception catch (e, s) {
      L.e('Gagal menyimpan diary craving: $e $s');
      rethrow;
    }
  }
}
```

## Contoh Salah

```dart
// Memperbarui state sebelum operasi database selesai.
state = AsyncValue.data(DiaryCravingState(listCraving: [craving, ...list]));
await op.tambah(NamaTabel.diaryCraving, craving.toSqflite()); // jika gagal, state sudah berubah
```

## family-provider.md

# Family Provider (Riverpod)

Referensi detail pola family provider dari skill `aturan-riverpod`.

## Pola

- Family provider (`.family`) hanya untuk parameter immutable dan comparable; key stabil untuk caching; family parameter mutable dilarang.
- Family Notifier (class-based) dengan parameter immutable (mis. `build(int impianId)`).
- Pakai: `ref.watch(detailTransaksiNotifierProvider(impianId))`.

## Contoh Benar

```dart
@riverpod
Future<User> user(Ref ref, int id) => fetchUser(id);

final u = ref.watch(userProvider(42));

@Riverpod(keepAlive: true)
class DetailTransaksiNotifier extends _$DetailTransaksiNotifier {
  @override
  Future<List<Transaksi>> build(int impianId) async {
    return _repository.ambilByImpian(impianId);
  }
}
// Pakai: ref.watch(detailTransaksiNotifierProvider(impianId))
```

## Contoh Salah

```dart
// DILARANG: argumen mutable (identitas/== tidak stabil untuk cache)
final ids = <int>[1, 2, 3];
ref.watch(itemsProvider(ids));
```

## provider-scope.md

# ProviderScope (Riverpod)

Referensi detail `ProviderScope` dari skill `aturan-riverpod`.

## Pola

- `ProviderScope` wajib di root widget tree (`main.dart`/`app.dart`).
- `overrides` hanya untuk scope itu dan keturunannya; `ProviderScope` nested dilarang.
- Provider overrides untuk testing via `ProviderScope(overrides: [...])` dengan `overrideWithValue`/`overrideWithProvider`.
- `UncontrolledProviderScope` tidak mengelola siklus hidup container; dispose adalah tanggung jawab pemanggil.

## Contoh Benar

```dart
final container = ProviderContainer();
runApp(
  UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ),
);
// Saat container tidak lagi dipakai, pemanggil wajib dispose
container.dispose();

// Testing
await tester.pumpWidget(
  ProviderScope(
    overrides: [
      repoProvider.overrideWithValue(FakeRepo()),
    ],
    child: const MyApp(),
  ),
);
```

## Contoh Salah

```dart
// DILARANG: modifikasi provider di lifecycle
@override
void initState() {
  super.initState();
  ref.read(counterProvider.notifier).increment();
}
```

## ref-watch-read.md

# ref.watch / ref.read (Riverpod)

Referensi detail `ref.watch`/`ref.read` dari skill `aturan-riverpod`.

## Pola

- `ref.watch(provider)` WAJIB langsung di dalam `build()` untuk rebuild otomatis.
- `ref.read(provider)` di callback/event handler.
- Dilarang `ref.watch` di callback atau di luar `build()`.
- Helper yang dipanggil dari `build()` DILARANG memanggil `ref.watch`/`ref.read` — state hasil `ref.watch` di `build()` WAJIB diteruskan ke helper sebagai parameter.
- Helper async (mengembalikan `Future<void>`/`Future<T>`) yang dipanggil dari event handler (bukan dari `build()`) BOLEH memanggil `await ref.read(provider.future)` untuk menunggu state siap; hasilnya adalah `State` non-nullable. DILARANG `ref.read(provider)` sinkron lalu `.requireValue`/`.value` di dalam helper (berisiko state belum siap).
- Helper sync yang dipanggil dari `build()` DILARANG memanggil `ref.read(provider)` maupun `ref.read(provider.future)`; state hasil `ref.watch(provider)` di `build()` WAJIB diteruskan ke helper sebagai parameter.
- `ref.watch(provider.select((state) => state.field))` untuk optimasi rebuild minimal.

## Contoh Benar

```dart
@override
Widget build(BuildContext context) {
  final asyncPelangganAktif = ref.watch(penggunaAktifProvider);
  final asyncPelanggan = ref.watch(pelangganProvider);
  final asyncPaket = ref.watch(paketProvider);

  if (asyncPelangganAktif.isLoading || asyncPelanggan.isLoading || asyncPaket.isLoading) {
    return const Center(child: CircularProgressIndicator());
  }
  if (asyncPelangganAktif.hasError) {
    return _buildMuatGagal('Gagal memuat data: ${asyncPelangganAktif.error}',
        () => ref.refresh(penggunaAktifProvider));
  }
  return _buildBody(
    asyncPelanggan.requireValue,
    asyncPaket.requireValue,
    asyncPelangganAktif.requireValue,
  );
}

Widget _buildBody(PelangganState pelangganState, PaketState paketState, PelangganAktifState pelangganAktifAsync) {
  final semuaPelanggan = pelangganAktifAsync.listPelangganAktif;
  // rendering tanpa ref.watch/ref.read di dalam helper
  return const SizedBox.shrink();
}
```

## Contoh Salah

```dart
// DILARANG: ref.watch/ref.read di dalam helper yang dipanggil dari build()
Widget _buildBody() {
  final nilai = ref.watch(counterProvider); // DILARANG
```

## consumer-widget.md

# ConsumerWidget vs ConsumerStatefulWidget (Riverpod)

Panduan pemilihan widget konsumer Riverpod.

## Pola

- Widget yang hanya memerlukan provider reaktif (`ref.watch`) tanpa state mutable (mis. `TextEditingController`, `FocusNode`, enum lokal) WAJIB memakai `ConsumerWidget`.
- `ConsumerWidget.build` memiliki signature `Widget build(BuildContext context, WidgetRef ref)` dan `ref` diperoleh dari parameter (bukan getter).
- Helper privat yang membutuhkan `BuildContext`/state/provider WAJIB menerima parameter dari `build` (aturan 55); helper aksi (`_...` void) tetap di atas `build`, helper widget (`_build...`) di bawah `build` (aturan 52).
- Jika memerlukan state mutable, tetap pakai `ConsumerStatefulWidget` dengan `ref` getter (aturan 15).
- Pada `ConsumerWidget`, field final diakses via `this.field` (bukan `widget.field`).

## Contoh Benar

```dart
class DetailTransaksiPage extends ConsumerWidget {
  final TransaksiModel transaksi;

  const DetailTransaksiPage({super.key, required this.transaksi});

  void _bukaFormEdit(BuildContext context) {
    unawaited(
      Nav.to(
        context,
        FormTransaksiPage(transaksi: transaksi),
      ).catchError((Object e, StackTrace s) {
        L.e('Gagal membuka form edit transaksi: $e $s');
        return null;
      }),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transaksi = this.transaksi;
    final asyncDompet = ref.watch(dompetProvider);
    if (asyncDompet.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (asyncDompet.hasError) {
      return _buildError(
        context,
        'Gagal memuat: ${asyncDompet.error}',
        () => ref.refresh(dompetProvider),
      );
    }
    final dompetState = asyncDompet.requireValue;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _bukaFormEdit(context),
          ),
        ],
      ),
      body: _buildDetailRow(
        context,
        'Dompet',
        dompetState.getById(transaksi.idDompet)?.namaDompet ?? '-',
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(label),
          Flexible(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String pesan, VoidCallback onRetry) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(pesan),
            FilledButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
```

## Contoh Salah

```dart
// DILARANG: ConsumerStatefulWidget tanpa state mutable
class DetailTransaksiPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<DetailTransaksiPage> createState() => _State();
}

// DILARANG: ref sebagai parameter build() pada ConsumerState (melanggar override State.build)
class _State extends ConsumerState<DetailTransaksiPage> {
  @override
  Widget build(BuildContext context, WidgetRef ref) { ... }
}
```


===== .agents/skills/aturan-testing/SKILL.md =====
---
name: aturan-testing
description: "Trigger: saat menulis test | Aturan testing standar: package:test untuk unit test, WidgetTester untuk widget test, integration test, mocktail mock manual (tanpa codegen), dummy data, build_runner. Pola Testing Standar Skill ini mendokumentasikan pola testing yang wajib diterapkan di semua proyek pengguna. 1. Unit Test (package:test) Aturan - File test diletakkan flat di `test/*_test.dart` (bukan di subfolder). - Gunakan `package:test` dengan `test()`, `group()`, `setUp()`, `tearDown()`. - Test fungsi murni, helper, extension, logic bisnis (bukan widget). - Nama test: `should <expected behavior> when <condition>`. Referensi - `dart-add-unit-test` skill untuk detail 2. Widget Test (WidgetTester) Aturan - Gunakan `WidgetTester` dari `package:flutter_test`. - Test rendering, tap, scroll, input text, navigasi. - Bungkus widget dengan `ProviderScope` + `MaterialApp` + override provider. - Gunakan `pumpWidget()`, `pumpAndSettle()`, `tap()`, `enterText()`. Referensi - `flutter-add-widget-test` skill untuk detail 3. Int"
metadata:
  kategori: "custom"
  versi: "1.3.0"
  diperbarui: "Wed Nov 18 2026 07:19 WIB"
---

# Aturan Testing Standar

Skill ini mendokumentasikan pola testing yang wajib diterapkan di semua proyek pengguna.

## 1. Unit Test (package:test)

### Aturan

- File test mengikuti struktur folder sumber di `lib/` dengan menempatkan test di `test/` yang **mirror struktur `lib/fitur/<fitur>/...`** (bukan flat di `test/` tanpa subfolder); DILARANG meletakkan semua test flat di `test/`.
- Gunakan `package:test` dengan `test()`, `group()`, `setUp()`, `tearDown()`.
- Test fungsi murni, helper, extension, logic bisnis (bukan widget).
- Nama test: `should <expected behavior> when <condition>`.
- Nama berkas test: `<nama_file>_test.dart` (snake_case) yang menguji `<nama_file>.dart` di sumber.

```dart
// test/biodata_perhitungan_test.dart
import 'package:test/test.dart';
import 'package:berhenti_merokok/fitur/biodata/model/biodata_model.dart';

void main() {
  group('BiodataModelPerhitungan', () {
    test('should return 0 hariBerhenti when tanggalMulaiBerhentiMerokok is null', () {
      const model = BiodataModel(nama: 'Test', tanggalMulaiBerhentiMerokok: null);
      expect(model.hariBerhenti, 0);
    });

    test('should calculate hariBerhenti correctly', () {
      final tanggal = DateTime.now().subtract(const Duration(days: 5));
      final model = BiodataModel(nama: 'Test', tanggalMulaiBerhentiMerokok: tanggal);
      expect(model.hariBerhenti, 5);
    });
  });
}
```

### Referensi

- `dart-add-unit-test` skill untuk detail

## 2. Widget Test (WidgetTester)

### Aturan

- File test mengikuti struktur folder sumber di `lib/` dengan menempatkan test di `test/` yang **mirror struktur `lib/fitur/<fitur>/...`** (bukan flat di `test/` tanpa subfolder); DILARANG meletakkan semua test flat di `test/`.
- Gunakan `WidgetTester` dari `package:flutter_test`.
- Test rendering, tap, scroll, input text, navigasi.
- Bungkus widget dengan `ProviderScope` + `MaterialApp` + override provider.
- Gunakan `pumpWidget()`, `pumpAndSettle()`, `tap()`, `enterText()`.
- Nama berkas test: `<nama_file>_test.dart` (snake_case) yang menguji `<nama_file>.dart` di sumber.

```dart
// test/biodata_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:berhenti_merokok/app.dart';
import 'package:berhenti_merokok/fitur/biodata/dummy_data/biodata_dummy.dart';

void main() {
  testWidgets('should show biodata form when biodata is null', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [biodataProvider.overrideWithValue(AsyncValue.data(null))],
        child: const MaterialApp(home: BiodataScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Isi Biodata'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });
}
```

### Referensi

- `flutter-add-widget-test` skill untuk detail

## 3. Integration Test

### Aturan

- Gunakan `integration_test` package.
- Test flow utuh: onboarding → home → fitur spesifik.
- Hanya jalan di device/emulator (bukan web-only).
- File di `integration_test/` (bukan `test/`).

```dart
// integration_test/app_flow_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:berhenti_merokok/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('complete onboarding flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Isi biodata
    await tester.enterText(find.byKey(Key('namaField')), 'Test User');
    await tester.tap(find.byKey(Key('simpanBtn')));
    await tester.pumpAndSettle();

    // Verify home screen
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
```

### Referensi

- `flutter-add-integration-test` skill untuk detail

## 4. Mocktail Mock Manual (tanpa codegen)

### Aturan

- **Semua test di semua proyek WAJIB menggunakan `package:mocktail`** (permintaan eksplisit pengguna sesi 30, cakupan semua proyek, berbasis commit `admin_wifi` `ea39344`).
- Jika kode bergantung pada repository/service eksternal, **WAJIB** gunakan `package:mocktail` dengan kelas mock manual `class MockX extends Mock implements X {}`; jangan lewati hanya karena override provider.
- `package:mocktail` wajib tercantum pada `dev_dependencies` (`mocktail: ^1.0.5`; tercantum di `share_global_saya` sejak 2026-11-16 dan di `admin_wifi` sejak 2026-11-18) sebelum file mock dibuat; tambahkan memakai `flutter pub add --dev mocktail` (skill `aturan-pubspec`) bila belum ada.
- Mock repository/service, **BUKAN** Notifier/Provider (override provider langsung melalui `ProviderScope`/`ProviderContainer`).
- `class MockX extends Mock implements X {}` ditulis di `test/mocks.dart` (bukan di file `*_test.dart`); `test/mocks.dart` bukan file test sehingga tidak dijalankan langsung oleh `flutter test`.
- Dummy data dari `lib/fitur/*/dummy_data/`.
- Stub dengan `when(() => mock.metode()).thenAnswer(...)`/`thenReturn(...)`; `registerFallbackValue` untuk tipe non-nullable custom bila diperlukan; `verify(() => mock.metode())` dan `verifyNever(...)` untuk verifikasi interaksi.

```dart
// test/mocks.dart
import 'package:mocktail/mocktail.dart';

// Sesuaikan X dengan tipe repository/service yang di-mock.
class MockX extends Mock implements X {}
```

Implementasi nyata `test/mocks.dart` di `share_global_saya` (pola dari commit `e43255b`):

```dart
// Template mock manual memakai `package:mocktail` (tanpa codegen).
// Berkas ini BUKAN file test (bukan `*_test.dart`) sehingga tidak dijalankan
// oleh `flutter test`; import dari file test dengan `import 'mocks.dart';`.
//
// Cara pakai:
//   1. Pastikan `mocktail` ada di `dev_dependencies`.
//   2. Buat kelas mock manual untuk repository/service yang ingin di-mock:
//
//        import 'package:mocktail/mocktail.dart';
//
//        class MockXxx extends Mock implements Xxx {}
//
//   3. Stub dengan `when(() => mock.metode()).thenAnswer((_) async => ...);`
//      dan verifikasi dengan `verify(() => mock.metode()).called(1);`.
//
// Catatan: kelas dengan hanya static method (mis. `SharedPrefService`,
// `ParserUtil`, `L`) TIDAK bisa di-mock dengan mocktail; abstraksikan ke
// kelas/instance eksternal bila perlu di-mock.
```

```dart
// test/contoh_repository_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  test('repository dipanggil dengan argumen yang benar', () async {
    final mock = MockX();
    when(() => mock.ambilSemua()).thenAnswer((_) async => <Item>[]);

    final hasil = await panggilAlur(mock);

    expect(hasil, isEmpty);
    verify(() => mock.ambilSemua()).called(1);
  });
}
```

### Checklist

- [ ] `mocktail` tercantum di `dev_dependencies` submodule yang bersangkutan.
- [ ] Kelas mock manual ada di `test/mocks.dart`, bukan di dalam `*_test.dart`.
- [ ] Kelas mock manual ada di `test/mocks.dart`, bukan di dalam `*_test.dart`.
- [ ] Tidak ada artefak `*.mocks.dart` hasil generate yang menjadi sumber mock test (mock dibuat manual via mocktail).
- [ ] Notifier/Provider di-override langsung, tidak di-mock.
- [ ] Stub default ditetapkan (`when`) agar tidak ada `NoSuchMethodError` dari pemanggilan tak ter-stub.

### Referensi

- `hasil_diskusi/diskusi_5.md` (K-5, R-1; sesi 158)
- `package:mocktail` (https://pub.dev/packages/mocktail)

## 5. Test Organization & Dummy Data

### Aturan

- Dummy data di `lib/fitur/<fitur>/dummy_data/` (bukan di test/).
- Import dummy data di test: `import 'package:berhenti_merokok/fitur/biodata/dummy_data/biodata_dummy.dart';`
- Satu file test per unit/widget yang diuji.
- Group test by fitur/class.

## 6. Build Runner untuk Codegen

### Aturan

- **WAJIB** jalankan `dart run build_runner build --delete-conflicting-outputs` setelah:
  - Ubah model Freezed (`.freezed.dart`)
  - Ubah Riverpod Notifier (`.g.dart`)
- Jangan edit file `.g.dart` / `.freezed.dart` manual.
- CI akan jalanin build_runner otomatis.

```bash
# Local development
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto rebuild)
dart run build_runner watch --delete-conflicting-outputs
```

### Referensi Commit

- `3b67d309` — Freezed models + Riverpod generator

## 7. Coverage

### Aturan

- Target coverage minimal 80% untuk logic bisnis.
- Gunakan `flutter test --coverage` lalu `genhtml coverage/lcov.info -o coverage/html`.
- Exclude generated files, main.dart, dummy data dari coverage.

### Referensi

- `dart-collect-coverage` skill untuk detail

## 8. Static Analysis

### Aturan

- **WAJIB** `flutter analyze` clean (no warnings/errors) sebelum commit.
- Jalankan `dart fix --apply` untuk fix otomatis lint mechanical.
- Config di `analysis_options.yaml`.

```bash
flutter analyze
dart fix --apply
```

### Referensi

- `dart-run-static-analysis` skill untuk detail

## 9. Larangan Testing

- **DILARANG** test logic di widget test (pisahkan ke unit test).
- **DILARANG** `pumpWidget` tanpa `ProviderScope` + override.
- **DILARANG** mock Notifier/Provider → override provider.
- **DILARANG** test bergantung urutan (gunakan `setUp`/`tearDown`).
- **DILARANG** hardcode delay (`await Future.delayed`) → gunakan `pumpAndSettle`.

## Referensi Aturan Sumber

- `aturan_bersama.md` — Tests flat di test/, web only, build APK CI only
- `flutter-add-widget-test` skill
- `flutter-add-integration-test` skill
- `dart-add-unit-test` skill
- `dart-collect-coverage` skill
- `dart-run-static-analysis` skill
- `hasil_diskusi/diskusi_5.md` (K-5, R-1; sesi 158) — mocktail menggantikan alat mock lama; `dart-generate-test-mocks` tidak diikuti untuk proyek ini
- Commit `share_global_saya` `e43255bd56b4eaba6b7629d749582be96dcd2527` (`test/mocks.dart` template mock manual mocktail, `mocktail: ^1.0.5` pada `dev_dependencies`, `pubspec.lock` diperbarui)
- Permintaan eksplisit pengguna sesi 30 (2026-11-18; "semua test wajib pakai mocktail", cakupan semua proyek); commit submodule `admin_wifi` `ea39344` (2026-11-18, pengguna; konversi `test/services/notifikasi_servis_test.dart` ke mocktail, `test/mocks.dart`, penghapusan `test/services/notifikasi_servis_test.mocks.dart` dan `test/helpers/test_helpers.mocks.dart` yang tidak dikerjakan sesi 30); commit root `b0d5b45` (gitlink `admin_wifi`)


===== .agents/skills/audit-riwayat-sesi/SKILL.md =====
---
name: audit-riwayat-sesi
description: Trigger: saat mengaudit riwayat sesi | Panduan audit manual dan inkremental terhadap `memori/sesi/`, `MEMORI.md`, dan `memori/riwayat_perubahan.md`: inventarisasi berkas sesi + ledger (mtime + jumlah baris) di `audit/riwayat_sesi.md`, ekstraksi sinyal (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`) dengan verifikasi manual, agregasi frekuensi lintas sesi (ambang ≥3 sesi), klasifikasi A/B/C, dan rekomendasi perbaikan sistem tertulis; read-only dengan satu pengecualian append section baru ke `audit/riwayat_sesi.md`; berkas sesi tidak diubah, dihapus, atau dikompresi. Referensi: `.kilo/commands/audit_riwayat_sesi.md`, `hasil_diskusi/diskusi_10.md`. Audit Riwayat Sesi Prosedur audit portabel lintas proyek dengan `MEMORI.md` untuk mendeteksi kesalahan/kegagalan yang sering terulang pada riwayat sesi (`memori/sesi/sesi_*.md`), mengklasifikasikan kebutuhan perbaikannya, dan mencatat hasil ke `audit/riwayat_sesi.md`. Audit bersifat **read-o
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 18:58 WIB"
---

# Audit Riwayat Sesi

Prosedur audit portabel lintas proyek dengan `MEMORI.md` untuk mendeteksi kesalahan/kegagalan yang sering terulang pada riwayat sesi (`memori/sesi/sesi_*.md`), mengklasifikasikan kebutuhan perbaikannya, dan mencatat hasil ke `audit/riwayat_sesi.md`. Audit bersifat **read-only** dengan satu pengecualian: append section baru ke `audit/riwayat_sesi.md`. Audit bersifat **inkremental** (berdasarkan ledger) dan **tidak memperbaiki otomatis** — tindak lanjut hanya rekomendasi tertulis.

## Cakupan yang Di-Cover

- Berkas yang diproses: `memori/sesi/sesi_*.md` yang belum tercatat di ledger atau yang berubah (mtime/jumlah baris).
- Konteks agregasi (selalu dibaca): `MEMORI.md`, `memori/riwayat_perubahan.md`.
- Berkas yang boleh ditulis: `audit/riwayat_sesi.md` (append section baru; section lama dipertahankan).
- Sumber data: hanya berkas memori; git log **tidak** digunakan.
- Referensi: `.kilo/commands/audit_riwayat_sesi.md`, `hasil_diskusi/diskusi_10.md` (K-1 s.d. K-13, R-1 s.d. R-6), `.agents/skills/cek-kesehatan-sistem-kerja/SKILL.md` (pola skill read-only), `.agents/skills/memori-check/SKILL.md` (alur sesi).
- Sumber perencanaan: `hasil_diskusi/diskusi_10.md`.

## Aturan

1. Perlakukan audit sebagai pemeriksaan **read-only**: kumpulkan bukti dari berkas aktual; jangan membuat, mengubah, atau menghapus berkas apa pun selain append section baru ke `audit/riwayat_sesi.md`.
2. Simpan penanda "sudah diaudit" **hanya** di ledger `audit/riwayat_sesi.md` — bukan di dalam berkas sesi; berkas sesi tidak diubah oleh audit.
3. Lewati penuh berkas sesi yang cocok dengan ledger **dan** mtime **serta** jumlah baris-nya sama; proses berkas yang belum tercatat di ledger atau yang mtime/jumlah barisnya berbeda.
4. Catat mtime dan jumlah baris **pada saat audit** ke ledger; berkas dilewati hanya bila keduanya sama.
5. mtime dapat berubah tanpa konten berubah (mis. berkas tersentuh); bila meragukan, baca ulang berkas untuk verifikasi sebelum melewatinya — tetapi berkas yang sudah diaudit tidak boleh dianalisis ulang sepenuhnya tanpa alasan.
6. Berkas yang tercatat di ledger tetapi sudah tidak ada di folder → catat sebagai temuan `berkas hilang`, bukan sebagai "sudah diaudit".
7. Sumber data hanya berkas memori (`memori/sesi/`, `MEMORI.md`, `memori/riwayat_perubahan.md`); jangan memakai git log.
8. Ekstraksi sinyal hanya untuk berkas yang diproses; pindai kata kunci (`ambigu`, `tabrakan`, `tidak disentuh`, `dilaporkan`, `Belum Sinkron`, `belum di-commit`, `melanggar`, `menunggu keputusan`) lalu verifikasi manual dengan membaca berkas (mencegah false positive).
9. Agregasi frekuensi lintas **sesi berbeda** (bukan jumlah baris/kemunculan dalam satu sesi). Untuk berkas yang dilewati, kemunculan dihitung dari catatan audit sebelumnya di `audit/riwayat_sesi.md`; ambang "sering terulang" (≥3 sesi) dihitung dari gabungan catatan lama + temuan baru.
10. Klasifikasikan setiap pola ke: **(A)** kesalahan insidental sekali jadi; **(B)** pola berulang (≥3 sesi) → kandidat perbaikan sistem (aturan/skill/command/instruksi); **(C)** kerusakan arsip/rujukan yatim.
11. Rekomendasikan tindakan konkret per pola kategori B/C; tindak lanjut hanya rekomendasi tertulis di sesi; perbaikan dieksekusi lewat sesi terpisah atas persetujuan pengguna.
12. Perbarui `audit/riwayat_sesi.md` dengan pola **append per audit**: setiap audit menambahkan section baru bernomor berurutan (mis. `## Audit 2026-11-15 (sesi 117)`) berisi ringkasan, tabel pola, klasifikasi A/B/C, rekomendasi, dan daftar berkas yang diaudit beserta mtime + jumlah baris; section lama tidak dihapus/ditimpa.
13. Berkas sesi yang sudah diaudit **tetap diarsipkan permanen** di `memori/sesi/`; tidak dihapus, tidak dikompresi, dan tidak diubah; ukuran berkas kecil sehingga penghematan ruang tidak berarti.
14. Bila mtime tidak dapat diperoleh, catat `tidak tersedia` pada kolom mtime dan sampaikan sebagai keterbatasan; jangan mengarang nilai.
15. Jangan mengarang frekuensi/temuan; setiap temuan wajib didukung bukti dari berkas yang diproses atau catatan audit sebelumnya.
16. Gunakan tool baca yang sesuai (`read`, `glob`, `grep`) dan hindari operasi yang mengubah state.

### Format Ledger dan Section (presisi)

`audit/riwayat_sesi.md` memuat: (1) H1 + pengantar singkat; (2) format header/konvensi; (3) section-section audit (satu per run); di dalam section terdapat ledger tabel:

```markdown
| Sesi    | Tanggal audit | mtime                        | Jumlah baris |
| ------- | ------------- | ---------------------------- | ------------ |
| sesi_81 | 2026-11-15    | Sun Nov 14 2026 09:12:33 WIB | 128          |
```

Kolom wajib:

- `Sesi` — nama berkas tanpa `.md` (mis. `sesi_81`).
- `Tanggal audit` — tanggal Jakarta audit dijalankan (`YYYY-MM-DD`).
- `mtime` — waktu modifikasi berkas sesi (atau `tidak tersedia`).
- `Jumlah baris` — jumlah baris berkas sesi pada saat audit.

Deteksi perubahan: berkas dilewati hanya bila `mtime` **dan** `Jumlah baris` identik dengan ledger; jika salah satunya berbeda, berkas diproses ulang.

Contoh section append:

```markdown
## Audit 2026-11-15 (sesi 117)

### Ringkasan

- Berkas diproses: 2; dilewati: 115; berkas hilang: 0.

### Tabel Pola

| Masalah                                   | Sesi kemunculan    | Frekuensi | Klasifikasi | Rekomendasi                                                   |
| ----------------------------------------- | ------------------ | --------- | ----------- | ------------------------------------------------------------- |
| Tabrakan penomoran sesi paralel (sesi_81) | sesi 87, 89, 90, … | ≥3 sesi   | B           | Usulkan aturan eskalasi + keputusan pengguna di sesi terpisah |

### Daftar Berkas yang Diaudit

| Sesi    | Tanggal audit | mtime | Jumlah baris |
| ------- | ------------- | ----- | ------------ |
| sesi_81 | 2026-11-15    | …     | …            |
```

## Steps

1. **Muat konteks**: baca `AGENTS.md`, `MEMORI.md`, dan `memori/riwayat_perubahan.md`; muat skill `memori-check`.
2. **Inventarisasi**: baca `audit/riwayat_sesi.md` (ledger); kumpulkan daftar `memori/sesi/sesi_*.md`; peroleh mtime + jumlah baris tiap berkas.
3. **Tentukan diproses vs dilewati** (aturan 3–6).
4. **Ekstraksi sinyal** untuk berkas yang diproses (aturan 8); verifikasi manual.
5. **Agregasi frekuensi** (aturan 9): gabungkan catatan audit lama dari `audit/riwayat_sesi.md` dengan temuan baru.
6. **Klasifikasikan** setiap pola (A/B/C) dan susun **rekomendasi** untuk kategori B/C (aturan 10–11).
7. **Append section** ke `audit/riwayat_sesi.md` (format pada bagian Aturan) dan sampaikan laporan di sesi.
8. **Verifikasi akhir**: section baru terbaca; tidak ada berkas lain yang berubah.

## Larangan

- DILARANG mengubah berkas apa pun selain append ke `audit/riwayat_sesi.md`.
- DILARANG memperbaiki temuan audit secara otomatis.
- DILARANG mengubah berkas `memori/sesi/*.md` (termasuk penandaan di dalamnya), `MEMORI.md`, `memori/riwayat_perubahan.md`, indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), skill, command, aturan, `task.md`, atau kode sumber.
- DILARANG menghapus, mengompres, atau mengubah sesi yang sudah diaudit.
- DILARANG menganalisis ulang penuh berkas yang dilewati tanpa alasan (mis. keraguan mtime harus diselesaikan dengan membaca ulang untuk verifikasi, bukan analisis ulang).
- DILARANG memakai git log sebagai sumber data audit.
- DILARANG mengarang frekuensi/temuan; temuan tanpa bukti tidak boleh dilaporkan.
- DILARANG commit/push.

## Contoh Benar

```text
Ledger dibaca: 114 sesi tercatat. Inventarisasi: 117 berkas.
Dilewati (mtime + baris sama): 115 berkas.
Diproses: sesi_116 (baru), sesi_117 (baru).
Agregasi: pola "tabrakan penomoran sesi (sesi_81)" muncul di ≥20 sesi → Klasifikasi B → rekomendasi: keputusan pengguna di sesi terpisah.
Append section "## Audit 2026-11-15 (sesi 117)" ke audit/riwayat_sesi.md.
Laporan di sesi; tidak ada berkas lain yang berubah.
```

```text
Berkas tercatat di ledger tetapi hilang dari memori/sesi/ → temuan "berkas hilang: sesi_70" → klasifikasi C → rekomendasi investigasi di sesi terpisah.
```

## Contoh Salah

```text
Saya menemukan sesi_81 bermasalah, jadi langsung saya hapus dari memori/sesi/.
```

```text
Saya analisis ulang seluruh 117 sesi dari nol meski ledger mencatat 115 berkas sudah diaudit dan tidak berubah.
```

```text
Saya memakai git log untuk menghitung frekuensi pola.
```

```text
Saya perbaiki rujukan yatim di MEMORI.md dan skill memori-check saat audit.
```

```text
## Audit 2026-11-15 (sesi 117)
(menghapus section audit lama karena kepanjangan — section lama wajib dipertahankan)
```


===== .agents/skills/boilerplate/SKILL.md =====
---
name: boilerplate
description: 'Trigger: saat membuat kode boilerplate atau pola kode berulang yang siap pakai | Panduan boilerplate: pola kode berulang (widget, notifier, model, layar) yang konsisten dengan aturan proyek, dengan contoh benar/salah dan rujukan ke skill terkait (struktur-class-ui, struktur-folder-lib, aturan-riverpod, model-state-freezed-abstract).'
---

# Skill: boilerplate

Panduan pembuatan boilerplate (kode berulang yang siap pakai) agar konsisten dengan aturan dan konvensi proyek.

## Aturan

1. Boilerplate WAJIB mengikuti aturan yang berlaku: `struktur-class-ui`, `struktur-folder-lib`, `aturan-riverpod`, `model-state-freezed-abstract`, `penamaan-konvensi`, `gaya`, `spacing`, `tipografi`.
2. Boilerplate WAJIB memakai bahasa Indonesia untuk identifier yang didefinisikan aplikasi (variable, method, class, enum, table, column) — lihat `penamaan-konvensi`.
3. Boilerplate WAJIB memakai impor material `package:material_ui/material_ui.dart` dan utilitas shared lewat `package:share_global_saya/core_shared.dart` (bukan impor individu).
4. Boilerplate widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state; parameter `final` + constructor `const`; `build` pure; aman light/dark mode.
5. Hierarki method dari atas ke bawah: method helper privat aksi (nama diawali `_`, mengembalikan `void`) di atas `build`; `build` di atas method helper widget (mengembalikan `Widget`); method helper non-widget pengembali nilai (`Color`, `String`, `int`, `bool`) di paling bawah kelas. `build` WAJIB pure (tanpa side-effect, tanpa baca provider langsung).
6. Boilerplate notifier Riverpod berbasis codegen WAJIB mengembalikan state immutable Freezed di `build()`; reload via `AsyncValue.data(await _ambilSemua())` + `catch (e, s)` + `L.e(...)` + `rethrow`; nama provider = nama class tanpa akhiran `Notifier` (camelCase).
7. Boilerplate model database WAJIB Freezed (`abstract class` + `const factory`), `id` non-nullable disuplai pemanggil, parsing lewat `ParserUtil`, key DB lewat `XxxSkema`, tulis UTC baca lokal.
8. Boilerplate DILARANG memuat log narasi tanpa nilai aktual dan banner/separator.
9. Boilerplate DILARANG memakai operator `!` untuk nullable; gunakan type promotion via variabel lokal (lihat `type-promotion-null-safety`).
10. Boilerplate DILARANG memakai `package:flutter/material.dart`; wajib `package:material_ui/material_ui.dart`.

## Contoh Benar

```dart
// path: lib/fitur/contoh/screens/contoh_screen.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:share_global_saya/core_shared.dart';

class ContohScreen extends ConsumerStatefulWidget {
  const ContohScreen({super.key});

  @override
  ConsumerState<ContohScreen> createState() => _ContohScreenState();
}

class _ContohScreenState extends ConsumerState<ContohScreen> {
  void _muatUlang() {
    ref.refresh(contohProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(contohProvider);
    if (asyncState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (asyncState.hasError) {
      return _buildError(
        'Gagal memuat: ${asyncState.error}',
        () => ref.refresh(contohProvider),
      );
    }
    final data = asyncState.requireValue;
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh')),
      body: Center(child: Text(data.nama)),
    );
  }

  Widget _buildError(String pesan, VoidCallback onRetry) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const Icon(Icons.error_outline),
            Text(pesan),
            FilledButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
```

## Contoh Salah

```dart
import 'package:flutter/material.dart'; // DILARANG: deprecated

class ContohScreen extends StatefulWidget {
  @override
  State<ContohScreen> createState() => _ContohScreenState();
}

class _ContohScreenState extends State<ContohScreen> {
  @override
  Widget build(BuildContext context) {
    // helper privat di bawah build — DILARANG
    return const SizedBox.shrink();
  }

  void _muatUlang() {
    // DILARANG: method helper privat di bawah build
  }
}
```

===== .agents/skills/bug-runtime/SKILL.md =====
---
name: bug-runtime
description: "Trigger: saat mencegah bug runtime Flutter | Indeks skill spesifik: type-promotion-null-safety, penanganan-async, penanganan-error-unawaited, validasi-platform-izin, exception-khusus-deteksi-error. Indeks Pencegahan Bug Runtime Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap topik pencegahan bug runtime. Jangan menduplikasi isi skill spesifik di sini. Cakupan yang Di-Cover - Package: `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:flutter` (class `DateTime`, `Timer`) - Class: `AsyncValue`, `DateTime`, `Timer`, `Exception`, `ImpianProgresHelper`, `BiodataModel` - Method: `AsyncValue.requireValue()`, `AsyncValue.asData?.value`, `ref.watch()`, `ref.refresh()`, `DateTime.normalize()`, `Timer.periodic()`, `Timer.cancel()` Aturan 1. Untuk implementasi detail, buka skill spesifik yang tercantum di tabel di bawah. 2. Untuk code review, periksa apakah kode mengikuti aturan dari sk"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Indeks Pencegahan Bug Runtime

Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap topik pencegahan bug runtime. Jangan menduplikasi isi skill spesifik di sini.

## Cakupan yang Di-Cover

- Package: `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:flutter` (class `DateTime`, `Timer`)
- Class: `AsyncValue`, `DateTime`, `Timer`, `Exception`, `ImpianProgresHelper`, `BiodataModel`
- Method: `AsyncValue.requireValue()`, `AsyncValue.asData?.value`, `ref.watch()`, `ref.refresh()`, `DateTime.normalize()`, `Timer.periodic()`, `Timer.cancel()`

## Pemetaan Topik → Skill Teknis

| Topik bug runtime                             | Skill teknis yang wajib dimuat |
| --------------------------------------------- | ------------------------------ |
| Type promotion / null safety pada field model | `type-promotion-null-safety`   |
| Normalisasi tanggal / perhitungan hari        | `normalisasi-tanggal`          |

| Penanganan state async & data kosong (satu atau beberapa provider) | `penanganan-async` |
| Future yang dilepas (unawaited) | `penanganan-error-unawaited` |
| Dukungan platform & izin runtime | `validasi-platform-izin` |
| Deteksi tipe error via exception khusus | `exception-khusus-deteksi-error` |

## Aturan

1. Untuk implementasi detail, buka skill spesifik yang tercantum di tabel di bawah.
2. Untuk code review, periksa apakah kode mengikuti aturan dari skill spesifik yang relevan.
3. Untuk onboarding, gunakan indeks ini untuk memahami lanskap pencegahan bug runtime, lalu pelajari setiap skill spesifik.
4. Sebelum implementasi atau code review terkait bug runtime, wajib memuat (via tool `skill`) skill teknis yang relevan berdasarkan tabel pemetaan di atas. Indeks ini hanya untuk menemukan skill teknis, bukan pengganti pemuatan isi skill teknis.

## Larangan

- JANGAN menyalin isi skill spesifik ke skill indeks ini.
- JANGAN menambahkan contoh kode detail di skill indeks ini (contoh ada di skill spesifik).
- JANGAN membuat aturan baru di skill indeks ini yang seharusnya ada di skill spesifik.

## Contoh Benar

```dart
// Rujuk ke skill spesifik untuk implementasi detail
// type promotion → lihat skill `type-promotion-null-safety`
final tanggalLahir = biodata?.tanggalLahir;
if (tanggalLahir == null) {
  return 'Belum dipilih';
} // type promotion berlaku di sini

// normalisasi tanggal → dihapus (skill dihapus)
final hariIniDate = DateTime(hariIni.year, hariIni.month, hariIni.day);

// AsyncValue handling → lihat skill `penanganan-async-data-kosong`
if (dataAsync.isLoading) return const _LoadingView();
if (dataAsync.hasError) return _ErrorRetry(onRetry: () => ref.refresh(provider));
final data = dataAsync.requireValue;
```

## Contoh Salah

```dart
// Jangan menyalin isi skill spesifik ke sini
// Jangan menambahkan contoh kode detail di skill indeks

// SALAH: requireValue tanpa handle loading/error
final state = ref.watch(provider).requireValue;

// SALAH: Tanggal tanpa normalisasi
final totalHari = DateTime.now().difference(tanggalBerhenti).inDays + 1;
```


===== .agents/skills/build-apk-github-workflow/SKILL.md =====
---
name: build-apk-github-workflow
description: Trigger: saat membangun APK Android release atau memperbarui proses build APK | Panduan build APK release via GitHub Actions workflow (bukan build lokal): prasyarat `gh` terautentikasi dengan scope `workflow`, proyek wajib memiliki `.github/workflows/build-apk.yml`, konfigurasi tetap `--split-per-abi --target-platform android-arm64`, pemicuan `gh workflow run`, pemantauan `gh run watch --exit-status`, pengunduhan artefak `app-release-apk`, dan verifikasi berkas `<proyek>-arm64-v8a-release.apk`. Termasuk larangan build lokal tanpa Android SDK, perubahan flag tanpa perintah pengguna, dan commit direktori `build/`. Build APK via GitHub Actions Workflow Membangun APK Android `release` (split per ABI, hanya `android-arm64`) melalui GitHub Actions workflow, bukan melalui `flutter build apk` lokal, agar tidak bergantung pada Android SDK di mesin pengembang. Cakupan yang Di-Cover - Berkas workflow: `<proyek>/.github/workflows/build-apk.yml` - Perintah GitHub CLI: `gh workflow run`, `gh run list`, `gh run watch`, `gh 
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Thu Nov 19 2026 23:35 WIB"
---

# Build APK via GitHub Actions Workflow

Membangun APK Android `release` (split per ABI, hanya `android-arm64`) melalui GitHub Actions workflow, bukan melalui `flutter build apk` lokal, agar tidak bergantung pada Android SDK di mesin pengembang.

## Cakupan yang Di-Cover

- Berkas workflow: `<proyek>/.github/workflows/build-apk.yml`
- Perintah GitHub CLI: `gh workflow run`, `gh run list`, `gh run watch`, `gh run download`
- Artefak: `app-release-apk`
- Berkas output: `<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk`
- Command terkait: `.kilo/commands/build_apk.md`

## Aturan

1. Pastikan `gh` terpasang dan terautentikasi dengan scope `workflow` sebelum memicu build (`gh auth status`).
2. Proyek target wajib memiliki `pubspec.yaml`, folder `android/`, dan `.github/workflows/build-apk.yml`; bila salah satu tidak ada, **STOP** dan laporkan.
3. Konfigurasi build pada workflow wajib tetap `flutter build apk --release --split-per-abi --target-platform android-arm64`.
4. Workflow wajib mengganti nama berkas hasil dari `app-arm64-v8a-release.apk` menjadi `<nama_proyek>-arm64-v8a-release.apk` sebelum mengunggah artefak.
5. Artefak wajib diunggah dengan nama `app-release-apk` (path: `build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk`, retention 14 hari).
6. Pemicuan build wajib melalui `gh workflow run build-apk.yml` (workdir = folder proyek), lalu tunggu penyelesaian dengan `gh run watch <RUN_ID> --exit-status`.
7. Pengambilan `RUN_ID` wajib dari `gh run list --workflow=build-apk.yml --limit=1` setelah jeda singkat (mis. `sleep 5`) agar run baru terdaftar.
8. Bila `gh run watch` gagal (exit non-nol), **STOP**, laporkan galat workflow apa adanya, dan jangan mengunduh artefak.
9. Pengunduhan artefak wajib melalui `gh run download <RUN_ID> --name app-release-apk --dir <proyek>/build/app/outputs/flutter-apk`.
10. Setelah pengunduhan, pindahkan (bukan salin) APK ke folder `apk/` di root proyek (mis. `mv`/`install`) agar berkas lama tidak tersisa, lalu verifikasi berkas dengan tool `glob` dan laporkan path absolut serta ukuran (`stat -c%s`).
11. Bila terdapat lebih dari satu proyek Flutter (submodule) yang dapat di-build, tanyakan repo target kepada pengguna sebelum menjalankan workflow.
12. Sebelum memicu workflow, periksa kompatibilitas versi Java (runner default) dengan Gradle yang dipakai (gradle-wrapper.properties / workflow); peringatkan bila tidak kompatibel.
13. Saat memeriksa prasyarat berkas (mis. `.github/workflows/build-apk.yml`), verifikasi path secara langsung (tool `read`/`glob` absolut) selain mengandalkan glob relatif; jangan menyimpulkan berkas tidak ada tanpa verifikasi langsung, terutama pada folder hidden (`.github`, `.kilo`, `.agents`).

## Masalah Umum dan Solusi

- **`androidx.core:core` memerlukan `compileSdk` 37**: naikkan `compileSdk` di `android/app/build.gradle.kts` ke `37` (dependensi membutuhkan API 37); `flutter.compileSdkVersion` (36) tidak cukup.
- **AGP/Kotlin/Gradle tidak kompatibel**: gunakan AGP 9.1.0 + Kotlin 2.4.0 + Gradle 9.3.1, atau AGP 8.13.0 + Gradle 8.14.3 + Kotlin 2.3.20 sesuai kebutuhan; periksa `gradle-wrapper.properties` dan `settings.gradle.kts`.
- **`kotlinOptions` deprecated**: migrasikan ke `kotlin { compilerOptions { jvmTarget.set(...) } }`.
- **Java version mismatch**: set `sourceCompatibility`/`targetCompatibility` ke `JavaVersion.VERSION_17` dan `jvmTarget` ke `JVM_17`.
- **AGP 9.x new DSL**: tambahkan `android.newDsl=false` dan `android.builtInKotlin=false` di `gradle.properties` agar DSL lama tetap berjalan.
- **`flutter_local_notifications` butuh desugaring**: aktifkan `isCoreLibraryDesugaringEnabled = true` dan tambahkan `coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")`.
- **`.gitignore`**: tambahkan `/apk/` dan `/build/` agar artefak hasil build tidak ter-track dan tidak menyebabkan push gagal.
- **APK tidak muncul di IDE**: folder `build/` diabaikan oleh `.gitignore`; gunakan terminal (`ls`/`stat`) untuk verifikasi, jangan ubah `.gitignore` hanya untuk menampilkan.

- DILARANG menjalankan `flutter build apk` lokal sebagai jalur utama bila mesin tidak memiliki Android SDK; gunakan workflow GitHub.
- DILARANG mengubah flag build di luar `--release --split-per-abi --target-platform android-arm64` tanpa perintah eksplisit pengguna.
- DILARANG mengubah kode sumber, `pubspec.yaml`, konfigurasi Gradle/manifest, atau berkas workflow tanpa perintah eksplisit pengguna.
- DILARANG memindahkan, mengganti nama, mengunggah, atau menginstal APK hasil tanpa perintah eksplisit pengguna.
- DILARANG commit/push, termasuk direktori `build/`.
- DILARANG mengarang path atau ukuran APK tanpa verifikasi tool `glob`/`stat`.

## Contoh Benar

```bash
# Workdir = folder proyek target
gh workflow run build-apk.yml
sleep 5
RUN_ID=$(gh run list --workflow=build-apk.yml --limit=1 --json databaseId -q '.[0].databaseId')
gh run watch "$RUN_ID" --exit-status
gh run download "$RUN_ID" --name app-release-apk --dir build/app/outputs/flutter-apk
```

```text
# Verifikasi hasil (via tool glob)
<proyek>/build/app/outputs/flutter-apk/<nama_proyek>-arm64-v8a-release.apk
```

## Contoh Salah

```bash
# DILARANG: build lokal pada mesin tanpa Android SDK
flutter build apk --release --split-per-abi --target-platform android-arm64
```

```text
# DILARANG: mengarang path/ukuran APK tanpa verifikasi glob/stat
APK size: 18000000 bytes
```


===== .agents/skills/build-runner-codegen/SKILL.md =====
---
name: build-runner-codegen
description: "Trigger: saat menjalankan atau memperbaiki proses code generation build_runner (Freezed, Riverpod, mock, JSON) | Panduan eksekusi build_runner: direktori paket, perintah build/watch, larangan edit berkas hasil generate, penanganan konflik output, dan pembatasan keluaran dengan --build-filter. Aturan: jalankan dari direktori proyek/paket yang memiliki pubspec.yaml; setelah ubah sumber codegen atau pull yang mengubah hasil generate, jalankan dart run build_runner build; gunakan watch saat pengembangan dan build untuk sekali jalan; ubah hanya berkas sumber, *.g.dart, *.freezed.dart, *.mocks.dart dilarang diedit manual; jika output bentrok, hapus berkas hasil generate bentrok/terkait lalu jalankan ulang tanpa filter; jalankan pada paket terdampak; dengan --build-filter gunakan glob berkas hasil generate valid, bukan path berkas sumber; dilarang --build-filter saat ada berkas hasil generate terlacak git di luar filter karena dianggap conflicting dan dihapus; --delete-conflicting-outputs sudah dihapus dan diabaikan"
---

# Skill: build-runner-codegen

Panduan ringkas menjalankan `build_runner` untuk code generation pada proyek/paket Dart atau Flutter.

## Cakupan yang Di-Cover

- Eksekusi `dart run build_runner build` dan mode `watch`.
- Pemicu umum: Freezed, anotasi Riverpod (`@riverpod`/`@Riverpod`), `@GenerateMocks`, `@JsonSerializable`, atau pull yang mengubah berkas hasil generate.
- Larangan mengubah berkas hasil generate (`*.g.dart`, `*.freezed.dart`, `*.mocks.dart`).
- Penanganan output bentrok dan pembatasan keluaran dengan `--build-filter`.

## Aturan

1. Jalankan perintah dari direktori proyek/paket yang memiliki `pubspec.yaml` (mis. `cd <direktori-proyek>`).
2. Setelah ubah/menambah sumber codegen atau setelah pull yang mengubah berkas hasil generate, jalankan `dart run build_runner build`.
3. Gunakan `watch` hanya saat pengembangan; gunakan `build` untuk sekali jalan.
4. Ubah hanya berkas sumber; `*.g.dart`, `*.freezed.dart`, `*.mocks.dart` DILARANG diedit manual.
5. Jika output bentrok, hapus berkas hasil generate yang bentrok/terkait lalu jalankan ulang tanpa filter.
6. Jalankan `build_runner` pada paket terdampak; bila perlu membatasi keluaran, gunakan `--build-filter` dengan glob berkas hasil generate yang valid (bukan argumen path berkas sumber).
7. DILARANG menjalankan `build_runner` dengan `--build-filter` saat ada berkas hasil generate terlacak git yang TIDAK masuk filter — berkas di luar filter dianggap "conflicting" dan DIHAPUS oleh build_runner. Insiden 2026-11-18: dengan `--build-filter` hanya untuk 11 berkas `lib/model/*.freezed.dart`, berkas `pelanggan_aktif_state.freezed.dart`, `pengguna_aktif_notifier.g.dart`, dan 8 berkas `*_test.mocks.dart` (semuanya terlacak git) ikut terhapus dan harus dipulihkan dari HEAD dengan `git checkout --`. `--build-filter` hanya boleh untuk output baru/lokal yang tidak menyentuh berkas terlacak; setelah build dengan filter, wajib verifikasi `git status` dan pulihkan penghapusan tak diinginkan via `git checkout -- <berkas>`.
8. Opsi `--delete-conflicting-outputs` sudah DIHAPUS dan diabaikan pada build_runner versi terkini (warning: "These options have been removed and were ignored").

## Contoh Benar

```bash
cd <direktori-proyek>
dart run build_runner build
```

```bash
# Membatasi keluaran ke berkas hasil generate tertentu (hanya untuk output
# baru/lokal yang TIDAK menyentuh berkas generated terlacak git; setelahnya
# wajib verifikasi `git status`)
dart run build_runner build \
  --build-filter="lib/kopi.g.dart" \
  --build-filter="lib/kopi.freezed.dart"
```

## Contoh Salah

```bash
# DILARANG: menjalankan di luar direktori paket (tanpa pubspec.yaml)
dart run build_runner build --delete-conflicting-outputs
```

```bash
# DILARANG: menunjuk berkas sumber sebagai argumen atau perintah tidak valid
dart run build_runner /lib/kopi.dart
```

```dart
// DILARANG: mengedit berkas hasil generate secara manual
// *.g.dart, *.freezed.dart, *.mocks.dart
```

```bash
# DILARANG: --build-filter saat ada berkas generated terlacak git di luar filter
# (berkas di luar filter dianggap "conflicting" dan DIHAPUS)
dart run build_runner build --build-filter="lib/model/kopi_model.freezed.dart"
```


===== .agents/skills/cek-kesehatan-sistem-kerja/SKILL.md =====
---
name: cek-kesehatan-sistem-kerja
description: Trigger: saat mengaudit kesehatan sistem kerja proyek (struktur, indeks skill, frontmatter skill, command, memori sesi, repositori, hasil diskusi) | Prosedur audit read-only untuk memeriksa konsistensi aset pendukung agen AI lintas proyek, mengklasifikasikan temuan GALAT/PERINGATAN, dan melaporkan hasil hanya di sesi tanpa mengubah berkas. Cek Kesehatan Sistem Kerja Prosedur audit portabel untuk memeriksa kesehatan sistem kerja proyek (aset pendukung agen AI: aturan, skill, command, memori, hasil diskusi, dan repositori). Audit bersifat **read-only** dan hasilnya dilaporkan hanya di sesi. Cakupan yang Di-Cover - Aset: struktur folder/berkas wajib, indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), metadata frontmatter `SKILL.md`, berkas command `.kilo/commands/**.md`, berkas sesi `memori/sesi/sesi_N.md`, kondisi repositori teramati (submodule, pointer, `.gitignore` vs working tree), dan penomoran/pencatatan `hasil_diskusi/diskusi_N.md`. - Keluaran: laporan temuan di sesi dengan tingkat `GALAT` dan `PER
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Cek Kesehatan Sistem Kerja

Prosedur audit portabel untuk memeriksa kesehatan sistem kerja proyek (aset pendukung agen AI: aturan, skill, command, memori, hasil diskusi, dan repositori). Audit bersifat **read-only** dan hasilnya dilaporkan hanya di sesi.

## Cakupan yang Di-Cover

- Aset: struktur folder/berkas wajib, indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), metadata frontmatter `SKILL.md`, berkas command `.kilo/commands/**.md`, berkas sesi `memori/sesi/sesi_N.md`, kondisi repositori teramati (submodule, pointer, `.gitignore` vs working tree), dan penomoran/pencatatan `hasil_diskusi/diskusi_N.md`.
- Keluaran: laporan temuan di sesi dengan tingkat `GALAT` dan `PERINGATAN`, tanpa berkas laporan baru.
- Referensi: `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`, `.agents/rules/global/format_hasil_diskusi.md`, skill `aturan-pembuatan-commands`, skill `aturan-pembuatan-skill`, skill `memori-check`.
- Sumber perencanaan: `hasil_diskusi/diskusi_8.md`.

## Aturan

1. Perlakukan audit sebagai pemeriksaan **read-only**: kumpulkan bukti dari berkas/struktur aktual, jangan membuat, mengubah, atau menghapus berkas apa pun.
2. Sesuaikan pemeriksaan dengan struktur aktual proyek (portabel lintas proyek); jangan mengasumsikan nama proyek, daftar skill, atau tata letak tertentu yang tidak terverifikasi.
3. Periksa tujuh aset secara berurutan: (1) struktur folder/berkas wajib, (2) konsistensi indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), (3) metadata frontmatter skill, (4) validasi command, (5) kesehatan memori sesi, (6) kesehatan repositori, (7) penomoran `hasil_diskusi/`.
4. Untuk setiap temuan, catat aset, tingkat, path/objek, bukti singkat, dan saran perbaikan; jangan mengarang temuan tanpa bukti.
5. Klasifikasikan temuan sebagai `GALAT` bila melanggar aturan/konsistensi dan berpotensi menyebabkan perilaku salah atau data tidak dapat dipercaya; sebagai `PERINGATAN` bila berupa potensi masalah, inkonsistensi minor, atau hal yang memerlukan konfirmasi.
6. Laporkan hasil hanya di sesi (ringkasan + tabel/daftar temuan + catatan keterbatasan); jangan menulis temuan ke `task.md` dan jangan membuat berkas laporan.
7. Gunakan tool baca yang sesuai (`read`, `glob`, `grep`) dan hindari operasi git yang mengubah state saat memeriksa repositori.
8. Sampaikan keterbatasan secara eksplisit bila berkas tidak dapat dibaca atau pemeriksaan tidak dapat diselesaikan.

## Steps

1. **Muat konteks**: baca `AGENTS.md`, `MEMORI.md`, dan muat skill relevan (`aturan-pembuatan-skill`, `aturan-pembuatan-commands`, `memori-check`) bila tersedia.
2. **Inventarisasi**: kumpulkan daftar berkas/folder untuk tujuh aset (struktur, indeks skill, folder skill, command, sesi memori, `.gitignore`/status git teramati, folder `hasil_diskusi/`).
3. **Periksa aset 1–7** berurutan:
   - Aset 1 (struktur): verifikasi keberadaan/keterbacaan berkas dan folder kunci yang dirujuk proyek.
   - Aset 2 (indeks skill `.agents/rules/kelompok_skill_wajib_*.md`): cocokkan entri dengan `SKILL.md` aktual dan deteksi entri yatim atau folder skill tak terindeks.
   - Aset 3 (frontmatter skill): validasi field wajib, segmen `Trigger:` pada `description`, dan kecocokan `name` dengan folder.
   - Aset 4 (command): validasi penamaan, frontmatter `description`, tautan markdown lokal yang keliru, dan rujukan target yang tidak ada.
   - Aset 5 (memori sesi): temukan sesi `Belum Sinkron` (di luar sesi aktif bila teridentifikasi), penomoran/penamaan tidak konsisten, atau status tidak jelas.
   - Aset 6 (repositori): catat anomali submodule/pointer/`.gitignore` vs working tree dari bukti yang tersedia tanpa mengubah state git.
   - Aset 7 (`hasil_diskusi/`): validasi penomoran `diskusi_N.md` dan keselarasan daftar/nomor tertinggi dengan `MEMORI.md`.
4. **Klasifikasikan** setiap temuan ke `GALAT` atau `PERINGATAN` dengan bukti.
5. **Susun laporan**: ringkasan jumlah temuan, tabel temuan (No, Aset, Tingkat, Path/Objek, Temuan, Saran), dan catatan keterbatasan.
6. **Sampaikan laporan** di sesi dan nyatakan audit selesai; jangan melakukan perbaikan otomatis.

## Larangan

- DILARANG membuat, mengubah, atau menghapus berkas apa pun sebagai bagian dari audit.
- DILARANG menulis temuan ke `task.md` atau membuat berkas laporan di root proyek.
- DILARANG menjalankan operasi git yang mengubah state (commit, push, checkout, reset, stash, add, restore tulis, dsb.).
- DILARANG mengarang hasil pemeriksaan; temuan tanpa bukti aktual tidak boleh dilaporkan sebagai fakta.
- DILARANG mengubah `MEMORI.md`, `memori/riwayat_perubahan.md`, `memori/sesi/*.md`, indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`), skill, command, aturan, atau kode sumber.
- DILARANG memperbaiki temuan yang ditemukan tanpa instruksi/konfirmasi pengguna pada sesi terpisah.

## Contoh Benar

```text
Ringkasan: 1 GALAT, 1 PERINGATAN (7 aset diperiksa).

| No | Aset | Tingkat | Path/Objek | Temuan | Saran |
| --- | --- | --- | --- | --- | --- |
| 1 | .agents/rules/kelompok_skill_wajib_*.md | GALAT | `.agents/rules/kelompok_skill_wajib_non_code.md` | Entri menunjuk `.agents/skills/non-code/contoh/SKILL.md` tetapi berkas tidak ada | Hapus entri atau pulihkan skill, lalu sinkronkan indeks |
| 2 | Command | PERINGATAN | `.kilo/commands/contoh.md` | Tidak ada frontmatter `description` | Tambahkan frontmatter `description` sesuai konvensi command |

Catatan keterbatasan: tidak ada.
```

```text
Langkah aman pemeriksaan repositori (read-only): baca hasil `git status` atau struktur `.gitmodules`/pointer submodule yang tersedia tanpa menjalankan perintah yang mengubah state.
```

## Contoh Salah

```text
Saya menemukan masalah lalu langsung memperbaiki SKILL.md dan memperbarui task.md.
```

```text
GALAT: command rusak. (tanpa path, tanpa bukti, tanpa saran)
```

```text
Menjalankan git add/reset/commit untuk merapikan temuan audit.
```


===== .agents/skills/data-dummy/SKILL.md =====
---
name: data-dummy
description: "Trigger: saat menambahkan atau memperbarui data dummy untuk pratinjau UI atau pengembangan | Pola data dummy: kelas `abstract final class <Model>Dummy` di `lib/fitur/<fitur>/dummy/<model>_dummy.dart`; daftar `dummyList` (`static final List`); setiap id wajib konstanta `static const` SCREAMING_SNAKE_CASE berformat UUID 8-4-4-4-12; tanggal entri relatif terhadap `DateTime.now()`; dummy berelasi WAJIB memakai ID dari dummy sumber yang sama (referensi ID valid lintas entitas). Data Dummy Skill ini menetapkan pola pembuatan data dummy (data sampel) untuk kebutuhan pratinjau UI dan pengembangan. Data dummy bukan sumber data produksi dan bukan pengganti test. Aturan 1. Folder data dummy berada di `lib/fitur/<fitur>/dummy/` (bukan di `test/`). Berkas bernama `<nama_model>_dummy.dart` (snake_case) dan diawali komentar header `// path: lib/fitur/<fitur>/dummy/<nama_model>_dummy.dart`. 2. Kelas dummy berupa `abstract final class <NamaModel>Dummy` — mencegah instansiasi; seluruh isi berupa anggota statis. 3. Daftar sampe"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 02:56 WIB"
---

# Data Dummy

Skill ini menetapkan pola pembuatan data dummy (data sampel) untuk kebutuhan pratinjau UI dan pengembangan. Data dummy bukan sumber data produksi dan bukan pengganti test.

## Aturan

1. Folder data dummy berada di `lib/fitur/<fitur>/dummy/` (bukan di `test/`). Berkas bernama `<nama_model>_dummy.dart` (snake_case) dan diawali komentar header `// path: lib/fitur/<fitur>/dummy/<nama_model>_dummy.dart`.
2. Kelas dummy berupa `abstract final class <NamaModel>Dummy` — mencegah instansiasi; seluruh isi berupa anggota statis.
3. Daftar sampel berupa `static final List<NamaModel> dummyList = [ ... ]` (bukan `const`, karena nilai memuat instansiasi `DateTime`/model).
4. **Setiap nilai id pada model dummy WAJIB konstanta `static const String` SCREAMING_SNAKE_CASE di atas daftar** (mis. `ID_ITEM_001`), bukan literal tersebar langsung pada entri.
5. **Nilai konstanta id WAJIB mengikuti format UUID `8-4-4-4-12`** (nibble versi `4`, varian `8`) — format saja; DILARANG memakai hasil generate UUID sebagai nilai dummy.
6. Konstanta id dikelompokkan per field model (mis. id entitas utama, id entitas relasi, id referensi lain) dengan prefiks berbeda; nilai yang sama dipakai ulang lewat konstanta yang sama.
7. Tanggal pada entri dummy WAJIB relatif terhadap `DateTime.now()` (mis. `DateTime.now().subtract(const Duration(days: 10))`) agar tetap relevan; DILARANG memakai tanggal absolut yang lekas usang.
8. Untuk kebutuhan test (unit/widget), dummy data tetap dipakai dari `lib/fitur/<fitur>/dummy/` dan diimpor oleh berkas test — lihat skill `aturan-testing`.
9. Dummy yang berelasi WAJIB memakai konstanta ID yang sama dengan ID di kelas dummy sumber (mis. `PelangganAktifDummy.ID_PELANGGAN_001` == `PelangganDummy.ID_PELANGGAN_001`); referensi ke ID yang tidak ada di kelas dummy sumber DILARANG (menyebabkan log peringatan "tidak ditemukan" dari operasi `getXxxById` saat dummy direset).

## Contoh Benar

```dart
// path: lib/fitur/produk/dummy/produk_dummy.dart

import 'package:contoh_aplikasi/enum/status_enum.dart';
import 'package:contoh_aplikasi/fitur/produk/model/produk_model.dart';

/// Data dummy `ProdukModel` untuk kebutuhan pratinjau UI dan pengembangan.
/// Tanggal mengikuti `DateTime.now()` agar tetap relevan.
abstract final class ProdukDummy {
  static const String ID_PRODUK_001 = 'aa000001-0000-4000-8000-000000000001';
  static const String ID_PRODUK_002 = 'aa000002-0000-4000-8000-000000000002';

  static const String ID_TOKO_001 = 'bb000001-0000-4000-8000-000000000001';

  static const String ID_TRANSAKSI_001 = 'dd000001-0000-4000-8000-000000000001';

  static final List<ProdukModel> dummyList = [
    ProdukModel(
      id: ID_PRODUK_001,
      idToko: ID_TOKO_001,
      idTransaksi: ID_TRANSAKSI_001,
      tanggalMulai: DateTime.now().subtract(const Duration(days: 10)),
      tanggalBerakhir: DateTime.now().add(const Duration(days: 20)),
      status: StatusEnum.aktif,
    ),
    ProdukModel(
      id: ID_PRODUK_002,
      idToko: ID_TOKO_001,
      tanggalMulai: DateTime.now().subtract(const Duration(days: 3)),
      tanggalBerakhir: DateTime.now().add(const Duration(days: 4)),
      status: StatusEnum.nonaktif,
    ),
  ];
}
```

## Contoh Salah

```dart
// DILARANG: literal id tersebar langsung pada entri, tanpa konstanta
ProdukModel(id: 'aa000001-0000-4000-8000-000000000001', ...),

// DILARANG: konstanta id tidak berformat UUID
static const String ID_PRODUK_001 = 'produk-dummy-001';

// DILARANG: memakai hasil generate UUID sebagai nilai dummy
static const String ID_PRODUK_001 = 'f47ac10b-58cc-4372-a567-0e02b2c3d479';

// DILARANG: tanggal absolut yang usang
tanggalMulai: DateTime(2026, 1, 1),

// DILARANG: kelas dummy bisa diinstansiasi (bukan `abstract final`)
class ProdukDummy {
  ...
}

// DILARANG: referensi lintas entitas ke ID yang TIDAK ADA di kelas dummy
// sumber (mis. dummy PelangganAktif merujuk ID Pelanggan/Paket dummy yang
// belum/ tidak pernah di-seed) — memicu peringatan "tidak ditemukan" dari
// operasi getXxxById saat dummy direset
static const String ID_PELANGGAN_999 = 'bb000099-0000-4000-8000-000000000099';
```


===== .agents/skills/disiplin-scope-kerja/SKILL.md =====
---
name: disiplin-scope-kerja
description: 'Trigger: saat mengerjakan tugas apa pun (kode, dokumen, refactor, pemanggilan command), termasuk migrasi massal via codemod/skrip otomatis | Panduan disiplin cakupan kerja: jangan membuat perubahan di luar berkas/cakupan tugas (termasuk churn whitespace/format), format hanya pada berkas terdampak tugas, review `git diff` sebelum melapor, laporkan berkas yang berubah di luar sesi, dan verifikasi codemod lintas berkas setelah dieksekusi. Disiplin Cakupan Kerja Menetapkan batasan tegas antara pekerjaan yang diperintahkan dan perubahan lain yang "kebetulan lewat" — supaya AI tidak membesarkan cakupan pekerjaan tanpa persetujuan. Cakupan yang Di-Cover - Perubahan kode/dokumen di luar cakupan tugas: format massal, rename opsional, type/fix drive-by. - Berkas yang berubah akibat proses/sesi lain (paralel) saat sedang dikerjakan. - Review `git diff` sebelum melapor selesai. Aturan 1. Kerjakan hanya berkas/cakupan yang relevan dengan tugas; perubahan tambahan di luar cakupan (opsional cleanup, format, rename, "bagus-b'
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 03:20 WIB"
---

# Disiplin Cakupan Kerja

Menetapkan batasan tegas antara pekerjaan yang diperintahkan dan perubahan lain yang "kebetulan lewat" — supaya AI tidak membesarkan cakupan pekerjaan tanpa persetujuan.

## Cakupan yang Di-Cover

- Perubahan kode/dokumen di luar cakupan tugas: format massal, rename opsional, type/fix drive-by.
- Berkas yang berubah akibat proses/sesi lain (paralel) saat sedang dikerjakan.
- Review `git diff` sebelum melapor selesai.

## Aturan

1. Kerjakan hanya berkas/cakupan yang relevan dengan tugas; perubahan tambahan di luar cakupan (opsional cleanup, format, rename, "bagus-bagus tambahan") WAJIB dikonfirmasi ke pengguna sebelum dikerjakan.
2. Format hanya pada berkas yang memang bagian dari tugas (mis. `dart format <berkas>`); jangan jalankan format/linter untuk seluruh proyek kecuali diminta eksplisit.
3. Sebelum melapor selesai, review `git diff --stat`; seluruh berkas yang berubah WAJIB tercantum di laporan/tabel berkas terdampak; berkas yang berubah di luar sesi (proses lain) dilaporkan sebagai temuan — jangan diklaim milik sesi ini dan jangan diperbaiki tanpa persetujuan.
4. Masalah di luar cakupan yang ditemukan saat bekerja (bug, impor rusak, drift dokumen) dicatat/dilaporkan sebagai usulan; jangan sekaligus diperbaiki tanpa persetujuan.
5. Perubahan kosmetik (whitespace, trailing spaces, blank line) pada berkas yang tidak terdampak tugas DILARANG.
6. Migrasi massal lintas berkas (mis. skrip codemod yang memodifikasi puluhan berkas sekaligus) WAJIB memakai persetujuan eksplisit pengguna atas cakupannya; skrip ditulis ke direktori sementara (mis. `/tmp`) dan tidak boleh menyentuh berkas di luar pola yang disetujui; setelah dieksekusi WAJIB `git diff --stat` + `dart format <berkas>` pada berkas tugas (bukan `dart format lib`) + `dart analyze`; seluruh berkas tersentuh wajib tercantum di tabel Berkas Terdampak; pola yang gagal dikonversi wajib diselesaikan manual atau dilaporkan, tidak boleh diabaikan.

## Contoh Benar

```bash
# Memformat satu berkas yang memang diubah dalam tugas
dart format lib/fitur/pelanggan/dummy/pelanggan_dummy.dart
```

Laporan yang jujur:

```text
Berkas a.dart berubah di luar sesi ini (proses lain) — tidak saya klaim dan tidak saya perbaiki.
```

## Contoh Salah

```bash
# DILARANG: format massal seluruh proyek saat tugas hanya menyentuh satu berkas
dart format lib/

# DILARANG: membetulkan impor/path di berkas di luar tugas "sekalian saja"
```

```text
# DILARANG: melapor "selesai" tanpa mengecek git diff — berkas asing ikut terklaim
```


===== .agents/skills/ekspor-pemulihan-cadangan/SKILL.md =====
---
name: ekspor-pemulihan-cadangan
description: "Trigger: saat mengelola ekspor atau pemulihan data cadangan lokal | Panduan: transaksi DB atomic, exception khusus, cek platform, flag double submit, unawaited catchError, mounted check, refresh provider, isDestructiveAction, hapus file parsial gagal. Ekspor dan Pemulihan Data Cadangan Lokal Pemulihan dalam transaksi atomic, exception khusus, cek platform, flag double submit, unawaited catchError, mounted check, refresh provider, konfirmasi destruktif, AppToast. Cakupan yang Di-Cover - Package: `package:sqflite` (class `Database`, `Transaction`), `package:flutter_riverpod` (class `ref`, `ConsumerStatefulWidget`), `package:easyloading` (class `EasyLoading`, `EasyLoadingMaskType`), `package:shared_preferences` (class `SharedPreferences`), `package:adaptive_dialog` (class `showOkCancelAlertDialog`, `OkCancelResult`) - Class: `SqfliteOp`, `BerkasCadanganTidakValidException`, `EasyLoading`, `AppToast`, `L`, `Nav` - Method: `op.transaksi()`, `op.hapus()`, `ref.refresh()`, `EasyLoading.show()`, `EasyLoading.dismiss("
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Ekspor dan Pemulihan Data Cadangan Lokal

Pemulihan dalam transaksi atomic, exception khusus, cek platform, flag double submit, unawaited catchError, mounted check, refresh provider, konfirmasi destruktif, AppToast.

## Cakupan yang Di-Cover

- Package: `package:sqflite` (class `Database`, `Transaction`), `package:flutter_riverpod` (class `ref`, `ConsumerStatefulWidget`), `package:easyloading` (class `EasyLoading`, `EasyLoadingMaskType`), `package:shared_preferences` (class `SharedPreferences`), `package:adaptive_dialog` (class `showOkCancelAlertDialog`, `OkCancelResult`)
- Class: `SqfliteOp`, `BerkasCadanganTidakValidException`, `EasyLoading`, `AppToast`, `L`, `Nav`
- Method: `op.transaksi()`, `op.hapus()`, `ref.refresh()`, `EasyLoading.show()`, `EasyLoading.dismiss()`, `showOkCancelAlertDialog()`, `SharedPreferences.getInstance()`
- Properti: `_sedangMemproses`, `mounted`, `isDestructiveAction`

## Aturan

1. Pemulihan data wajib dalam satu transaksi DB (`op.transaksi`) hapus lama → masuk baru, atomik konsisten.
2. Berkas cadangan tidak valid → exception khusus (class implements `Exception`), bukan string matching.
3. Cek platform (`kIsWeb`, `defaultTargetPlatform`) sebelum operasi berkas. Platform tidak didukung → warning, tidak crash.
4. Operasi async berulang (ekspor/pemulihan) dilindungi flag `_sedangMemproses` dicek awal, dikembalikan `finally` termasuk error.
5. unawaited (EasyLoading show/dismiss, Nav.to) wajib `.catchError(...)` log via `L.e`.
6. Setelah `await` wajib cek `mounted` sebelum akses context/setState.
7. Setelah pemulihan berhasil, refresh SEMUA provider yang datanya ikut dipulihkan via `ref.refresh()`, masing-masing dalam try/catch `L.e` — bukan hanya sebagian. Daftar minimal saat ini: `biodataProvider`, `impianProvider`, `diaryCravingProvider`, `alasanBerhentiProvider`, `konsumsiRokokProvider`, `sosIntervensiProvider`, `rencanaDaruratProvider`. Bila menambah tabel ke `tabelCadangan`, provider-nya WAJIB ikut ditambahkan ke `_refreshProviderSetelahRestore` (cadangan_screen.dart) — menambah tabel cadangan tanpa refresh provider membuat UI menampilkan data usang setelah pemulihan.
   7a. Ekspor (`CadanganHelper.eksporKePayload`) wajib menyertakan SELURUH tabel yang dideklarasikan di `tabelCadangan` (`biodata`, `impian`, `diaryCraving`, `alasanBerhenti`, `konsumsiRokok`, `sosIntervensi`, `rencanaDarurat`) beserta pencatatan jumlah baris tiap tabel di log (`L.i`). Tabel baru yang ditambahkan ke skema wajib dievaluasi apakah termasuk cadangan; bila ya, tambahkan ke `tabelCadangan` sekaligus ke refresh provider di aturan 7.
8. Operasi destruktif (pemulihan ganti data) wajib dialog konfirmasi `showOkCancelAlertDialog` dengan `isDestructiveAction: true`.
9. Feedback pakai `AppToast` (sukses/gagal/info), bukan `Fluttertoast` langsung.
10. Berkas parsial gagal ditulis wajib dihapus.

## Larangan

- Jangan pemulihan tanpa transaksi DB.
- Jangan string literal untuk nama exception deteksi.
- Jangan tampilkan kontrol ekspor/pemulihan di platform tidak mendukung.
- Jangan unawaited EasyLoading tanpa catchError.
- Jangan abaikan mounted check setelah await.
- Jangan simpan status berhasil sebelum operasi benar-benar selesai.

## Contoh Benar

```dart
class BerkasCadanganTidakValidException implements Exception {
  const BerkasCadanganTidakValidException(this.pesan);
  final String pesan;
  @override String toString() => 'Berkas cadangan tidak valid: $pesan';
}

class _CadanganBenarState extends ConsumerState<CadanganBenar> {
  bool _sedangMemproses = false;

  Future<void> _pulihkan() async {
    if (_sedangMemproses) return;
    setState(() => _sedangMemproses = true);

    try {
      await EasyLoading.show(status: 'Memproses...', maskType: EasyLoadingMaskType.black)
          .catchError((e, s) => L.e('Gagal loading: $e $s'));

      // Konfirmasi destruktif
      final konfirmasi = await showOkCancelAlertDialog(
        context: context, title: 'Pulihkan Cadangan',
        message: 'Data akan diganti. Lanjutkan?',
        okLabel: 'Pulihkan', cancelLabel: 'Batal',
        isDestructiveAction: true,
      );
      if (konfirmasi != OkCancelResult.ok) return;

      // Transaksi atomic
      final op = SqfliteOp();
      await op.transaksi((txn) async {
        for (final tabel in ['tabel1', 'tabel2']) {
          await txn.delete(tabel);
          L.i('Hapus data lama tabel $tabel');
        }
        // insert data baru...
      });

      // Refresh SEMUA provider yang datanya dipulihkan
      for (final provider in [biodataProvider, impianProvider, diaryCravingProvider, alasanBerhentiProvider, konsumsiRokokProvider, sosIntervensiProvider, rencanaDaruratProvider]) {
        try { ref.refresh(provider); } on Exception catch (e, s) { L.e('Gagal refresh provider: $e $s'); }
      }

      AppToast.sukses(context, 'Cadangan berhasil dipulihkan');
    } on BerkasCadanganTidakValidException catch (e) {
      AppToast.gagal(context, e.toString());
    } finally {
      unawaited(EasyLoading.dismiss().catchError((e, s) => L.e('Gagal dismiss: $e $s')));
      if (mounted) setState(() => _sedangMemproses = false);
    }
  }
}
```

## Contoh Salah

```dart
// DILARANG: Pemulihan tanpa transaksi atomic
final op = SqfliteOp();
for (final tabel in ['tabel1', 'tabel2']) {
  await op.hapusSemua(tabel);
  await op.tambah(tabel, {}); // Jika gagal di tengah, data rusak
}

// DILARANG: String matching untuk error
try {} catch (e) { if (e.toString().contains('invalid')) {} }

// DILARANG: unawaited tanpa catchError
unawaited(EasyLoading.show(status: 'Memproses...'));
unawaited(EasyLoading.dismiss());

// DILARANG: Tidak cek mounted setelah await
Navigator.pop(context);

// DILARANG: Tidak refresh provider setelah sukses
```


===== .agents/skills/ekstraksi-perhitungan-turunan/SKILL.md =====
---
name: ekstraksi-perhitungan-turunan
description: "Trigger: saat logika perhitungan turunan terduplikasi | Panduan ekstraksi logika perhitungan turunan ke ekstensi model atau helper murni agar ditulis sekali dan konsisten di seluruh layar. Ekstraksi Logika Perhitungan Turunan yang Diduplikasi Perhitungan turunan yang sama di lebih dari satu layar wajib diekstrak ke satu lokasi bersama (ekstensi model, helper murni, atau utilitas). Aturan 1. Apabila perhitungan turunan yang sama digunakan di lebih dari satu layar, ekstrak ke satu lokasi bersama (ekstensi pada model, helper murni, atau utilitas) agar logika hanya ditulis sekali. 2. Konsumen (layar/widget) wajib menggunakan hasil dari lokasi bersama, bukan menghitung ulang secara inline. 3. Helper murni wajib menerima parameter primitif dan tidak bergantung pada `BuildContext` atau provider. 4. Guard pembagian dengan nol wajib diterapkan pada perhitungan yang melakukan pembagian. 5. Pisahkan secara eksplisit metrik **baseline (estimasi dari biodata)** dan metrik **aktual (dari catatan konsumsi)** ke helper bersa"
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Ekstraksi Logika Perhitungan Turunan yang Diduplikasi

Perhitungan turunan yang sama di lebih dari satu layar wajib diekstrak ke satu lokasi bersama (ekstensi model, helper murni, atau utilitas).

## Aturan

1. Apabila perhitungan turunan yang sama digunakan di lebih dari satu layar, ekstrak ke satu lokasi bersama (ekstensi pada model, helper murni, atau utilitas) agar logika hanya ditulis sekali.
2. Konsumen (layar/widget) wajib menggunakan hasil dari lokasi bersama, bukan menghitung ulang secara inline.
3. Helper murni wajib menerima parameter primitif dan tidak bergantung pada `BuildContext` atau provider.
4. Guard pembagian dengan nol wajib diterapkan pada perhitungan yang melakukan pembagian.
5. Pisahkan secara eksplisit metrik **baseline (estimasi dari biodata)** dan metrik **aktual (dari catatan konsumsi)** ke helper bersama (mis. `MetrikBerhentiHelper` di `lib/fitur/konsumsi_rokok/helper/metrik_berhenti_helper.dart` dan `KonsumsiHitungHelper` di `konsumsi_hitung_helper.dart`). Metrik aktual (`hitungRokokDihindariAktual`, `hitungUangDihematAktual`, `hitungStreak`) wajib mengecualikan hari tanpa catatan konsumsi; hari tanpa catatan bukan bukti pengguna tidak merokok.
6. Rata-rata per hari atas `n` hari kalender terakhir wajib memakai basis kalender (hari tanpa catatan dihitung 0, `rataRataKalender`), bukan rata-rata hanya atas hari yang punya catatan.
7. Layar wajib memakai helper bersama, tidak menghitung ulang secara inline — contoh nyata: `_streakSaatIni` duplikat di `kalender_smoke_free_screen.dart` dihapus dan diganti `MetrikBerhentiHelper.hitungStreak(...)`.
8. Metrik baseline wajib diberi label "estimasi" di UI; metrik aktual wajib diberi label "berdasarkan n hari tercatat" di UI. Pemanggil (layar) yang menentukan sumber angka, bukan helper.
9. Konsistensi antara dua layar untuk besaran yang sama wajib dijaga lewat satu helper (contoh: dashboard, badge, impian, dan pelacakan toksin sama-sama memakai `MetrikBerhentiHelper`).
10. Jika sebuah kalkulasi lokal perlu dipertahankan sementara, tandai dengan `TODO` yang merujuk helper target, dan hapus begitu migrasi selesai (TODO basi yang merujuk PRD yang sudah diimplementasikan dilarang dibiarkan).

## Larangan

- Jangan membuat method perhitungan inline (mis. `_hitungUangDihemat`) di layar yang menggandakan logika yang sudah ada di ekstensi/helper.
- Jangan meletakkan perhitungan turunan di provider (perhitungan bergantung pada waktu saat ini dan lebih tepat di lapisan model).
- Jangan membiarkan formula berbeda antar layar untuk besaran yang sama.
- Jangan menghitung metrik aktual dengan menganggap hari tanpa catatan sebagai "tidak merokok".
- Jangan menduplikasi logika baseline/aktual di sebuah layar saat `MetrikBerhentiHelper`/`KonsumsiHitungHelper` sudah menyediakannya.

## Contoh Benar

```dart
// Ekstensi pada model (didefinisikan sekali)
extension BiodataModelPerhitungan on BiodataModel {
  double get uangDihemat {
    if (batangPerBungkus == 0) return 0; // Guard pembagian dengan nol
    return (rokokTidakDiHisap / batangPerBungkus) * hargaRokokPerBungkus;
  }
}

// Konsumsi di layar
final uangDihemat = biodata?.uangDihemat ?? 0;
```

## Contoh Salah

```dart
// Duplikasi perhitungan inline di layar
double _hitungUangDihemat(BiodataModel? biodata) {
  if (biodata == null) return 0;
  // ... logika duplikat
}
```


===== .agents/skills/empty-state-daftar/SKILL.md =====
---
name: empty-state-daftar
description: "Trigger: saat membuat empty state daftar atau non-daftar | Panduan komponen bersama EmptyStateView (ikon, judul, deskripsi, CTA opsional), CTA kontekstual, SafeArea + padding, warna ColorScheme; DILARANG `Center(child: Text(...))` atau empty state custom per layar. Empty State pada Daftar dan Layar Non-Daftar Ketika data kosong (daftar maupun tampilan non-daftar), gunakan komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`) dengan CTA kontekstual; jangan membuat implementasi empty state per layar. Aturan 1. Empty state wajib memakai komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`): `ikon`, `judul`, `deskripsi`, dan CTA opsional (`ctaLabel` + `onCta`). 2. `ctaLabel` dan `onCta` wajib diisi berpasangan atau keduanya `null` (widget sudah menegakkan lewat `assert`); CTA yang tersedia dirender sebagai `OutlinedButton`. 3. `EmptyStateView` bersifat pure (tidak membaca provider); teks dan aksi disediakan pemanggil. 4. `EmptyStateView` sudah membungkus `SafeArea` + `Padding(all: 16)` + `Center` + `Column(mainAxisS"
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 22 2026 12:45 WIB"
---

# Empty State pada Daftar dan Layar Non-Daftar

Ketika data kosong (daftar maupun tampilan non-daftar), gunakan komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`) dengan CTA kontekstual; jangan membuat implementasi empty state per layar.

## Aturan

1. Empty state wajib memakai komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`): `ikon`, `judul`, `deskripsi`, dan CTA opsional (`ctaLabel` + `onCta`).
2. `ctaLabel` dan `onCta` wajib diisi berpasangan atau keduanya `null` (widget sudah menegakkan lewat `assert`); CTA yang tersedia dirender sebagai `OutlinedButton`.
3. `EmptyStateView` bersifat pure (tidak membaca provider); teks dan aksi disediakan pemanggil.
4. `EmptyStateView` sudah membungkus `SafeArea` + `Padding(all: 16)` + `Center` + `Column(mainAxisSize: MainAxisSize.min, spacing: 8)`; warna ikon dan deskripsi dari `colorScheme.onSurfaceVariant`, judul dari `textTheme.titleMedium` tebal. Jangan membungkus ulang dengan `SafeArea`/`Padding` ganda di layar.
5. Sertakan CTA kontekstual (mis. "Tambah Impian", "Beralih ke catatan") yang mengarah ke aksi/form yang relevan; CTA boleh `null` bila layar memang tidak punya aksi (mis. read-only).
6. Terapkan pada semua kondisi "belum ada data" — daftar maupun layar non-daftar (kalender, pelacakan toxin, pemulihan kesehatan) — agar pola tampilan konsisten.
7. Hapus komponen empty state custom per layar setelah migrasi ke `EmptyStateView` (jangan biarkan dua pola hidup berdampingan).

## Larangan

- Jangan menampilkan layar kosong tanpa informasi.
- Jangan membuat widget empty state custom per layar yang menduplikasi `EmptyStateView`.
- Jangan mengisi hanya salah satu dari `ctaLabel`/`onCta`.
- Jangan membungkus `EmptyStateView` dengan `SafeArea`/`Padding` lain.
- Jangan hardcode warna pada empty state; gunakan `ColorScheme`/`TextTheme`.

## Contoh Benar

```dart
import 'package:berhenti_merokok/shared/widget/empty_state_view.dart';

// Di layar daftar:
if (impianState.listImpian.isEmpty) {
  return EmptyStateView(
    ikon: CupertinoIcons.flag,
    judul: 'Belum ada impian',
    deskripsi: 'Catat impian yang ingin kamu capai dengan uang yang dihemat.',
    ctaLabel: 'Tambah Impian',
    onCta: () => unawaited(
      Nav.to(context, const FormImpian()).catchError((Object e, StackTrace s) {
        L.e('Gagal navigasi ke Form Impian: $e $s');
        return null;
      }),
    ),
  );
}

// Di layar non-daftar (tanpa CTA):
if (!adaData) {
  return const EmptyStateView(
    ikon: CupertinoIcons.heart,
    judul: 'Belum ada data pemulihan',
    deskripsi: 'Data kesehatan akan muncul setelah Anda berhenti merokok.',
  );
}
```

## Contoh Salah

```dart
// Widget empty state custom per layar (duplikasi):
class _EmptyDiaryCraving extends StatelessWidget { ... }

// Hanya satu dari ctaLabel/onCta diisi:
EmptyStateView(ikon: Icons.add, judul: '...', deskripsi: '...', ctaLabel: 'Tambah'); // assert gagal

// Membungkus ganda:
SafeArea(child: Padding(padding: EdgeInsets.all(16), child: EmptyStateView(...)));

// Layar kosong tanpa informasi sama sekali:
if (list.isEmpty) return const Scaffold(body: SizedBox.shrink());
```


===== .agents/skills/exception-khusus-deteksi-error/SKILL.md =====
---
name: exception-khusus-deteksi-error
description: "Trigger: saat mendeteksi tipe error; saat memilih tipe yang dilempar (exception/error) | Panduan exception khusus (class implements Exception) untuk deteksi via type check (is), bukan string matching pesan error; throw string literal DILARANG. Penggunaan Tipe Exception Khusus untuk Deteksi Error Gunakan class exception khusus yang implements `Exception` untuk menandai kondisi error, deteksi via `is` (type check), bukan string matching. Aturan 1. Gunakan tipe exception khusus (class yang mengimplementasikan `Exception` atau `Error`) untuk menandai kondisi error yang perlu dideteksi oleh pemanggil. 2. Pemanggil wajib mendeteksi error melalui `is` (type check), bukan pencocokan string `e.toString().contains(...)`. 3. Tipe exception khusus wajib dideklarasikan sebagai class terpisah dengan dokumentasi singkat. 4. Jangan bergantung pada teks pesan exception untuk menentukan alur program. Larangan - Jangan melempar `Exception('pesan')` lalu mendeteksi via `e.toString().contains('pesan')`. - Jangan menggunakan strin"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 02:38 WIB"
---

# Penggunaan Tipe Exception Khusus untuk Deteksi Error

Gunakan class exception khusus yang implements `Exception` untuk menandai kondisi error, deteksi via `is` (type check), bukan string matching.

## Aturan

1. Gunakan tipe exception khusus (class yang mengimplementasikan `Exception` atau `Error`) untuk menandai kondisi error yang perlu dideteksi oleh pemanggil.
2. Pemanggil wajib mendeteksi error melalui `is` (type check), bukan pencocokan string `e.toString().contains(...)`.
3. Tipe exception khusus wajib dideklarasikan sebagai class terpisah dengan dokumentasi singkat.
4. Jangan bergantung pada teks pesan exception untuk menentukan alur program.

## Larangan

- Jangan melempar `Exception('pesan')` lalu mendeteksi via `e.toString().contains('pesan')`.
- Jangan menggunakan string matching untuk deteksi error.
- Jangan melempar string literal (`throw 'pesan'`); stack trace tidak tertangkap dan tidak bisa dideteksi via `is`. Gunakan `StateError('pesan')` atau exception khusus.

## Contoh Benar

```dart
class IzinNotifikasiTidakDiberikanException implements Exception {
  const IzinNotifikasiTidakDiberikanException();
  @override
  String toString() => 'Izin notifikasi tidak diberikan';
}

// Melempar
throw const IzinNotifikasiTidakDiberikanException();

// Mendeteksi via type check
} on Exception catch (e, s) {
  if (e is IzinNotifikasiTidakDiberikanException) {
    // tangani kegagalan izin
  }
}

// StateError membawa stack trace dan dapat dideteksi via `is`
throw StateError('WhatsApp tidak dapat dibuka: $uri');
```

## Contoh Salah

```dart
throw Exception('Izin notifikasi tidak diberikan');

// Mendeteksi melalui pencocokan string (rentan)
final isIzin = e.toString().contains('Izin notifikasi tidak diberikan');

// Melempar string literal (stack trace hilang)
throw 'Could not launch $uri';
```


===== .agents/skills/flutter-local-notifications/SKILL.md =====
---
name: flutter-local-notifications
description: "Trigger: saat menambahkan notifikasi lokal Flutter | Panduan flutter_local_notifications v23.0.0: cek platform, izin runtime, payload validation, lifecycle tap, exception khusus, unawaited catchError. Standar flutter_local_notifications v23.0.0 pada Notifikasi Harian Aturan khusus untuk plugin versi 23.0.0: cek platform, dukungan multi-platform (Android/iOS/macOS/Linux/Windows), izin runtime, payload, lifecycle tap, dan penjadwalan terjadwal. Cakupan yang Di-Cover - Package: `package:flutter_local_notifications` v23.0.0 (class `FlutterLocalNotificationsPlugin`, `InitializationSettings`, `AndroidInitializationSettings`, `DarwinInitializationSettings`, `LinuxInitializationSettings`, `WindowsInitializationSettings`, `NotificationDetails`, `NotificationResponse`, `AndroidNotificationDetails`, `DarwinNotificationDetails`, `LinuxNotificationDetails`, `WindowsNotificationDetails`), `package:timezone` as `tz` (class `tz`, `TZDateTime`), `dart:async` (`unawaited`) - Class: `FlutterLocalNotificationsPlugin`, `Initializ"
metadata:
  kategori: "custom"
  versi: "2.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Standar flutter_local_notifications v23.0.0 pada Notifikasi Harian

Aturan khusus untuk plugin versi 23.0.0: cek platform, dukungan multi-platform (Android/iOS/macOS/Linux/Windows), izin runtime, payload, lifecycle tap, dan penjadwalan terjadwal.

## Cakupan yang Di-Cover

- Package: `package:flutter_local_notifications` v23.0.0 (class `FlutterLocalNotificationsPlugin`, `InitializationSettings`, `AndroidInitializationSettings`, `DarwinInitializationSettings`, `LinuxInitializationSettings`, `WindowsInitializationSettings`, `NotificationDetails`, `NotificationResponse`, `AndroidNotificationDetails`, `DarwinNotificationDetails`, `LinuxNotificationDetails`, `WindowsNotificationDetails`), `package:timezone` as `tz` (class `tz`, `TZDateTime`), `dart:async` (`unawaited`)
- Class: `FlutterLocalNotificationsPlugin`, `InitializationSettings`, `AndroidInitializationSettings`, `DarwinInitializationSettings`, `LinuxInitializationSettings`, `WindowsInitializationSettings`, `NotificationDetails`, `NotificationResponse`, `AndroidNotificationDetails`, `DarwinNotificationDetails`, `LinuxNotificationDetails`, `WindowsNotificationDetails`, `TZDateTime`, `AndroidFlutterLocalNotificationsPlugin`, `IOSFlutterLocalNotificationsPlugin`, `MacOSFlutterLocalNotificationsPlugin`, `WebFlutterLocalNotificationsPlugin`, `LinuxFlutterLocalNotificationsPlugin`, `FlutterLocalNotificationsWindows`
- Enum: `Importance`, `Priority`, `AndroidScheduleMode`, `DateTimeComponents`, `RepeatInterval`, `LinuxNotificationUrgency`, `LinuxNotificationTimeout`, `WebNotificationDirection`
- Method: `plugin.initialize()`, `plugin.zonedSchedule()`, `plugin.show()`, `plugin.cancel()`, `plugin.cancelAll()`, `plugin.cancelAllPendingNotifications()`, `plugin.getNotificationAppLaunchDetails()`, `plugin.resolvePlatformSpecificImplementation()`, `plugin.pendingNotificationRequests()`, `plugin.openAppNotificationSettings()`, `plugin.getActiveNotifications()`, `androidPlugin?.requestNotificationsPermission()`, `iosPlugin?.requestPermissions()`, `macOSPlugin?.requestPermissions()`, `unawaited()`, `catchError()`
- Properti: `kIsWeb`, `defaultTargetPlatform`, `TargetPlatform.android`, `TargetPlatform.iOS`, `TargetPlatform.macOS`, `TargetPlatform.linux`, `TargetPlatform.windows`, `isDestructiveAction`

## Aturan

1. Periksa dukungan fitur berdasarkan platform dan versi plugin sebelum menggunakan API penjadwalan.
2. Jangan gunakan penjadwalan berulang (`matchDateTimeComponents`, `zonedSchedule` dengan pengulangan) pada Web, Linux, Windows. macOS didukung via `zonedSchedule`.
3. Gunakan `AndroidScheduleMode.inexactAllowWhileIdle` untuk penjadwalan harian standar; `AndroidScheduleMode.alarmClock` hanya untuk pengingat kritis yang harus tepat waktu.
4. Inisialisasi plugin dengan `InitializationSettings` untuk platform yang di 지원: `android`, `iOS`, `macOS`, `linux`, dan `windows`. Jangan set `requestAlertPermission`, `requestSoundPermission`, `requestBadgePermission` ke `true` secara default di `DarwinInitializationSettings`.
5. Jangan minta izin notifikasi otomatis saat startup (termasuk iOS Darwin default). Minta saat pengguna aktifkan fitur melalui `mintaIzin()`.
6. Periksa hasil izin sebelum simpan status aktif. Periksa kembali izin saat buka aplikasi melalui `_periksaIzinSistem()`.
7. Rollback state, tampilkan feedback, jangan simpan status aktif jika penjadwalan gagal.
8. Tangani gagal penjadwalan ulang saat buka aplikasi: log error, jangan biarkan unhandled.
9. Pisahkan ID notifikasi uji coba dari ID pengingat utama.
10. Handle tap notifikasi 3 kondisi lifecycle: foreground, background, terminated. Gunakan `getNotificationAppLaunchDetails()` untuk terminated.
11. Validasi payload: parse `kategori` dan `id`, hanya proses kategori dikenal, log warning jika tidak valid.
12. Izin dicabut → cancel jadwal, update preferensi, pastikan tidak ada jadwal tertinggal. Aktifkan kembali → minta izin dulu.
13. Konsistensi waktu: simpan nilai lama, terapkan baru setelah berhasil, gagal → pulihkan lama.
14. unawaited navigasi/loading wajib catchError dengan `L.e`.
15. Gunakan exception khusus (class implements `Exception`), deteksi via `is`, bukan string matching.
16. `cancelAllPendingNotifications()` hanya didukung pada Android, iOS, dan macOS. Pada platform lain akan melempar `UnimplementedError`.
17. `openAppNotificationSettings()` tidak didukung pada Web.

## Larangan

- Jangan minta izin notifikasi otomatis saat startup aplikasi.
- Jangan gunakan penjadwalan berulang di Web/Linux/Windows.
- Jangan gunakan ID notifikasi uji coba sama dengan ID pengingat utama.
- Jangan unawaited navigasi/loading tanpa catchError.
- Jangan string matching untuk deteksi exception.
- Jangan simpan status aktif sebelum izin terverifikasi.
- Jangan panggil `cancelAllPendingNotifications()` di Web/Linux/Windows.
- Jangan panggil `openAppNotificationSettings()` di Web.

## Contoh Benar

```dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotifikasiService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const int _idPengingatHarian = 1001;
  static const int _idUjiCoba = 1002;

  /// Inisialisasi plugin TANPA minta izin otomatis.
  static Future<void> inisialisasi() async {
    const android = AndroidInitializationSettings('ic_launcher');
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    );
    const settings = InitializationSettings(
      android: android,
      iOS: darwin,
      macOS: darwin,
    );

    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: _onTapNotifikasi,
    );
  }

  /// Handle tap notifikasi (foreground/background).
  static void _onTapNotifikasi(NotificationResponse response) {
    _navigasiDariPayload(response.payload);
  }

  /// Handle kondisi terminated saat aplikasi dibuka.
  static Future<void> cekNotifikasiSaatBuka() async {
    if (kIsWeb ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows) {
      return; // Platform tidak mendukung launch details
    }
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      final payload = details?.notificationResponse?.payload;
      if (payload != null && payload.isNotEmpty) {
        _navigasiDariPayload(payload);
      }
    }
  }

  /// Jadwalkan pengingat harian.
  static Future<void> jadwalkanPengingatHarian({
    required int jam,
    required int menit,
  }) async {
    if (kIsWeb ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.windows) {
      throw UnsupportedError('Platform tidak mendukung notifikasi terjadwal');
    }

    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, jam, menit,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'pengingat_harian',
        'Pengingat Harian',
        channelDescription: 'Pengingat harian berhenti merokok',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        icon: 'ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _plugin.zonedSchedule(
      id: _idPengingatHarian,
      scheduledDate: scheduled,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      title: 'Berhenti Merokok',
      body: 'Jaga semangat! Cek progres smoke-free Anda hari ini.',
      payload: 'kategori=pengingat_harian&id=$_idPengingatHarian',
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Batalkan pengingat harian.
  static Future<void> batalkanPengingatHarian() async {
    await _plugin.cancel(id: _idPengingatHarian);
  }

  /// Tampilkan notifikasi langsung (untuk uji coba).
  static Future<void> tampilkanSekarang() async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'pengingat_harian',
        'Pengingat Harian',
        channelDescription: 'Pengingat harian berhenti merokok',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        icon: 'ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );
    await _plugin.show(
      id: _idUjiCoba,
      title: 'Berhenti Merokok',
      body: 'Jaga semangat! Cek progres smoke-free Anda hari ini.',
      notificationDetails: details,
      payload: 'kategori=pengingat_harian&id=$_idUjiCoba',
    );
  }

  /// Resolve implementasi platform-specific (contoh Android).
  static Future<bool> mintaIzinAndroid() async {
    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    final granted = await androidPlugin?.requestNotificationsPermission();
    return granted ?? false;
  }
}

void _navigasiDariPayload(String? payload) {
  String? kategori;
  if (payload != null) {
    for (final part in payload.split('&')) {
      final kv = part.split('=');
      if (kv.length == 2 && kv[0] == 'kategori') {
        kategori = kv[1];
      }
    }
  }
  if (kategori == 'pengingat_harian') {
    // unawaited dengan catchError
    // unawaited(Nav.pushAndRemoveUntil(context, const Home()).catchError((e, s) {
    //   L.e('Gagal navigasi: $e $s');
    // }));
  }
}

// Exception khusus
class IzinNotifikasiTidakDiberikanException implements Exception {
  const IzinNotifikasiTidakDiberikanException();
  @override
  String toString() => 'Izin notifikasi tidak diberikan';
}
```

## Contoh Salah

```dart
// DILARANG: Tidak cek platform sebelum pakai API penjadwalan
await plugin.zonedSchedule(
  1, 'Test', 'Body',
  tz.TZDateTime.now(tz.local).add(const Duration(days: 1)),
  const NotificationDetails(),
  matchDateTimeComponents: DateTimeComponents.time, // Tidak didukung Web
);

// DILARANG: Minta izin otomatis saat startup (termasuk iOS default true)
await plugin.requestNotificationsPermission();

// DILARANG: ID uji coba sama dengan ID pengingat utama
await plugin.show(1, 'Test', 'Body', const NotificationDetails());

// DILARANG: unawaited tanpa catchError
unawaited(plugin.show(1, 'Test', 'Body', const NotificationDetails()));

// DILARANG: cancelAllPendingNotifications di Web
await plugin.cancelAllPendingNotifications(); // UnimplementedError di Web

// DILARANG: openAppNotificationSettings di Web
await plugin.openAppNotificationSettings(); // UnimplementedError di Web
```


===== .agents/skills/format-prd/SKILL.md =====
---
name: format-prd
description: "Trigger: saat membuat atau memperbarui PRD | Panduan format PRD proyek: header Status Dokumen dan Status Implementasi, enam bagian wajib (Informasi Produk, Tujuan PRD, Daftar Fitur, Alur Pengguna, Steps, File-File Terdampak), konteks penggunaan dan aturan pengisian per bagian, tabel prioritas (Must/Should/Could Have). Jangan digunakan untuk berkas hasil diskusi (`hasil_diskusi/diskusi_N.md`) atau `task.md`. Format PRD Mengatur bentuk dan isi dokumen PRD (_Product Requirements Document_) agar konsisten di seluruh proyek: header status, enam bagian wajib, konteks penggunaan dan aturan pengisian per bagian. Skill ini menggantikan berkas aturan `format_PRD.md` (dahulu `.agents/rules/global/format_PRD.md`, konversi penuh, sesi 66; berkas sumber kini dihapus); aturan format PRD kini mengikat melalui skill ini. Cakupan yang Di-Cover - Dokumen: PRD pada `prd/` di root proyek (mis. `prd/prd_<nama>.md`) - Header wajib: `**Status Dokumen:**` dan `**Status Implementasi:**` - Bagian wajib: Informasi Produk, Tujuan PRD, Da"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Tue Nov 17 2026 23:39 WIB"
  model: "openrouter/thinkingmachines/inkling-2-small:free"
---

# Format PRD

Mengatur bentuk dan isi dokumen PRD (_Product Requirements Document_) agar konsisten di seluruh proyek: header status, enam bagian wajib, konteks penggunaan dan aturan pengisian per bagian. Skill ini menggantikan berkas aturan `format_PRD.md` (dahulu `.agents/rules/global/format_PRD.md`, konversi penuh, sesi 66; berkas sumber kini dihapus); aturan format PRD kini mengikat melalui skill ini.

## Cakupan yang Di-Cover

- Dokumen: PRD pada `prd/` di root proyek (mis. `prd/prd_<nama>.md`)
- Header wajib: `**Status Dokumen:**` dan `**Status Implementasi:**`
- Bagian wajib: Informasi Produk, Tujuan PRD, Daftar Fitur, Alur Pengguna, Steps, File-File Terdampak
- Tabel: Daftar Fitur (`| Fitur | Deskripsi | Prioritas |`) dan File-File Terdampak (`| Lokasi File | Status Perubahan | Deskripsi Perubahan |`)
- Status prioritas: `Must Have`, `Should Have`, `Could Have`
- Status dokumen: `Draft` / `Final`
- Status implementasi: `Belum Diimplementasikan` / `Sedang Diimplementasikan` / `Sudah Diimplementasikan`

## Aturan

1. PRD diawali header `**Status Dokumen:** Draft / Final` dan `**Status Implementasi:** Belum Diimplementasikan / Sedang Diimplementasikan / Sudah Diimplementasikan`, diikuti pemisah `---`.
2. PRD memuat tepat enam bagian berurutan dengan judul persis: `## 1. Informasi Produk`, `## 2. Tujuan PRD`, `## 3. Daftar Fitur`, `## 4. Alur Pengguna`, `## 5. Steps`, `## 6. File-File Terdampak`.
3. Tiap bagian (setelah header) memuat `Konteks penggunaan:`, `Aturan pengisian:`, dan isi (`**Informasi:**`, `**Isi:**`, atau tabel).
4. Bedakan status dokumen dengan status implementasi; jangan mengarang informasi yang belum diketahui — tulis secara eksplisit (mis. `Belum diketahui`).
5. Bagian 1 Informasi Produk: isi `Nama aplikasi`, `Deskripsi produk`, `Platform`, `Versi`, `Status pengembangan` berdasarkan kondisi proyek yang sebenarnya; gunakan nama yang konsisten dengan proyek; cantumkan platform dan versi target.
6. Bagian 2 Tujuan PRD: tuliskan hasil yang diharapkan dari PRD; setiap tujuan wajib berhubungan langsung dengan kebutuhan dokumen; gunakan tujuan yang jelas dan dapat dievaluasi; jangan memasukkan tujuan di luar ruang lingkup PRD.
7. Bagian 3 Daftar Fitur: satu baris mewakili satu fitur yang dapat diidentifikasi secara terpisah (`| Fitur | Deskripsi | Prioritas |`); jangan menggabungkan beberapa fitur dalam satu baris; prioritas diisi `Must Have`, `Should Have`, atau `Could Have`; setiap fitur wajib mendukung tujuan produk dan masuk dalam ruang lingkup.
8. Bagian 4 Alur Pengguna: mulai dari kondisi awal pengguna; jelaskan langkah secara berurutan; sebutkan tindakan pengguna dan respons aplikasi; sertakan percabangan atau kondisi alternatif bila ada; jelaskan kondisi akhir yang diharapkan; pastikan alur sesuai persyaratan fitur; jangan memasukkan proses yang tidak didukung kebutuhan produk.
9. Bagian 5 Steps: buat langkah yang spesifik dan dapat diikuti; gunakan numbered list; setiap langkah harus tidak ambigu dan dapat dikerjakan; jangan memasukkan langkah yang tidak relevan atau redundan.
10. Bagian 6 File-File Terdampak: periksa struktur proyek sebelum menentukan file terdampak; cantumkan lokasi file spesifik sesuai struktur proyek sebenarnya; tandai `Dibuat` / `Diubah` / `Dihapus`; jelaskan alasan dan tujuan perubahan; cantumkan hanya file yang terkait kebutuhan fitur; jika file belum dapat ditentukan, tandai sebagai belum diketahui — jangan menebak; perbarui daftar setelah analisis teknis atau implementasi bila ditemukan file terdampak tambahan.

## Steps

1. Tentukan status dokumen (`Draft`/`Final`) dan status implementasi yang sesuai kondisi aktual.
2. Isi bagian 1–6 secara berurutan sesuai Aturan 4–10.
3. Verifikasi: enam judul bagian sesuai persis, tabel prioritas terisi, status implementasi konsisten dengan perubahan kode sesi ini.

## Larangan

- DILARANG mengubah jumlah, judul, atau urutan enam bagian wajib.
- DILARANG menulis status `Sudah Diimplementasikan` (atau `Sedang Diimplementasikan`) tanpa implementasi kode yang faktual.
- DILARANG mengarang lokasi, nama, atau keberadaan file pada bagian File-File Terdampak.
- DILARANG menggabungkan beberapa fitur dalam satu baris tabel Daftar Fitur.
- DILARANG memakai struktur PRD untuk berkas hasil diskusi (`hasil_diskusi/diskusi_N.md`) — gunakan `.agents/rules/global/format_hasil_diskusi.md`; untuk `task.md` gunakan skill `.agents/skills/non-code/format-task-md/SKILL.md`.
- DILARANG mengosongkan bagian tanpa keterangan eksplisit (`Belum dibahas` / `Belum diketahui`).

## Contoh Benar

```markdown
**Status Dokumen:** Draft
**Status Implementasi:** Belum Diimplementasikan

---

## 1. Informasi Produk

**Konteks penggunaan:**
Digunakan untuk mengidentifikasi produk dan memberikan gambaran umum proyek. ...
**Aturan pengisian:**
...
**Informasi:**

- Nama aplikasi: <nama aktual proyek>
- Deskripsi produk: <deskripsi aktual>
- Platform: <platform target>
- Versi: <versi>
- Status pengembangan: <status aktual>
```

## Contoh Salah

```markdown
**Status Implementasi:** Sudah Diimplementasikan // salah: dikarang; sesi hanya membuat dokumen

| Fitur                         | Deskripsi | Prioritas |
| ----------------------------- | --------- | --------- |
| Fitur A dan Fitur B sekaligus | ...       | Must Have | // salah: satu baris dua fitur |
```


===== .agents/skills/format-task-md/SKILL.md =====
---
name: format-task-md
description: "Trigger: saat menambahkan atau memperbarui isi file task.md di root | Panduan gaya penulisan format task.md agar setiap orang dan AI yang mengedit task.md menghasilkan isi yang konsisten: pengelompokan task berdasarkan file terdampak, prioritas Tinggi/Rendah, kolom Status/Masalah/Solusi/aturan dilanggar/file bermasalah/prompt, serta catatan kepatuhan terhadap skill yang terpenuhi (skill adalah aturan yang mengikat). Berlaku lintas proyek. Format Penulisan task.md Mengatur gaya penulisan dan pemformatan isi file `task.md` di root proyek agar setiap orang dan AI yang mengeditnya menghasilkan isi yang selalu konsisten. Setiap task dikelompokkan berdasarkan file-file yang terdampak: misalnya `task A` mengedit file `A, B, dan C` lalu `task B` hanya mengerjakan file `A`, maka keduanya dikelompokkan dalam satu kelompok. Cakupan yang Di-Cover - File: `task.md` di root proyek - Struktur: `Kelompok N` → `file terdampak` → `Tinggi` / `Rendah` (prioritas) → `Task N` - Kolom per task (kelompok Tinggi): `Status`, `Masalah`"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Format Penulisan task.md

Mengatur gaya penulisan dan pemformatan isi file `task.md` di root proyek agar setiap orang dan AI yang mengeditnya menghasilkan isi yang selalu konsisten. Setiap task dikelompokkan berdasarkan file-file yang terdampak: misalnya `task A` mengedit file `A, B, dan C` lalu `task B` hanya mengerjakan file `A`, maka keduanya dikelompokkan dalam satu kelompok.

## Cakupan yang Di-Cover

- File: `task.md` di root proyek
- Struktur: `# Kelompok N` → `## file terdampak` → `## Tinggi` / `## Rendah` (prioritas) → `#### Task N`
- Kolom per task (kelompok Tinggi): `Status`, `Masalah`, `Solusi`, `aturan dilanggar`, `file bermasalah`, `prompt`
- Kolom per task (kelompok Rendah): minimal `Status` dan `Masalah`
- Penamaan kelompok dan task: `Kelompok N` dan `Task N` (bilangan bulat positif, mulai dari 1)

## Aturan

1. Setiap penambahan atau perbaruan isi `task.md` **wajib** mengikuti format pada skill ini; dilarang menambah, menghapus, atau mengubah makna kolom tanpa persetujuan pengguna.
2. Setiap task **wajib** dikelompokkan berdasarkan file terdampak: task yang menyentuh file yang sama berada dalam satu kelompok (mis. `task A` mengedit file `A, B, C` dan `task B` hanya file `A` → satu kelompok).
3. Struktur berurutan: `# Kelompok N` → `## file terdampak` (daftar berkas sebagai link markdown, mis. `- (file A)[../FileA.md]`) → prioritas `## Tinggi` atau `## Rendah` → `#### Task N`.
4. Kolom per task (kelompok Tinggi), dalam urutan:
   - `Status` — isi salah satu: `selesai`, `belum`, `setengah`, `kerjakan`.
   - `Masalah` — masalah yang diketahui; bila belum diketahui, tulis secara eksplisit, jangan mengarang.
   - `Solusi` — solusi yang direkomendasikan beserta contohnya.
   - `aturan dilanggar` — nama semua aturan yang dilanggar beserta rujukannya, mis. `(aturan_boilprate)[aturan_boilprate:32]`.
   - `file bermasalah` — semua berkas yang harus diperbaiki, mis. `(aturan_boilprate)[aturan_boilprate:32]`.
   - `prompt` — **hanya diisi oleh pengguna**; AI dilarang mengisi atau mengubah kolom ini.
5. Kolom per task (kelompok Rendah): minimal `Status` dan `Masalah`; kolom lain boleh ditambahkan bila relevan.
6. `Status` wajib diisi salah satu dari empat nilai; `Masalah` wajib diisi atau ditandai eksplisit `belum diketahui`.
7. Skill yang trigger-nya terpenuhi adalah aturan yang mengikat; kepatuhan terhadap skill terkait **wajib** dicatat pada kolom `aturan dilanggar` bila relevan.
8. Isi `Solusi`, `aturan dilanggar`, dan `file bermasalah` harus berbasis fakta proyek; bila data tidak tersedia, tulis eksplisit `belum diketahui` — dilarang mengarang.

## Steps

1. Baca `task.md` di root; tentukan task yang akan ditambah/diperbarui.
2. Tentukan file terdampak setiap task; kelompokkan task berdasarkan perpotongan file terdampaknya.
3. Susun kolom per task sesuai aturan 4–6; catat skill terkait yang terpenuhi pada `aturan dilanggar` bila relevan (aturan 7).
4. Verifikasi: struktur `# Kelompok` → `## file terdampak` → prioritas → `#### Task` terjaga; kolom wajib lengkap; `prompt` tidak diisi AI.

## Larangan

- DILARANG mengisi, mengubah, atau menghapus kolom `prompt` — kolom ini hanya diisi oleh pengguna.
- DILARANG memecah task yang file terdampaknya tumpang tindih ke kelompok berbeda.
- DILARANG menghilangkan kolom wajib pada kelompok Tinggi (`Status`, `Masalah`, `Solusi`, `aturan dilanggar`, `file bermasalah`, `prompt`).
- DILARANG mengarang `Masalah`, `Solusi`, `aturan dilanggar`, atau `file bermasalah` — tulis `belum diketahui` bila data tidak tersedia.
- DILARANG menaruh task di luar struktur `# Kelompok` → prioritas → `#### Task`.
- DILARANG mengubah format ini tanpa persetujuan pengguna.

## Contoh Benar

```markdown
# Kelompok 1

## file terdampak

- (file A)[../FileA.md]

## Tinggi

#### Task 1

- Status : kerjakan
- Masalah : File A memuat logika yang tidak sesuai aturan penamaan (penamaan-konvensi).
- Solusi : Ganti identifier menjadi camelCase sesuai skill `penamaan-konvensi`; contoh: `nama_variable` menjadi `namaVariable`.
- aturan dilanggar : (penamaan-konvensi)[penamaan-konvensi]
- file bermasalah : (FileA.md)[../FileA.md]
- prompt : hanya diisi oleh saya

#### Task 2

- Status : belum
- Masalah : Belum diketahui.
- Solusi : Belum diketahui.
- aturan dilanggar : belum diketahui
- file bermasalah : (FileA.md)[../FileA.md]
- prompt : hanya diisi oleh saya
```

## Contoh Salah

```markdown
// DILARANG: task B (hanya file A) dipisah ke kelompok lain padahal task A juga menyentuh file A

# Kelompok 2

## file terdampak

- (file B)[../FileB.md]

#### Task 1 (task B) ... // salah: task B seharusnya bergabung dengan Kelompok 1 (file A yang sama)
```

```markdown
// DILARANG: AI mengisi kolom prompt

#### Task 1

- prompt : kerjakan sekarang juga // salah: prompt hanya diisi oleh pengguna
```

```markdown
// DILARANG: kolom wajib kelompok Tinggi dihilangkan

#### Task 1

- Status : kerjakan
- Masalah : Bug. // salah: Solusi, aturan dilanggar, file bermasalah, prompt tidak boleh dihilangkan
```

```markdown
// DILARANG: aturan dilanggar dikosongkan padahal skill terkait terpenuhi

- aturan dilanggar : // salah: skill terkait wajib dicatat bila relevan
```


===== .agents/skills/gaya/SKILL.md =====
---
name: gaya
description: "Trigger: saat menata warna dan tema UI | Panduan styling Flutter: withValues(alpha:) bukan withOpacity, warna dari ColorScheme/tema, hardcode hanya status semantic (hijau/merah/kuning), EasyLoading dengan catchError. Panduan Styling (Gaya) Skill ini mendokumentasikan aturan styling warna dan tema berdasarkan implementasi nyata di proyek Flutter. Semua aturan wajib diikuti untuk menjaga konsistensi visual antara mode terang dan gelap, serta menghindari API yang sudah deprecated. Cakupan yang Di-Cover - Package: `package:flutter` (class `Color`, `ThemeData`, `ColorScheme`, `Brightness`), `package:flutter_easyloading` (class `EasyLoading`, `EasyLoadingMaskType`) - Class: `Color`, `ThemeData`, `ColorScheme`, `Brightness`, `EasyLoading`, `EasyLoadingMaskType`, `AlwaysStoppedAnimation` - Enum: `Brightness.light`, `Brightness.dark`, `EasyLoadingMaskType.black`, `EasyLoadingMaskType.none` - Properti: `Color.alpha`, `ColorScheme.primary`, `ColorScheme.surface`, `ColorScheme.onSurface`, `ColorScheme.primaryContainer`, "
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Panduan Styling (Gaya)

Skill ini mendokumentasikan aturan styling warna dan tema berdasarkan implementasi nyata di proyek Flutter. Semua aturan wajib diikuti untuk menjaga konsistensi visual antara mode terang dan gelap, serta menghindari API yang sudah deprecated.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `Color`, `ThemeData`, `ColorScheme`, `Brightness`), `package:flutter_easyloading` (class `EasyLoading`, `EasyLoadingMaskType`)
- Class: `Color`, `ThemeData`, `ColorScheme`, `Brightness`, `EasyLoading`, `EasyLoadingMaskType`, `AlwaysStoppedAnimation`
- Enum: `Brightness.light`, `Brightness.dark`, `EasyLoadingMaskType.black`, `EasyLoadingMaskType.none`
- Properti: `Color.alpha`, `ColorScheme.primary`, `ColorScheme.surface`, `ColorScheme.onSurface`, `ColorScheme.primaryContainer`, `ThemeData.brightness`, `ThemeData.colorScheme`
- Method: `Color.withValues(alpha:)`, `Color.withOpacity()`, `Theme.of(context)`, `EasyLoading.show()`, `EasyLoading.dismiss()`

## Aturan

1. Wajib menggunakan `warna.withValues(alpha: ...)` untuk mengatur opacity warna.
2. DILARANG menggunakan `warna.withOpacity(...)` karena deprecated sejak Flutter 3.47+.
3. Wajib menggunakan warna dari `Theme.of(context).colorScheme` untuk teks dan komponen UI agar menyesuaikan mode terang/gelap.
4. Hardcode warna (HEX/RGBA) hanya diperbolehkan jika warna harus tetap sama di kedua mode tema (mis. brand color, status semantic: hijau sukses, merah error, kuning warning).
5. DILARANG mengubah nilai HEX/RGBA yang sudah ada menjadi referensi `ColorScheme` jika warna memang harus tetap.
   5a. Hardcode status semantic sudah dikonfirmasi pengguna boleh dipertahankan — task yang menandai `const Color(0xFFFF9800)` (dashboard, warning), `const Color(0xFF4CAF50)` (dashboard, sukses), dan `const Color(0xFFEF5350)` (konsumsi_rokok_screen, error) sebagai pelanggaran ditandai `batal` oleh pengguna (commit `ceb9536cc50304149be139dc8c5a36addb9c0774`, `task.md`). Kode di atas sudah sesuai aturan #4; jangan "diperbaiki" dengan mengganti ke `ColorScheme`.
6. `EasyLoading.show()` dan `EasyLoading.dismiss()` yang dipanggil dengan `unawaited()` wajib dilengkapi `.catchError(...)` untuk menangani error.
7. Mask type untuk operasi blocking wajib menggunakan `EasyLoadingMaskType.black`.
8. Konsisten menggunakan `withValues` di seluruh widget, tidak boleh bercampur dengan `withOpacity`.

## Larangan

- DILARANG `withOpacity()` → gunakan `withValues(alpha:)`.
- DILARANG hardcode warna untuk komponen yang harus ikut tema (primary, surface, onSurface, dll.).
- DILARANG `EasyLoading.show/dismiss` tanpa `.catchError()` pada `unawaited()`.
- DILARANG mencampur `withValues` dan `withOpacity` dalam satu file/widget.

## Contoh Benar

```dart
// Opacity dengan withValues (WAJIB)
Container(
  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
)
LinearProgressIndicator(
  backgroundColor: warnaProgres.withValues(alpha: 0.2),
  valueColor: AlwaysStoppedAnimation(warnaProgres),
)
Colors.black.withValues(alpha: 0.5), // Overlay modal

// Warna dari ColorScheme untuk UI umum
Text('Judul', style: TextStyle(color: Theme.of(context).colorScheme.onSurface))
Card(color: Theme.of(context).colorScheme.surfaceContainerHighest)
FilledButton(onPressed: ..., child: Text('Simpan'))

// Hardcode hanya untuk status semantic yang harus sama di light/dark
Container(color: const Color(0xFF4CAF50), child: ...), // Brand green / sukses
Icon(Icons.check_circle, color: const Color(0xFF4CAF50)), // Status sukses
Icon(Icons.error, color: const Color(0xFFEF5350)), // Status error
Icon(Icons.warning, color: const Color(0xFFFF9800)), // Status warning

// EasyLoading dengan catchError pada unawaited
unawaited(
  EasyLoading.show(
    status: 'Memproses...',
    maskType: EasyLoadingMaskType.black,
  ).catchError((e, s) => L.e('Gagal loading: $e $s')),
);
```

## Contoh Salah

```dart
// DILARANG: withOpacity deprecated
warna.withOpacity(0.2)

// DILARANG: Hardcode primary color (harus ikut tema)
final primary = const Color(0xFF2196F3);

// DILARANG: Semua warna hardcode (tidak support dark mode)
Container(color: Colors.blue, child: Text('...', style: TextStyle(color: Colors.white)))

// DILARANG: EasyLoading tanpa catchError
unawaited(EasyLoading.show(status: 'Memproses...'));
```


===== .agents/skills/isolasi-widget-timer/SKILL.md =====
---
name: isolasi-widget-timer
description: "Trigger: saat widget diperbarui berkala (Timer.periodic) | Panduan isolasi widget timer ke widget terpisah agar hanya widget itu yang rebuild, bukan seluruh halaman. Isolasi Widget yang Diperbarui Berkala (Timer/Animasi) Widget yang diperbarui secara berkala (mis. `Timer.periodic` per detik) wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild. Aturan 1. Widget yang diperbarui secara berkala wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild, bukan seluruh halaman. 2. Timer wajib dibatalkan (`cancel()`) di `dispose()` widget yang memilikinya. 3. Di dalam callback timer, periksa `mounted` sebelum memanggil `setState`. 4. Jangan menjalankan `Timer.periodic` pada widget yang mencakup seluruh halaman apabila hanya sebagian tampilan yang perlu diperbarui. 5. Jangan membiarkan timer tetap aktif setelah widget tidak lagi terpasang. 6. Widget teknik SOS yang interaktif (timer/animasi napas: Box Breathing, Napas 4-7"
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Isolasi Widget yang Diperbarui Berkala (Timer/Animasi)

Widget yang diperbarui secara berkala (mis. `Timer.periodic` per detik) wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild.

## Aturan

1. Widget yang diperbarui secara berkala wajib diisolasi ke widget terpisah (`StatefulWidget`) agar hanya widget tersebut yang melakukan rebuild, bukan seluruh halaman.
2. Timer wajib dibatalkan (`cancel()`) di `dispose()` widget yang memilikinya.
3. Di dalam callback timer, periksa `mounted` sebelum memanggil `setState`.
4. Jangan menjalankan `Timer.periodic` pada widget yang mencakup seluruh halaman apabila hanya sebagian tampilan yang perlu diperbarui.
5. Jangan membiarkan timer tetap aktif setelah widget tidak lagi terpasang.
6. Widget teknik SOS yang interaktif (timer/animasi napas: Box Breathing, Napas 4-7-8, Napas 90 Detik, Grounding 5-4-3-2-1, Urge Surfing, Timer Craving, Distraksi) wajib diekstrak ke file terpisah `lib/fitur/sos_craving/widgets/*_view.dart` sebagai `ConsumerStatefulWidget` + `ConsumerState`, bukan kelas private di dalam file layar. Layar utama hanya menyimpan state `_teknikTerpilih` dan merender tampilan sesuai pilihan.

## Contoh Benar

```dart
class _HeaderPemulihan extends StatefulWidget {
  const _HeaderPemulihan({required this.tanggalBerhenti});
  final DateTime tanggalBerhenti;

  @override
  State<_HeaderPemulihan> createState() => _HeaderPemulihanState();
}

class _HeaderPemulihanState extends State<_HeaderPemulihan> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // hanya widget ini yang rebuild tiap detik
    return Text('Hari ke-${_hitungHari()}');
  }
}
```

## Contoh Salah

```dart
// Timer.periodic dijalankan di widget tingkat halaman, menyebabkan
// seluruh halaman rebuild setiap detik.
class _HalamanState extends State<Halaman> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {}); // rebuild seluruh halaman
    });
  }
}
```


===== .agents/skills/keamanan-aplikasi/SKILL.md =====
---
name: keamanan-aplikasi
description: "Trigger: saat menerapkan keamanan aplikasi | Aturan keamanan: validasi input, enkripsi data sensitif, penyimpanan aman, platform validation, error handling tidak bocor info sensitif, dependency scanning. Aturan Keamanan Aplikasi Skill ini mendokumentasikan aturan keamanan yang wajib diterapkan di proyek ini. 1. Validasi Input (Input Validation) Aturan - **WAJIB** validasi semua input pengguna (form, query param, deep link, notifikasi payload). - Validasi di sisi client (UI) DAN server-side (repository/notifier) - defense in depth. - Gunakan `Form` + `GlobalKey<FormState>` + `validator` untuk form. - **DILARANG** `?? 0` atau `?? ''` masking input tidak valid (lihat `validasi-form-sebelum-penyimpanan`). - Sanitasi input sebelum simpan ke DB (trim, escape, normalisasi). 2. Penyimpanan Data Sensitif Aturan - **DILARANG** simpan password, token, PIN, kunci enkripsi di `SharedPreferences` / SQLite plaintext. - Data sensitif **WAJIB** dienkripsi (mis. `flutter_secure_storage` untuk keychain/keystore). - Database SQL"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Aturan Keamanan Aplikasi

Skill ini mendokumentasikan aturan keamanan yang wajib diterapkan di proyek ini.

## 1. Validasi Input (Input Validation)

### Aturan

- **WAJIB** validasi semua input pengguna (form, query param, deep link, notifikasi payload).
- Validasi di sisi client (UI) DAN server-side (repository/notifier) - defense in depth.
- Gunakan `Form` + `GlobalKey<FormState>` + `validator` untuk form.
- **DILARANG** `?? 0` atau `?? ''` masking input tidak valid (lihat `validasi-form-sebelum-penyimpanan`).
- Sanitasi input sebelum simpan ke DB (trim, escape, normalisasi).

```dart
// Validator contoh
validator: (value) {
  final trimmed = value?.trim() ?? '';
  if (trimmed.isEmpty) return 'Wajib diisi';
  if (trimmed.length > 100) return 'Maksimal 100 karakter';
  // Sanitasi: hapus karakter berbahaya
  if (trimmed.contains(RegExp(r'[<>\"\'&]'))) return 'Karakter tidak diperbolehkan';
  return null;
}
```

## 2. Penyimpanan Data Sensitif

### Aturan

- **DILARANG** simpan password, token, PIN, kunci enkripsi di `SharedPreferences` / SQLite plaintext.
- Data sensitif **WAJIB** dienkripsi (mis. `flutter_secure_storage` untuk keychain/keystore).
- Database SQLite lokal **TIDAK** dienkripsi (offline-first, data tidak sensitif: biodata, craving, impian).
- Jika butuh enkripsi DB, gunakan `sqflite_sqlcipher` (native dependency).

### Data yang BOLEH plaintext SQLite:

- Biodata (nama, tanggal, jumlah rokok, harga)
- Craving diary (trigger, feeling, durasi)
- Impian (nama, target, deskripsi)
- Badge, milestone, preferensi UI

### Data yang WAJIB enkripsi (pakai flutter_secure_storage):

- API keys (kalau ada)
- Auth tokens (kalau ada backend)
- Biometric keys

## 3. Platform Validation & Permission

### Aturan

- **WAJIB** cek dukungan platform sebelum pakai API (lihat `validasi-platform-izin`, `flutter-local-notifications-22-3-3`).
- **WAJIB** minta izin runtime sesuai kebijakan OS (Android 13+ POST_NOTIFICATIONS, iOS UNUserNotificationCenter).
- **DILARANG** asumsikan izin granted → cek hasil request izin.
- **DILARANG** tampilkan kontrol fitur yang tidak didukung platform (mis. scheduled notification di Web).

```dart
// Contoh: cek platform & izin sebelum schedule notifikasi
if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
  final granted = await FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  if (granted == true) {
    // Schedule notifikasi
  } else {
    // Handle izin ditolak - jangan crash, tampilkan info
  }
}
```

## 4. Error Handling - Tidak Bocor Info Sensitif

### Aturan

- **DILARANG** tampilkan stack trace, SQL query, path file, detail internal ke user.
- Log error detail (`L.e`) untuk debugging, tampilkan user-friendly message (`AppToast.error`).
- Exception khusus (`class implements Exception`) untuk deteksi via `is`, bukan string matching.

```dart
// SALAH: Bocor detail internal
catch (e) {
  AppToast.error(context, 'DB Error: $e'); // JANGAN
}

// BENAR: User-friendly + log detail
catch (e, s) {
  L.e('Gagal simpan biodata', e, s);
  AppToast.error(context, 'Gagal menyimpan data. Coba lagi.');
}
```

### Referensi

- `exception-khusus-deteksi-error` skill
- `penanganan-error-unawaited` skill

## 5. Dependency Security

### Aturan

- **WAJIB** `flutter pub outdated` berkala untuk cek vulnerability.
- **WAJIB** review `pubspec.lock` saat upgrade dependency major.
- Gunakan `dart pub deps --style=compact` untuk audit dependency tree.
- Hindari dependency yang tidak maintained / deprecated.

## 6. Network Security (Jika Ada Backend)

### Aturan

- **WAJIB** HTTPS (TLS 1.2+) untuk semua network call.
- **DILARANG** `http://` production (kecuali localhost development dengan `usesCleartextTraffic=true` di Android manifest).
- Certificate pinning untuk API kritikal (opsional tapi direkomendasikan).
- Timeout network call wajib di-set (mis. 10 detik).

## 7. Data Export/Backup Security

### Aturan

- File backup **WAJIB** validasi struktur sebelum restore (lihat `ekspor-pemulihan-cadangan`).
- **DILARANG** restore file backup tanpa validasi signature/checksum.
- **DILARANG** overwrite data tanpa konfirmasi destruktif.
- Hapus file backup parsial gagal setelah operasi.

## 8. Local Authentication (Biometric/PIN)

### Aturan

- Gunakan `local_auth` package untuk biometric/PIN.
- **DILARANG** fallback ke PIN aplikasi custom (pakai OS lockscreen).
- Hanya aktifkan fitur sensitif (hapus data, export) setelah auth berhasil.

## 9. Logging Security

### Aturan

- **DILARANG** log data sensitif (password, token, PII lengkap) ke `L.i`/`L.w`/`L.e`.
- Log metadata saja: `L.i('userId=$id, action=login')`, bukan `L.i('password=$pass')`.
- Production: matikan debug log verbose, hanya error/warning.

## 10. Larangan Keamanan

- **DILARANG** `eval()` / `Function.apply` / dynamic code execution.
- **DILARANG** `dart:mirrors` (tidak support Flutter AOT).
- **DILARANG** `WebView` load URL tidak trusted tanpa validasi.
- **DILARANG** `path_provider` akses directory sensitif tanpa alasan.
- **DILARANG** hardcode secret di kode (API key, password) → gunakan `--dart-define` / env.

## Referensi Aturan Sumber

- `aturan_bersama.md` — Validasi platform/izin, Form validation, Exception khusus
- `aturan_khusus.md` — Konfirmasi destruktif, Platform validation
- `validasi-platform-izin` skill
- `flutter-local-notifications-22-3-3` skill
- `ekspor-pemulihan-cadangan` skill
- `konfirmasi-sebelum-simpan` skill
- `exception-khusus-deteksi-error` skill
- `penanganan-error-unawaited` skill

## Referensi Commit Terkait

- `774431d` — flutter_local_notifications setup dengan platform check
- `338a021` — Backup/restore dengan validasi & konfirmasi
- `3b67d309` — Form validation, error handling pattern


===== .agents/skills/kelompok-skill-wajib/SKILL.md =====
---
name: kelompok-skill-wajib
description: "Trigger: saat memperbarui kelompok skill wajib | Panduan kelompok skill wajib: path file valid, trigger jelas, tanggal diperbarui lengkap beserta jam, laporan skill yang tidak tersedia, dan penyusunan A-Z. Indeks non-code HANYA berisi skill non-code. Kelompok Skill Wajib Panduan pemeliharaan kelompok skill wajib pada indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) agar konsisten dan dapat diaudit. Aturan 1. Setiap skill pada kelompok skill wajib memiliki path file yang valid, trigger yang jelas, dan tanggal diperbarui lengkap beserta jam. 2. Jika skill tidak tersedia, laporkan; jangan mengarang. 3. Setiap skill yang diubah wajib memperbarui tanggal diperbaruinya. 4. Jika memperbarui berkas kelompok skill wajib, wajib memuat skill ini terlebih dahulu. 5. Susun daftar skill berdasarkan abjad A-Z. 6. Trigger pada setiap skill wajib ditulis detail dan spesifik agar AI dapat memuat skill yang relevan. 7. Jika ada skill baru atau pembaruan berkas skill, wajib perbarui indeks skill (`.agents/rules/kelompok_"
---

# Kelompok Skill Wajib

Panduan pemeliharaan kelompok skill wajib pada indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) agar konsisten dan dapat diaudit.

## Aturan

1. Setiap skill pada kelompok skill wajib memiliki path file yang valid, trigger yang jelas, dan tanggal diperbarui lengkap beserta jam.
2. Jika skill tidak tersedia, laporkan; jangan mengarang.
3. Setiap skill yang diubah wajib memperbarui tanggal diperbaruinya.
4. Jika memperbarui berkas kelompok skill wajib, wajib memuat skill ini terlebih dahulu.
5. Susun daftar skill berdasarkan abjad A-Z.
6. Trigger pada setiap skill wajib ditulis detail dan spesifik agar AI dapat memuat skill yang relevan.
7. Jika ada skill baru atau pembaruan berkas skill, wajib perbarui indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`).
8. **Indeks non-code (`.agents/rules/kelompok_skill_wajib_non_code.md`) HANYA berisi skill dari `.agents/skills/non-code/`. DILARANG memasukkan skill code ke indeks non-code.**

## Larangan

- DILARANG mencantumkan path file yang tidak valid atau skill yang tidak tersedia tanpa laporan.
- DILARANG menyusun daftar skill selain berdasarkan abjad A-Z.
- DILARANG mengubah berkas kelompok skill wajib tanpa memuat skill ini terlebih dahulu.
- DILARANG tidak memperbarui indeks skill (`.agents/rules/kelompok_skill_wajib_*.md`) saat ada skill baru atau pembaruan skill.
- DILARANG memasukkan skill code ke `.agents/rules/kelompok_skill_wajib_non_code.md`.


===== .agents/skills/konfigurasi-kilo-proyek/SKILL.md =====
---
name: konfigurasi-kilo-proyek
description: "Trigger: saat membuat atau mengubah konfigurasi Kilo proyek atau command Kilo | Panduan prosedur & larangan konfigurasi `.kilo/kilo.jsonc` proyek (bukan snapshot isi config): baca `permission` sebelum `bash` (AGENTS.md aturan 11), deny mutlak, perbarui `MEMORI.md` setelah ubah config, jangan commit config tanpa perintah pengguna; plus tutorial pembuatan commands Kilo (lokasi & struktur rekursif, frontmatter, variabel template, subcommand & fallback, konvensi proyek); rujukan `.kilo/kilo.jsonc`, `.kilo/commands/`, dan dokumen resmi Kilo. Konfigurasi Kilo Proyek dan Commands Kilo Prosedur dan larangan konfigurasi Kilo tingkat proyek (`.kilo/kilo.jsonc`) beserta tutorial pembuatan commands Kilo di `.kilo/commands/`. Isi bersifat prosedural — bukan snapshot isi config; nilai config (model, daftar permission) sengaja tidak disalin agar skill tidak cepat usang. Sumber kebenaran konfigurasi adalah berkas config proyek itu sendiri; untuk konfigurasi Kilo generik (bukan spesifik proyek), rujuk skill bawaan `kilo-confi"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Tue Nov 17 2026 23:39 WIB"
---

# Konfigurasi Kilo Proyek dan Commands Kilo

Berlaku pada workspace/proyek yang memuat skill ini; bukan terikat pada satu proyek tertentu.

Prosedur dan larangan konfigurasi Kilo tingkat proyek (`.kilo/kilo.jsonc`) beserta tutorial pembuatan commands Kilo di `.kilo/commands/`. Isi bersifat prosedural — bukan snapshot isi config; nilai config (model, daftar permission) sengaja tidak disalin agar skill tidak cepat usang. Sumber kebenaran konfigurasi adalah berkas config proyek itu sendiri; untuk konfigurasi Kilo generik (bukan spesifik proyek), rujuk skill bawaan `kilo-config`.

## Cakupan yang Di-Cover

- Berkas: `.kilo/kilo.jsonc` (config proyek, sumber kebenaran — AGENTS.md aturan 11), `.kilo/prompts/code.md`, `.kilo/prompts/ask.md`, `.kilo/prompts/debug.md`, `.kilo/commands/**`, `MEMORI.md`, `memori/riwayat_perubahan.md`, `docs/kilo/kilo_global.txt` (arsip usang)
- Konsep config Kilo: bagian `permission` (`allow`/`ask`/`deny`, pola glob, proteksi `.env`), `instructions`, `skills.paths` (path relatif), `agent.<nama>.prompt` dengan `{file:...}`, `commit_message.prompt`, `indexing`
- Konsep commands Kilo: pola pemuatan `{command,commands}/**/*.md` rekursif, frontmatter command (`description`, `agent`, `model`, `variant`, `subtask`), variabel template (`$1`–`$N`, `$ARGUMENTS`, `@file`)
- Skill bawaan: `kilo-config` (builtin, generik; bukan pengganti skill ini dan bukan project-local)

## Aturan

1. Sumber kebenaran konfigurasi Kilo proyek adalah `.kilo/kilo.jsonc` (bukan `kilo.json`, bukan `~/.config/kilo/kilo.jsonc` global, bukan `docs/kilo/kilo_global.txt`). Baca ulang berkas ini setiap interaksi — nilai (terutama `permission`) dapat berubah sewaktu-waktu.
2. Sebelum menjalankan `bash` atau tindakan lain, wajib baca bagian `permission` pada `.kilo/kilo.jsonc` (AGENTS.md aturan 11). Gunakan tool bawaan lebih dahulu sesuai `.agents/skills/non-code/penggunaan-tool-bawaan-kilo/SKILL.md`; shell hanya untuk operasi tanpa padanan tool. Izin `deny` bersifat mutlak: DILARANG dilewati, diakali, atau dieksekusi lewat perintah lain.
3. Daftar `deny` dapat berubah setiap saat; baca `.kilo/kilo.jsonc` dan jangan menghafal atau menyalin daftar tersebut ke skill/dokumen. Verifikasi dari berkas pada setiap interaksi.
4. Config global `~/.config/kilo/kilo.jsonc` kini nyaris kosong (hanya `$schema`, terverifikasi 2026-11-12). Seluruh `permission` aktif berada di config proyek; jangan mengandalkan global.
5. `docs/kilo/kilo_global.txt` adalah arsip usang (memuat model dan prompt inline lama, mis. `agent.code` `kilo/baidu/ernie-5.5-flash-preview:free` dan prompt `"kamu adalah pekerja saya"`). DILARANG dijadikan rujukan aktif atau dasar restore; gunakan hanya sebagai arsip historis.
6. Setelah mengubah `.kilo/kilo.jsonc`, wajib perbarui `MEMORI.md` (bagian `File Konfigurasi & Penting` dan bagian relevan lain) dan tambah entri pada `memori/riwayat_perubahan.md`.
7. Config tidak boleh di-commit, di-push, atau diubah "sekalian" tanpa perintah pengguna; perubahan config yang berdampak (permission, `external_directory`, model) menunggu keputusan eksplisit pengguna.
8. `.kilo/kilo.jsonc` tervalidasi otomatis oleh harness Kilo saat diedit; bila edit gagal validasi, perbaiki berkas sebelum melanjutkan, jangan mengabaikan galat validasi.
9. Prompt agent disimpan sebagai berkas di `.kilo/prompts/` dan dirujuk dari config dengan `{file:./prompts/<nama>.md}` (diterapkan 2026-11-12/13: `code.md` dipindahkan dari root `prompts/`, `ask.md` dan `debug.md` dibuat). Prompt inline panjang tidak ditulis langsung di config.
10. `skills.paths` memakai path relatif (mis. `.agents/skills/code`, `.agents/skills/non-code`, `.agents/skills`, `.agents/skills/bawaan`) yang portabel lintas mesin; jangan memakai path absolut spesifik mesin.
11. Untuk konfigurasi Kilo generik (paths, fields, providers, TUI, Agent Manager, dll.), rujuk skill bawaan `kilo-config`; skill ini memuat prosedur & larangan khusus proyek/workspace yang memuatnya, bukan terikat pada satu proyek tertentu.
12. Perubahan pada config yang belum diputuskan pengguna (mis. `external_directory` yang menunjuk path usang dan `kilo_memory_recall: "*": "allow"`) DILARANG dilakukan sepihak; catat sebagai pertanyaan terbuka pada `diskusi_N.md`.
13. Isi tutorial commands pada skill ini bersumber dari berkas nyata di `.kilo/commands/` proyek dan riwayat commit; jangan menambah contoh fiktif.

## Tutorial Pembuatan Commands Kilo

### Lokasi dan Struktur

- Commands proyek berada di `.kilo/commands/`; baik direktori bernama `command/` maupun `commands/` didukung, dan pola pemuatan `{command,commands}/**/*.md` bersifat rekursif, sehingga subdirektori di proyek ini ikut dimuat: `.kilo/commands/mode/` (mis. `mode_diskusi.md`), `.kilo/commands/prd/` (mis. `kerjakan_prd.md`), `.kilo/commands/fitur/` (mis. `membuat_prd_fitur.md`), `.kilo/commands/sinkronisasi/` (mis. `sinkronkan_skill_dengan_aturan.md`).
- Nama berkas (minus `.md`) menjadi nama command yang dipanggil (mis. `kerjakan_task.md` → `/kerjakan_task`).
- Mirror manual `gpt/` (root proyek) sudah tidak ada per 2026-11-14; command `.kilo/commands/sinkronisasi/sinkronkan_commands.md` yang memeliharanya telah dihapus (sesi 47). Sinkronisasi command hanya dilakukan lewat `.kilo/commands/sinkronkan_semua.md` (menyegarkan rujukan antar-dokumen), bukan lewat mirror.
- Config global `~/.config/kilo/command/*.md` berada di luar cakupan proyek ini; jangan mencampuradukkan.

### Frontmatter dan Nama Command

- Field frontmatter yang didukung: `description`, `agent`, `model`, `variant`, `subtask`.
- Frontmatter minimal cukup `description` bila tidak perlu override agent/model.
- Contoh nyata di proyek: `tambah_log.md` dan `analisa_log.md` (`description` + `agent: code`); `kerjakan_hasil_diskusi.md` dan `evaluasi_size_ruang_kerja.md` (hanya `description`); `kerjakan_task.md` (tanpa frontmatter sama sekali, tetap sah dimuat).
- Nama berkas harus aman dijadikan nama command: huruf kecil, angka, dan garis bawah; DILARANG memakai spasi (preseden: berkas `contoh satu.md` pernah di-rename karena nama command menjadi ambigu).
- `agent` pada frontmatter menunjuk agent yang menjalankan command (mis. `code`); `variant` override reasoning effort model; `subtask` menandai command sebagai subtask.

### Variabel Template

- `$1`–`$N`: argumen positional (kata ke-1 sampai ke-N dari argumen command).
- `$ARGUMENTS`: seluruh string argumen apa adanya.
- `@file`: TIDAK di-expand oleh Kilo (terverifikasi via uji pada sesi 2026-11-13); teks sampai ke model apa adanya dan agen membaca isi berkas dengan tool `read`. Jangan menaruh `@file` dengan harapan isinya disuntik otomatis.
- `` !`cmd` ``: output shell; sintaks ini berisiko ambigu di editor dan DILARANG dipakai pada command proyek.
- Kedua variabel positional (`$1`, `$ARGUMENTS`) terverifikasi di-substitute (command tanpa argumen → keduanya kosong).
- Tidak ada command di repo saat ini yang memakai variabel template; variabel di atas bersumber dari dokumentasi resmi Workflows dan verifikasi sesi 2026-11-13.

### Subcommand dan Fallback

- Command kustom TIDAK dapat mendaftarkan subcommand lewat frontmatter (berbeda dengan command bawaan seperti `/review uncommitted`).
- Pola (a): satu berkas dengan positional `$1` + percabangan instruksi + fallback tool `question` saat argumen kosong/tidak dikenal. Rujukan nyata pola fallback: `.kilo/commands/kerjakan_hasil_diskusi.md` (meminta input file diskusi bila belum ditentukan) dan `.kilo/commands/sinkronkan_semua.md` (memakai `git status`/`git diff` sebagai sumber saat konteks hilang, lalu `question` bila tetap tidak jelas).
- Pola (b): satu berkas per subcommand (masing-masing tampil sebagai entri terpisah) dengan logika bersama di-_include_. Catatan akurasi: contoh historis pola ini (`contoh_menu.md`, `contoh_menu_satu.md`, `contoh_menu_dua.md`, `.kilo/shared/contoh_bersama.md`) **tidak ditemukan di repository** (dibuat di working tree pada 2026-11-13, tidak pernah ter-commit, dan kini sudah tidak ada) — jangan dirujuk seolah berkas nyata; gunakan pola (a) atau susun berkas baru sesuai kebutuhan.

### Konvensi Proyek untuk Commands

- Isi command menggunakan bahasa Indonesia baku, bergaya instruksi untuk agen (bukan kode Dart).
- Cantumkan larangan eksplisit bila command tidak boleh menyentuh sesuatu (kode Dart, file hasil generate, arsip `hasil_diskusi/`, `docs/kilo/kilo_global.txt`, commit/push) — contoh nyata: `.kilo/commands/sinkronkan_semua.md`.
- Larangan umum lain: jangan commit/push kecuali diminta; jangan mengubah config Kilo tanpa keputusan pengguna.
- Contoh command yang baik di proyek ini: `.kilo/commands/tambah_log.md`, `.kilo/commands/kerjakan_task.md`, `.kilo/commands/analisa_log.md`, `.kilo/commands/kerjakan_hasil_diskusi.md`.
- Setelah membuat/mengubah command, jalankan `.kilo/commands/sinkronkan_semua.md` bila diperlukan agar tidak ada rujukan yang usang, dan perbarui `MEMORI.md`/`memori/riwayat_perubahan.md` bila mengubah state proyek.
- Jangan menyalin isi command ke dalam skill atau dokumen lain; rujuk path berkasnya.

## Larangan

- DILARANG melewati, mengakali, atau mendelegasikan izin `deny` pada `.kilo/kilo.jsonc` lewat perintah, interpreter, alias, atau tool lain.
- DILARANG menjadikan `docs/kilo/kilo_global.txt` atau `~/.config/kilo/kilo.jsonc` sebagai sumber kebenaran permission/konfigurasi aktif proyek.
- DILARANG menyalin isi atau nilai `.kilo/kilo.jsonc` (model, daftar permission, `instructions`) ke dalam skill, dokumen, atau command sebagai snapshot; rujuk path berkas.
- DILARANG membuat atau mengubah `.kilo/kilo.jsonc` tanpa perintah pengguna, dan DILARANG commit/push config tanpa perintah eksplisit.
- DILARANG menulis prompt agent inline panjang di config; gunakan berkas di `.kilo/prompts/` + `{file:...}`.
- DILARANG `skills.paths` dengan path absolut spesifik mesin; gunakan path relatif.
- DILARANG nama berkas command mengandung spasi; gunakan huruf kecil/angka/garis bawah.
- DILARANG mendaftarkan subcommand command kustom lewat frontmatter (tidak didukung); gunakan pola positional + fallback atau berkas per subcommand.
- DILARANG memakai sintaks `` !`cmd` `` dan DILARANG mengandalkan `@file` ter-expand otomatis pada command proyek.
- DILARANG mengarang isi dokumen resmi Kilo; skill hanya merujuk URL, tidak menyalin isinya.
- DILARANG mengubah config untuk temuan yang menunggu keputusan pengguna (mis. `external_directory` usang dan `kilo_memory_recall: "*": "allow"`).

## Contoh Benar

```jsonc
// Pola wiring prompt agent dengan berkas (di .kilo/kilo.jsonc — commit 50ee3c7, 26362be)
"agent": {
  "ask": {
    "model": "kilo/kilo-auto/free",
    "variant": "max",
    "prompt": "{file:./prompts/ask.md}"
  }
}
```

```markdown
<!-- .kilo/commands/tambah_log.md (contoh nyata — frontmatter minimal + instruksi bahasa Indonesia) -->

---

description: Menambahkan log debug terstruktur (L.i, L.w, L.e) secara presisi pada variabel dan parameter di file Dart yang ditentukan sesuai standar proyek.
agent: code
---

# TUJUAN UTAMA

Perintahkan AI untuk menambahkan baris log debug ...
```

```markdown
<!-- Pola fallback saat argumen kosong/tidak dikenal (dirujuk dari .kilo/commands/sinkronkan_semua.md) -->

Jika konteks percakapan sesi ini sudah hilang (mis. setelah auto compaction), gunakan `git status` dan `git diff` untuk menentukan pembaruan, dan jangan menebak. Jika tetap tidak jelas, tanyakan dulu ke pengguna dengan tool `question` sebelum mengubah berkas apa pun.
```

## Contoh Salah

```jsonc
// Prompt inline panjang langsung di config
"debug": {
  "model": "kilo/kilo-auto/free",
  "prompt": "kamu harus mengatasi masalah ini, agar mengikuti file dependensi nya supaya ketemu solusinya" // salah: prompt inline; wajib berkas di .kilo/prompts/ + {file:...}
}
```

```bash
# Mengakali deny dengan interpreter lain
python3 -c "print(open('.env').read())"   # DILARANG: deny `python3 *` bersifat mutlak
sed -n '1,20p' .env                        # DILARANG: deny `sed *` dan `read *.env`
cat .env                                   # DILARANG: deny `cat *`
```

```bash
# Memakai shell untuk operasi yang sudah punya tool bawaan
rg "namaFungsi" lib/                       # DILARANG: gunakan tool `grep`
find . -name '*.dart'                      # DILARANG: gunakan tool `glob`
ls lib/                                    # DILARANG: gunakan tool `list`
head -n 20 lib/main.dart                   # DILARANG: gunakan tool `read`
```

```markdown
<!-- Snapshot config ke dalam skill/dokumen -->

Skill ini mencatat bahwa permission proyek berisi `"*": "ask"`, `"git status *": "allow"`, ... // salah: snapshot cepat usang; rujuk .kilo/kilo.jsonc
```

```markdown
<!-- Frontmatter command mencoba mendaftar subcommand -->

---

description: Menu utama
subcommands: [satu, dua] # salah: field tidak didukung; subcommand via $1 + fallback atau berkas per subcommand
---
```


===== .agents/skills/larangan-backup-task/SKILL.md =====
---
name: larangan-backup-task
description: "Trigger: saat membuat berkas cadangan task | Larangan membawa berkas .backup/.bak/.sebelum_* ke repository: hanya di working tree, jangan git add, gunakan git stash/reflog. Larangan Membawa Berkas Cadangan `.backup task/` ke Repository Berkas cadangan (.bak, .backup, .sebelum_*) hanya di working tree, jangan commit. Gunakan git stash/reflog untuk versi lama. Aturan 1. Berkas cadangan hanya boleh ada di working tree, bukan di commit. 2. Jangan `git add` berkas cadangan saat commit `task.md` atau file lain. 3. Simpan versi lama di luar repo atau pakai `git stash`/`git reflog`, bukan file `.bak` di-commit. 4. Commit hanya berisi perubahan yang benar-benar diperlukan. Larangan - Jangan commit file `.bak`, `.backup`, `.sebelum_*`. - Jangan tinggalkan arsip cadangan di working tree setelah commit (bersihkan). - Jangan gunakan berkas cadangan sebagai pengganti riwayat Git. Contoh Benar Contoh Salah Skill ini wajib dibaca sebelum bertindak; patuhi seluruh aturan, contoh, dan larangan yang tercantum. Skill ini wajib d"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Larangan Membawa Berkas Cadangan `.backup task/` ke Repository

Berkas cadangan (.bak, .backup, .sebelum_*) hanya di working tree, jangan commit. Gunakan git stash/reflog untuk versi lama.

## Aturan

1. Berkas cadangan hanya boleh ada di working tree, bukan di commit.
2. Jangan `git add` berkas cadangan saat commit `task.md` atau file lain.
3. Simpan versi lama di luar repo atau pakai `git stash`/`git reflog`, bukan file `.bak` di-commit.
4. Commit hanya berisi perubahan yang benar-benar diperlukan.

## Larangan

- Jangan commit file `.bak`, `.backup`, `.sebelum_*`.
- Jangan tinggalkan arsip cadangan di working tree setelah commit (bersihkan).
- Jangan gunakan berkas cadangan sebagai pengganti riwayat Git.

## Contoh Benar

```bash
git add task.md
git commit -m "task: tandai tugas selesai"
```

## Contoh Salah

```bash
git add task.md .backup\ task/task.md.bak
git commit -m "task: tandai tugas selesai"
```


========================================')`, `L.i('LIFECYCLE: ...')`); saat membersihkan log, hapus log semacam itu dan pertahankan hanya log nilai aktual, titik penting (initState, dispose, catch `$e $s`), dan ringkasan bermakna.

## Larangan

- Jangan membuat sistem logging baru.
- Jangan membuat kelas/wrapper log manual per proyek (mis. `lib/debug/log.dart` dengan `class Log`, `_formatData`, atau `_logCustom`) — hapus dan migrasikan seluruh pemakaiannya ke `L` dari `share_global_saya` (`package:share_global_saya/src/utils/l.dart`); `L` adalah satu-satunya pintu masuk logging yang sah.
- Jangan mencetak properti model satu per satu (gunakan `$model`).
- Jangan mencetak data sensitif.
- Jangan mengubah logika program saat menambahkan log.

## Contoh Benar

```dart
L.i('dummyImpian.length=${dummyImpian.length}, dummyBiodata.length=${dummyBiodata.length}');
L.i('row=$row');
L.i('biodata=$biodata');
L.i('impian=$impian');
L.i('konfirmasi=$konfirmasi');
L.s('isinImpianBerhasil: id=$idImpian');
L.json({'row': row, 'tanggal': tanggal});
L.list(listImpian, label: '📋 daftarImpian');
L.api('/api/impian', {'id': 1}, method: 'GET');
L.i('_namaController.text=${_namaController.text}, _jumlahController.text=${_jumlahController.text}, _targetTanggal=$_targetTanggal');
L.i('listImpian.length=${listImpian.length}, totalJumlah=${impianState.totalJumlah}');
L.i('DashboardScreen initState');
L.i('DashboardScreen dispose');
L.i('biodataAsync=$biodataAsync');
L.w('konfirmasi bukan ok');
L.w('jumlah <= 0');
L.w('biodataAsync loading');
L.e('Gagal memasukkan data dummy: $e $s');
L.e('biodataAsync error: ${biodataAsync.error} ${biodataAsync.stackTrace}');
L.i('tanggalBerhenti=$tanggalBerhenti, jumlahRokokPerHari=$jumlahRokokPerHari, hargaPerBungkus=$hargaPerBungkus, hariBerhenti=$hariBerhenti, rokokTidakDiHisap=$rokokTidakDiHisap, uangDihemat=$uangDihemat');
L.i('icon=$icon, title=$title, subtitle=$subtitle');
```

## Contoh Salah

```dart
L.i('tes'); // tidak memberikan informasi nilai variabel
L.i('nama=${model.nama}, umur=${model.umur}'); // menguraikan properti model
print('data=$data'); // menggunakan print() alih-alih L.*

// DILARANG: kelas pembungkus log manual per proyek
class Log {
  static void info(String message) => debugPrint('... $message'); // wrapper manual
}

// DILARANG: log narasi langkah tanpa nilai aktual
L.i('Membuat instance PelangganOperasi');
L.i('Memeriksa apakah perangkat dapat membuka URI WhatsApp');
L.i('Memanggil _loadDetails() untuk mengambil data');

// DILARANG: banner/separator
L.i('========================================');
L.i('LIFECYCLE: build() - Membangun UI');
```


===== .agents/skills/material-app-tema-lokalisasi/SKILL.md =====
---
name: material-app-tema-lokalisasi
description: "Trigger: saat mengonfigurasi MaterialApp dan WidgetsApp | Panduan tema (theme, darkTheme, themeMode), lokalisasi (locale, supportedLocales, localizationsDelegates), dan ScrollBehavior. Konfigurasi MaterialApp, Tema, dan Lokalisasi Mengatur `MaterialApp` / `WidgetsApp` dengan tema gelap/terang, locale, supportedLocales, dan localizationsDelegates untuk aplikasi multi-bahasa. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/widgets/material/app.dart`, `lib/src/widgets/app.dart`) - Class: `MaterialApp`, `WidgetsApp`, `ThemeMode`, `ThemeData`, `MaterialScrollBehavior`, `ScrollBehavior`, `Localizations`, `LocalizationsDelegate`, `GlobalKey` - Enum: `ThemeMode.system`, `ThemeMode.light`, `ThemeMode.dark` - Properti: `theme`, `darkTheme`, `highContrastTheme`, `highContrastDarkTheme`, `themeMode`, `themeAnimationDuration`, `themeAnimationCurve`, `locale`, `supportedLocales`, `localizationsDelegates`, `localeResolutionCallback`, `localeListResolutionCallback`, `color`, `debugShowCheckedModeBanner`, `n"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Konfigurasi MaterialApp, Tema, dan Lokalisasi

Mengatur `MaterialApp` / `WidgetsApp` dengan tema gelap/terang, locale, supportedLocales, dan localizationsDelegates untuk aplikasi multi-bahasa.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/widgets/material/app.dart`, `lib/src/widgets/app.dart`)
- Class: `MaterialApp`, `WidgetsApp`, `ThemeMode`, `ThemeData`, `MaterialScrollBehavior`, `ScrollBehavior`, `Localizations`, `LocalizationsDelegate`, `GlobalKey`
- Enum: `ThemeMode.system`, `ThemeMode.light`, `ThemeMode.dark`
- Properti: `theme`, `darkTheme`, `highContrastTheme`, `highContrastDarkTheme`, `themeMode`, `themeAnimationDuration`, `themeAnimationCurve`, `locale`, `supportedLocales`, `localizationsDelegates`, `localeResolutionCallback`, `localeListResolutionCallback`, `color`, `debugShowCheckedModeBanner`, `navigatorKey`, `scaffoldMessengerKey`
- Method: `basicLocaleListResolution`, `Theme.of`, `MediaQuery.platformBrightnessOf`

## Aturan

1. `MaterialApp` membungkus `WidgetsApp` dan menambahkan fungsionalitas Material Design (AnimatedTheme, ScaffoldMessenger, Hero, DefaultSelectionStyle).
2. Salah satu dari `home`, `routes`, `onGenerateRoute`, atau `builder` harus non-null.
3. `themeMode = ThemeMode.system` mengikuti kecerahan sistem melalui `MediaQuery.platformBrightnessOf`.
4. `darkTheme` wajib memiliki `ThemeData.brightness = Brightness.dark` jika disediakan.
5. `highContrastTheme` dan `highContrastDarkTheme` untuk aksesibilitas high contrast (mis. iOS).
6. `supportedLocales` default adalah `[Locale('en', 'US')]`. Tambahkan locale yang didukung aplikasi.
7. `localizationsDelegates` harus menyertakan `GlobalMaterialLocalizations.delegate` dan `GlobalWidgetsLocalizations.delegate` untuk lokalisasi bawaan Flutter.
8. `localeResolutionCallback` atau `localeListResolutionCallback` digunakan untuk override algoritma pemilihan locale default.
9. `color` digunakan untuk warna app switcher di Android lama, diambil dari light theme meski dark mode aktif.
10. `debugShowCheckedModeBanner = true` default di debug mode; setel `false` untuk menyembunyikan banner DEBUG.
11. `themeAnimationDuration` default `kThemeAnimationDuration`; setel `Duration.zero` untuk transisi tema instan.
12. `navigatorKey` (`GlobalKey<NavigatorState>`) dan `scaffoldMessengerKey` (`GlobalKey<ScaffoldMessengerState>`) — dideklarasikan top-level final di berkas khusus (mis. `share_global_saya/lib/src/utils/app_keys.dart`: `navigatorKey` untuk navigasi dari widget overlay global di luar pohon halaman aktif, `scaffoldMessengerKey` untuk akses `ScaffoldMessenger` global), didaftarkan SEKALI di `MaterialApp(navigatorKey: ..., scaffoldMessengerKey: ...)`, dan TIDAK boleh dibuat di dalam `build()`.

## Larangan

- `darkTheme` dengan brightness bukan `Brightness.dark`.
- `MaterialApp` tanpa `home`, `routes`, `onGenerateRoute`, atau `builder` (tidak ada Navigator).
- `supportedLocales` kosong (harus minimal 1 elemen).
- `localizationsDelegates` tanpa delegate Material/Widgets untuk aplikasi yang menggunakan lokalisasi bawaan.

## Contoh Benar

```dart
MaterialApp(
  title: 'Berhenti Merokok',
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    useMaterial3: true,
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    useMaterial3: true,
  ),
  themeMode: ThemeMode.system,
  locale: Locale('id', 'ID'),
  supportedLocales: [
    Locale('en', 'US'),
    Locale('id', 'ID'),
  ],
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  debugShowCheckedModeBanner: false,
  home: const HomeScreen(),
);
```

## Contoh Salah

```dart
// darkTheme tanpa brightness dark
darkTheme: ThemeData(primaryColor: Colors.blue), // salah: brightness default light
```

```dart
// supportedLocales kosong
supportedLocales: [], // assert error
```


===== .agents/skills/material-ui/SKILL.md =====
---
name: material-ui
description: "Trigger: saat menambah/mengubah impor material Flutter, saat memakai/mengganti MaterialApp, saat migrasi package:flutter/material.dart ke package:material_ui/material_ui.dart | Impor material wajib package:material_ui/material_ui.dart (package:flutter/material.dart deprecated sejak v3.47.0-0.0.pre); MaterialApp material_ui menyediakan delegasi MaterialLocalizations bawaan (dilarang menambah localizationsDelegates/supportedLocales manual); error No MaterialLocalizations found pada Overlay root manual diatasi dengan Localizations DI ATAS Directionality, bukan delegasi di MaterialApp. Impor Material Flutter: material_ui `package:flutter/material.dart` deprecated sejak v3.47.0-0.0.pre; seluruh impor material wajib memakai `package:material_ui/material_ui.dart`. Aturan 1. Impor material WAJIB memakai `package:material_ui/material_ui.dart`; `package:flutter/material.dart` DILARANG — deprecated sejak v3.47.0-0.0.pre (analyzer: `deprecated_member_use`). 2. MaterialApp dari `material_ui` sudah menyediakan delegasi `Ma"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Thu Nov 19 2026 09:36 WIB"
---

# Impor Material Flutter: material_ui

`package:flutter/material.dart` deprecated sejak v3.47.0-0.0.pre; seluruh impor material wajib memakai `package:material_ui/material_ui.dart`.

## Aturan

1. Impor material WAJIB memakai `package:material_ui/material_ui.dart`; `package:flutter/material.dart` DILARANG — deprecated sejak v3.47.0-0.0.pre (analyzer: `deprecated_member_use`).
2. MaterialApp dari `material_ui` sudah menyediakan delegasi `MaterialLocalizations` bawaan; DILARANG menambahkan `localizationsDelegates`/`supportedLocales` manual dari flutter/material (mis. `DefaultMaterialLocalizations.delegate`, `DefaultWidgetsLocalizations.delegate`) — redundan dan memakai API deprecated.
3. Error `No MaterialLocalizations found` yang sumbernya panel log debug / `SelectionArea` pada `PengelolaOverlayLogDebug` WAJIB diatasi dengan membungkus Overlay root manual dengan `Localizations` DI ATAS `Directionality` (lihat `.agents/rules/overlay_log_debug.md` butir 4 dan skill `overlay-log-debug` Aturan 4), BUKAN dengan delegasi di MaterialApp.
4. Migrasi masal impor (codemod/subagent) hanya pada cakupan berkas yang ditugaskan; `dart format` hanya pada berkas terdampak; review `git diff --stat` sebelum melapor (skill `disiplin-scope-kerja`).
5. Jangan mencampur impor `package:flutter/material.dart` dan `package:material_ui/material_ui.dart` pada berkas yang sama; ganti impornya, jangan menambahkan duplikat.

## Larangan

- Jangan mengimpor `package:flutter/material.dart` pada kode baru maupun kode lama yang sedang diubah.
- Jangan menulis `localizationsDelegates: const [DefaultMaterialLocalizations.delegate, DefaultWidgetsLocalizations.delegate]` pada MaterialApp material_ui.
- Jangan menambahkan `supportedLocales: const [Locale('en', 'US')]` semata untuk memuaskan analyzer; delegasi sudah bawaan material_ui.
- Jangan memakai delegasi material_ui sebagai solusi error yang sumbernya Overlay root manual (lihat Aturan 3).

## Contoh Benar

```dart
import 'package:material_ui/material_ui.dart';
```

```dart
// MaterialApp material_ui — delegasi MaterialLocalizations bawaan,
// tanpa localizationsDelegates/supportedLocales manual
MaterialApp(
  title: 'Aplikasi',
  home: const Beranda(),
);
```

## Contoh Salah

```dart
import 'package:flutter/material.dart'; // deprecated sejak v3.47.0-0.0.pre
```

```dart
MaterialApp(
  localizationsDelegates: const [
    DefaultMaterialLocalizations.delegate, // deprecated + redundan
    DefaultWidgetsLocalizations.delegate,
  ],
  supportedLocales: const [Locale('en', 'US')],
  title: 'Aplikasi',
  home: const Beranda(),
);
```


===== .agents/skills/membuat-readme-yang-baik/SKILL.md =====
---
name: membuat-readme-yang-baik
description: Trigger: saat membuat atau memperbaiki file README proyek | Panduan struktur README (judul, deskripsi, TOC, instalasi, penggunaan, kredit, lisensi, badge, kontribusi, test), prinsip what/why/how, visual (GIF/screenshot), daftar kontributor, perbedaan tipe proyek, dan referensi eksternal freeCodeCamp & DEV Community. Membuat README yang Baik Panduan menyusun file `README.md` yang informatif, terstruktur, dan memudahkan pengguna/kontributor memahami proyek. Mengacu pada praktik terbaik dari freeCodeCamp (what/why/how) dan DEV Community (visual, kontributor, perbedaan tipe proyek), serta konvensi GitHub umum. Cakupan yang Di-Cover - Bagian wajib: Judul, Deskripsi, Instalasi & Menjalankan, Penggunaan, Kredit, Lisensi - Bagian tambahan: Table of Contents, Badges, Kontribusi, Test, Daftar Kontributor, Demo Visual (GIF/screenshot) - Prinsip penulisan: menjawab what, why, how; bahasa Inggris (global), up-to-date - Perbedaan tipe proyek: aplikasi vs library vs package vs non-code - Tools pendukung: VS Code + Markdown 
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Membuat README yang Baik

Panduan menyusun file `README.md` yang informatif, terstruktur, dan memudahkan pengguna/kontributor memahami proyek. Mengacu pada praktik terbaik dari freeCodeCamp (what/why/how) dan DEV Community (visual, kontributor, perbedaan tipe proyek), serta konvensi GitHub umum.

## Cakupan yang Di-Cover

- Bagian wajib: Judul, Deskripsi, Instalasi & Menjalankan, Penggunaan, Kredit, Lisensi
- Bagian tambahan: Table of Contents, Badges, Kontribusi, Test, Daftar Kontributor, Demo Visual (GIF/screenshot)
- Prinsip penulisan: menjawab what, why, how; bahasa Inggris (global), up-to-date
- Perbedaan tipe proyek: aplikasi vs library vs package vs non-code
- Tools pendukung: VS Code + Markdown All in One, readme.so, shields.io, contrib.rocks, bitdowntoc
- Referensi eksternal: freeCodeCamp & DEV Community (Marc Seitz)

## Aturan

1. **Judul proyek** (H1) wajib ada dan deskriptif — menggambarkan tujuan utama proyek dalam satu baris.
2. **Deskripsi** wajib menjawab: apa yang dilakukan aplikasi, mengapa teknologi tersebut dipilih, tantangan & rencana fitur.
3. **Table of Contents** ditambahkan jika README panjang (> 5 section) agar navigasi mudah; gunakan bitdowntoc atau manual.
4. **Instalasi & Menjalankan** wajib berisi langkah-langkah _step-by-step_ (dependencies, environment, perintah build/run, contoh: `git clone` → `npm install` → `cp .env.example .env` → `db push` → `run dev`).
5. **Penggunaan** wajib berisi instruksi & contoh (screenshot opsional), termasuk kredensial jika butuh auth.
6. **Demo Visual** (GIF/screenshot) **sangat direkomendasikan** — "show, don't just tell"; gunakan GIF untuk fitur interaktif.
7. **Kredit** mencantumkan kolaborator (link GitHub/sosmed) serta referensi/tutorial yang dipakai.
8. **Lisensi** wajib ada (pilih via choosealicense.com) — menentukan hak modifikasi/komersial.
9. **Badges** (opsional) dari shields.io untuk status build, versi, lisensi, stars, followers, dsb — otomatis update; taruh di atas/bawah README.
10. **Daftar Kontributor** (opsional) via contrib.rocks untuk apresiasi komunitas open source.
11. **Kontribusi** (opsional, untuk open source) menyertakan panduan CONTRIBUTING & kode etik (Contributor Covenant).
12. **Test** (opsional) menyertakan contoh kode test & cara menjalankannya.
13. **Tipe proyek** disesuaikan: aplikasi (install/run/demo), library (API docs, import contoh), package (pub.dev/npm badge), non-code (dokumentasi saja).
14. **Bahasa** gunakan **Inggris** agar global; terjemahkan jika audiens lokal non-Inggris.
15. **Pemeliharaan** README **wajib diperbarui** setiap kali ada perubahan signifikan pada proyek.
16. **Editor** gunakan VS Code + ekstensi "Markdown All in One" untuk preview real-time; atau readme.so untuk generator cepat.

## Steps

1. Tulis judul proyek (H1) yang jelas dan singkat.
2. Tulis deskripsi menjawab what/why/how (motivasi, masalah, solusi, pembelajaran, keunikan).
3. Tambahkan Table of Contents jika README > 5 section (gunakan bitdowntoc).
4. Tulis bagian Instalasi & Menjalankan dengan langkah berurutan (dependencies → setup env → run).
5. Tulis bagian Penggunaan dengan contoh perintah/UI/screenshot & kredensial demo jika perlu.
6. **Tambahkan Demo Visual (GIF/screenshot)** menampilkan fitur utama — "show, don't just tell".
7. Cantumkan Kredit (tim, referensi, tutorial).
8. Pilih & cantumkan Lisensi (GPL, MIT, Apache, AGPLv3, dll. via choosealicense.com).
9. Tambahkan Badges (build, version, license, stars, coverage) dari shields.io bila relevan.
10. Tambahkan Daftar Kontributor via contrib.rocks jika open source.
11. Sertakan panduan Kontribusi & kode etik jika proyek open source.
12. Tambahkan bagian Test dengan contoh & cara menjalankan test suite.
13. Sesuaikan struktur sesuai tipe proyek (aplikasi/library/package/non-code).
14. Review: pastikan bahasa Inggris, up-to-date, formatting Markdown konsisten, preview di VS Code.
15. Commit README bersama perubahan proyek terkait.

## Larangan

- DILARANG tidak menyertakan README sama sekali.
- DILARANG deskripsi kosong atau generik (mis. "project ini keren").
- DILARANG langkah instalasi tidak lengkap (mis. missing dependencies, perintah run).
- DILARANG lisensi tidak dicantumkan (hak penggunaan tidak jelas).
- DILARANG README tidak diperbarui setelah perubahan besar (versi, fitur, breaking change).
- DILARANG menggunakan bahasa non-Inggris tanpa alasan audiens lokal; hindari campur aduk bahasa.
- DILARANG badge palsu/tidak relevan (mis. build passing padahal tidak ada CI).
- DILARANG menyalin README template tanpa menyesuaikan konteks proyek sendiri.
- DILARANG hanya teks tanpa visual (GIF/screenshot) untuk proyek aplikasi/UI.
- DILARANG struktur README aplikasi dipakai untuk library/package tanpa adaptasi (API docs, import contoh).

## Contoh Benar

````markdown
# Nama Proyek

Deskripsi singkat: apa, mengapa, dan bagaimana proyek ini bekerja.

## Table of Contents

- [Instalasi](#instalasi)
- [Penggunaan](#penggunaan)
- [Kredit](#kredit)
- [Lisensi](#lisensi)

## Instalasi

```bash
# 1. Clone repo
git clone https://github.com/user/repo.git
cd repo

# 2. Install dependencies
flutter pub get

# 3. Jalankan
flutter run
```
````

## Penggunaan

Contoh penggunaan fitur utama:

```dart
// Kode contoh
void main() {
  runApp(MyApp());
}
```

Screenshot: ![Demo](assets/demo.png)

## Kredit

- [Nama Author](https://github.com/author) — Maintainer
- Referensi: [Tutorial Flutter](https://flutter.dev/docs)

## Lisensi

[MIT License](LICENSE) — lihat file LICENSE untuk detail.

---

![Build](https://img.shields.io/github/actions/workflow/status/user/repo/ci.yml)
![License](https://img.shields.io/github/license/user/repo)

````

## Contoh Salah

```markdown
# Project

Ini project saya. (DILARANG: deskripsi terlalu singkat, tidak menjawab what/why/how)

## Install

`flutter run` (DILARANG: missing dependencies, setup env, step-by-step)

## License

Tidak ada lisensi. (DILARANG: hak penggunaan tidak jelas)
````

```markdown
# My App

Aplikasi keren. (DILARANG: bahasa campur, tidak informatif)

## Cara Pakai

Buka app lalu klik tombol. (DILARANG: tidak ada contoh kode/screenshot)
```


===== .agents/skills/memori-check/SKILL.md =====
---
name: memori-check
description: "Trigger: saat memulai percakapan atau tugas di proyek mana pun | Panduan wajib baca MEMORI.md di root proyek sebelum interaksi dan perbarui bagian relevan setelahnya (kode, dokumen, state). Berlaku lintas repositori; tidak terikat satu proyek/path. Satu berkas sesi (`memori/sesi/sesi_N.md`) per percakapan/tugas, bukan per pesan; berkas sesi baru hanya dibuat bila percakapan/tugas baru dimulai atau ada pekerjaan nyata yang belum tercatat. Sinkronisasi disertai konsolidasi konflik, klasifikasi semantic/episodic/procedural, provenance sesi, dan pinning fakta eksplisit pengguna. Catch-up sync berkas `Belum Sinkron` dari sesi sebelumnya (yatim/kosong → `Sudah Sinkron` + catatan eksplisit; berisi perubahan → prosedur akhir sesi; ambigu → lapor pengguna). Di akhir percakapan/tugas AI wajib memperbarui `MEMORI.md` lalu menandai berkas sesi `Sudah Sinkron`. Berkas `sesi_N.md` tidak boleh dihapus (arsip permanen); berkas `Sudah Sinkron` bersifat arsip — koreksi/klarifikasi WAJIB dicatat pada berkas sesi baru. Memeriksa"
metadata:
  kategori: "custom"
  versi: "1.13.1"
  diperbarui: "Sun Nov 22 2026 10:35 WIB"
---

# Memeriksa File MEMORI.md dan Berkas Sesi

Setiap kali model (AI) memulai percakapan atau tugas dengan proyek apa pun yang memiliki `MEMORI.md` di root proyek, **wajib** membaca file `MEMORI.md` di root proyek tersebut sebelum interaksi apa pun (bukan hanya task; termasuk pertanyaan, diskusi, review, penelusuran), **dan wajib membuat/aktifkan berkas sesi `memori/sesi/sesi_N.md` (nomor tertinggi + 1) sebelum bertindak atau mengubah kode/dokumen apa pun**, lalu **wajib** memperbarui bagian yang relevan di `MEMORI.md` setelah interaksi yang mengubah proyek (kode, dokumen, state). Skill ini berlaku untuk SEMUA percakapan/tugas di proyek mana pun; tidak terikat satu proyek, satu path, atau satu jenis proyek (bukan khusus proyek Flutter). Project root ditentukan dari direktori kerja aktif atau root repositori tempat interaksi berlangsung. **Satu berkas sesi** (`memori/sesi/sesi_N.md`) mewakili **satu percakapan/tugas** — bukan satu pesan atau satu tindakan kecil.

Bila proyek belum memiliki `MEMORI.md` di root, jangan mengarang konteks proyek dan jangan menulis memori sembarangan: tanyakan kepada pengguna apakah ingin menginisialisasi `MEMORI.md` dan folder `memori/sesi/` terlebih dahulu.

Memori bersifat **per root proyek** (per repositori); fakta, konvensi, dan status satu proyek tidak menular secara implisit ke proyek lain (mencegah _context collapse_ lintas domain). Klasifikasi memori yang dipakai:

- **Semantic memory** = `MEMORI.md` — fakta durable (konvensi, keputusan, status, konteks proyek). Cukup kecil untuk diinjeksikan utuh ke konteks agen; diringkas, bukan arsip kronologi.
- **Episodic memory** = `memori/riwayat_perubahan.md` dan `memori/sesi/sesi_N.md` — catatan peristiwa ber-timestamp; dicari/dirujuk saat perlu, tidak diinjeksikan utuh ke konteks.
- **Procedural memory** = skills (indeks skill `.agents/rules/kelompok_skill_wajib_*.md`) dan aturan (`.agents/rules/`) — pola kerja yang mengikat; dimuat sesuai trigger.

Kronologi mentah termasuk episodic memory, bukan semantic memory: `MEMORI.md` hanya memuat ringkasan durable, bukan transkrip sesi.

Mulai 2026-11-13, setiap sesi (percakapan/tugas) wajib dicatat ke berkas sesi `memori/sesi/sesi_N.md` (bernomor, `sesi_1.md`, `sesi_2.md`, …; penomoran nomor tertinggi + 1, gap tidak diisi). Berkas sesi menjadi perantara antara sesi kerja dan `MEMORI.md`: AI tidak boleh mengubah `MEMORI.md` secara langsung tanpa mencatat sesi ke berkas sesi terlebih dahulu, dan di akhir sesi AI wajib memperbarui `MEMORI.md` dengan catatan yang relevan dari berkas sesi lalu menandai berkas sesi `Sudah Sinkron`. Berkas `sesi_N.md` **tidak boleh dihapus** dengan alasan apa pun (diarsipkan permanen).

Pada setiap **awal sesi**, setelah membaca `MEMORI.md` dan sebelum membuat berkas sesi baru, AI wajib melakukan **catch-up sync**: memindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya dan menyinkronkannya. Sinkronisasi akhir sesi tetap dipertahankan sebagai penyelesaian normal; catch-up berfungsi sebagai **jaring pengaman**. Berkas yatim/kosong tanpa perubahan nyata ditandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan"; berkas berisi perubahan nyata disinkronkan dengan prosedur akhir sesi; bila isi ambigu/tidak dapat diverifikasi → laporkan ke pengguna, jangan diputuskan sendiri. Pemindaian dibatasi pada berkas `Belum Sinkron` saja (bukan seluruh riwayat). Berkas sesi yang sedang aktif di sesi ini tidak boleh ditandai pada langkah catch-up.

Berkas sesi ber-status `Sudah Sinkron` bersifat **arsip permanen** dan DILARANG diubah dengan alasan apa pun (isi, `Status Sinkron`, catatan, tabel `Berkas Terdampak`, maupun bagian lain). Koreksi, klarifikasi, atau tindak lanjut atas isi berkas sesi lama WAJIB dicatat pada berkas sesi **baru** (nomor tertinggi + 1) yang merujuk berkas lama. Yang boleh disentuh hanya berkas ber-status `Belum Sinkron` (catch-up) dan berkas sesi yang sedang aktif di sesi ini.

## Cakupan yang Di-Cover

- **File utama**: `MEMORI.md` di root proyek mana pun (`<root-proyek>/MEMORI.md`); root proyek = root repositori/direktori kerja aktif tempat interaksi berlangsung
- **File sesi**: `memori/sesi/sesi_N.md` di root proyek (folder `memori/sesi/`; bernomor, diarsipkan permanen)
- **File episodic**: `memori/riwayat_perubahan.md` di root proyek (catatan peristiwa ber-timestamp; rujuk saat perlu, bukan diinjeksikan utuh)
- **Objek**: Seluruh isi `MEMORI.md` sebagai konteks hidup proyek (status, konvensi, aturan, catatan teknis, riwayat, dan bagian lain yang ada di dalamnya)
- **Sifat**: `MEMORI.md` adalah dokumen yang **berubah seiring waktu**, bukan kontrak tetap; berkas sesi diarsipkan permanen sebagai jejak per sesi
- **Method**: (1) di awal sesi, membaca `MEMORI.md` lalu melakukan catch-up sync (memindai `memori/sesi/sesi_N.md` `Belum Sinkron` dari sesi sebelumnya dan menyinkronkannya), kemudian membuat berkas `sesi_N.md` dengan status `Belum Sinkron`; (2) selama sesi, mencatat poin penting/perubahan ke berkas sesi; (3) di akhir sesi, memperbarui bagian yang relevan di `MEMORI.md` berdasarkan catatan berkas sesi (disertai konsolidasi konflik, promosi sesuai kriteria, dan peninjauan entri volatil), lalu menandai berkas sesi `Sudah Sinkron`

## Aturan

1. **Wajib baca `MEMORI.md` terlebih dahulu** sebelum interaksi apa pun di proyek mana pun yang memiliki `MEMORI.md` di root proyek (task, pertanyaan, diskusi, review, penelusuran). **Sebelum interaksi apa pun yang mengubah proyek, wajib membuat/aktifkan berkas sesi `memori/sesi/sesi_N.md` (nomor tertinggi + 1) terlebih dahulu**; bila `MEMORI.md` belum ada, tanyakan kepada pengguna apakah ingin menginisialisasi; jangan mengarang konteks proyek.
2. **Catch-up sync di awal sesi.** Setelah membaca `MEMORI.md` dan sebelum membuat berkas sesi baru, pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya (pemindaian dibatasi pada berkas `Belum Sinkron` saja, bukan seluruh riwayat). Tindak lanjutnya:
   - Berkas yatim/kosong tanpa perubahan nyata → tandai `Sudah Sinkron` dengan catatan eksplisit "tidak ada perubahan untuk disinkronkan" (jejak diarsipkan permanen, tidak dihapus).
   - Berkas berisi perubahan nyata → sinkronkan dengan prosedur yang sama seperti sinkronisasi akhir sesi (perbarui `MEMORI.md` + `memori/riwayat_perubahan.md` → isi `## Sinkronisasi ke MEMORI.md` → tandai `Sudah Sinkron`).
   - Berkas sesi yang sedang aktif di sesi ini → **tidak boleh ditandai** pada langkah catch-up.
   - Isi ambigu/tidak dapat diverifikasi → jangan diputuskan sendiri; laporkan ke pengguna. Sesi paralel: best-effort; bila ambigu, lapor.
   - Alur akhir sesi **tetap dipertahankan**; catch-up hanya jaring pengaman.
3. **Wajib buat satu berkas sesi per percakapan/tugas.** Pada awal percakapan/tugas, sebelum tindakan apa pun yang mengubah proyek, buat `memori/sesi/sesi_N.md` dengan `N` = nomor tertinggi yang ada + 1 (gap tidak diisi; jika folder kosong, buat `sesi_1.md`). **Satu berkas sesi digunakan untuk seluruh percakapan/tugas tersebut**; DILARANG membuat berkas sesi baru hanya karena ada pesan, pertanyaan, atau tindakan kecil berikutnya dalam percakapan yang sama. Berkas sesi baru hanya dibuat bila: (a) percakapan/tugas baru dimulai, atau (b) ada pekerjaan nyata yang belum tercatat pada berkas sesi aktif. Berkas sesi wajib memuat (struktur lengkap):
   - `## Status` — `Status Sinkron: Belum Sinkron`, `Tanggal` (tanggal Jakarta), `Command` (command yang memerintahkan sesi — mis. `/kerjakan_task` atau path command; bila tidak ada command yang dijalankan, tulis `interaksi langsung (tanpa command)`), `Topik` sesi. Field `Command` wajib diisi pada setiap berkas sesi.
   - `## Catatan Sesi` — kronologi/poin penting/keputusan sesi (diperbarui selama sesi).
   - `## Berkas Terdampak` — tabel `Lokasi File | Status Perubahan | Deskripsi` (kelengkapan dan verifikasi tabel diatur pada Aturan 22 dan Aturan 23).
   - `## Sinkronisasi ke MEMORI.md` — ringkasan penyesuaian `MEMORI.md` pada akhir sesi, atau `Belum disinkronkan` selama sesi berlangsung.
4. **Catat ke berkas sesi selama sesi berlangsung.** Setiap perubahan penting (file dibuat/diubah/dihapus, keputusan, temuan) wajib dicatat ke berkas sesi yang aktif; berkas sesi menjadi bahan sinkronisasi `MEMORI.md`, bukan duplikasi penuh `MEMORI.md`. Selama sesi, bandingkan tabel `## Berkas Terdampak` dengan `git status --short` (root + setiap submodule yang terlibat) pada setiap titik perubahan substantif — bukan hanya di akhir sesi — agar selisih terdeteksi lebih dini.
5. **Pahami konteks dari keseluruhan isi `MEMORI.md`** — termasuk (jika ada) status proyek, struktur, konvensi penamaan, konfigurasi/berkas penting, daftar atau rujukan skill dan aturan, catatan teknis, riwayat, serta bagian lain yang tersedia. Jangan berasumsi hanya ada bagian tertentu.
6. **Terapkan konteks/aturan yang relevan** dari isi `MEMORI.md` pada pekerjaan yang akan dilakukan.
7. **Catat poin-poin penting** dari `MEMORI.md` yang relevan dengan interaksi/task yang akan dikerjakan.
8. **Jangan mulai implementasi** sebelum konteks dari `MEMORI.md` tercerna dan poin-poin relevan tercatat.
9. **Sinkronkan di akhir sesi.** Pada akhir sesi, tanyakan kepada pengguna apakah sesi akan diakhiri; jika ya, setelah interaksi yang mengubah proyek selesai, **perbarui bagian yang relevan** di `MEMORI.md` (tentukan berdasarkan isi `MEMORI.md` saat itu, bukan daftar nama bagian yang di-hardcode), tambah entri `memori/riwayat_perubahan.md`, isi bagian `## Sinkronisasi ke MEMORI.md` pada berkas sesi dengan ringkasan penyesuaian, lalu ubah `Status Sinkron` menjadi `Sudah Sinkron`. Pada sinkronisasi ini juga wajib dijalankan:
   - **Promosi sesuai kriteria** (aturan 14) — hanya fakta yang lolos kriteria yang masuk `MEMORI.md`.
   - **Provenance** (aturan 15) — klaim/keputusan durable merujuk berkas sesi sumber.
   - **Konsolidasi & resolusi konflik** (aturan 16) — kontradiksi diselesaikan, bukan dibiarkan berdampingan.
   - **Peninjauan entri volatil** (aturan 17) — entri basi ditandai usang atau diperbarui.
   - **Cek batas ukuran** (aturan 20) — bila `MEMORI.md` terlalu besar, konsolidasi dahulu.
10. **Tanggal diperbarui `MEMORI.md`.** Setiap sinkronisasi `MEMORI.md` (akhir sesi maupun catch-up) wajib memperbarui field tanggal diperbarui di header `MEMORI.md` proyek yang bersangkutan sesuai sesi yang melakukan sinkronisasi, dengan format `Diperbarui: <tanggal Jakarta> (sesi N)`. Field ini berada tepat di bawah judul `# MEMORI …` pada berkas tersebut (teks judul boleh bervariasi per proyek).
11. **Anggap `MEMORI.md` dan berkas sesi bisa berubah strukturnya.** Bila bagian yang biasa diperbarui tidak ada, tambahkan bagian yang sesuai kebutuhan; bila ada bagian baru, ikuti strukturnya. Jangan menghapus bagian yang tidak relevan dengan interaksi.
12. **Jika `MEMORI.md` memuat rujukan ke sumber kebenaran lain** (mis. indeks skill atau rules), patuhi rujukan itu dan jangan menggantinya dengan salinan di `MEMORI.md`.
13. **Berkas sesi `Sudah Sinkron` adalah arsip.** DILARANG mengubah berkas sesi ber-status `Sudah Sinkron` dengan alasan apa pun (isi, `Status Sinkron`, catatan koreksi, tabel `Berkas Terdampak`). Koreksi/klarifikasi/tindak lanjut atas isi berkas sesi lama WAJIB dicatat pada berkas sesi baru (nomor tertinggi + 1) yang merujuk berkas lama; berkas lama tetap apa adanya. Yang boleh diubah hanya: berkas `Belum Sinkron` (catch-up) dan berkas sesi yang sedang aktif di sesi ini.
14. **Kriteria promosi ke `MEMORI.md`.** Hanya fakta/keputusan yang lolos salah satu kriteria berikut boleh dipromosikan dari berkas sesi ke `MEMORI.md`: (a) pengguna **eksplisit** meminta agar sesuatu dicatat/diingat; atau (b) sinyal berulang yang konsisten lintas sesi (mis. konvensi atau keputusan yang sama muncul berkali-kali tanpa kontradiksi). Sebutiran insidental tanpa niat eksplisit atau pengulangan cukup dicatat di berkas sesi dan tidak dipromosikan.
15. **Provenance wajib.** Setiap klaim/keputusan durable yang ditulis di `MEMORI.md` wajib merujuk berkas sesi sumbernya (mis. `(sesi 62)`), sehingga entri dapat diverifikasi ulang dan dideteksi kekeliruannya setelah fakta.
16. **Konsolidasi & resolusi konflik saat sinkronisasi.** Pada akhir sesi dan catch-up, bandingkan isi baru dengan `MEMORI.md`; bila ada kontradiksi, pernyataan yang lebih baru dan berkeyakinan lebih tinggi **menggantikan** yang lama — keduanya DILARANG berdampingan. Hasil penggantian dicatat sebagai entri baru di `memori/riwayat_perubahan.md` (bukan menghapus jejak).
17. **Entri volatil wajib bertanggal dan ditinjau.** Status yang dapat basi (mis. "`pub get` dijalankan per 2026-11-14", daftar berkas belum di-commit, versi yang terpasang) wajib memuat tanggal. Pada setiap sinkronisasi, entri volatil yang sudah lewat verifikasi wajib diperbarui, atau ditandai usang secara eksplisit (mis. "usang per \<tanggal\>, menunggu verifikasi") — bukan dibiarkan tampak mutlak.
18. **Pinning fakta eksplisit pengguna.** Fakta/keputusan yang pengguna eksplisit minta diingat/dicatat ditandai `dipatok pengguna` di `MEMORI.md`; entri tersebut DILARANG dikonsolidasi, dipersingkat, ditandai usang, atau dihapus tanpa perintah eksplisit pengguna.
19. **Decay = demote, bukan hapus.** Entri `MEMORI.md` yang tidak lagi relevan DILARANG dihapus begitu saja; tandai usang secara eksplisit atau pindahkan ringkasan historisnya ke `memori/riwayat_perubahan.md`, lalu rapikan bagian `MEMORI.md`. Kebijakan demote ini sejalan dengan larangan penghapusan berkas sesi.
20. **Batas ukuran `MEMORI.md`.** `MEMORI.md` wajib cukup kecil untuk diinjeksikan utuh ke konteks; bila mendekati ±200 baris (atau bagian status membengkak tanpa terkendali), lakukan **konsolidasi** (gabung entri usang, pindahkan detail ke `riwayat_perubahan.md`, ringkas) — bukan membiarkannya membesar tanpa batas (_fading memory_: sinyal tenggelam di kebisingan).
21. **Klasifikasi memori.** Gunakan klasifikasi semantic/episodic/procedural sebagaimana dijelaskan di bagian intro: `MEMORI.md` (semantic, ringkas, diinjeksikan), `memori/sesi/*.md` dan `memori/riwayat_perubahan.md` (episodic, diarsipkan/dirujuk), skills + rules (procedural, dimuat sesuai trigger). Jangan menulis kronologi sesi ke `MEMORI.md`; jangan memasukkan detail duplikatif episodic ke `MEMORI.md`. Format isi memori wajib memakai struktur bertingkat: Section (bagian/kelompok dalam dokumen), Category (kategori yang mengelompokkan informasi), Heading (judul bagian), Subsection (bagian di dalam section), Field (satu kolom/atribut informasi). Setiap informasi ditulis pada tingkat yang sesuai agar terarah.
22. **Kelengkapan tabel `## Berkas Terdampak`.** Tabel `## Berkas Terdampak` pada berkas sesi WAJIB mencantumkan **seluruh** berkas yang dibuat/diubah/dihapus selama sesi — termasuk perubahan di dalam submodule — dengan path relatif terhadap root repositori tempat sesi berjalan (mis. `base_coc/lib/fitur/cadangan/service/cadangan_service.dart`). Tabel DILARANG hanya memuat berkas sesi bila ada perubahan lain; perubahan yang tidak tercantum pada tabel dianggap tidak tercatat dan melanggar alur sinkronisasi ini.
23. **Penandaan hanya oleh sesi pembuat.** Penandaan `Sudah Sinkron` hanya boleh dilakukan oleh sesi pembuat berkas tersebut; sesi lain dilarang mengubah berkas sesi milik sesi lain.
24. **Pengecualian pengguna (preferensi eksplisit).** Bila pengguna secara eksplisit meminta agar entri `memori/riwayat_perubahan.md` tidak ditambahkan pada sinkronisasi (preferensi pengguna), patuhi permintaan tersebut dan nyatakan eksplisit pada sesi yang bersangkutan bahwa entri tidak ditambahkan. Pengecualian ini hanya berlaku bila diminta eksplisit oleh pengguna.

## Steps

1. Awal percakapan/tugas: baca `MEMORI.md` (dan berkas pendukung lain sesuai konteks); catat poin relevan.
2. Catch-up sync (sebelum membuat berkas sesi baru): pindai berkas `memori/sesi/*.md` ber-status `Belum Sinkron` milik sesi sebelumnya; yatim/kosong → tandai `Sudah Sinkron` dengan catatan eksplisit; berisi perubahan nyata → sinkronkan dengan prosedur akhir sesi (`MEMORI.md` + `memori/riwayat_perubahan.md` → isi `## Sinkronisasi ke MEMORI.md` → tandai `Sudah Sinkron`); ambigu/tidak dapat diverifikasi atau sesi paralel → laporkan ke pengguna, jangan diputuskan sendiri; berkas sesi yang sedang aktif di sesi ini tidak ditandai.
3. Buat satu `memori/sesi/sesi_N.md` untuk percakapan/tugas ini (format lengkap, status `Belum Sinkron`) — bila folder belum ada, buat foldernya terlebih dahulu. Jangan membuat berkas sesi baru untuk pesan/tindakan berikutnya dalam percakapan yang sama.
4. Selama sesi: perbarui `## Catatan Sesi` dan `## Berkas Terdampak` setiap ada perubahan substantif.
5. Akhir sesi: perbarui `MEMORI.md` bagian relevan berdasarkan catatan berkas sesi — jalankan promosi sesuai kriteria (aturan 14), cantumkan provenance `sesi N` (aturan 15), selesaikan kontradiksi (aturan 16), tinjau entri volatil (aturan 17), hormati pinning (aturan 18), demote entri basi (aturan 19), dan cek batas ukuran (aturan 20); tambah entri `memori/riwayat_perubahan.md`; perbarui field tanggal diperbarui di header `MEMORI.md` sesuai sesi yang melakukan sinkronisasi (format `Diperbarui: <tanggal Jakarta> (sesi N)`); isi `## Sinkronisasi ke MEMORI.md`; ubah `Status Sinkron` berkas sesi menjadi `Sudah Sinkron`.
6. Verifikasi: berkas sesi bernomor benar (`tertinggi + 1`), struktur lengkap, status hasil catch-up sesuai (yatim/kosong ditandai `Sudah Sinkron`), `MEMORI.md` konsisten dengan isi berkas sesi, tidak ada kontradiksi antar bagian `MEMORI.md`, tidak ada kredensial/secret yang tertulis, dan setiap klaim baru di `MEMORI.md` memiliki provenance `sesi N`. Selain itu wajib memastikan tidak ada berkas sesi ber-status `Sudah Sinkron` yang berubah: jalankan `git status -- memori/sesi/` dan `git diff -- memori/sesi/` — yang muncul hanya berkas sesi aktif dan (bila ada) berkas `Belum Sinkron` yang disinkronkan lewat catch-up; berkas `Sudah Sinkron` tidak boleh muncul. Terakhir, sebelum menandai berkas sesi `Sudah Sinkron`, cocokkan isi tabel `## Berkas Terdampak` dengan `git status --short` / `git diff --name-only` (root + setiap submodule yang terlibat); seluruh berkas yang berubah selama sesi WAJIB tercantum pada tabel, dan selisih WAJIB diselesaikan (tabel diperbaiki) atau dilaporkan ke pengguna.

## Larangan

- DILARANG memulai interaksi/task apa pun tanpa membaca `MEMORI.md` terlebih dahulu.
- DILARANG membuat berkas sesi baru untuk setiap pesan, pertanyaan, atau tindakan kecil dalam percakapan/tugas yang sama; gunakan berkas sesi aktif yang sudah ada.
- DILARANG mengubah `MEMORI.md` secara langsung tanpa mencatat sesi ke `memori/sesi/sesi_N.md` terlebih dahulu (berkas sesi adalah satu-satunya perantara yang sah menuju `MEMORI.md`).
- DILARANG mengubah berkas `sesi_N.md` ber-status `Sudah Sinkron` dengan alasan apa pun, termasuk menambahkan catatan koreksi/klarifikasi ke dalamnya; berkas tersebut arsip, dan koreksi WAJIB dicatat pada berkas sesi baru (nomor tertinggi + 1) yang merujuk berkas lama. Yang boleh disentuh hanya berkas `Belum Sinkron` (catch-up) dan berkas sesi yang sedang aktif di sesi ini.
- DILARANG pola "hapus lalu buat ulang" untuk "membetulkan" berkas sesi lama; berkas sesi tidak boleh dihapus, koreksi bersifat aditif di berkas sesi baru.
- DILARANG menghapus berkas `sesi_N.md` dengan alasan apa pun, termasuk setelah `Sudah Sinkron` (diarsipkan permanen). Permintaan penghapusan dari pihak mana pun harus ditolak atau dikembalikan kepada pengguna untuk konfirmasi eksplisit luar biasa yang terdokumentasi.
- DILARANG menandai berkas sesi yang sedang aktif di sesi ini sebagai `Sudah Sinkron` pada langkah catch-up.
- DILARANG memutuskan sendiri bila isi berkas sesi yang disinkronkan lewat catch-up ambigu atau tidak dapat diverifikasi — laporkan ke pengguna.
- DILARANG menandai berkas sesi `Sudah Sinkron` sebelum `MEMORI.md` benar-benar diperbarui dan bagian `## Sinkronisasi ke MEMORI.md` terisi (berlaku juga untuk berkas yang disinkronkan lewat catch-up).
- DILARANG memperbarui `MEMORI.md` tanpa memperbarui field tanggal diperbarui di header (`Diperbarui: <tanggal Jakarta> (sesi N)`).
- DILARANG menandai berkas sesi `Sudah Sinkron` sebelum tabel `## Berkas Terdampak` lengkap mencakup seluruh perubahan (root + submodule yang terlibat) dan terverifikasi cocok dengan `git status --short` / `git diff --name-only` (lihat Aturan 22 dan Aturan 23).
- DILARANG mengabaikan bagian "catatan untuk model selanjutnya" (atau sebutan setara) yang ada di `MEMORI.md`.
- DILARANG menggunakan versi proyek yang sudah usang tanpa dicek di `MEMORI.md`.
- DILARANG mengabaikan aturan/konvensi yang tercantum di `MEMORI.md` setelah membacanya.
- DILARANG mengimplementasikan fitur tanpa memastikan kepatuhan terhadap konvensi yang tercantum di `MEMORI.md`.
- DILARANG menganggap daftar di `MEMORI.md` sebagai daftar lengkap bila `MEMORI.md` sendiri merujuk ke sumber kebenaran lain.
- DILARANG mengubah struktur `MEMORI.md` secara membabi buta hanya karena skill ini menyebut bagian tertentu; skill ini tidak menetapkan struktur `MEMORI.md`.
- DILARANG menulis kredensial, token, password, atau API key ke `MEMORI.md`, `memori/sesi/*.md`, atau `memori/riwayat_perubahan.md`; bila informasi tersebut terlanjur tercatat, laporkan ke pengguna dan jangan menyalinnya ke berkas lain.
- DILARANG menduplikasi kronologi mentah sesi ke `MEMORI.md`; `MEMORI.md` hanya memuat ringkasan durable, detail kronologi tetap di berkas sesi dan `riwayat_perubahan.md`.
- DILARANG mempromosikan sebutiran insidental (tanpa niat eksplisit pengguna atau pengulangan konsisten lintas sesi) ke `MEMORI.md`.
- DILARANG membiarkan dua pernyataan yang bertentangan berdampingan di `MEMORI.md`; kontradiksi wajib diselesaikan saat sinkronisasi (aturan 16).
- DILARANG menghapus entri `MEMORI.md` yang basi tanpa proses demote/penandaan usang (aturan 19).
- DILARANG mengonsolidasi, menandai usang, atau menghapus entri yang `dipatok pengguna` tanpa perintah eksplisit pengguna (aturan 18).
- DILARANG menulis entri volatil ke `MEMORI.md` tanpa tanggal (aturan 17).

## Contoh Benar

```markdown
Sebelum memulai percakapan/tugas ini, lakukan langkah berikut:

1. Buka file MEMORI.md di root proyek dan baca konteks yang relevan
2. Buat satu memori/sesi/sesi_9.md (nomor tertinggi 8 + 1) dengan Status Sinkron: Belum Sinkron untuk seluruh percakapan/tugas ini
3. Catat poin penting sesi dan berkas terdampak ke memori/sesi/sesi_9.md selama bekerja (jangan buat sesi baru untuk pesan berikutnya)
4. Mulai pekerjaan setelah konteks tercerna

Setelah selesai dan bila ada perubahan proyek:

- Perbarui bagian yang relevan di MEMORI.md (mis. status, riwayat, catatan teknis) sesuai kondisi terkini
- Tambah entri memori/riwayat_perubahan.md
- Isi bagian "Sinkronisasi ke MEMORI.md" di memori/sesi/sesi_9.md, lalu ubah Status Sinkron menjadi "Sudah Sinkron"
```

Catch-up sync pada awal sesi (setelah membaca MEMORI.md, sebelum membuat berkas sesi baru):

```markdown
1. Baca MEMORI.md
2. Pindai memori/sesi/*.md yang ber-status Belum Sinkron dari sesi sebelumnya:
   - sesi_1.md, sesi_2.md -> yatim/kosong (topik belum ditentukan, tidak ada perubahan) -> tandai Sudah Sinkron dengan catatan "tidak ada perubahan untuk disinkronkan"
   - sesi_7.md -> berisi perubahan nyata -> sinkronkan dengan prosedur akhir sesi (MEMORI.md + riwayat_perubahan.md -> isi Sinkronisasi ke MEMORI.md -> Sudah Sinkron)
   - sesi_aktif_sesi_ini.md -> JANGAN ditandai
   - isi ambigu / sesi paralel -> laporkan ke pengguna, jangan diputuskan sendiri
3. Buat memori/sesi/sesi_9.md (nomor tertinggi + 1) ...
```

Koreksi/klarifikasi atas isi berkas sesi lama yang sudah `Sudah Sinkron` (buat berkas sesi baru, jangan sentuh berkas lama):

```markdown
1. Baca MEMORI.md, lalu sesi_15.md (Status Sinkron: Sudah Sinkron) yang catatannya keliru
2. JANGAN mengedit sesi_15.md — berkas itu arsip
3. Buat memori/sesi/sesi_18.md (nomor tertinggi + 1): catat koreksi + rujuk baris/bagian sesi_15.md yang dikoreksi
4. Isi Berkas Terdampak dan Sinkronisasi ke MEMORI.md; tandai sesi_18.md Sudah Sinkron pada akhir sesi
```

Contoh promosi ke `MEMORI.md` dengan kriteria, provenance, dan pinning:

```markdown
1. Cek catatan sesi: pengguna eksplisit meminta "tolong catat: kami memakai Conventional Commits + squash merge" -> lolos kriteria (a) -> tulis di MEMORI.md dengan provenance:
   "Aturan kontribusi: Conventional Commits + squash merge (sesi 64, dipatok pengguna)."
2. Cek kontradiksi: MEMORI.md lama menyebut "merge commit diizinkan" -> pernyataan baru (dipatok pengguna, lebih baru) menggantikan -> entri di riwayat_perubahan.md mencatat penggantian tersebut.
3. Sebutiran insidental "sepertinya pubspec diurutkan alfabetis" tanpa niat eksplisit/pengulangan -> TIDAK dipromosikan; tetap di berkas sesi.
```

## Contoh Salah

```markdown
// DILARANG: mengedit berkas sesi yang sudah Sudah Sinkron untuk "mengoreksi" isinya
// Salah: "catatan catch-up di sesi_15.md keliru, jadi sesi_15.md saya edit saja agar benar"
// Benar: buat sesi_18.md (nomor tertinggi + 1), catat koreksinya di sana dengan rujukan ke sesi_15.md
```

```markdown
// DILARANG: menganggap berkas sesi lama boleh disentuh karena "hanya menambahkan catatan kecil"
// Salah: "cuma tambah satu baris koreksi ke sesi_13.md yang sudah Sudah Sinkron, tidak apa-apa"
// Benar: berkas Sudah Sinkron = arsip; setiap koreksi dicatat di berkas sesi baru
```

```markdown
// DILARANG: pola hapus lalu buat ulang untuk membetulkan berkas sesi lama
// Salah: "sesi_9.md isinya salah, saya hapus lalu buat lagi dengan konten yang benar"
```

```markdown
// DILARANG: Memulai implementasi tanpa membaca MEMORI.md
// Salah: "Aja langsung aja buat UI-nya, nggak usah baca file2 aneh"

MaterialApp(
home: Center(child: Text('Contoh Salah')),
); // DILARANG: implementasi tanpa konteks MEMORI.md
```

```markdown
// DILARANG: mengubah MEMORI.md tanpa berkas sesi
// Salah: "Langsung edit MEMORI.md saja, nggak perlu memori/sesi/sesi_9.md"
```

```markdown
// DILARANG: menghapus berkas sesi
// Salah: "sesi_9.md sudah Sudah Sinkron, jadi boleh dihapus"
```

```markdown
// DILARANG: membiarkan berkas sesi yatim tetap Belum Sinkron selamanya
// Salah: "sesi_1.md dan sesi_2.md masih Belum Sinkron, tapi dibiarkan saja"
```

```markdown
// DILARANG: menandai berkas sesi yang sedang aktif di sesi ini pada catch-up
// Salah: "pada awal sesi, catch-up: sesi_9.md ditandai Sudah Sinkron padahal sesi_9.md justru sesi yang sedang berjalan"
```

```markdown
// DILARANG: memutuskan sendiri bila isi sesi yang ditemukan pada catch-up ambigu
// Salah: "sesi_7.md berisi perubahan tapi tidak jelas bagian mana yang nyata; disinkronkan asal-asalan tanpa lapor pengguna"
```

```markdown
// DILARANG: menulis kredensial ke memori
// Salah: "MEMORI.md -> catatan: password database = s3cret123"
// Benar: jangan tulis sama sekali; laporkan ke pengguna bila terlanjur tercatat
```

```markdown
// DILARANG: menduplikasi kronologi sesi ke MEMORI.md
// Salah: menyalin seluruh "## Catatan Sesi" verbatim ke MEMORI.md
// Benar: MEMORI.md hanya ringkasan durable + provenance `sesi N`; kronologi tetap di berkas sesi
```

```markdown
// DILARANG: membiarkan kontradiksi berdampingan
// Salah: "MEMORI.md: deploy tiap Senin" dan "MEMORI.md: deploy tiap Jumat" keduanya tetap ada
// Benar: selesaikan saat sinkronisasi — pernyataan lebih baru/berkeyakinan lebih tinggi menggantikan, jejaknya dicatat di riwayat_perubahan.md
```

```markdown
// DILARANG: mengonsolidasi entri yang dipatok pengguna
// Salah: entri "dipatok pengguna: nama paket tetap snake_case" dirapikan/dihapus saat konsolidasi
// Benar: entri dipatok pengguna tidak boleh disentuh tanpa perintah eksplisit pengguna
```

```markdown
// DILARANG: menganggap skill ini menetapkan bagian tertentu di MEMORI.md
// Salah: "MEMORI.md harus punya bagian X, Y, Z" lalu menghapus/menata ulang bagian lain tanpa alasan dari isi proyek
```


===== .agents/skills/migrasi-skema-sqlite/SKILL.md =====
---
name: migrasi-skema-sqlite
description: "Trigger: saat menambah atau mengubah tabel, kolom, indeks, atau migrasi SQLite | Naikkan versi, update onCreate dan onUpgrade, cerminkan perubahan di onCreate, verifikasi PRAGMA table_info; hindari untuk perubahan non-skema. Migrasi Skema Database SQLite Setiap perubahan skema wajib menaikkan versi database, update `onCreate` dan `onUpgrade` dengan kondisi versi yang sesuai. Perubahan kolom/indeks pada tabel yang sudah ada wajib dicerminkan di definisi `CREATE TABLE` pada `onCreate`, bukan hanya di `onUpgrade`. Aturan 1. Setiap perubahan skema wajib menaikkan konstanta `_versiDatabase` (increment satu per migrasi). 2. Metode `onCreate` wajib membuat seluruh tabel yang dibutuhkan aplikasi, termasuk tabel baru, agar instalasi baru memiliki skema lengkap. 3. Metode `onUpgrade` wajib menangani setiap versi lama secara kondisional menggunakan `if (oldVersion < N)` untuk setiap versi yang ditambahkan. 4. Tabel baru pada versi tertentu wajib dibuat baik di `onCreate` maupun di `onUpgrade` (agar pengguna lama mendapa"
metadata:
  kategori: "custom"
  versi: "1.2.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Migrasi Skema Database SQLite

Setiap perubahan skema wajib menaikkan versi database, update `onCreate` dan `onUpgrade` dengan kondisi versi yang sesuai. Perubahan kolom/indeks pada tabel yang sudah ada wajib dicerminkan di definisi `CREATE TABLE` pada `onCreate`, bukan hanya di `onUpgrade`.

## Aturan

1. Setiap perubahan skema wajib menaikkan konstanta `_versiDatabase` (increment satu per migrasi).
2. Metode `onCreate` wajib membuat seluruh tabel yang dibutuhkan aplikasi, termasuk tabel baru, agar instalasi baru memiliki skema lengkap.
3. Metode `onUpgrade` wajib menangani setiap versi lama secara kondisional menggunakan `if (oldVersion < N)` untuk setiap versi yang ditambahkan.
4. Tabel baru pada versi tertentu wajib dibuat baik di `onCreate` maupun di `onUpgrade` (agar pengguna lama mendapatkan tabel baru).
5. Nama tabel dan kolom baru wajib didefinisikan di `NamaTabel` dan `NamaKolom`, bukan string literal di kode database.
6. Perubahan kolom pada tabel lama wajib menggunakan `ALTER TABLE ... ADD COLUMN` di `onUpgrade` dengan kondisi versi yang sesuai.
7. Setiap tabel wajib didefinisikan tepat sekali pada cabang `if (oldVersion < N)` yang seharusnya membuatnya. Dilarang menduplikasi DDL tabel yang sama di dua cabang versi (mis. `sos_intervensi` di cabang v9 dan v11 sekaligus); `onCreate` tetap membuat semua tabel, `onUpgrade` hanya membuat tabel milik versinya.
8. Perubahan penamaan nilai enum yang dipersistenkan ke kolom `TEXT` wajib disertai migrasi data pada cabang versi baru memakai `rawUpdate` dengan pola `UPDATE <tabel> SET <kolom> = ? WHERE <kolom> = ?` untuk setiap pemetaan nilai lama → baru (contoh v12: `napas_478` → `napas478` pada `diary_craving.strategi`, `diary_craving.hasil`, `sos_intervensi.jenis_intervensi`, `sos_intervensi.hasil_intervensi`). Tanpa migrasi ini nilai lama gagal diparse `safeParseEnum`.
9. Tambahkan komentar singkat di atas konstanta `_versiDatabase` yang menjelaskan isi setiap versi (mis. `// Versi 13: tabel rencana_darurat (if-then plan).`).
10. Ratakan indentasi blok `onUpgrade` agar konsisten dengan blok lain (spasi, bukan campuran tab/spasi).
11. Indeks (`CREATE INDEX IF NOT EXISTS ...`) pada tabel baru wajib dibuat di cabang versi yang sama dengan pembuatan tabelnya, bukan di cabang versi lain.
12. Perubahan kolom/indeks pada tabel yang sudah ada wajib dicerminkan di definisi `CREATE TABLE` pada `onCreate` (dan/atau definisi indeks di `_buatTabel`) sehingga `onCreate` selalu mencerminkan skema versi terkini secara penuh; pengguna lama mendapatkannya lewat cabang `onUpgrade`, pengguna baru langsung dari `onCreate`. Bug yang terjadi pada v14 (migrasi `ALTER TABLE ... ADD COLUMN pemicu` hanya di `onUpgrade`, definisi `CREATE TABLE konsumsi_rokok` di `onCreate` tidak di-update → instalasi baru gagal `INSERT OR REPLACE ... pemicu` dengan `SqfliteFfiException(1) no column named pemicu`) adalah contoh langsung pelanggaran aturan ini; perbaikannya ada di v15 (lihat `230f0b1`).
13. Setelah mengubah skema, verifikasi skema hasil `onCreate` dan hasil chain `onUpgrade` per tabel memakai `PRAGMA table_info(<nama_tabel>)` (kolom wajib ada, nama dan tipe sesuai) sebelum perubahan dinyatakan selesai; untuk kolom yang ditambahkan kondisional, gunakan pola cek `PRAGMA table_info` lalu `ALTER TABLE` hanya bila kolom belum ada (aman untuk database yang terlanjur dibuat tanpa kolom).
14. Rekomendasi (bukan kewajiban refactor): pertimbangkan pola satu sumber DDL — `onCreate` membangun skema lewat langkah-langkah (`_createV1`, `_upgradeV1ToV2`, dst.) yang sama dengan `onUpgrade`, sebagaimana pola "Migration chain with batches" pada skill `sqflite-open-database` — agar DDL tidak diduplikasi dan tidak bisa tidak sinkron. Pada proyek ini `sqflite.dart` masih memakai definisi duplikat; refactor ke pola ini harus dibahas/disetujui terpisah sebelum dilakukan.

## Steps

1. Tambahkan/ubah definisi kolom, tabel, atau indeks di `_buatTabel` (`onCreate`) agar skema versi terkini tercermin di instalasi baru.
2. Naikkan `_versiDatabase` dan tambahkan komentar versi di atas konstanta tersebut.
3. Tambahkan cabang `if (oldVersion < N)` di `_onUpgrade` untuk pengguna lama (`ALTER TABLE ... ADD COLUMN` / `CREATE TABLE` / `CREATE INDEX` sesuai kebutuhan; gunakan cek `PRAGMA table_info` bila kolom bisa saja sudah ada).
4. Verifikasi skema per tabel dengan `PRAGMA table_info(<nama_tabel>)` untuk database instalasi baru dan database hasil chain `onUpgrade` (kolom, nama, tipe harus sama).
5. Jalankan `dart analyze` dan `flutter test`; dokumentasikan perubahan skema di `MEMORI.md` dan berkas diskusi/PRD terkait.

## Larangan

- Jangan menaikkan versi database tanpa memperbarui `onCreate` dan `onUpgrade`.
- Jangan membuat tabel baru hanya di `onCreate` tanpa menangani `onUpgrade` (pengguna lama tidak akan mendapatkan tabel).
- Jangan menduplikasi `CREATE TABLE` tabel yang sama di dua cabang `if (oldVersion < N)`; satu tabel tepat satu cabang versinya.
- Jangan mengubah nilai enum yang tersimpan di kolom database tanpa migrasi data pada cabang versi baru.
- Jangan menambah kolom/indeks hanya di `onUpgrade` tanpa mencerminkannya di definisi `CREATE TABLE` pada `onCreate` (instalasi baru akan gagal saat menulis kolom tersebut).
- Jangan menyatakan perubahan skema selesai tanpa verifikasi `PRAGMA table_info` per tabel.
- Jangan menggunakan string literal untuk nama tabel/kolom baru.
- Jangan menghapus data pengguna saat migrasi kecuali memang diperlukan dan terdokumentasi.

## Contoh Benar

```dart
// Versi 12: migrasi nilai enum snake_case lama ke lowerCamelCase.
// Versi 13: tabel rencana_darurat (if-then plan).
static const int _versiDatabase = 13;

// onCreate: buat semua tabel (konsumsi_rokok, sos_intervensi, rencana_darurat, ...).
await db.execute('CREATE TABLE IF NOT EXISTS ${NamaTabel.rencanaDarurat}(...)');

// onUpgrade:
if (oldVersion < 9) {
  // HANYA konsumsi_rokok + indeks idx_konsumsi_tanggal.
  await db.execute('CREATE TABLE IF NOT EXISTS ${NamaTabel.konsumsiRokok}(...)');
  await db.execute('CREATE INDEX IF NOT EXISTS idx_konsumsi_tanggal ON ${NamaTabel.konsumsiRokok}(${NamaKolom.tanggal})');
}
if (oldVersion < 11) {
  // HANYA sos_intervensi (tepat sekali, bukan di cabang v9).
  await db.execute('CREATE TABLE IF NOT EXISTS ${NamaTabel.sosIntervensi}(...)');
}
if (oldVersion < 12) {
  // Migrasi data nilai enum lama ke baru.
  const pemetaan = <String, String>{'napas_478': 'napas478', 'belum_selesai': 'belumSelesai'};
  for (final entry in pemetaan.entries) {
    await db.rawUpdate(
      'UPDATE ${NamaTabel.diaryCraving} SET ${NamaKolom.strategi} = ? WHERE ${NamaKolom.strategi} = ?',
      [entry.value, entry.key],
    );
  }
}
if (oldVersion < 13) {
  // HANYA rencana_darurat.
  await db.execute('CREATE TABLE IF NOT EXISTS ${NamaTabel.rencanaDarurat}(...)');
}

// v14: tambah kolom pemicu (TEXT, nullable) pada tabel konsumsi_rokok.
// JANGAN lupa: definisi CREATE TABLE konsumsi_rokok di onCreate wajib
// ikut menyertakan ${NamaKolom.pemicu} (aturan 12).
if (oldVersion < 14) {
  await db.execute(
    'ALTER TABLE ${NamaTabel.konsumsiRokok} '
    'ADD COLUMN ${NamaKolom.pemicu} TEXT',
  );
}
// v15: perbaikan bug instalasi baru (onCreate versi 14 tanpa kolom pemicu).
// Cek PRAGMA table_info agar aman untuk database yang sudah punya kolom.
if (oldVersion < 15) {
  final info = await db.rawQuery('PRAGMA table_info(${NamaTabel.konsumsiRokok})');
  final sudahAda = info.any((kolom) => kolom['name'] == NamaKolom.pemicu);
  if (!sudahAda) {
    await db.execute(
      'ALTER TABLE ${NamaTabel.konsumsiRokok} '
      'ADD COLUMN ${NamaKolom.pemicu} TEXT',
    );
  }
}
```

## Contoh Salah

```dart
// Hanya membuat tabel di onCreate, lupa onUpgrade: pengguna lama tidak mendapatkan tabel.
static const int _versiDatabase = 5;
// onCreate: create table diary_craving
// onUpgrade: (kosong / tidak menangani v5)
```

```dart
// Bug v14 yang sebenarnya terjadi (lihat commit 230f0b1): migrasi hanya di
// onUpgrade, definisi CREATE TABLE konsumsi_rokok di onCreate tidak di-update.
static const int _versiDatabase = 14;
// onCreate: CREATE TABLE konsumsi_rokok (id, tanggal, jumlah, is_slip, catatan, dibuat)
//           ^ TIDAK ada kolom pemicu → instalasi baru gagal INSERT OR REPLACE ... pemicu
// onUpgrade: if (oldVersion < 14) { ALTER TABLE konsumsi_rokok ADD COLUMN pemicu TEXT; }
// Instalasi baru versi 14 tidak pernah melewati cabang onUpgrade → kolom pemicu absen.
```


===== .agents/skills/model-state-freezed-abstract/SKILL.md =====
---
name: model-state-freezed-abstract
description: "Trigger: saat membuat model atau state Freezed | Panduan model/state Freezed abstract class: serialisasi JSON (part '*.freezed.dart' + '*.g.dart'), private constructor `._()` untuk getter/method, `@Default` (literal konstan untuk String/koleksi), pengosongan field nullable via `copyWith(field: null)` sentinel codegen (tanpa bendera `clearField` manual), integrasi notifier Riverpod, serta model database (fromSqflite/toSqflite, ParserUtil, konversi UTC, larangan fallback enum diam-diam yang menandakan sukses). Termasuk larangan mengedit berkas hasil generate. Membuat Model dan State dengan Freezed Membuat model dan state immutable dengan paket Freezed (`freezed` 4.0.2, `freezed_annotation` 3.1.0) menggunakan `abstract class` beranotasi `@freezed`, beserta serialisasi JSON, integrasi notifier Riverpod, dan pola model database (SQLite). Freezed menghasilkan `copyWith`, `==`/`hashCode`, `toString`, serta (bila diperlukan) `fromJson`/`toJson` secara otomatis melalui `build_runner`. Cakupan yang Di-Cover - Package: "
metadata:
  kategori: "custom"
  versi: "2.5.0"
  diperbarui: "Thu Nov 19 2026 03:26 WIB"
---

# Membuat Model dan State dengan Freezed

Membuat model dan state immutable dengan paket Freezed (`freezed` 4.0.2, `freezed_annotation` 3.1.0) menggunakan `abstract class` beranotasi `@freezed`, beserta serialisasi JSON, integrasi notifier Riverpod, dan pola model database (SQLite). Freezed menghasilkan `copyWith`, `==`/`hashCode`, `toString`, serta (bila diperlukan) `fromJson`/`toJson` secara otomatis melalui `build_runner`.

## Cakupan yang Di-Cover

- Package: `freezed_annotation` (`package:freezed_annotation/freezed_annotation.dart`), `freezed` (dev/build), `riverpod_annotation` (`package:riverpod_annotation/riverpod_annotation.dart`)
- Class: kelas `abstract class` (atau `sealed class`) beranotasi `@freezed`, `_$Nama` (mixin hasil generate), `_Nama` (implementasi privat hasil generate)
- Properti: `@Default(...)` untuk nilai awal field, `part '*.freezed.dart'`, `part '*.g.dart'`
- Method: `copyWith`, `==`, `hashCode`, `toString`, `fromJson`, `toJson`, `fromSqflite`, `toSqflite` (dihasilkan/ditulis sesuai pola)
- Version: `freezed` `4.0.2`, `freezed_annotation` `3.1.0`

## Aturan

1. Model dan state yang dibuat dengan Freezed wajib menggunakan `abstract class` (atau `sealed class`) beranotasi `@freezed`, bukan `class` biasa.
2. Tambahkan `part '<nama>.freezed.dart';` di berkas sumber. Bila memakai JSON, tambahkan juga `part '<nama>.g.dart';`.
3. Gunakan `const factory` untuk setiap varian/konstruktor. Untuk satu varian, cukup satu `const factory` dengan nama sama seperti kelas.
4. Gunakan `@Default(nilai)` untuk memberi nilai awal field; jangan menulis logika di dalam ekspresi `@Default`. Untuk `String` dan koleksi wajib memakai literal konstan sederhana (`@Default('')`, `@Default([])`, `@Default(<Tag>{})`).
5. Bila kelas membutuhkan getter atau method, deklarasikan constructor privat `const Nama._();` di dalam body kelas, lalu tulis getter/method biasa.
6. Untuk serialisasi JSON, anotasi setiap field dengan `@JsonKey(name: '...')` bila nama kolom berbeda dari nama field, dan sediakan `factory Nama.fromJson(Map<String, dynamic> json)` (dihasilkan Freezed) serta `Map<String, dynamic> toJson()`.
7. Model database wajib menyediakan factory `fromSqflite(Map<String, Object?> row)` dan method `toSqflite()` untuk konversi ke/dari SQLite.
8. Parsing nilai dari database wajib menggunakan `ParserUtil`.
9. Konversi tanggal ke UTC wajib dilakukan di `toSqflite()` (`toUtc().toIso8601String()`), dan konversi ke lokal wajib dilakukan di `fromSqflite()` (`parseDateTime(...)?.toLocal()`).
10. Field bertipe enum wajib diparse dengan `ParserUtil.safeParseEnum(TelEnum.values, ParserUtil.parseStringOrNull(row[NamaKolom.kolom]))`, dengan fallback nilai default yang valid bila tersimpan `null`/tidak dikenal, kecuali kolom boleh `null` — untuk kolom nullable cukup kembalikan `null` tanpa fallback. **Fallback DILARANG diam-diam memilih nilai yang menandakan sukses/selesai/lunas** (mis. `lunas`, `berhasil`, `selesai`); wajib memilih default konservatif (mis. `belumLunas`, `proses`) atau melempar `ArgumentError` — nilai enum tidak dikenal harus terlihat, bukan tersembunyi di balik nilai sukses.
11. Nilai enum yang dipersistenkan ke kolom `TEXT` wajib `lowerCamelCase` (`berhasilMenahan`, `timer3Menit`) dan konsisten dengan migrasi data (lihat skill `migrasi-skema-sqlite`); nilai `snake_case` lama tidak boleh muncul di enum baru.
12. Kolom yang nullable di database wajib dipetakan ke properti nullable di model (`String?`, `HasilIntervensiSos?`) dan diparse dengan `ParserUtil.parseStringOrNull` / `safeParseEnum` tanpa fallback paksa.
13. Untuk state Riverpod, kombinasikan `@freezed` pada kelas state dengan notifier `@Riverpod(keepAlive: true)`; `build()` mengembalikan instance state default.
14. Field nullable pada state Freezed yang perlu bisa dikosongkan (mis. filter Town Hall/tipe) wajib mengandalkan sentinel `copyWith` dari codegen: panggil `copyWith(field: null)` untuk menghapus nilai. Jangan membuat bendera manual `clearField`/`clearTags` pada state Freezed.
15. Jalankan `build_runner` untuk menghasilkan berkas `*.freezed.dart` dan `*.g.dart` setelah menulis/mengubah sumber. Workflow: `dart pub get` → `dart run build_runner build --delete-conflicting-outputs` → `dart format .` → `dart analyze`.
16. Verifikasi kebenaran dengan `dart format`, `dart analyze`, dan `flutter test` bila relevan.
17. Model yang belum Freezed dan memiliki pasangan `fromSqlite`/`toSqlite` (dan/atau `fromFirebase`/`toFirebase`) wajib dikonversi ke struktur Freezed (`abstract class` + `part '<model>.freezed.dart'` + `const factory X({...}) = _X;`, serta `const X._();` bila ada factory/method); manual `copyWith` WAJIB dihapus (di-generate); `id` wajib `required String` non-nullable — DILARANG auto-UUID di dalam model (UUID wajib disuplai oleh pemanggil); field bernilai default lama memakai `@Default`.
18. Seluruh parsing nilai dari database WAJIB lewat `ParserUtil`: `parseString`/`parseStringOrNull` (DILARANG cast `as String`/`as num`), `parseBool`, `parseInt`/`parseIntOrNull`, `parseDouble`; enum lewat `safeParseEnum` + `parseStringOrNull` (DILARANG `firstWhere`/`byName` langsung pada nilai DB).
19. Nilai `Timestamp` dari Firestore (atau tipe setara `cloud_firestore`) wajib dinormalisasi lewat helper private (mis. `_parseTanggal`): `value is Timestamp` → `value.toDate().toLocal()`; selain itu `ParserUtil.parseDateTime(value)?.toLocal()`. Paket bersama yang bersifat generik dan dipakai lintas proyek tidak boleh mengimpor `cloud_firestore` hanya untuk parsing tanggal. Shared util lintas proyek juga DILARANG memuat deteksi domain/Firebase (mis. duck-typing `toDate()`, pengecekan `NoSuchMethodError` untuk `Timestamp`); konversi tipe domain hanya berada di adapter model.
20. Kolom/field tanggal yang wajib non-null wajib divalidasi eksplisit; bila gagal parse, lemparkan `ArgumentError` khusus — DILARANG fallback `DateTime.now()`.
21. Bila model yang sama dipakai lintas backend (SQLite, Firestore, Supabase) dengan **nama kunci skema yang sama**, WAJIB menyediakan satu pintu parsing `_fromMap(String? id, Map<String, dynamic> map)` yang dipakai oleh `fromSqlite`, `fromFirebase`, dan `fromSupabase`; DILARANG menduplikasi body parsing pada tiap factory.
22. Field boolean dengan `@Default(true)` (atau default non-false) yang dapat bernilai `null` dari backend WAJIB diparse lewat helper privat (mis. `_parseIsPublic`) yang menganggap `null` → nilai default; `ParserUtil.parseBool` (yang default `false`) DILARANG dipakai langsung untuk field dengan default `true`.
23. Kolom waktu yang ditulis ke Firestore WAJIB memakai `FieldValue.serverTimestamp()` untuk waktu server, dan field nullable (mis. `diarsipkan`) WAJIB ditulis `null` secara eksplisit agar nilai lama ikut terhapus saat `set`/`set(merge)`/`update`. Kolom waktu SQLite/Supabase WAJIB ditulis ISO-8601 UTC non-null (default `DateTime.now()` bila null) agar tidak melanggar aturan non-null.
24. Enum `label` pada model multi-backend BOLEH memakai **switch expression** (Dart 3) selama tetap exhaustive atas seluruh nilai enum.

## Steps

1. Tambahkan dependensi `freezed_annotation` (dependencies) dan `freezed` + `build_runner` (dev_dependencies) di `pubspec.yaml`.
2. Buat berkas sumber model/state dengan anotasi `@freezed`, `part '*.freezed.dart'` (dan `*.g.dart` bila JSON).
3. Tulis `abstract class` dengan `const factory` dan `@Default`; tambahkan `const Nama._();` bila ada getter/method.
4. Untuk model database, sediakan `fromSqflite`/`toSqflite` (dengan `ParserUtil` dan konversi UTC) dan/atau `fromJson`/`toJson` untuk JSON.
5. Jalankan `dart run build_runner build --delete-conflicting-outputs` untuk menghasilkan berkas generate.
6. Jalankan `dart format .` dan `dart analyze`; perbaiki temuan.
7. Jangan edit berkas `*.freezed.dart` / `*.g.dart` secara manual; ubah sumber lalu jalankan ulang `build_runner`.

## Larangan

- DILARANG menulis model/state sebagai `class` biasa tanpa anotasi `@freezed` bila ingin memakai fitur Freezed.
- DILARANG mengedit berkas hasil generate (`*.freezed.dart`, `*.g.dart`) secara manual.
- DILARANG menulis logika di dalam `@Default(...)`.
- DILARANG menambahkan `part '*.g.dart'` tanpa membuat field yang memerlukan serialisasi JSON (atau tanpa `json_serializable`).
- DILARANG menjalankan `build_runner` tanpa `--delete-conflicting-outputs` bila ada berkas generate lama yang bentrok.
- DILARANG melakukan parsing `dynamic` dari database secara langsung tanpa `ParserUtil`.
- DILARANG menyimpan waktu lokal seolah-olah UTC.
- DILARANG memparse enum dari database dengan cast/string matching langsung tanpa `ParserUtil.safeParseEnum`.
- DILARANG fallback enum non-nullable yang diam-diam memilih nilai sukses/selesai/lunas (mis. `orElse: () => StatusPembayaranEnum.lunas`); wajib default konservatif (mis. `belumLunas`) atau melempar `ArgumentError` (Aturan 10).
- DILARANG persistenkan nilai enum `snake_case` ke kolom database.
- DILARANG membuat bendera manual `clearField`/`clearTags` pada state Freezed untuk mengosongkan field nullable; gunakan `copyWith(field: null)` dari codegen.
- DILARANG cast `as String[?]`/`as num` pada nilai dari database; pakai `ParserUtil.parseString[OrNull]`/`parseInt`/`parseDouble`.
- DILARANG fallback `DateTime.now()` saat parse tanggal wajib gagal; lemparkan `ArgumentError`.
- DILARANG nama field Firestore yang berbeda dari kolom SQLite (mis. camelCase terpisah); samakan dengan kolom SQLite.
- DILARANG auto-UUID dari dalam model; `id` wajib non-nullable dan disuplai pemanggil.
- DILARANG menambah deteksi tipe domain/Firebase (mis. duck-typing `toDate()`, `catch (NoSuchMethodError)` untuk `Timestamp`) ke shared util lintas proyek (mis. `ParserUtil` pada `share_global_saya`); konversi tipe domain hanya di adapter model (Aturan 19).

## Contoh Benar

State Freezed dengan getter, `@Default`, private constructor, dan notifier Riverpod (pola dari commit repo):

```dart
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_debug_notifier.freezed.dart';
part 'log_debug_notifier.g.dart';

@freezed
abstract class LogDebugState with _$LogDebugState {
  const LogDebugState._();

  const factory LogDebugState({
    @Default([]) List<LogDebugModel> listLogDebug,
  }) = _LogDebugState;

  List<LogDebugModel> getListError() {
    return listLogDebug.where((log) => log.tipeLog == TipeLog.error).toList();
  }
}

@Riverpod(keepAlive: true)
class LogDebugNotifier extends _$LogDebugNotifier {
  @override
  Future<LogDebugState> build() async {
    return const LogDebugState();
  }
}
```

State filter Freezed dengan `@Default` koleksi dan pengosongan field nullable via codegen (pola dari commit `cacca30`/`c0ed41e` di `base_coc`):

```dart
@freezed
abstract class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    TownHallLevel? townHall,
    TipeBase? tipe,
    @Default('') String query,
    @Default(<TagStrategi>{}) Set<TagStrategi> tags,
  }) = _FilterState;

  bool get hasFilter =>
      townHall != null || tipe != null || query.isNotEmpty || tags.isNotEmpty;
}

// Menghapus filter Town Hall: field nullable di-clear lewat copyWith codegen.
state = state.copyWith(townHall: null);
// Menghapus seluruh tag: assign koleksi kosong, bukan bendera manual.
state = state.copyWith(tags: const <TagStrategi>{});
```

State Freezed dua field — list + counter sederhana (pola dari proyek `admin_wifi`, commit `f9568a1`):

```dart
@freezed
abstract class PelangganAktifState with _$PelangganAktifState {
  const PelangganAktifState._();

  const factory PelangganAktifState({
    @Default([]) List<PelangganAktifModel> listPelangganAktif,
    @Default(0) int jumlahPelangganAktif,
  }) = _PelangganAktifState;
}
```

Model Freezed dengan serialisasi JSON (pola SDK resmi package:freezed):

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'produk.freezed.dart';
part 'produk.g.dart';

@freezed
abstract class Produk with _$Produk {
  const factory Produk({
    required String id,
    required String nama,
    @Default(0) int harga,
  }) = _Produk;

  factory Produk.fromJson(Map<String, dynamic> json) => _$ProdukFromJson(json);
}
```

Model database Freezed dengan `fromSqflite`/`toSqflite`, `ParserUtil`, dan konversi UTC (pola dari commit repo):

```dart
@freezed
abstract class DiaryCravingModel with _$DiaryCravingModel {
  const DiaryCravingModel._();
  const factory DiaryCravingModel({...}) = _DiaryCravingModel;

  factory DiaryCravingModel.fromSqflite(Map<String, Object?> row) {...}
  Map<String, Object?> toSqflite() {...}
}
```

Model database non-Freezed `StatistikDao` dengan `fromSqflite`/`toSqflite`, `ParserUtil`, konstanta kolom snake_case, dan transaksi (pola dari commit `5265490` di `base_coc`):

```dart
import 'package:sqflite/sqflite.dart';

import 'package:base_coc/core/util/parser_util.dart';
import 'package:base_coc/fitur/galeri_base/model/nama_tabel_statistik.dart';

class StatistikBase {
  const StatistikBase({
    required this.idBase,
    required this.jumlahSalin,
    required this.jumlahDibuka,
    required this.diperbarui,
  });

  final String idBase;
  final int jumlahSalin;
  final int jumlahDibuka;
  final String diperbarui;

  factory StatistikBase.fromSqflite(Map<String, Object?> row) {
    return StatistikBase(
      idBase: ParserUtil.parseStringOrNull(row[NamaKolomStatistik.idBase]) ?? '',
      jumlahSalin: ParserUtil.parseInt(
        row[NamaKolomStatistik.jumlahSalin],
        defaultValue: 0,
      ),
      jumlahDibuka: ParserUtil.parseInt(
        row[NamaKolomStatistik.jumlahDibuka],
        defaultValue: 0,
      ),
      diperbarui:
          ParserUtil.parseStringOrNull(row[NamaKolomStatistik.diperbarui]) ??
          '',
    );
  }

  Map<String, Object?> toSqflite() {
    return <String, Object?>{
      NamaKolomStatistik.idBase: idBase,
      NamaKolomStatistik.jumlahSalin: jumlahSalin,
      NamaKolomStatistik.jumlahDibuka: jumlahDibuka,
      NamaKolomStatistik.diperbarui: diperbarui,
    };
  }
}
```

Model Freezed dengan field enum baru (`SortirMode`) dan `@Default` koleksi (pola dari commit `5265490` di `base_coc`):

```dart
@freezed
abstract class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    TownHallLevel? townHall,
    TipeBase? tipe,
    @Default(SortirMode.terbaru) SortirMode sortir,
    @Default('') String query,
    @Default(<TagStrategi>{}) Set<TagStrategi> tags,
  }) = _FilterState;

  /// Status sortir tidak dihitung sebagai filter.
  bool get hasFilter =>
      townHall != null || tipe != null || query.isNotEmpty || tags.isNotEmpty;
}
```

Model database `TautanStatus` dengan `toSqflite()` ditambahkan setelah `fromSqflite` (pola dari commit `45ae356` di `base_coc`):

```dart
Map<String, Object?> toSqflite() {
  return <String, Object?>{
    NamaKolomTautan.idBase: idBase,
    NamaKolomTautan.jumlahLaporan: jumlahLaporan,
    NamaKolomTautan.terakhirDilaporkan: terakhirDilaporkan,
    NamaKolomTautan.diperbarui: diperbarui,
  };
}
```

Model Freezed multi-backend (SQLite/Firestore/Supabase) dengan satu pintu `_fromMap`, default null-boolean, dan waktu server (pola dari commit `bd91623`/`05c8d61` di `admin_wifi`):

```dart
@freezed
abstract class PaketModel with _$PaketModel {
  const PaketModel._();
  const factory PaketModel({
    required String id,
    required String nama,
    @Default(true) bool isPublic,
    DateTime? diperbarui,
    DateTime? diarsipkan,
  }) = _PaketModel;

  static PaketModel _fromMap(String? id, Map<String, dynamic> map) {
    return PaketModel(
      id: id ?? ParserUtil.parseString(map[PaketSkema.id]),
      nama: ParserUtil.parseString(map[PaketSkema.nama]),
      isPublic: _parseIsPublic(map[PaketSkema.isPublic]),
      diperbarui: _parseTanggal(map[PaketSkema.diperbarui]),
      diarsipkan: _parseTanggal(map[PaketSkema.diarsipkan]),
    );
  }

  static bool _parseIsPublic(dynamic value) {
    return value == null ? true : ParserUtil.parseBool(value);
  }

  static DateTime? _parseTanggal(dynamic value) {
    if (value is Timestamp) return value.toDate().toLocal();
    return ParserUtil.parseDateTime(value)?.toLocal();
  }

  factory PaketModel.fromSqlite(Map<String, dynamic> map) => _fromMap(null, map);
  factory PaketModel.fromFirebase(String id, Map<String, dynamic> data) =>
      _fromMap(id, data);
  factory PaketModel.fromSupabase(Map<String, dynamic> map) => _fromMap(null, map);

  Map<String, dynamic> toSqlite() => <String, dynamic>{
        PaketSkema.id: id,
        PaketSkema.isPublic: isPublic ? 1 : 0,
        PaketSkema.diperbarui: (diperbarui ?? DateTime.now()).toUtc().toIso8601String(),
        PaketSkema.diarsipkan: diarsipkan?.toUtc().toIso8601String(),
      };

  Map<String, dynamic> toFirebase() {
    final arsip = diarsipkan;
    return <String, dynamic>{
      PaketSkema.id: id,
      PaketSkema.isPublic: isPublic,
      PaketSkema.diperbarui: FieldValue.serverTimestamp(),
      PaketSkema.diarsipkan: arsip == null ? null : Timestamp.fromDate(arsip.toUtc()),
    };
  }

  Map<String, dynamic> toSupabase() => <String, dynamic>{
        PaketSkema.id: id,
        PaketSkema.isPublic: isPublic,
        PaketSkema.diperbarui: (diperbarui ?? DateTime.now()).toUtc().toIso8601String(),
        PaketSkema.diarsipkan: diarsipkan?.toUtc().toIso8601String(),
      };
}
```

Enum `label` dengan switch expression (Dart 3) pada model multi-backend:

```dart
enum TipeDurasi {
  menit, jam, hari, bulan;

  String get label => switch (this) {
    TipeDurasi.menit => 'Menit',
    TipeDurasi.jam => 'Jam',
    TipeDurasi.hari => 'Hari',
    TipeDurasi.bulan => 'Bulan',
  };
}
```

## Contoh Salah

```dart
// DILARANG: kelas biasa tanpa anotasi @freezed, freezed tidak berlaku
class Produk {
  final String id;
  Produk({required this.id});
}
```

```dart
// DILARANG: logika di dalam @Default
const factory Produk({
  @Default(1 + 1) int harga, // salah: @Default harus nilai konstan sederhana
}) = _Produk;
```

```dart
@freezed
class DiaryCravingModel with _$DiaryCravingModel { ... } // salah: class biasa, bukan abstract
```

```dart
// DILARANG: mengedit berkas hasil generate secara manual
// lib/produk.freezed.dart (GENERATED CODE - DO NOT MODIFY BY HAND)
```


===== .agents/skills/navigator-routing/SKILL.md =====
---
name: navigator-routing
description: "Trigger: saat navigasi atau routing Flutter | Panduan Navigator, Route, Page, MaterialApp.router, pushNamed, pop, onGenerateRoute, onUnknownRoute, restorablePushNamed. Navigasi dan Routing Flutter Mengelola navigasi antar layar menggunakan `Navigator`, `Route`, `Page`, dan `MaterialApp` baik dengan imperative API maupun declarative (`MaterialApp.router`). Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/widgets/navigator.dart`, `lib/src/widgets/app.dart`, `lib/src/widgets/material/app.dart`) - Class: `Navigator`, `NavigatorState`, `Route<T>`, `Page<T>`, `RouteSettings`, `MaterialApp`, `WidgetsApp`, `Router` - Method: `Navigator.push`, `Navigator.pop`, `Navigator.pushNamed`, `Navigator.pushReplacement`, `Navigator.popUntil`, `Navigator.pushNamedAndRemoveUntil`, `Navigator.restorablePushNamed`, `Navigator.maybePop`, `Navigator.of`, `Navigator.maybeOf` - Tipe: `RouteFactory`, `RoutePredicate`, `PageRouteFactory`, `TransitionBuilder` - Properti: `Navigator.pages`, `onGenerateRoute`, `onUnknownRou"
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Wed Nov 18 2026 02:24 WIB"
---

# Navigasi dan Routing Flutter

Mengelola navigasi antar layar menggunakan `Navigator`, `Route`, `Page`, dan `MaterialApp` baik dengan imperative API maupun declarative (`MaterialApp.router`).

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/widgets/navigator.dart`, `lib/src/widgets/app.dart`, `lib/src/widgets/material/app.dart`)
- Class: `Navigator`, `NavigatorState`, `Route<T>`, `Page<T>`, `RouteSettings`, `MaterialApp`, `WidgetsApp`, `Router`
- Method: `Navigator.push`, `Navigator.pop`, `Navigator.pushNamed`, `Navigator.pushReplacement`, `Navigator.popUntil`, `Navigator.pushNamedAndRemoveUntil`, `Navigator.restorablePushNamed`, `Navigator.maybePop`, `Navigator.of`, `Navigator.maybeOf`
- Tipe: `RouteFactory`, `RoutePredicate`, `PageRouteFactory`, `TransitionBuilder`
- Properti: `Navigator.pages`, `onGenerateRoute`, `onUnknownRoute`, `onGenerateInitialRoutes`, `initialRoute`, `transitionDelegate`, `restorationScopeId`

## Aturan

1. Gunakan `Navigator.of(context)` untuk navigasi imperatif (`push`, `pop`, `pushNamed`) — hanya untuk pemakaian umum Flutter; pada proyek yang bergantung pada `share_global_saya`, navigasi WAJIB lewat helper `Nav` (lihat Aturan 12 dan 16).
2. Pastikan `MaterialApp` atau `WidgetsApp` memiliki `onGenerateRoute` jika menggunakan `pushNamed` atau named routes.
3. `onGenerateRoute` tidak boleh mengembalikan `null` kecuali `onUnknownRoute` juga disediakan.
4. `Navigator.pop(context, result)` untuk kembali dan mengirimkan nilai ke route sebelumnya.
5. `Navigator.popUntil(context, ModalRoute.withName('/'))` untuk kembali ke halaman root.
6. `Navigator.pushNamedAndRemoveUntil` untuk mengganti seluruh stack (mis. setelah login).
7. `Navigator.pushReplacement` untuk mengganti route saat ini tanpa menumpuk (mis. splash screen → home).
8. `MaterialApp.router` digunakan untuk declarative routing dengan `routerDelegate` / `routerConfig` (contoh `go_router`).
9. Satu `Navigator` hanya boleh memiliki satu `routerConfig` atau satu kombinasi `routerDelegate`/`routeInformationParser`, tidak keduanya sekaligus.
10. Gunakan `restorablePushNamed` jika route perlu dapat dipulihkan saat state restoration.
11. `RouteSettings.arguments` untuk melewatkan data ke route yang dipush dengan nama.
12. Helper `Nav` (`share_global_saya`, `lib/src/utils/navigator_helper.dart`) menyederhanakan navigasi: `Nav.to<T extends Object?>(context, page)` → `Future<T?>` (`Navigator.push`); `Nav.toReplacement<T extends Object?, TO extends Object?>(context, page)` → `Future<T?>` (`Navigator.pushReplacement<T, TO>`); `Nav.pop<T extends Object?>(context, [result])` → `void` (`Navigator.pop`); `Nav.pushAndRemoveUntil<T extends Object?>(context, page, {predicate})` → `Future<T?>` (`Navigator.pushAndRemoveUntil`, default `predicate ?? (route) => false`; dipakai saat membuka halaman dari notifikasi agar tidak ada route awal tersisa). Semua memakai `MaterialPageRoute<T>` dan private constructor `Nav._()`. Pemanggilan yang mengembalikan `Future` wajib `unawaited(...)` dengan `.catchError(...)` yang mencatat `L.e` dan `return null`.
13. Untuk daftar item yang masing-masing menavigasi (mis. menu "Lainnya", kartu aksi), ekstrak pembungkus tunggal (mis. `_navigasi(BuildContext context, Widget page, String nama)`) yang berisi pola `unawaited(Nav.to(...).catchError(...))` — jangan mengulang closure catchError per item.
14. Ratakan indentasi blok `onPressed: () => unawaited(...)` mengikuti pola lain di file yang sama (closure satu level lebih dalam, `child:`/penutup sejajar `onPressed:`).
15. `initialRoute` hanya berlaku saat pertama kali widget dibuat; perubahan setelah itu tidak berpengaruh.
16. Pada proyek yang bergantung pada `share_global_saya`, navigasi WAJIB memakai `Nav.to`/`Nav.toReplacement`/`Nav.pop`/`Nav.pushAndRemoveUntil`; DILARANG memanggil `Navigator.push`/`pushReplacement`/`pop`/`pushAndRemoveUntil` langsung — sesuai doc comment `Nav`, pelanggaran ditolak pada code review.
17. Navigasi mundur tanpa mengembalikan nilai WAJIB memakai `Nav.pop(context)` tanpa argumen; DILARANG `Nav.pop(context, false)`, `Nav.pop(context, null)`, atau `Nav.pop(context, true)`.
18. `AppBar` WAJIB tidak memasang `leading: BackButton(...)` kustom — `AppBar` sudah menampilkan tombol kembali otomatis bila ada route sebelumnya di stack; memasangnya ulang redundan dan berpotensi menimpa perilaku default (mis. `closeButton` pada dialog).

## Larangan

- `pushNamed` tanpa `onGenerateRoute` di `MaterialApp`/`WidgetsApp`.
- `onGenerateRoute` mengembalikan `null` tanpa `onUnknownRoute`.
- Pada proyek yang bergantung pada `share_global_saya`: memanggil `Navigator.push`/`pushReplacement`/`pop`/`pushAndRemoveUntil` langsung — wajib lewat helper `Nav` (Aturan 12 dan 16).
- `Navigator.of(context)` dengan `context` yang tidak berada di bawah `Navigator` (akan melempar `FlutterError`).
- Menggunakan `initialRoute` dan `routes` yang sama-sama berisi entri `'/'`.
- `Navigator.push` dengan route yang sudah pernah di-install (harus buat `Route` baru).
- `Nav.pop(context, false/null/true)` — navigasi mundur biasa tidak boleh mengirim hasil.
- `AppBar(leading: BackButton(...))` atau `AppBar(leading: IconButton(icon: Icon(Icons.arrow_back), ...))` — gunakan default `AppBar`.

## Contoh Benar

```dart
// push ke route bernama
Navigator.pushNamed(context, '/profil', arguments: <String, dynamic>{'id': 123});

// pop tanpa hasil (halaman ditutup biasa)
Nav.pop(context);

// pop dengan result
Navigator.pop(context, true);

// kembali ke root
Navigator.popUntil(context, ModalRoute.withName('/'));

// ganti stack seluruhnya
Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

// MaterialApp dengan named routes
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/profil': (context) => ProfilScreen(),
  },
  onGenerateRoute: (settings) {
    if (settings.name == '/detail') {
      return MaterialPageRoute(builder: (context) => DetailScreen());
    }
    return null;
  },
  onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => NotFoundScreen()),
);
```

## Contoh Salah

```dart
// context bukan di bawah Navigator
Navigator.of(context).push(...); // melempar FlutterError
```

```dart
// routes dengan '/' dan home sekaligus
MaterialApp(home: HomeScreen(), routes: {'/': (context) => HomeScreen()}); // assert error
```


===== .agents/skills/overlay-log-debug/SKILL.md =====
---
name: overlay-log-debug
description: "Trigger: saat menyusun root aplikasi Flutter (app.dart/main.dart); saat ikon/panel overlay debug tidak muncul (`_tampilkanIkon: overlay null? true` / `Overlay.maybeOf` null); saat error `No Directionality widget found` pada Overlay; saat error `No MaterialLocalizations found` pada SelectionArea | Panduan membungkus root app dengan `PengelolaOverlayLogDebug` dari share_global_saya: inisialisasi `L.init(container)` dengan ProviderContainer yang sama, `UncontrolledProviderScope`, wajib Overlay root manual sebagai ancestor (agar `Overlay.maybeOf` non-null), dibungkus `Directionality` **dan `Localizations`** (di ATAS `Directionality`), pola OverlayEntry (postFrameCallback + mounted check), dan `overlayLogDebugTampilProvider`. Overlay Log Debug pada Root Aplikasi Fitur debug log (ikon melayang + panel log) dari `share_global_saya` harus dipasang di root aplikasi agar log dapat diakses di atas seluruh layar tanpa mengganggu tree utama. Cakupan yang Di-Cover - Package: `share_global_saya` — komponen `PengelolaOverlay"
metadata:
  kategori: "custom"
  versi: "1.4.0"
  diperbarui: "Thu Nov 19 2026 02:56 WIB"
---

# Overlay Log Debug pada Root Aplikasi

Fitur debug log (ikon melayang + panel log) dari `share_global_saya` harus dipasang di root aplikasi agar log dapat diakses di atas seluruh layar tanpa mengganggu tree utama.

## Cakupan yang Di-Cover

- Package: `share_global_saya` — komponen `PengelolaOverlayLogDebug`, `OverlayLogDebug`, `OverlayLogDebugTampilNotifier` / `overlayLogDebugTampilProvider`, panel `_SheetSalinLog`, `OverlayEntry` (ikon `_IkonMelayangLogDebug`).
- File sumber: `share_global_saya/lib/log_debug/overlay_log_debug.dart`.
- Inisialisasi: `SharedPrefService`, `ProviderContainer`, `L.init`, `UncontrolledProviderScope`.

## Aturan

1. Panggil `WidgetsFlutterBinding.ensureInitialized()` pertama, lalu inisialisasi dependensi (mis. `SharedPrefService.init()`) sebelum `runApp`.
2. Buat `final container = ProviderContainer();` lalu `L.init(container);` — `L` dan widget di dalam app **wajib** memakai container yang sama; jangan buat container kedua.
3. Root app WAJIB dibungkus `PengelolaOverlayLogDebug` **tepat satu kali**, dan letakkan di root (bukan per layar); tetapi pembungkusan saja **tidak cukup** — tambahkan **Overlay root manual** di luar `PengelolaOverlayLogDebug`, **dibungkus `Directionality`** (lihat alasan & contoh pada blok di bawah, dan Aturan 4):

   ```dart
   runApp(
     UncontrolledProviderScope(
       container: container,
       // Overlay root manual berada DI ATAS MaterialApp (satu-satunya penyedia
       // Directionality/Localizations di tree), jadi keduanya dipasang manual:
       // Localizations di ATAS Directionality, Directionality di ATAS Overlay.
       child: Localizations(
         locale: const Locale('en'),
         delegates: const [
           DefaultWidgetsLocalizations.delegate,
           DefaultMaterialLocalizations.delegate,
         ],
         child: Directionality(
           textDirection: TextDirection.ltr,
           child: Overlay(
             initialEntries: [
               OverlayEntry(
                 // PengelolaOverlayLogDebug menyisipkan ikon/panel ke Overlay.maybeOf(context);
                 // Overlay root dibuat manual agar pemanggilan itu menemukan ancestor.
                 builder: (context) => const PengelolaOverlayLogDebug(
                   child: AplikasiSaya(),
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
   ```

   **Mengapa wajib Overlay root manual** (verifikasi runtime, 2026-11-18, `flutter run -d chrome`, proyek `admin_wifi`): `PengelolaOverlayLogDebug` menyisipkan ikon/panel lewat `Overlay.maybeOf(context)` yang hanya mencari ancestor Overlay. Jika ia berada **di atas** `MaterialApp`/`Navigator` (tanpa Overlay ancestor), hasilnya `null` dan `_tampilkanIkon()`/`_sembunyikanIkon()` langsung `return` — gejala di console: `_tampilkanIkon: overlay null? true`, dan ikon tidak pernah muncul. Butir-butir:

   - `MaterialApp.builder` **BUKAN** solusi: widget dari builder disisipkan **di atas** `MaterialApp`'s `Navigator` (lihat SDK `packages/flutter/lib/src/widgets/app.dart`, dok `builder` untuk `home` vs `builder`: "In contrast, the widget returned from builder is inserted _above_ the app's Navigator").
   - `Overlay` bersifat nested dan legal; Overlay root tetap ter-pasang selama aplikasi berjalan; entri ikon/panel disisipkan ke Overlay terdekat (root manual) dan tampil di atas seluruh app; konteks `PengelolaOverlayLogDebug` tidak pernah unmount lintas navigasi sehingga entri tidak di-remove di tengah sesi.
   - Pola bungkus app langsung di root **membuktikan ikon tidak muncul** — jangan gunakan tanpa Overlay root:
     ```dart
     // Salah: ikon tidak pernah tampil (Overlay.maybeOf dari context ini == null)
     runApp(const PengelolaOverlayLogDebug(child: MyApp()));
     ```

   **Mengapa `Overlay` root manual wajib dibungkus `Directionality`** (verifikasi runtime, 2026-11-18, `flutter run -d chrome`, proyek `admin_wifi`): Overlay root manual berada **DI ATAS** `MaterialApp` — satu-satunya penyedia `Directionality` di tree — sehingga tidak ada ancestor `Directionality` untuknya. `_Theater` (bagian internal `Overlay`) mewajibkan `Directionality`; root view hanya menyediakan `MediaQuery`. Tanpa `Directionality`, aplikasi melempar `No Directionality widget found. _Theater widgets require a Directionality widget ancestor` secara berulang (widget pemicu: `Overlay` di `main.dart`). Perbaikan: bungkus `Overlay` dengan `Directionality(textDirection: TextDirection.ltr, ...)` (`MediaQuery` **tidak** cukup). Verifikasi setelah perbaikan: `dart format` bersih, `dart analyze` — **No issues found!**, `flutter test` penuh → **+105/−24, identik baseline**; verifikasi runtime `flutter run -d chrome` (hot restart) terkonfirmasi lewat log pengguna (2026-11-18): tidak ada `No Directionality widget found`, dan `_tampilkanIkon: overlay null? false` serta `_tampilkanIkon: ikon di-insert ke overlay`.

   **Mengapa `Overlay` root manual wajib dibungkus `Localizations` (DI ATAS `Directionality`)** (verifikasi runtime, 2026-11-18, proyek `admin_wifi`; ter-commit `93d649c`): panel `share_global_saya` memakai `SelectionArea` yang membutuhkan `MaterialLocalizations`; Overlay root manual berada DI ATAS `MaterialApp` (penyedia Localizations), jadi root view hanya menyediakan `MediaQuery`. Tanpa `Localizations`, pembukaan panel melempar `No MaterialLocalizations found` secara berulang. Perbaikan: bungkus `Overlay` dengan `Localizations` berisi delegasi default framework (`DefaultWidgetsLocalizations` + `DefaultMaterialLocalizations`, locale `'en'`; proyek tidak memuat `flutter_localizations`). Verifikasi: `dart analyze` bersih; runtime log pengguna mengonfirmasi error hilang.

4. `PengelolaOverlayLogDebug` adalah `ConsumerStatefulWidget` yang menyisipkan `OverlayEntry` ke `Overlay.maybeOf(context)`. Insert entry dilakukan di `addPostFrameCallback` dengan cek `mounted`, bukan di `build` langsung; `build` hanya membandingkan nilai `overlayLogDebugTampilProvider` dengan `_terakhirTampilIkon`.
5. `_entryIkon`/`_entryLog` di-remove secara eksplisit di `dispose`; jangan dibiarkan menumpuk saat root app di-rebuild.
6. Provider `overlayLogDebugTampilProvider` (bool, default `true`) mengendalikan tampil/sembunyi ikon dan panel; gunakan `ref.read(overlayLogDebugTampilProvider.notifier).tampilkan()` / `.sembunyikan()`.
7. Logging internal `share_global_saya` memakai helper `p(...)` dari `log_debug/print_custom.dart` (hanya `print` saat `kDebugMode`). Proyek lain menulis log dengan gaya proyek (`L.i`, `L.w`, `L.e`, atau helper setara) . Jangan log data sensitif.
8. Untuk proyek yang belum bergantung pada `share_global_saya`, tambahkan dependensi `share_global_saya` (path atau git sesuai kebijakan proyek) terlebih dahulu; jangan menyalin kode overlay ke proyek (duplikasi).
9. `logDebugProvider` dan log buffer `L` akan muncul di panel; overlay ini untuk debug, bukan untuk UI pengguna akhir.
10. Bottom sheet kustom (mis. `_SheetSalinLog`) di-insert sebagai `OverlayEntry` dengan `Overlay.of(context, rootOverlay: true)` SETELAH `_entryLog` di-insert, agar selalu tampil di atas panel (Material milik `OverlayLogDebug`), bukan di bawahnya; area gelap di belakang sheet di-tap untuk menutup. Sebaliknya: overlay ikon/panel memakai `Overlay.maybeOf(context)` (bukan `rootOverlay: true`).
11. `_copyAllLogs` menyalin daftar log ke clipboard (`Clipboard.setData`), lalu LANGSUNG memanggil `logDebugProvider.notifier.hapusSemua()` (seluruh log DB terhapus setelah disalin) dan menampilkan `AppToast.sukses`; salinan per-tipe lewat `_SheetSalinLog` (`onPilih`) memakai alur yang sama — salinan bersifat konsumtif, bukan sekadar pratinjau.
12. Panel menggabungkan dua sumber log: log DB (`logDebugProvider`) dan buffer `L` (`L.buffer`), men-dedup berdasarkan `id` (`semuaList` di `build`, `...?logState?.listLogDebug` + `...L.buffer.where((b) => !...any((s) => s.id == b.id))`). Filter tampilan memakai `ModeTampilanLog` (semua/error/warning/info) lewat `_filterByMode`; badge warna per `TipeLog` (error=merah, warning=oranye, info=biru, sukses=hijau, api=ungu).
13. `Overlay` root manual berada DI ATAS `MaterialApp` — satu-satunya penyedia `Localizations`/`Directionality` di tree — sehingga root view hanya menyediakan `MediaQuery`. Panel `share_global_saya` memakai `SelectionArea` yang membutuhkan `MaterialLocalizations`; proyek tanpa `flutter_localizations` boleh memakai delegasi default framework (`DefaultWidgetsLocalizations` + `DefaultMaterialLocalizations`, locale `'en'`). Bungkus `Overlay` dengan `Localizations` **DI ATAS** `Directionality`; tanpa itu, setiap pembukaan panel melempar `No MaterialLocalizations found` (`SelectionArea`). Verifikasi runtime 2026-11-18 (sesi induk "kode", diperbaiki di `admin_wifi/lib/main.dart`, ter-commit `93d649c`): error `No MaterialLocalizations found` hilang setelah bungkus ganda; `dart analyze` — No issues found!.

Gotcha: `_ItemLogDebug` menyalin `widget.terlihatSemua` ke field lokal pada `initState` dan tidak menerapkan `didUpdateWidget`; toggle "lihat semua" di parent bersifat per-item dan tidak retroaktif ke `_ItemLogDebug` yang sudah ter-build.

## Contoh Benar

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_global_saya/core_shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();

  final container = ProviderContainer();
  L.init(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      // Overlay root manual berada di ATAS MaterialApp (penyedia
      // Localizations/Directionality), jadi keduanya dipasang manual:
      // Localizations di ATAS Directionality, Directionality di ATAS Overlay.
      child: Localizations(
        locale: const Locale('en'),
        delegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                // Overlay root manual: ancestor Overlay untuk PengelolaOverlayLogDebug
                builder: (context) => const PengelolaOverlayLogDebug(
                  child: AplikasiSaya(),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
```

## Contoh Salah

```dart
// Salah: L tidak diinisialisasi dengan container yang sama
void main() {
  runApp(const ProviderScope(child: MyApp())); // overlay & L tidak terhubung
}

// Salah: membungkus per layar, entry menumpuk
Widget build(BuildContext context) =>
    PengelolaOverlayLogDebug(child: BerandaScreen());

// Salah: ikon tidak pernah tampil (Overlay.maybeOf dari konteks ini == null
//   karena PengelolaOverlayLogDebug berada di atas MaterialApp/Navigator)
runApp(const PengelolaOverlayLogDebug(child: MyApp()));

// Salah: MaterialApp.builder tidak berada di bawah Overlay (widget dari builder
//   disisipkan DI ATAS Navigator — SDK app.dart), ikon tetap tidak tampil
MaterialApp(builder: (context, child) => PengelolaOverlayLogDebug(child: child));

// Salah: Overlay root manual TANPA Directionality — _Theater (bagian internal
//   Overlay) mewajibkan ancestor Directionality (MaterialApp di dalam anak Overlay
//   tidak bisa jadi ancestor-nya; root view hanya menyediakan MediaQuery).
//   Runtime melempar "No Directionality widget found. _Theater widgets require
//   a Directionality widget ancestor" secara berulang (sesi 31, admin_wifi)
runApp(
  UncontrolledProviderScope(
    container: container,
    child: Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => const PengelolaOverlayLogDebug(child: MyApp()),
        ),
      ],
    ),
  ),
);

// Salah: Overlay root manual TANPA Localizations — panel (`SelectionArea`)
//   membutuhkan MaterialLocalizations; runtime melempar "No MaterialLocalizations
//   found" secara berulang saat panel dibuka (sesi induk, admin_wifi, diperbaiki
//   di main.dart, commit `93d649c`)
runApp(
  UncontrolledProviderScope(
    container: container,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => const PengelolaOverlayLogDebug(child: MyApp()),
          ),
        ],
      ),
    ),
  ),
);
```

## File Terkait

- `share_global_saya/lib/log_debug/overlay_log_debug.dart` — `PengelolaOverlayLogDebug`, `OverlayLogDebug`, `overlayLogDebugTampilProvider`, `_IkonMelayangLogDebug`, `_SheetSalinLog`.
- `share_global_saya/lib/log_debug/print_custom.dart` — helper `p(...)` (log debug `kDebugMode`-only).
- `share_global_saya/README.md` — bagian "Inisialisasi" (contoh pemasangan lengkap; catatan: contoh README memposisikan overlay di atas MaterialApp — secara runtime ikon tidak tampil, lihat Aturan 3).
- `.agents/rules/overlay_log_debug.md` — kewajiban pemasangan pada root app.
- SDK Flutter: `packages/flutter/lib/src/widgets/overlay.dart` (`Overlay.maybeOf`, rootOverlay), `packages/flutter/lib/src/widgets/app.dart` (dok `home` vs `builder`: widget dari `builder` disisipkan DI ATAS Navigator).


===== .agents/skills/parsing-nullable-int/SKILL.md =====
---
name: parsing-nullable-int
description: 'Trigger: saat membaca field integer nullable dari database | Panduan parseIntOrNull (null tetap null, tidak jadi 0) dan parseInt/parseBool dengan defaultValue untuk field non-nullable. Parsing Field Nullable Integer dari Database Menggunakan parseIntOrNull Field `int?` yang dibaca dari database wajib menggunakan `ParserUtil.parseIntOrNull(...)`. Nilai null harus tetap null, bukan berubah menjadi 0. Aturan 1. Field nullable `int?` dari database wajib di-parse menggunakan `ParserUtil.parseIntOrNull(...)`, bukan `ParserUtil.parseInt(...)` yang menggunakan nilai default 0. 2. Pertahankan null dari database di model agar aplikasi dapat membedakan kondisi "belum diatur" dengan nilai nol yang memang ditetapkan. 3. **Field non-nullable di Dart** (`int`, `bool`, dll.) gunakan `ParserUtil.parseInt(...)` atau `ParserUtil.parseBool(...)` dengan `defaultValue`, karena tipe Dart tidak bisa menampung null. Jika DB null, nilai default Dart akan digunakan. 4. **Field nullable di Dart** (`int?`, `double?`, `String?`, dll.) gun'
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Parsing Field Nullable Integer dari Database Menggunakan parseIntOrNull

Field `int?` yang dibaca dari database wajib menggunakan `ParserUtil.parseIntOrNull(...)`. Nilai null harus tetap null, bukan berubah menjadi 0.

## Aturan

1. Field nullable `int?` dari database wajib di-parse menggunakan `ParserUtil.parseIntOrNull(...)`, bukan `ParserUtil.parseInt(...)` yang menggunakan nilai default 0.
2. Pertahankan null dari database di model agar aplikasi dapat membedakan kondisi "belum diatur" dengan nilai nol yang memang ditetapkan.
3. **Field non-nullable di Dart** (`int`, `bool`, dll.) gunakan `ParserUtil.parseInt(...)` atau `ParserUtil.parseBool(...)` dengan `defaultValue`, karena tipe Dart tidak bisa menampung null. Jika DB null, nilai default Dart akan digunakan.
4. **Field nullable di Dart** (`int?`, `double?`, `String?`, dll.) gunakan `ParserUtil.parseIntOrNull(...)`, `ParserUtil.parseDoubleOrNull(...)`, atau `ParserUtil.parseStringOrNull(...)` tanpa `??` default, sehingga null dari database tetap null. Catatan: `ParserUtil` TIDAK menyediakan `parseBoolOrNull`; untuk field `bool?` nullable gunakan `parseBool(..., defaultValue:)` hanya bila nilai default bisnis jelas, atau tangani null secara eksplisit.
5. Terapkan aturan ini pada seluruh field nullable yang dipetakan dalam factory model dari baris SQLite.

## Referensi API `ParserUtil` (share_global_saya)

Berkas sumber: `share_global_saya/lib/src/utils/parser_util.dart`. Kelas static-only dengan private ctor `ParserUtil._()`. Field yang tidak dikenali di-log `L.w(...)` lalu fallback ke `defaultValue`/`null`:

- `parseDateTime(dynamic value)` → `DateTime?` — `null`→`null`; `DateTime` passthrough; `int`: heuristik `< 1e12` → detik (×1000), selain itu milidetik; `String` → `DateTime.tryParse`; lainnya → `L.w` + `null`.
- `parseInt(value, {int defaultValue = 0})` → `int` — `num`→`toInt()`; `String` → `tryParse ?? defaultValue`; lainnya → `L.w` + `defaultValue`.
- `parseIntOrNull(value)` → `int?` — `num`→`toInt()`; `String` → `tryParse` (null bila gagal); lainnya → `L.w` + `null`.
- `parseDouble(value, {double defaultValue = 0.0})` → `double` — analog `parseInt`.
- `parseDoubleOrNull(value)` → `double?` — analog `parseIntOrNull`.
- `parseBool(value, {bool defaultValue = false})` → `bool` — `null`→`defaultValue`; `bool` passthrough; `int` → `value == 1`; `String` lowercased `'true'`/`'1'`; lainnya → `L.w` + `defaultValue`. **Tidak ada `parseBoolOrNull`.**
- `parseString(value, {String defaultValue = ''})` → `String` — `null`→`defaultValue`; `String` passthrough; lainnya → `toString()`.
- `parseStringOrNull(value)` → `String?` — `null`→`null`; `String` passthrough; lainnya → `toString()`.
- `safeParseEnum<T extends Enum>(List<T> values, String? value)` → `T?` — match `name` case-insensitive; gagal/tidak cocok → `L.w` + `null`.

## Larangan

- Jangan menggunakan `ParserUtil.parseInt(row[kolom])` untuk field `int?` yang null berarti belum diatur.
- Jangan mengubah null menjadi 0 tanpa keputusan dan validasi bisnis yang jelas.
- Jangan menambahkan `?? defaultValue` pada hasil `parseIntOrNull` untuk field nullable `int?`, karena akan meniadakan tujuan menjaga null tetap null.
- Jangan mengasumsikan keberadaan `parseBoolOrNull` atau varian OrNull lain yang tidak disediakan `ParserUtil`; periksa API `ParserUtil` terlebih dahulu.
- Jangan memakai `parseBool(...)` untuk field `bool?` yang null berarti "belum diatur", karena null akan berubah menjadi `defaultValue`.

## Contoh Benar

```dart
// Field nullable int? di Dart → parseIntOrNull, null tetap null
targetSmokeFreeHari: ParserUtil.parseIntOrNull(
  row[NamaKolom.targetSmokeFreeHari],
),

// Field non-nullable int di Dart → parseInt dengan defaultValue
jumlah: ParserUtil.parseInt(row[NamaKolom.jumlah], defaultValue: 1),

// Field non-nullable bool di Dart → parseBool dengan defaultValue
isSlip: ParserUtil.parseBool(row[NamaKolom.isSlip], defaultValue: false),

// Field nullable String? di Dart → parseStringOrNull, null tetap null
catatan: ParserUtil.parseStringOrNull(row[NamaKolom.catatan]),

// Field bool? nullable — TIDAK ada parseBoolOrNull; tangani eksplisit
isSlip: row[NamaKolom.isSlip] == null
    ? null
    : ParserUtil.parseBool(row[NamaKolom.isSlip], defaultValue: false),

// Field nullable enum — safeParseEnum case-insensitive, null bila tidak cocok
tipe: ParserUtil.safeParseEnum(TipeLog.values, row[NamaKolom.tipe] as String?),
```

## Contoh Salah

```dart
// SALAH: parseInt pada field nullable int? → null berubah menjadi 0
targetSmokeFreeHari: ParserUtil.parseInt(
  row[NamaKolom.targetSmokeFreeHari],
), // null berubah menjadi 0

// SALAH: ?? defaultValue pada parseIntOrNull untuk field nullable → null tidak tetap null
jumlah: ParserUtil.parseIntOrNull(row[NamaKolom.jumlah]) ?? 0,
```

## Rujukan

- Rujuk juga skill `penanganan-data-null` (indeks penanganan data null).


===== .agents/skills/penamaan-konvensi/SKILL.md =====
---
name: penamaan-konvensi
description: "Trigger: saat menamai identifier, file, atau class | Konvensi proyek Flutter: identifier bahasa Indonesia, file snake_case, variable camelCase, class PascalCase, konstanta SCREAMING_SNAKE_CASE, import package:, tabel/kolom snake_case, enum alih-alih String untuk banyak opsi, non-nullable dengan default alih-alih nullable. Konvensi Penamaan Proyek Skill ini mendokumentasikan konvensi penamaan yang wajib diterapkan di proyek ini. Cakupan yang Di-Cover - Package: `package:flutter`, `package:flutter_riverpod`, `package:freezed`, `package:json_annotation`, `package:mockito` (kode eksternal tetap pakai konvensi aslinya dalam Bahasa Inggris) - Class: `BiodataModel`, `ModeBerhenti`, `NamaTabel`, `NamaKolom` - Enum: `ModeBerhenti.seketika`, `ModeBerhenti.bertahap`, `Status.loading`, `Status.success`, `Status.error` - Properti: `jumlahRokokPerHari`, `isLoading`, `hasError`, `_errorMessage`, `namaTabel`, `versiDatabase` - Method: `simpanBiodata()`, `_handleTap()` Aturan 1. Wajib gunakan bahasa Indonesia untuk identifier yang didefinisikan aplikasi (variable, method, class, enum, table, column). 2. DILARANG "
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Sun Nov 22 2026 17:45 WIB"
---

# Konvensi Penamaan Proyek

Skill ini mendokumentasikan konvensi penamaan yang wajib diterapkan di proyek ini.

## Cakupan yang Di-Cover

- Package: `package:flutter`, `package:flutter_riverpod`, `package:freezed`, `package:json_annotation`, `package:mockito` (kode eksternal tetap pakai konvensi aslinya dalam Bahasa Inggris)
- Class: `BiodataModel`, `ModeBerhenti`, `NamaTabel`, `NamaKolom`
- Enum: `ModeBerhenti.seketika`, `ModeBerhenti.bertahap`, `Status.loading`, `Status.success`, `Status.error`
- Properti: `jumlahRokokPerHari`, `isLoading`, `hasError`, `_errorMessage`, `namaTabel`, `versiDatabase`
- Method: `simpanBiodata()`, `_handleTap()`

## Aturan

1. Wajib gunakan bahasa Indonesia untuk identifier yang didefinisikan aplikasi (variable, method, class, enum, table, column).
2. DILARANG campur bahasa Indonesia dan Inggris dalam satu identifier.
3. Kode dari library eksternal (Flutter, Riverpod, Freezed, dll) tetap pakai konvensi aslinya (English).
4. Nama file `.dart` wajib menggunakan `snake_case`.
5. Nama file test: `<nama>_test.dart` (snake_case + suffix `_test`).
6. Nama file generated: `<nama>.g.dart`, `<nama>.freezed.dart`, `<nama>.mocks.dart`.
7. Class, Enum, Mixin, Extension, Typedef: `PascalCase`.
8. Generic type parameter: huruf besar tunggal (`T`, `E`, `K`, `V`).
9. Local variable, parameter, field, method, function: `camelCase`.
10. Boolean variable/field: prefix `is`/`has`/`can`/`should` (camelCase).
11. Private (underscore prefix): `_camelCase`.
12. Top-level constant, static const class field: `SCREAMING_SNAKE_CASE`.
13. Enum values: `lowerCamelCase` (bukan SCREAMING_SNAKE_CASE).
    13a. Nilai enum yang dipersistenkan ke kolom database (`.name` disimpan ke kolom `TEXT`) juga wajib `lowerCamelCase` (mis. `berhasilMenahan`, `timer3Menit`). Perubahan nilai enum yang sudah tersimpan wajib disertai migrasi data di `onUpgrade` (lihat skill `migrasi-skema-sqlite`); nilai `snake_case` lama tidak boleh dipertahankan di enum baru maupun di data baru.
14. Nama tabel & kolom database: `snake_case` (lowercase + underscore).
15. Konstanta `NamaTabel` / `NamaKolom` value harus cocok persis dengan schema SQLite.
16. Import wajib pakai `package:` prefix, DILARANG relative import (`../`, `./`).
17. Urutkan import alfabetis berdasarkan path package lengkap.
18. Group: `dart:`, `package:` (external), `package:` (internal/project), lalu `export`.
19. Enum yang perlu ditampilkan ke pengguna WAJIB menyediakan getter `label` berupa `switch` exhaustive atas seluruh nilai enum (teks tampilan baku untuk pengguna, Bahasa Indonesia); UI wajib memanggil `<enum>.label` dan DILARANG menulis teks tampilan enum secara manual di layar (ternary/if/string literal). Getter `label` tidak menggantikan `.name` untuk persistensi database maupun `toString()`. Contoh: `TipeDurasi.label` ('Menit'/'Jam'/'Hari'/'Bulan'), `StatusPembayaranEnum.label` ('Lunas'/'Belum Lunas'), `TipeTransaksi.label` ('Pemasukan'/'Pengeluaran'/'Transfer').
20. Variabel state yang menampung salah satu dari banyak opsi pilihan (mis. filter status, status pesanan, mode tampilan) WAJIB memakai `enum` alih-alih `String` literal; DILARANG memakai `String` dengan perbandingan literal (mis. `== 'semua'`, `== 'baru'`) untuk opsi yang terbatas dan diketahui. Enum WAJIB memiliki getter `label` (rule 19). Contoh: `StatusFilterPesananEnum _filterStatus = StatusFilterPesananEnum.semua;` dengan `enum StatusFilterPesananEnum { semua, baru, diproses, selesai, ditolak; String get label { ... } }`.
21. Parameter atau field yang memiliki nilai default yang masuk akal WAJIB dideklarasikan non-nullable dengan nilai default, bukan nullable (`T?`) dengan `??` fallback; DILARANG `bool? x` + `x ?? false` atau `String? x` + `x ?? ''` bila nilai default sudah diketahui. Gunakan `bool x = false`, `String x = ''`, `int x = 0`, dll. Contoh: `final bool modePerpanjang = false;` dengan constructor `this.modePerpanjang = false`, bukan `final bool? modePerpanjang;` + `widget.modePerpanjang ?? false`.

## Larangan

- DILARANG campur bahasa Indonesia dan Inggris dalam satu identifier.
- DILARANG teks tampilan enum tulis manual di layar (ternary/if/string literal); wajib lewat getter `<enum>.label` dengan `switch` exhaustive.
- DILARANG nama file dengan huruf besar (mis. `BiodataScreen.dart`).
- DILARANG single letter variable (kecuali loop index `i`, `j`, atau generic `T`).
- DILARANG abbreviation tidak standar (`btn` → `button`, `ctx` → `context`).
- DILARANG Hungarian notation (`strNama`, `intUmur`, `lstItem`).
- DILARANG nama file/class yang hanya beda case (`User.dart` vs `user.dart`).
- DILARANG relative import (`../`, `./`).
- DILARANG enum values SCREAMING_SNAKE_CASE (gunakan lowerCamelCase).

## Contoh Benar

```dart
// Identifier Indonesia
class BiodataModel { ... }
final int jumlahRokokPerHari;
Future<void> simpanBiodata() async { ... }
enum ModeBerhenti { seketika, bertahap }
const String namaTabel = 'biodata';

// File snake_case
lib/fitur/biodata/model/biodata_model.dart
lib/fitur/biodata/screens/biodata_screen.dart
test/biodata_model_test.dart

// Class PascalCase
class BiodataModel { ... }
enum ModeBerhenti { ... }
extension BiodataPerhitungan on BiodataModel { ... }

// Variable camelCase
final String namaPengguna;
int jumlahRokokPerHari;
bool isLoading;
bool hasError;
String? _errorMessage;

// Konstanta SCREAMING_SNAKE_CASE
const String namaTabel = 'biodata';
const int versiDatabase = 8;
static const int maxPanjangNama = 100;

// Enum lowerCamelCase
enum Status { loading, success, error }

// Database snake_case
class NamaTabel {
  static const String biodata = 'biodata';
  static const String craving = 'craving_diary';
}
class NamaKolom {
  static const String id = 'id';
  static const String tanggalMulai = 'tanggal_mulai_berhenti';
  static const String jumlahRokok = 'jumlah_rokok_per_hari';
}

// Import package: + alfabetis
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:berhenti_merokok/fitur/biodata/model/biodata_model.dart';
import 'package:berhenti_merokok/fitur/biodata/notifier/biodata_notifier.dart';
import 'package:berhenti_merokok/shared/utils/l.dart';
```

## Contoh Salah

```dart
// DILARANG: Campur bahasa
final int cigarettesPerDay; // English di app-code
Future<void> saveBiodata() async { ... } // English method

// DILARANG: Nama file huruf besar
lib/fitur/biodata/model/biodataModel.dart
lib/fitur/biodata/screens/BiodataScreen.dart
test/BiodataModelTest.dart

// DILARANG: Single letter variable (kecuali loop index)
final int x; // DILARANG

// DILARANG: Abbreviation tidak standar
final Button btn; // DILARANG, gunakan button
final Context ctx; // DILARANG, gunakan context

// DILARANG: Hungarian notation
final String strNama; // DILARANG
final int intUmur; // DILARANG
final List lstItem; // DILARANG

// DILARANG: Relative import
import '../model/biodata_model.dart'; // DILARANG
import './biodata_model.dart'; // DILARANG
```


===== .agents/skills/penanganan-async/SKILL.md =====
---
name: penanganan-async
description: "Trigger: saat layar menangani state async, data kosong, atau beberapa AsyncValue | Panduan isLoading, hasError, requireValue, empty state, data tidak lengkap, early return, mounted check, cache provider, loading gabungan, error terpisah, tipe generic konkret, satu method helper error. Penanganan State Asynchronous dan Data Kosong pada Layar (satu atau beberapa provider)."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 22 2026 13:45 WIB"
---

# Penanganan State Asynchronous dan Data Kosong pada Layar

Panduan penanganan satu atau beberapa provider asynchronous: loading, error, requireValue, empty state, data tidak lengkap, early return, mounted check, cache provider.

## A. Satu Provider Asynchronous

### Aturan

1. Layar yang memuat data asynchronous wajib menangani status `isLoading` terlebih dahulu (tampilkan indikator loading).
2. Setelah itu, tangani status `hasError` (tampilkan pesan error dan tombol retry yang memanggil `ref.refresh(provider)`). DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`. Karena `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider), hasilnya WAJIB dipakai: satu provider → `() => ref.refresh(provider)`; beberapa provider sekaligus → list literal `() => [ref.refresh(p1), ref.refresh(p2), ...]`. Jangan panggil `ref.refresh(...)` sebagai statement yang mengabaikan hasil (memicu `unused_result`) dan jangan gunakan `// ignore: unused_result`.
3. Setelah data tersedia (`requireValue`), tangani kondisi data kosong (empty state) dan kondisi data tidak lengkap (mis. biodata null, tanggal berhenti null) sebagai tampilan tersendiri dengan informasi dan call-to-action.
4. Gunakan early return (guard clause) untuk setiap kondisi tersebut agar alur build tetap linear dan mudah dibaca.
5. Gunakan `const SizedBox.shrink()` untuk widget kondisional yang disembunyikan.
6. Setelah `await`/operasi asynchronous, periksa `mounted` sebelum mengakses `context` atau memanggil `setState`.
7. Pengambilan data dari provider yang berfungsi sebagai cache wajib menangani tiga status (`isLoading`, `hasError`, `data`) secara eksplisit. Cakupan cache provider meliputi: (a) provider sinkron turunan `Provider<AsyncValue<T>>` yang menurunkan `AsyncValue` dari provider sumber (mis. `filteredBasesProvider`, `baseSerupaProvider`); (b) `FutureProvider`/`AsyncNotifier` dengan `keepAlive: true`. Pada **konten utama** layar, setiap kasus gagal (`hasError`) wajib menampilkan pesan error dan aksi retry (`ref.refresh(provider)`). Pada **bagian opsional** yang disembunyikan secara sadar saat gagal (mis. ikon favorit, section rekomendasi), minimal wajib logging (`L.w`/`L.e`) di titik konsumsi.

### Larangan

- Jangan memanggil `requireValue` sebelum memastikan `isLoading` dan `hasError` sudah ditangani.
- Jangan menampilkan layar kosong tanpa informasi atau CTA ketika data kosong.
- Jangan menggabungkan penanganan loading, error, dan data kosong dalam satu blok yang sulit dibaca.
- DILARANG menelan kegagalan cache provider secara senyap: `.asData?.value`/`valueOrNull` tanpa pesan error, tanpa retry, dan tanpa logging. Khusus konten utama layar, `.asData?.value`/`valueOrNull` DILARANG sama sekali.

## B. Beberapa Provider Asynchronous

### Aturan

1. Ketika layar memuat lebih dari satu provider asynchronous, tangani status `isLoading` gabungan. Tampilkan indikator loading jika salah satu provider masih loading.
2. Tangani status `hasError` untuk setiap provider secara terpisah, dengan pesan error dan tombol retry yang memanggil `ref.refresh(provider)` yang sesuai. DILARANG memakai `ref.invalidate(provider)` untuk retry pada penanganan `hasError`. Karena `ref.refresh` dianotasi `@useResult` (mengembalikan nilai provider), hasilnya WAJIB dipakai: untuk satu provider gunakan `() => ref.refresh(provider)` (hasil menjadi return lambda); untuk beberapa provider sekaligus gunakan list literal `() => [ref.refresh(p1), ref.refresh(p2), ...]` agar setiap hasil terpakai. Jangan panggil `ref.refresh(...)` sebagai statement/blok yang mengabaikan hasilnya (memicu `unused_result`) dan jangan gunakan `// ignore: unused_result`.
3. Panggil `requireValue` pada setiap provider hanya setelah status loading dan error ditangani.
4. Kondisi data tidak lengkap (misalnya biodata null) tetap ditangani sebagai tampilan tersendiri dengan informasi dan call-to-action.
5. Saat menerima atau meneruskan nilai asynchronous ke parameter method/helper, gunakan tipe generic konkret sesuai state provider, misalnya `AsyncValue<ImpianState>`, bukan `AsyncValue<dynamic>`.
6. Pertahankan tipe konkret setiap provider secara terpisah agar akses properti state tetap diperiksa oleh analyzer.

### Larangan

- Jangan memanggil `requireValue` pada provider yang masih loading atau error.
- Jangan menggabungkan penanganan error beberapa provider menjadi satu blok yang tidak jelas provider mana yang gagal.
- Jangan menggunakan `AsyncValue<dynamic>` jika tipe state provider sudah diketahui.

## Contoh Benar

```dart
final dataAsync = ref.watch(provider);

if (dataAsync.isLoading) {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
if (dataAsync.hasError) {
  return Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const Text('Gagal memuat data'), OutlinedButton(onPressed: () => ref.refresh(provider), child: const Text('Coba lagi'))])));
}

final state = dataAsync.requireValue;
if (state.list.isEmpty) {
  return Scaffold(
    body: EmptyStateView(
      ikon: CupertinoIcons.book,
      judul: 'Belum ada data',
      deskripsi: 'Tekan tombol + untuk menambah data pertama.',
      ctaLabel: 'Tambah',
      onCta: () => unawaited(
        Nav.to(context, const FormPage()).catchError((Object e, StackTrace s) {
          L.e('Gagal navigasi: $e $s');
          return null;
        }),
      ),
    ),
  );
}
return Scaffold(body: _Daftar(state.list));
```

Beberapa provider:

```dart
final biodataAsync = ref.watch(biodataProvider);
final impianAsync = ref.watch(impianProvider);

if (biodataAsync.isLoading || impianAsync.isLoading) {
  return const Scaffold(body: Center(child: CircularProgressIndicator()));
}
if (biodataAsync.hasError) {
  return _ErrorRetry(onRetry: () => ref.refresh(biodataProvider));
}
if (impianAsync.hasError) {
  return _ErrorRetry(onRetry: () => ref.refresh(impianProvider));
}

final biodata = biodataAsync.requireValue;
final impianState = impianAsync.requireValue;
```

Parameter helper yang menerima state asynchronous juga harus tetap bertipe spesifik:

```dart
Widget _buildCardRingkasanImpian(
  BiodataModel biodata,
  AsyncValue<ImpianState> impianAsync,
) {
  // ...
}
```

## Contoh Salah

```dart
final state = dataAsync.requireValue;
return Scaffold(body: ListView(...));
```

```dart
// DILARANG: kegagalan cache provider ditelan senyap; konten utama memakai asData tanpa penanganan
final bases = ref.watch(filteredBasesProvider).asData?.value ?? [];
return GridBase(bases: bases, ...);
```

```dart
Widget _buildCardRingkasanImpian(
  BiodataModel biodata,
  AsyncValue<dynamic> impianAsync,
) {
  // ...
}
## Rujukan

- Rujuk juga skill `penanganan-data-null` (indeks penanganan data null).
```


===== .agents/skills/penanganan-data-null/SKILL.md =====
---
name: penanganan-data-null
description: "Trigger: saat menangani data null | Indeks skill khusus penanganan data null: type-promotion-null-safety, parsing-nullable-int, penanganan-async, validasi-form-sebelum-penyimpanan. Gunakan skill terkait untuk detail; jangan duplikasi isi di sini."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sat Nov 21 2026 08:11 WIB"
---

# Penanganan Data Null

Indeks skill khusus penanganan data null. Jangan menduplikasi isi skill spesifik di sini; buka skill terkait.

## Skill Terkait

- `type-promotion-null-safety` — field nullable dari objek model (salin ke variabel lokal sebelum null-check).
- `parsing-nullable-int` — field `int?` dari database (null tetap null, bukan 0).
- `penanganan-async` — kondisi data tidak lengkap (mis. biodata null) sebagai tampilan tersendiri.
- `validasi-form-sebelum-penyimpanan` — validasi input/null sebelum simpan.


===== .agents/skills/penanganan-error-unawaited/SKILL.md =====
---
name: penanganan-error-unawaited
description: "Trigger: saat memanggil Future tanpa await (unawaited) | Panduan wajib catchError dengan logging L.e pada Future yang dilepas; jangan biarkan unhandled. Penanganan Error pada Future yang Dilepas (unawaited) Future yang dilepas dengan `unawaited()` wajib memiliki penanganan error via `catchError()` yang mencatat error melalui logger proyek. Aturan 1. Future yang dilepas dengan `unawaited()` dan berpotensi gagal wajib memiliki penanganan error melalui `catchError(...)` atau `try/catch` yang mencatat error melalui logger proyek (`L.e`). 2. Jangan melepas `unawaited(...)` tanpa penanganan error hanya untuk menghilangkan peringatan analyzer. 3. Jangan mengandalkan keberhasilan implisit pada Future yang dilepas. 4. `unawaited(...)` pada pemanggilan method yang di dalamnya terdapat dialog (`showOkCancelAlertDialog`) atau `setState` DI LUAR blok `try` tetap wajib `.catchError(...)` di titik pemanggilan — exception dari dialog (mis. kegagalan platform channel) tidak tertangkap `try` internal method tersebut dan menjad"
metadata:
  kategori: "custom"
  versi: "1.1.2"
  diperbarui: "Thu Nov 19 2026 02:38 WIB"
---

# Penanganan Error pada Future yang Dilepas (unawaited)

Future yang dilepas dengan `unawaited()` wajib memiliki penanganan error via `catchError()` yang mencatat error melalui logger proyek.

## Aturan

1. Future yang dilepas dengan `unawaited()` dan berpotensi gagal wajib memiliki penanganan error melalui `catchError(...)` atau `try/catch` yang mencatat error melalui logger proyek (`L.e`).
2. Jangan melepas `unawaited(...)` tanpa penanganan error hanya untuk menghilangkan peringatan analyzer.
3. Jangan mengandalkan keberhasilan implisit pada Future yang dilepas.
4. `unawaited(...)` pada pemanggilan method yang di dalamnya terdapat dialog (`showOkCancelAlertDialog`) atau `setState` DI LUAR blok `try` tetap wajib `.catchError(...)` di titik pemanggilan — exception dari dialog (mis. kegagalan platform channel) tidak tertangkap `try` internal method tersebut dan menjadi error async tidak tertangani. Lebih baik: pindahkan dialog/`setState` ke dalam `try` pada method tersebut, ATAU bungkus pemanggilan dengan `.catchError(...)` yang mencatat `L.e` dan `return null`.

## Larangan

- Jangan memanggil `unawaited(Nav.to(...))`, `unawaited(EasyLoading.show(...))`, atau sejenisnya tanpa `.catchError(...)`/`try/catch`.
- Jangan mengabaikan error pada Future yang dilepas.

## Contoh Benar

```dart
unawaited(
  Nav.to(context, const HalamanLain()).catchError((Object e, StackTrace s) {
    L.e('Gagal navigasi: $e $s');
    return null;
  }),
);
```

## Contoh Salah

```dart
unawaited(Nav.to(context, const HalamanLain()));
```


===== .agents/skills/pencarian-koleksi-null-safe/SKILL.md =====
---
name: pencarian-koleksi-null-safe
description: "Trigger: saat mencari, mengurutkan, atau mengakses elemen dalam koleksi (List/Iterable/Map) | Panduan koleksi: pencarian wajib `firstWhereOrNull`, pengurutan wajib `.sorted`/`.sortedBy`/`.sortedByDescending` dari `package:collection/collection.dart`; akses nilai Map DILARANG memakai `!` (gunakan `.entries`, `??`, atau `putIfAbsent`); larangan `cast<T?>().firstWhere(..., orElse: ...)`, `..sort(...)` in-place, dan `map[key]!`."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 22 2026 12:07 WIB"
---

# Pencarian Koleksi Null-Safe

Saat mencari elemen dalam koleksi (`List`/`Iterable`) dengan predikat yang mungkin tidak ditemukan, wajib memakai `firstWhereOrNull` dari `package:collection/collection.dart`.

## Aturan

1. Pencarian elemen dalam koleksi dengan predikat yang mungkin tidak ditemukan wajib memakai `firstWhereOrNull` dari `package:collection/collection.dart`.
2. Import `package:collection/collection.dart` wajib ditambahkan bila belum ada (urutan alfabetis sesuai skill `aturan-penamaan`).
3. Hasil `firstWhereOrNull` bertipe nullable (`T?`); tangani `null` secara eksplisit (mis. `??` atau `if (result == null)`).
4. Pola `cast<T?>().firstWhere(..., orElse: () => null)` DILARANG karena verbose dan rentan salah tipe.
5. Pola `firstWhere(..., orElse: () => null)` tanpa `cast` juga DILARANG; gunakan `firstWhereOrNull`.

## Pengurutan Koleksi

6. Pengurutan elemen koleksi (`List`/`Iterable`) wajib memakai extension `.sorted(...)`, `.sortedBy(...)`, atau `.sortedByDescending(...)` dari `package:collection/collection.dart`, bukan `..sort(...)` pada list yang dimutasi (cascade).
7. `.sorted(...)` mengembalikan `List<T>` baru (immutable-friendly); jangan memutasi list sumber secara langsung untuk pengurutan.
8. Gunakan `.sortedBy((e) => e.field)` bila kunci pengurutan sederhana; gunakan `.sorted((a, b) => ...)` bila perlu pembanding kustom.
9. Import `package:collection/collection.dart` wajib ditambahkan bila belum ada (urutan alfabetis sesuai skill `aturan-penamaan`).

## Larangan

- Jangan memakai `_list..sort((a, b) => ...)` atau `list.sort(...)` untuk pengurutan yang menghasilkan list baru; gunakan `.sorted(...)`.
- Jangan memutasi list sumber secara langsung untuk pengurutan; gunakan `.sorted(...)`.

- Jangan memakai `_list.cast<T?>().firstWhere((e) => e?.id == id, orElse: () => null)`.
- Jangan memakai `_list.firstWhere((e) => e.id == id, orElse: () => null)` untuk koleksi yang mungkin tidak berisi elemen cocok.
- Jangan memakai operator `!` untuk memaksa hasil pencarian non-null apabila hasilnya dapat bernilai `null`.
- Jangan memakai `map[key]!` pada akses nilai Map; gunakan `.entries` atau `??`.
- Jangan memakai `map[key]!.add(x)` saat menambahkan ke koleksi di dalam Map; gunakan `putIfAbsent`.

## Akses Nilai Map

10. Akses nilai `Map` melalui indeks (`map[key]`) mengembalikan nilai nullable (`V?`); DILARANG memakai operator `!` untuk memaksakan non-null (mis. `map[key]!`).
11. Bila iterasi berdasarkan indeks, gunakan `.entries` dan ambil `.key`/`.value` dari entri (tidak perlu lookup ulang).
12. Bila lookup memang diperlukan dan nilai mungkin tidak ada, sediakan nilai default dengan `??` (mis. `map[key] ?? defaultValue`) atau tangani `null` secara eksplisit.
13. Jangan memakai `map[key]!` hanya karena key berasal dari `map.keys` (lookup tetap nullable menurut tipe).
14. Saat menambahkan elemen ke koleksi yang disimpan di dalam `Map` (mis. pengelompokan), DILARANG `map[key]!.add(x)`; gunakan `map.putIfAbsent(key, () => []).add(x)` agar entri dibuat bila belum ada tanpa operator `!`.
15. Alternatif yang setara: `map[key] = (map[key] ?? <T>[])..add(x);` (simpan list baru yang sudah berisi elemen); namun `putIfAbsent` lebih ringkas dan menghindari pembuatan list sementara.

## Contoh Benar (Akses Map)

```dart
final entry = grouped.entries.elementAt(index);
final tanggal = entry.key;
final transaksiPadaTanggal = entry.value;

// Lookup dengan default
final value = grouped[tanggal] ?? const <TransaksiModel>[];

// Tambah ke list di dalam Map (pengelompokan) — putIfAbsent
grouped.putIfAbsent(tanggal, () => []).add(t);
```

## Contoh Salah (Akses Map)

```dart
final tanggal = grouped.keys.elementAt(index);
final transaksiPadaTanggal = grouped[tanggal]!; // DILARANG

// DILARANG: menambah ke list di dalam Map dengan !
grouped[tanggal]!.add(t);
```

## Contoh Benar

````dart
import 'package:collection/collection.dart';

final kategori = state.listKategori.firstWhereOrNull(
  (k) => k.id == id,
);
if (kategori == null) {
  // tangani tidak ditemukan
}

// Pengurutan dengan .sorted (package:collection)
final terbaru = state.listTransaksi
    .where((t) => t.idPelanggan == idPelanggan)
    .sorted((a, b) => b.tanggal.compareTo(a.tanggal));

## Contoh Salah

```dart
final kategori = state.listKategori
    .cast<KategoriModel?>()
    .firstWhere(
      (k) => k?.id == id,
      orElse: () => null,
    );
````

```dart
// Salah: mutasi in-place dengan ..sort
final terbaru = (state.listTransaksi
        .where((t) => t.idPelanggan == idPelanggan)
        .toList()
      ..sort((a, b) => b.tanggal.compareTo(a.tanggal)));
```


---

# Referensi (dipindahkan dari folder references)



===== .agents/skills/penggunaan-tool-bawaan-kilo/SKILL.md =====
---
name: penggunaan-tool-bawaan-kilo
description: Trigger: saat memilih atau memakai tool bawaan Kilo (read, edit, glob, grep, bash, webfetch, dll.) | Panduan pemilihan tool bawaan Kilo: pemetaan kebutuhan ke tool yang tepat, contoh pemanggilan, aturan prioritas tool bawaan atas shell, dan izin deny yang mutlak. Penggunaan Tool Bawaan Kilo Panduan memilih dan memakai tool bawaan Kilo sesuai kebutuhan, beserta contoh pemanggilan dan aturan prioritas atas shell. Cakupan yang Di-Cover - Tool bawaan Kilo yang tersedia pada build saat ini: berkas, web, tugas/perencanaan, sesi/memori, interaksi pengguna, orkestrasi/sistem. - Pemetaan kebutuhan ke tool yang tepat. - Aturan prioritas tool bawaan atas shell dan izin `deny` yang mutlak. - Sumber: `prompt/skill/penggunaan-tool-bawaan-kilo.md` (commit `19177b4`); aturan prioritas lama `prioritas_tool_bawaan.md` (commit `c85674e`) sudah dihapus dan isinya diserap oleh skill ini. Aturan 1. Wajib gunakan tool bawaan Kilo bila ada padanan yang setara dengan kebutuhan; shell (`Bash`) hanya dipakai bila tidak ada tool bawaan 
metadata:
  kategori: "custom"
  versi: "1.3.2"
  diperbarui: "Sat Nov 21 2026 17:15 WIB"
---

# Penggunaan Tool Bawaan Kilo

Panduan memilih dan memakai tool bawaan Kilo sesuai kebutuhan, beserta contoh pemanggilan dan aturan prioritas atas shell.

## Cakupan yang Di-Cover

- Tool bawaan Kilo yang tersedia pada build saat ini: berkas, web, tugas/perencanaan, sesi/memori, interaksi pengguna, orkestrasi/sistem.
- Pemetaan kebutuhan ke tool yang tepat.
- Aturan prioritas tool bawaan atas shell dan izin `deny` yang mutlak.
- Sumber: `prompt/skill/penggunaan-tool-bawaan-kilo.md` (commit `19177b4`); aturan prioritas lama `prioritas_tool_bawaan.md` (commit `c85674e`) sudah dihapus dan isinya diserap oleh skill ini.

## Aturan

1. Wajib gunakan tool bawaan Kilo bila ada padanan yang setara dengan kebutuhan; shell (`Bash`) hanya dipakai bila tidak ada tool bawaan yang mencukupi.
2. Izin `deny` pada `.kilo/kilo.jsonc` bersifat mutlak; DILARANG diakali lewat interpreter, alias, atau perintah lain.
3. Sebelum menjalankan `Bash`, baca `permission.bash` pada `.kilo/kilo.jsonc`.
4. Bila tool bawaan tidak memberikan informasi yang dibutuhkan (mis. ukuran, izin, metadata filesystem), jelaskan keterbatasannya; gunakan shell hanya jika perintahnya tidak berstatus `deny`.
5. Beberapa tool yang dirujuk aturan proyek (`list`, `todoread`, `lsp`) tidak tersedia sebagai tool terpisah pada build ini; gunakan padanannya (`Read` untuk direktori, `Todowrite` untuk daftar tugas) dan catat ketidaksesuaian bila ditemukan.
6. Pemetaan kebutuhan ke tool:
   - Cocokkan berkas berdasarkan pola → `Glob`.
   - Cari isi berkas (regex) → `Grep` (atau `Bash` + `rg` untuk performa lebih baik; lihat Aturan 11).
   - Baca isi berkas atau direktori (offset/limit) → `Read`.
   - Penggantian teks tepat → `Edit`.
   - Tulis/timpa isi berkas → `Write`.
   - Jalankan perintah shell (git, flutter, dart, package manager, dll.) → `Bash`.
   - Pencarian web → `Websearch`.
   - Ambil konten URL → `Webfetch`.
   - Daftar tugas internal → `Todowrite`.
   - Sub-agen khusus → `Task`.
   - Muat skill → `Skill`.
   - Kueri language server → `Lsp` (bila tersedia pada build).
   - Daftar isi direktori (bila tool `list` tersedia) → `List`; pada build ini gunakan `Read` pada path direktori.
   - Tanya pengguna dengan opsi → `Question`.
   - Tinjauan kode → `Suggest`.
   - Buka rencana → `Open_plan`.
   - Mulai/lajutkan goal → `Goal` / `Goal_report`.
   - Penjadwalan → `Schedule_wakeup`, `Cancel_wakeup`, `Cron_create`, `Cron_delete`, `Cron_list`.
   - Percakapan masa lalu → `Kilo_local_recall`.
   - Sesi Agent Manager → `Agent_manager`, `Agent_manager_models`.
   - Proses latar belakang → `Background_process`.
   - Papan bersama sesi task → `Board_post`, `Board_read`.
   - Grafik → `Chart`.
7. Skill dan command wajib menginstruksikan tool bawaan lebih dahulu. DILARANG menulis instruksi yang menyuruh `rg`, `grep`, `find`, `ls`, `cat`, `head`, atau `tail` untuk operasi yang dapat dilakukan tool bawaan.
8. Sebelum menyunting berkas, baca ulang (Read) bila ada indikasi berkas berubah di luar sesi (mis. `oldString` tidak cocok atau hasil Grep berbeda dari yang terbaca); DILARANG menebak isi berkas — sunting hanya dengan isi terkini yang sudah dibaca ulang.
9. Saat memeriksa prasyarat berkas, terutama pada folder hidden (`.github`, `.kilo`, `.agents`), verifikasi dengan Read langsung selain Glob, agar tidak salah menyatakan berkas tidak ada.
10. **Khusus untuk `rg` (ripgrep): gunakan tool `Bash` dengan perintah `rg` terlebih dahulu untuk pencarian konten; tool `Grep` bawaan Kilo hanya dipakai bila `rg` tidak tersedia atau tidak memenuhi kebutuhan.**

11. **Setelah memuat skill via tool `skill`, wajib membaca seluruh berkas di folder `references/` di dalam folder skill tersebut (jika ada), agar detail aturan, contoh kode, dan referensi lengkap tersedia.**

## Daftar Tool (ringkas)

### Tool Berkas

- `Glob` — cocokkan berkas berdasarkan pola. Contoh: `glob: { pattern: "lib/**/*.dart" }`
- `Grep` — cari isi berkas (regex). Contoh: `grep: { pattern: "class\\s+\\w+", include: "*.dart" }`
- `Read` — baca isi berkas/direktori (offset/limit). Contoh: `read: { filePath: "lib/main.dart", offset: 1, limit: 50 }`
- `Edit` — penggantian teks tepat. Contoh: `edit: { filePath: "lib/main.dart", oldString: "foo", newString: "bar" }`
- `Write` — tulis/timpa isi berkas. Contoh: `write: { filePath: "lib/main.dart", content: "..." }`
- `Bash` — jalankan perintah shell (izin). Contoh: `bash: { command: "flutter test", workdir: "base_coc" }`

### Tool Web

- `Websearch` — pencarian web. Contoh: `websearch: { query: "flutter 3.47 release" }`
- `Webfetch` — ambil URL. Contoh: `webfetch: { url: "https://example.com" }`

### Tool Tugas dan Perencanaan

- `Todowrite` — buat/perbarui daftar tugas. Contoh: `todowrite: { todos: [{ content, status, priority }] }`
- `Task` — sub-agen khusus. Contoh: `task: { description, prompt, subagent_type: "explore" }`
- `Goal` — mulai/lajutkan goal. Contoh: `goal: { action: "start", objective: "..." }`
- `Goal_report` — laporkan goal. Contoh: `goal_report: { status: "complete", reason: "..." }`
- `Schedule_wakeup` — jadwalkan pembangunan. Contoh: `schedule_wakeup: { prompt: "...", delay: "5m" }`
- `Cancel_wakeup` — batalkan wakeup. Contoh: `cancel_wakeup: { action: "cancel", id: "..." }`
- `Cron_create` — tugas terjadwal. Contoh: `cron_create: { prompt: "...", delay: "10m" }`
- `Cron_delete` — hapus tugas cron. Contoh: `cron_delete: { id: "..." }`
- `Cron_list` — daftar tugas cron. Contoh: `cron_list: {}`

### Tool Sesi dan Memori

- `Kilo_local_recall` — cari/baca percakapan masa lalu. Contoh: `kilo_local_recall: { mode: "search", query: "..." }`

### Tool Interaksi Pengguna

- `Question` — tanya dengan opsi. Contoh: `question: { questions: [{ question, header, options }] }`
- `Suggest` — sarankan tinjauan kode. Contoh: `suggest: { suggest: "...", actions: [{ label, prompt }] }`
- `Open_plan` — buka rencana. Contoh: `open_plan: { path: "..." }`

### Tool Orkestrasi dan Sistem

- `Skill` — muat skill. Contoh: `skill: { name: "aturan-riverpod" }`
- `Agent_manager` — sesi Agent Manager. Contoh: `agent_manager: { action: "list" }`
- `Agent_manager_models` — cari model. Contoh: `agent_manager_models: { query: "opus" }`
- `Background_process` — proses latar belakang. Contoh: `background_process: { action: "monitor", command: "npm run dev" }`
- `Board_post` — kirim ke papan bersama. Contoh: `board_post: { to: "...", type: "INFO", body: "..." }`
- `Board_read` — baca papan bersama. Contoh: `board_read: { since: "..." }`
- `Chart` — render grafik. Contoh: `chart: { title: "...", spec: "{...}" }`

## Larangan

- DILARANG memakai shell untuk membaca, mencari, atau mendaftar berkas bila tool `Read`, `Grep`, atau `Glob` tersedia.
- DILARANG mengakali `deny` dengan `python3`, `perl`, `sed`, `awk`, alias, `xargs`, atau perintah lain.
- DILARANG menulis instruksi skill/command yang menjadikan shell sebagai jalur utama untuk operasi yang punya padanan tool.
- DILARANG mengulang perintah yang ditolak; beralih ke tool bawaan atau laporkan kepada pengguna.
- DILARANG menganggap `Bash` sebagai pilihan pertama untuk tugas yang bisa diselesaikan tool bawaan.

## Contoh Benar

```
// Mencari berkas Dart
glob: { pattern: "lib/**/*.dart" }

// Membaca sebagian berkas
read: { filePath: "lib/main.dart", offset: 1, limit: 50 }

// Mengganti teks tepat
edit: { filePath: "lib/main.dart", oldString: "foo", newString: "bar" }
```

## Contoh Salah

```
// DILARANG: memakai shell untuk operasi yang punya tool bawaan
bash: { command: "cat lib/main.dart" }   // gunakan Read
bash: { command: "grep -rn foo lib/" }    // gunakan Grep
bash: { command: "find lib -name '*.dart'" } // gunakan Glob
```


===== .agents/skills/penggunaan-tool-question/SKILL.md =====
---
name: penggunaan-tool-question
description: 'Trigger: saat menyusun pertanyaan ke pengguna | Panduan tool question Kilo: header maks 30 karakter, label + description, multiple vs single, default, rekomendasi pertama (Recommended), larangan opsi catch-all, opsi Skip wajib di setiap pertanyaan, kunci i18n. Penggunaan Tool `question` Mengatur cara memanggil tool `question` Kilo agar setiap pertanyaan, permintaan klarifikasi, atau permintaan keputusan ke pengguna konsisten, jelas, dan sesuai kontrak tool. Tool ini wajib dipakai alih-alih menyisipkan pertanyaan sebagai teks biasa. Cakupan yang Di-Cover - Tool: `question` (Kilo built-in) - Parameter: `questions` (array), `question`, `header`, `options`, `label`, `description`, `multiple`, `default` - Parameter i18n opsional: `questionKey`, `headerKey`, `labelKey`, `descriptionKey` - Aturan: `header` maksimal 30 karakter, `label` ringkas 1-5 kata, `description` wajib per opsi, `multiple` vs single-select, opsi rekomendasi "(Recommended)", opsi bebas "Type your own answer" otomatis Aturan 1. Gunakan tool `quest'
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Wed Nov 18 2026 01:23 WIB"
---

# Penggunaan Tool `question`

Mengatur cara memanggil tool `question` Kilo agar setiap pertanyaan, permintaan klarifikasi, atau permintaan keputusan ke pengguna konsisten, jelas, dan sesuai kontrak tool. Tool ini wajib dipakai alih-alih menyisipkan pertanyaan sebagai teks biasa.

## Cakupan yang Di-Cover

- Tool: `question` (Kilo built-in)
- Parameter: `questions` (array), `question`, `header`, `options`, `label`, `description`, `multiple`, `default`
- Parameter i18n opsional: `questionKey`, `headerKey`, `labelKey`, `descriptionKey`
- Aturan: `header` maksimal 30 karakter, `label` ringkas 1-5 kata, `description` wajib per opsi, `multiple` vs single-select, opsi rekomendasi "(Recommended)", opsi bebas "Type your own answer" otomatis

## Aturan

1. Gunakan tool `question` setiap kali perlu bertanya, meminta klarifikasi, atau meminta keputusan/input dari pengguna; jangan menyisipkan pertanyaan sebagai teks biasa.
2. Setiap pertanyaan WAJIB memiliki `header` singkat maksimal 30 karakter yang melabeli pertanyaan.
3. Setiap opsi jawaban WAJIB memiliki `label` ringkas (1-5 kata) dan `description` yang menjelaskan pilihan/konsekuensinya.
4. `question` WAJIB berupa pertanyaan lengkap dan tidak ambigu.
5. Jika `multiple` tidak diset atau bernilai `false`, pertanyaan bersifat single-select (satu jawaban); set `multiple: true` hanya bila pengguna memang boleh memilih lebih dari satu opsi.
6. Bila memberi rekomendasi, letakkan opsi rekomendasi di urutan pertama dan akhiri `label` dengan "(Recommended)".
7. Jangan membuat opsi catch-all (mis. "Other", "Lainnya") karena opsi "Type your own answer" tersedia otomatis. Pengecualian: opsi "Skip" wajib di setiap pertanyaan (lihat Aturan 9).
8. Bila keputusan bergantung pada input pengguna, jangan berikan jawaban/keputusan final sebelum input diterima melalui tool `question`.
9. Setiap pemanggilan tool `question` wajib menyertakan satu opsi "Skip" agar pengguna dapat melewati pertanyaan bila tidak ingin menjawabnya. (Bukan opsi catch-all; dikecualikan dari Aturan 7.)

## Steps

1. Tentukan apakah input pengguna benar-benar diperlukan (bukan dapat diputuskan dari skill/rules/konteks).
2. Susun `header` ≤ 30 karakter dan `question` lengkap.
3. Daftarkan opsi dengan `label` singkat + `description`; taruh opsi rekomendasi di urutan pertama dengan "(Recommended)" bila ada.
4. Tentukan `multiple` (default single-select) dan `default` bila perlu praseleksi.
5. Panggil tool `question` dan tunggu jawaban sebelum melanjutkan.

## Larangan

- DILARANG bertanya lewat teks biasa tanpa tool `question`.
- DILARANG `header` melebihi 30 karakter.
- DILARANG opsi tanpa `description` atau dengan `label` ambigu.
- DILARANG menambahkan opsi catch-all seperti "Other"/"Lainnya".
- DILARANG mengambil keputusan final yang bergantung pada input pengguna tanpa menunggu jawaban tool `question`.

## Contoh Benar

```json
{
  "questions": [
    {
      "header": "Lokasi skill",
      "question": "Di mana skill `penggunaan-tool-question` sebaiknya ditempatkan?",
      "options": [
        {
          "label": "custom (Recommended)",
          "description": "Panduan khusus proyek ini, sesuai konvensi skill kustom."
        },
        {
          "label": "Skip",
          "description": "Lewati pertanyaan ini tanpa memberikan jawaban."
        }
      ],
      "multiple": false,
      "default": "custom (Recommended)"
    }
  ]
}
```

## Contoh Salah

```jsonc
// SALAH: header > 30 karakter
{
  "header": "Pertanyaan tentang lokasi penempatan file skill yang baru dibuat",
  "question": "..."
}
```

```jsonc
// SALAH: opsi tanpa description dan memakai catch-all
{
  "options": [{ "label": "custom" }, { "label": "Lainnya" }]
}
```

```text
// SALAH: bertanya lewat teks biasa tanpa tool question
"Pertanyaannya: skill ini mau ditaruh di mana ya, custom atau bawaan?"
```


===== .agents/skills/pengurutan-paket-pubspec/SKILL.md =====
---
name: pengurutan-paket-pubspec
description: "Trigger: saat menambah atau mengurutkan dependensi pubspec.yaml | Panduan urutan paket pada section `dependencies` dan `dev_dependencies` di `pubspec.yaml`: abjad case-insensitive, entri berbasis SDK (`flutter`, `flutter_test`) tetap di posisi teratas, komentar di atas entri paket dianggap bagian dari entri paket dan ikut berpindah; `dependency_overrides` dan section lain di luar cakupan. Untuk proyek Flutter: urutkan paket, lalu verifikasi `flutter pub get`. Acuan: `pubspec.yaml`, `.agents/skills/non-code/aturan-pembuatan-skill/SKILL.md`. Pengurutan Paket pubspec.yaml Sesuai Abjad Mengatur urutan paket pada section `dependencies` dan `dev_dependencies` di `pubspec.yaml` agar selalu sesuai abjad (case-insensitive), dengan entri berbasis SDK tetap di posisi teratas. Isi skill disusun dari kondisi proyek aktual dan keputusan pengguna (`hasil_diskusi/diskusi_5.md`), bukan dari riwayat commit (tidak ada commit yang berkaitan dengan pengurutan paket `pubspec.yaml`). Cakupan yang Di-Cover - File: `pubspec.yaml` (ro"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Pengurutan Paket pubspec.yaml Sesuai Abjad

Mengatur urutan paket pada section `dependencies` dan `dev_dependencies` di `pubspec.yaml` agar selalu sesuai abjad (case-insensitive), dengan entri berbasis SDK tetap di posisi teratas. Isi skill disusun dari kondisi proyek aktual dan keputusan pengguna (`hasil_diskusi/diskusi_5.md`), bukan dari riwayat commit (tidak ada commit yang berkaitan dengan pengurutan paket `pubspec.yaml`).

## Cakupan yang Di-Cover

- File: `pubspec.yaml` (root proyek Flutter)
- Section yang diatur: `dependencies`, `dev_dependencies`
- Section yang tidak diatur: `dependency_overrides`, `flutter`, `environment`, dan section lain (`name`, `version`, `description`, `publish_to`)
- Entri berbasis SDK: `flutter` (di `dependencies`) dan `flutter_test` (di `dev_dependencies`)
- Kriteria urutan: abjad, case-insensitive (`battery_info_v2` < `flutter_riverpod` < `riverpod_annotation`)

## Aturan

1. Urutkan paket pada `dependencies` dan `dev_dependencies` sesuai abjad nama paket, tidak peka huruf besar/kecil (case-insensitive).
2. Entri berbasis SDK (`flutter` di `dependencies`, `flutter_test` di `dev_dependencies`) tetap ditempatkan di posisi teratas section; paket-paket lain diurutkan abjad di bawahnya.
3. Komentar di atas entri paket dianggap bagian dari entri paket tersebut; komentar-komentar tersebut wajib ikut berpindah bersama paket saat pengurutan dilakukan.
4. Entri lain di dalam section yang bukan dependensi (mis. `sdk: flutter` miliki entri SDK) tetap di bawah kunci paketnya dan tidak diurutkan terpisah.
5. Section selain `dependencies` dan `dev_dependencies` (termasuk `dependency_overrides`) tidak diatur oleh skill ini dan tidak boleh diurutkan berdasarkan aturan ini.
6. Saat menambah paket baru, sisipkan paket tersebut pada posisi abjad yang benar (bukan di akhir section) beserta komentar deskriptifnya bila ada.
7. Saat memperbarui versi paket, jangan mengubah posisi paket; perubahan posisi hanya dilakukan ketika melakukan pengurutan yang disengaja.
8. Setelah mengurutkan, verifikasi `flutter pub get` berhasil dan `dart analyze` (bila relevan) tetap bersih.
9. Jangan mengurutkan entri `dependency_overrides` dengan aturan skill ini; penanganannya (bila dibutuhkan) ditentukan terpisah.
10. Skill ini bersifat portabel lintas-proyek Flutter; gunakan pada `pubspec.yaml` proyek mana pun dengan struktur yang sama.

## Larangan

- DILARANG meletakkan entri non-SDK sebelum entri SDK di dalam section yang sama.
- DILARANG salah menempatkan komentar: komentar deskriptif paket wajib mengikuti paketnya, bukan tertinggal di posisi lama.
- DILARANG memindahkan atau mengurutkan entri `dependency_overrides`, `flutter`, `environment`, atau section lain menggunakan hasil urutan skill ini.
- DILARANG mengurutkan dengan mengabaikan case-insensitivity (mis. menempatkan semua huruf besar sebelum huruf kecil).
- DILARANG mengurutkan berdasarkan versi, tanggal penambahan, atau vendor; urutan murni berdasarkan nama paket secara abjad.
- DILARANG menghapus komentar paket saat mengurutkan; komentar tetap dipertahankan dan ikut berpindah.
- DILARANG memperkenalkan baris kosong ganda atau merusak indentasi `pubspec.yaml` saat menyusun ulang entri.
- DILARANG menganggap pengurutan sebagai izin untuk mengubah versi paket; versi hanya diubah bila memang diminta.

## Contoh Benar

```yaml
dependencies:
  flutter:
    sdk: flutter

  battery_info_v2: ^1.1.5
  cupertino_icons: ^1.0.8
  flutter_riverpod: ^3.5.0
  riverpod_annotation: ^4.0.8
  shared_preferences: ^2.5.3

dev_dependencies:
  flutter_test:
    sdk: flutter

  build_runner: ^2.17.1
  flutter_lints: ^6.0.0
  riverpod_generator: ^4.0.10
```

```yaml
# Komentar ikut berpindah bersama entri paket saat pengurutan
dependencies:
  flutter:
    sdk: flutter

  # Membaca info baterai Android.
  battery_info_v2: ^1.1.5
  # Persistensi pengaturan lokal (mis. mode tema).
  shared_preferences: ^2.5.3
```

## Contoh Salah

```yaml
# Salah: entri non-SDK ditempatkan sebelum entri SDK
dependencies:
  battery_info_v2: ^1.1.5
  flutter:
    sdk: flutter
# DILARANG: entri berbasis SDK wajib di posisi teratas
```

```yaml
# Salah: paket tidak urut abjad
dependencies:
  flutter:
    sdk: flutter

  shared_preferences: ^2.5.3
  battery_info_v2: ^1.1.5
# DILARANG: battery_info_v2 harus berada sebelum shared_preferences (abjad case-insensitive)
```

```yaml
# Salah: komentar tertinggal di posisi lama setelah entri dipindah
dependencies:
  flutter:
    sdk: flutter

  # Persistensi pengaturan lokal (mis. mode tema).  # salah: komentar ini milik shared_preferences
  battery_info_v2: ^1.1.5
  shared_preferences: ^2.5.3
# DILARANG: komentar harus mengikuti entri paketnya saat diurutkan
```

```yaml
# Salah: dependency_overrides ikut diurutkan dengan aturan ini
dependency_overrides:
  zeta: ^1.0.0
  alfa: ^1.0.0
# DILARANG: dependency_overrides di luar cakupan skill ini
```


===== .agents/skills/penjadwalan-frame-dan-pemantauan-performa-flutter/SKILL.md =====
---
name: penjadwalan-frame-dan-pemantauan-performa-flutter
description: "Trigger: saat mengatur siklus frame dan pemantauan performa | Panduan SchedulerBinding, PlatformDispatcher, Timeline, FrameTiming: scheduleFrame, callbacks, addTimingsCallback, onReportTimings, Timeline.timeSync. Penjadwalan Frame dan Pemantauan Performa Flutter Skill ini mengatur cara kerja siklus frame Flutter dari lapisan framework (SchedulerBinding) hingga lapisan engine (PlatformDispatcher dan dart:ui), beserta alat pemantauan performa (Timeline, FrameTiming, dan onReportTimings). Tujuannya adalah agar frame dijadwalkan dengan benar, callback dieksekusi pada fase yang tepat, dan metrik performa terpantau tanpa kebocoran resource. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/scheduler/binding.dart`), `dart:developer` (file `developer/timeline.dart`), `dart:ui` (file `ui/platform_dispatcher.dart`) - Class: `SchedulerBinding`, `PlatformDispatcher`, `Timeline`, `TimelineTask`, `Flow`, `FrameTiming`, `PerformanceModeRequestHandle` - Enum: `SchedulerPhase`, `FramePhase`, `DartPerformanceMo"
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Penjadwalan Frame dan Pemantauan Performa Flutter

Skill ini mengatur cara kerja siklus frame Flutter dari lapisan framework (SchedulerBinding) hingga lapisan engine (PlatformDispatcher dan dart:ui), beserta alat pemantauan performa (Timeline, FrameTiming, dan onReportTimings). Tujuannya adalah agar frame dijadwalkan dengan benar, callback dieksekusi pada fase yang tepat, dan metrik performa terpantau tanpa kebocoran resource.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/scheduler/binding.dart`), `dart:developer` (file `developer/timeline.dart`), `dart:ui` (file `ui/platform_dispatcher.dart`)
- Class: `SchedulerBinding`, `PlatformDispatcher`, `Timeline`, `TimelineTask`, `Flow`, `FrameTiming`, `PerformanceModeRequestHandle`
- Enum: `SchedulerPhase`, `FramePhase`, `DartPerformanceMode`
- Properti: `SchedulerBinding.instance`, `SchedulerBinding.lifecycleState`, `SchedulerBinding.framesEnabled`, `SchedulerBinding.hasScheduledFrame`, `SchedulerBinding.schedulerPhase`, `SchedulerBinding.currentFrameTimeStamp`, `SchedulerBinding.currentSystemFrameTimeStamp`, `SchedulerBinding.timeDilation`, `PlatformDispatcher.instance`, `PlatformDispatcher.onBeginFrame`, `PlatformDispatcher.onDrawFrame`, `PlatformDispatcher.onReportTimings`, `FrameTiming.buildDuration`, `FrameTiming.rasterDuration`, `FrameTiming.vsyncOverhead`, `FrameTiming.totalSpan`
- Method: `SchedulerBinding.scheduleFrame()`, `SchedulerBinding.scheduleForcedFrame()`, `SchedulerBinding.scheduleWarmUpFrame()`, `SchedulerBinding.handleBeginFrame()`, `SchedulerBinding.handleDrawFrame()`, `SchedulerBinding.addTimingsCallback()`, `SchedulerBinding.removeTimingsCallback()`, `SchedulerBinding.scheduleTask()`, `SchedulerBinding.scheduleFrameCallback()`, `SchedulerBinding.cancelFrameCallbackWithId()`, `SchedulerBinding.addPersistentFrameCallback()`, `SchedulerBinding.addPostFrameCallback()`, `SchedulerBinding.resetEpoch()`, `SchedulerBinding.endOfFrame`, `SchedulerBinding.ensureVisualUpdate()`, `SchedulerBinding.ensureFrameCallbacksRegistered()`, `PlatformDispatcher.scheduleFrame()`, `PlatformDispatcher.scheduleWarmUpFrame()`, `Timeline.timeSync()`, `Timeline.startSync()`, `Timeline.finishSync()`, `TimelineTask.start()`, `TimelineTask.finish()`, `Flow.begin()`, `Flow.step()`, `Flow.end()`

## Aturan

1. Wajib menggunakan `SchedulerBinding.instance.scheduleFrame()` untuk meminta frame baru, bukan memanggil `PlatformDispatcher.scheduleFrame()` secara langsung kecuali dalam kasus khusus yang memang memerlukan akses ke platform dispatcher.
2. Gunakan `SchedulerBinding.scheduleWarmUpFrame()` hanya saat aplikasi startup atau setelah hot reload / `allowFirstFrame`; jangan digunakan untuk render frame rutin karena mengunci dispatch event hingga frame selesai.
3. `scheduleForcedFrame()` hanya dipakai jika frame harus dipaksa meskipun frame tidak seharusnya dijadwalkan (layar mati); hindari dalam operasi normal karena berdampak pada penggunaan baterai.
4. Fase frame (`SchedulerPhase`) harus dipahami: `scheduleFrame()` tidak berpengaruh saat fasa `transientCallbacks`, `midFrameMicrotasks`, atau `persistentCallbacks`; hanya berfungsi pada `idle` dan `postFrameCallbacks`.
5. Transient frame callback (`scheduleFrameCallback`) dieksekusi pada fase `transientCallbacks` (awal frame); persistent callback (`addPersistentFrameCallback`) dieksekusi pada fase `persistentCallbacks`; post-frame callback (`addPostFrameCallback`) dieksekusi setelah rendering selesai.
6. Persistent dan post-frame callback tidak dapat dibatalkan setelah terdaftar; pastikan pendaftaran hanya dilakukan sekali untuk menghindari duplikasi eksekusi per frame.
   6a. `WidgetsBinding.instance.addPostFrameCallback(...)` yang didaftarkan di dalam `build()` wajib dideduplicasi dengan flag instance (mis. `bool _simpanTerjadwal = false;`): hitung dulu selisih/kondisi yang memicu, set flag `true` sebelum mendaftarkan callback, dan reset flag menjadi `false` di awal callback. Jangan mendaftarkan callback baru pada setiap rebuild; pendaftaran tanpa flag menyebabkan callback terdaftar berkali-kali selama fase awal (mis. saat data async baru selesai dimuat) dan operasi di dalamnya (mis. `SharedPreferences.setStringList`) tereksekusi berulang.
7. Wajib memanggil `SchedulerBinding.addTimingsCallback()` (lebih disarankan) daripada `PlatformDispatcher.onReportTimings` secara langsung karena mendukung banyak callback secara independen.
8. Setiap `Timeline.startSync()` harus selalu diiringi `Timeline.finishSync()` dalam blok `finally` untuk mencegah uneven calls; gunakan `Timeline.timeSync()` untuk pemanggilan sinkron sederhana.
9. Objek `Flow` digunakan untuk menggambarkan alur antar Timeline slice dengan `id` yang sama; gunakan `Flow.begin()`, `Flow.step(id)`, dan `Flow.end(id)` berpasangan.
10. `resetEpoch()` dipanggil otomatis saat mengubah `timeDilation`; jangan dipanggil secara manual kecuali ada perubahan non-monotonik pada stempel waktu yang memerlukan penyesuaian basis epoch.
11. `PerformanceModeRequestHandle` harus dipanggil `.dispose()` saat tidak lagi diperlukan; semua request yang terdaftar harus dibuang untuk menghindari kebocoran performance mode.

## Larangan

- DILARANG memanggil `PlatformDispatcher.scheduleFrame()` langsung di luar kasus khusus; gunakan `SchedulerBinding.instance.scheduleFrame()`.
- DILARANG menggunakan `scheduleWarmUpFrame()` untuk render frame rutin (hanya startup / hot reload / allowFirstFrame).
- DILARANG menjalankan tugas berat (lebih dari ~1 ms) di dalam transient callback karena akan menunda frame reguler.
- DILARANG membatalkan persistent atau post-frame callback setelah terdaftar (tidak ada API unregister).
- DILARANG mendaftarkan `addPostFrameCallback` di `build()` tanpa flag dedup; pendaftaran berulang per rebuild dilarang meskipun callback "aman" dijalankan berkali-kali.
- DILARANG meninggalkan `Timeline.startSync()` tanpa pasangan `finishSync()`.
- DILARANG menggunakan `Flow` dengan `id` yang tidak terkoordinasi antar slice yang ingin dihubungkan.
- DILARANG meminta `DartPerformanceMode` tanpa membuang `PerformanceModeRequestHandle` saat selesai.
- DILARANG mengabaikan error pada `Future` yang dilepas (`unawaited`) dari navigasi atau operasi async terkait frame; wajib `.catchError()` dengan `L.e`.

## Contoh Benar

```dart
import 'package:flutter/scheduler.dart';
import 'dart:developer' show Timeline, Flow;
import 'package:flutter/foundation.dart' show kReleaseMode;

class FrameCoordinator {
  /// Meminta frame visual pada saat yang tepat sesuai fase scheduler.
  void ensureVisualUpdate() {
    SchedulerBinding.instance.ensureVisualUpdate();
  }

  /// Meminta frame baru secara aman.
  void scheduleFrame() {
    SchedulerBinding.instance.scheduleFrame();
  }

  /// Mendaftarkan callback untuk pengukuran performa frame.
  void registrasiTimings() {
    SchedulerBinding.instance.addTimingsCallback((List<FrameTiming> timings) {
      for (final t in timings) {
        if (!kReleaseMode) {
          // Terpantau hanya di debug/profile
        }
      }
    });
  }

  /// Menghentikan pemantauan performa.
  void batalkanTimings(void callback(List<FrameTiming>)) {
    SchedulerBinding.instance.removeTimingsCallback(callback);
  }

  /// Menjalankan tugas lintas-frame dengan pencatatan timeline dan flow.
  Future<void> jalankanTugasPrioritasTinggi(Future<void> Function() task) async {
    final flow = Flow.begin();
    await SchedulerBinding.instance.scheduleTask(
      () {
        return Timeline.timeSync('TugasPrioritas', () async {
          await task();
        }, flow: Flow.step(flow.id));
      },
      Priority.animation,
      debugLabel: 'TugasPrioritas',
      flow: flow,
    );
    // flow.id digunakan untuk sinkronisasi flow dengan Timeline berikutnya
  }

  /// Menjeda eksekusi hingga akhir frame saat ini.
  Future<void> tungguAkhirFrame() async {
    await SchedulerBinding.instance.endOfFrame;
  }

  /// Meminta frame paksa saat layar akan kembali menyala (rotasi).
  void paksaFrameSaidara() {
    SchedulerBinding.instance.scheduleForcedFrame();
  }
}
```

## Contoh Salah

```dart
// DILARANG: memanggil platform dispatcher langsung
PlatformDispatcher.instance.scheduleFrame();

// BENAR:
SchedulerBinding.instance.scheduleFrame();

// DILARANG: warm-up frame untuk render rutin
SchedulerBinding.instance.scheduleWarmUpFrame();

// BENAR: hanya startup / hot reload / allowFirstFrame

// DILARANG: tugas berat di transient callback
SchedulerBinding.instance.scheduleFrameCallback((_) {
  hitungPerhitunganBerat(); // menunda frame
});

// BENAR: pindahkan tugas berat ke scheduleTask dengan prioritas rendah

// DILARANG: addPostFrameCallback di build() tanpa dedup (terdaftar per rebuild)
WidgetsBinding.instance.addPostFrameCallback((_) { simpan(); });

// BENAR: dedup dengan flag instance
final kurang = tercapaiSekarang.difference(_tersimpan);
if (kurang.isNotEmpty && !_simpanTerjadwal) {
  _simpanTerjadwal = true;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _simpanTerjadwal = false; // reset lebih dulu agar perubahan berikutnya bisa dijadwalkan
    if (!mounted) return;
    unawaited(simpan(kurang).catchError((e, s) => L.e('Gagal: $e $s')));
  });
}

// DILARANG: Timeline tanpa finishSync
Timeline.startSync('Nama');
doSomething();
// lupa finishSync

// BENAR:
Timeline.startSync('Nama');
try {
  doSomething();
} finally {
  Timeline.finishSync();
}

// DILARANG: performance mode request tidak dibuang
final handle = SchedulerBinding.instance.requestPerformanceMode(DartPerformanceMode.latency);
// lupa handle.dispose()

// BENAR:
final handle = SchedulerBinding.instance.requestPerformanceMode(DartPerformanceMode.latency);
// ...
handle.dispose();
```


===== .agents/skills/perbaikan-test-notifikasi/SKILL.md =====
---
name: perbaikan-test-notifikasi
description: "Trigger: saat memperbaiki test notifikasi yang gagal karena mismatch jumlah call mock atau mock tidak diisolasi | Panduan prosedur: baca log aktual jumlah jadwal notifikasi, cocokkan dengan kontrak domain, reset mock setelah setup, verifikasi ID/hash notifikasi spesifik, jalankan test terkait lalu semua test."
---

# Perbaikan Test Notifikasi

## Tujuan

Mencegah pola error berulang pada test notifikasi: mismatch jumlah call mock dan mock yang tidak diisolasi dari setup.

## Langkah

1. Baca log aktual jumlah jadwal notifikasi dari kode produksi.
2. Cocokkan dengan kontrak domain (mis. `notifikasiPelangganAktif`).
3. Setelah setup membuat data, panggil `clearInteractions(mockNotifikasiServis)`.
4. Verifikasi perilaku hanya pada tahap yang diuji.
5. Verifikasi ID/hash notifikasi spesifik, bukan total call global.
6. Jalankan hanya test terkait terlebih dahulu.
7. Baru jalankan seluruh test.

## Contoh Benar

```dart
final modelDibuat = await operasi.createPelangganAktif(buatModel());
clearInteractions(mockNotifikasiServis);
await operasi.arsipkanPelangganAktif(modelDibuat.id);

verify(() => mock.batalNotifikasi(modelDibuat.id.hashCode)).called(1);
verify(() => mock.batalNotifikasi(modelDibuat.id.hashCode + 1)).called(1);
verify(() => mock.batalNotifikasi(modelDibuat.id.hashCode + 2)).called(1);
```

## Contoh Salah

```dart
// Salah: menghitung call dari setup + aksi yang diuji
verify(() => mock.batalNotifikasi(any())).called(3);
```


===== .agents/skills/performa-aplikasi/SKILL.md =====
---
name: performa-aplikasi
description: "Trigger: saat mengoptimasi performa aplikasi | Aturan performa Flutter: rebuild minimal, const constructor, builder list (lazy), lazy IndexedStack tab BottomNavigationBar (termasuk AutomaticKeepAliveClientMixin di IndexedStack), image caching, async gap yielding, memory leak, query DB optimization, profiling. Aturan Performa Aplikasi Skill ini mendokumentasikan aturan performa yang wajib diterapkan di proyek ini. Cakupan yang Di-Cover - Package: `package:flutter` (class `ListView`, `GridView`, `Image`, `CachedNetworkImage`, `Opacity`, `ClipRect`, `ClipRRect`, `Stack`, `Positioned`, `Timer`, `StreamSubscription`, `AnimationController`, `TextEditingController`, `ScrollController`), `package:flutter_riverpod` (class `ref`, `AsyncValue`, `select`), `package:compute` (fungsi `compute`) - Class: `ListView`, `GridView`, `Image`, `CachedNetworkImage`, `Timer`, `StreamSubscription`, `AnimationController`, `TextEditingController`, `ScrollController`, `AsyncValue` - Method: `ref.watch(provider.select(...))`, `compute()`"
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Wed Nov 18 2026 21:43 WIB"
---

# Aturan Performa Aplikasi

Skill ini mendokumentasikan aturan performa yang wajib diterapkan di proyek ini.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `ListView`, `GridView`, `Image`, `CachedNetworkImage`, `Opacity`, `ClipRect`, `ClipRRect`, `Stack`, `Positioned`, `Timer`, `StreamSubscription`, `AnimationController`, `TextEditingController`, `ScrollController`), `package:flutter_riverpod` (class `ref`, `AsyncValue`, `select`), `package:compute` (fungsi `compute`)
- Class: `ListView`, `GridView`, `Image`, `CachedNetworkImage`, `Timer`, `StreamSubscription`, `AnimationController`, `TextEditingController`, `ScrollController`, `AsyncValue`
- Method: `ref.watch(provider.select(...))`, `compute()`, `Future.microtask()`, `SchedulerBinding.instance.scheduleTask()`, `timer.cancel()`, `subscription.cancel()`, `controller.dispose()`
- Properti: `mounted`, `itemExtent`, `prototypeItem`, `cacheWidth`, `cacheHeight`, `memCacheWidth`, `memCacheHeight`

## Aturan

1. Wajib gunakan `const` constructor dimana mungkin (widget stateless, immutable data).
2. Wajib isolasi widget yang rebuild sering (Timer, Animation) ke widget terpisah (lihat `isolasi-widget-timer`).
3. Wajib gunakan `ref.watch(provider.select(...))` untuk hanya rebuild saat field tertentu berubah (lihat `aturan-riverpod`).
4. DILARANG `setState` di widget parent besar untuk update kecil → extract ke child widget.
5. Wajib gunakan `ListView.builder` / `GridView.builder` untuk daftar panjang/dinamis.
6. DILARANG `ListView(children: [...])` dengan list sudah di-materialize semua.
7. Gunakan `itemExtent` / `prototypeItem` untuk performa scroll lebih baik.
8. Wajib gunakan `Image.asset` / `Image.network` dengan `cacheWidth`/`cacheHeight` untuk downsample.
9. DILARANG load image resolusi besar ke widget kecil tanpa downsample.
10. Network image: pakai `cached_network_image` package untuk disk cache.
11. Operasi berat (parse JSON besar, hitung statistik, query DB kompleks) wajib offload ke `compute()` / `Isolate` atau gunakan `Future.microtask` / `SchedulerBinding.instance.scheduleTask` untuk yield ke event loop.
12. DILARANG blocking computation di main thread > 16ms (frame drop).
13. Wajib `cancel()` Timer/StreamSubscription di `dispose()` (lihat `isolasi-widget-timer`).
14. Wajib `dispose()` `AnimationController`, `TextEditingController`, `ScrollController`.
15. Wajib cek `mounted` sebelum `setState` di async callback (lihat `isolasi-widget-timer`).
16. Wajib `ref.listen` / `ref.listenManual` cleanup di `dispose` kalau pakai manual listen.
17. DILARANG closure capture `BuildContext` di async gap lama.
18. Wajib `const` untuk widget, list, map, object yang immutable.
19. Wajib `final` untuk variable yang tidak di-reassign.
20. Wajib `const` di `switch` expression / pattern matching case.
21. Wajib `where` + `whereArgs` (parameterized query) - bukan string interpolation.
22. Wajib index di kolom yang sering di-query (WHERE, JOIN, ORDER BY).
23. Wajib `LIMIT` untuk query yang tidak butuh semua row.
24. Gunakan `queryCursor` / `queryIterate` untuk result set besar (streaming).
25. Wajib `--split-debug-info` / `--obfuscate` di release build (CI handle).
26. DILARANG dependency tidak dipakai (cek `dart pub deps --style=compact`).
27. DILARANG asset image tidak dipakai di `pubspec.yaml`.
28. Gunakan `flutter build apk --analyze-size` untuk audit ukuran.
29. Wajib test performa di device fisik (low-end) bukan hanya emulator.
30. Gunakan `flutter run --profile` + DevTools (Performance, Memory, CPU tabs).
31. Target: 60fps (16ms/frame), no jank > 50ms, memory stabil tidak naik terus.
32. Wajib lazy loading untuk tab BottomNavigationBar yang berat: simpan penanda tab yang sudah pernah dibuka (mis. `Set<int>`, default tab pertama), bangun tab hanya saat pertama kali dibuka, dan render dengan `IndexedStack` + placeholder `SizedBox.shrink()` untuk tab yang belum pernah dibuka.
33. Anak IndexedStack yang sudah dibangun wajib `SizedBox.expand` (Stack memberi loose constraints ke anak); placeholder `SizedBox.shrink()` membuat tab yang belum dibuka nol biaya layout.
34. Anak `IndexedStack`/tab yang state-nya ingin dipertahankan saat tab disembunyikan wajib memakai `AutomaticKeepAliveClientMixin` dengan getter `wantKeepAlive => true`, dan `build()` wajib memanggil `super.build(context)` — tanpa pemanggilan itu, keep-alive tidak terdaftar dan analyzer menandai `must_call_super`. Jika keep-alive tidak diperlukan, mixin wajib dihapus sepenuhnya (bukan dibiarkan tanpa `super.build(context)`); tab yang selalu dibangun di `IndexedStack` (subtree tidak di-unmount) tidak wajib mixin.

## Larangan

- DILARANG `setState` di widget parent besar untuk update kecil.
- DILARANG `ListView(children: [...])` dengan list sudah di-materialize semua.
- DILARANG load image resolusi besar ke widget kecil tanpa downsample.
- DILARANG blocking computation di main thread > 16ms.
- DILARANG closure capture `BuildContext` di async gap lama.
- DILARANG `Opacity` widget wrapping subtree besar (gunakan `color.withValues(alpha:)` di child).
- DILARANG `ClipRect` / `ClipRRect` tanpa butuh (costly).
- DILARANG `Stack` dengan banyak `Positioned` overlapping kompleks (pertimbangkan `CustomPainter`).
- DILARANG `ListView` nested tanpa `shrinkWrap: true` + `physics: NeverScrollableScrollPhysics()`.
- DILARANG `setState` di loop / callback cepat tanpa debounce.
- DILARANG dependency tidak dipakai.
- DILARANG asset image tidak dipakai di `pubspec.yaml`.

## Contoh Benar

```dart
// BENAR: const widget stateless
const _EmptyDiaryCraving();

// BENAR: select hanya field yang butuh
final nama = ref.watch(biodataProvider.select((v) => v.valueOrNull?.nama));

// BENAR: ListView.builder lazy
ListView.builder(
  itemCount: list.length,
  itemBuilder: (context, index) => ItemWidget(item: list[index]),
)

// BENAR: itemExtent untuk fixed height
ListView.builder(
  itemCount: list.length,
  itemExtent: 80,
  itemBuilder: (context, index) => ItemWidget(item: list[index]),
)

// BENAR: Downsample asset image
Image.asset(
  'assets/large_image.png',
  cacheWidth: 200,
  cacheHeight: 200,
)

// BENAR: Network dengan cache
CachedNetworkImage(
  imageUrl: url,
  memCacheWidth: 200,
  memCacheHeight: 200,
  placeholder: (_, _) => const CircularProgressIndicator(),
)

// BENAR: Offload ke isolate
final data = await compute(parseJsonBesar, jsonString);

// BENAR: Cleanup di dispose
@override
void dispose() {
  _timer?.cancel();
  _controller.dispose();
  _subscription.cancel();
  super.dispose();
}

// BENAR: Mounted check
_timer = Timer.periodic(Duration(seconds: 1), (_) {
  if (mounted) setState(() {});
});

// BENAR: Parameterized query + index + limit
final rows = await db.query(
  NamaTabel.craving,
  where: '${NamaKolom.tanggal} >= ? AND ${NamaKolom.tanggal} <= ?',
  whereArgs: [start.toIso8601String(), end.toIso8601String()],
  orderBy: '${NamaKolom.tanggal} DESC',
  limit: 50,
)

// BENAR: Lazy + keep-alive IndexedStack (bottom navigation)
int _selectedIndex = 0;
final Set<int> _tabDibangun = <int>{0};

void _onItemTapped(int index) {
  setState(() {
    _tabDibangun.add(index);
    _selectedIndex = index;
  });
}

// body:
IndexedStack(
  index: _selectedIndex,
  children: <Widget>[
    for (var i = 0; i < _widgetOptions.length; i++)
      _tabDibangun.contains(i)
          ? SizedBox.expand(child: _widgetOptions[i])
          : const SizedBox.shrink(),
  ],
)

// BENAR: anak IndexedStack yang keep-alive
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin<MyTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // wajib: mendaftarkan keep-alive
    return const Placeholder();
  }
}
```

## Contoh Salah

```dart
// DILARANG: Watch full provider cuma butuh nama
final biodata = ref.watch(biodataProvider); // Rebuild saat field lain berubah

// DILARANG: ListView children materialized semua
ListView(children: list.map((e) => ItemWidget(item: e)).toList())

// DILARANG: Blocking computation di main thread
final data = parseJsonBesar(jsonString); // Bisa frame drop

// DILARANG: Opacity wrapping subtree besar
Opacity(
  opacity: 0.5,
  child: LargeWidgetTree(), // DILARANG
)

// DILARANG: SetState di loop
for (final item in items) {
  setState(() {}); // DILARANG tanpa debounce
}

// DILARANG: semua tab dibangun eager padahal tab berat
body: IndexedStack(index: _selectedIndex, children: _widgetOptions),

// DILARANG: elementAt jika state tab wajib terjaga
// (state tab hilang setiap pindah tab)
body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

// DILARANG: mixin tanpa super.build(context)
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin<MyTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) => const Placeholder();
}
// analyzer: 'must_call_super'; keep-alive tidak pernah terdaftar
```


===== .agents/skills/platform-dispatcher-locale/SKILL.md =====
---
name: platform-dispatcher-locale
description: "Trigger: saat membaca pengaturan sistem dari engine | Panduan PlatformDispatcher, Locale, ViewPadding, platformBrightness, textScaleFactor, locale resolution (dart:ui). PlatformDispatcher, Locale, dan Pengaturan Sistem Akses konfigurasi platform (locale, brightness, text scale, view padding) melalui `PlatformDispatcher.instance` dari `dart:ui`. Cakupan yang Di-Cover - Package: `dart:ui` (file `lib/ui/platform_dispatcher.dart`) - Class: `PlatformDispatcher`, `Locale`, `ViewPadding`, `ViewConstraints`, `Display`, `FlutterView`, `FrameTiming`, `AccessibilityFeatures`, `SystemColor`, `SystemColorPalette` - Properti: `PlatformDispatcher.instance`, `locale`, `locales`, `platformBrightness`, `textScaleFactor`, `alwaysUse24HourFormat`, `systemFontFamily`, `views`, `implicitView`, `accessibilityFeatures`, `semanticsEnabled` - Method: `computePlatformResolvedLocale`, `scaleFontSize`, `scheduleFrame`, `scheduleWarmUpFrame`, `setApplicationLocale`, `sendPlatformMessage` - Callback: `onLocaleChanged`, `onPlatformBrightnes"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# PlatformDispatcher, Locale, dan Pengaturan Sistem

Akses konfigurasi platform (locale, brightness, text scale, view padding) melalui `PlatformDispatcher.instance` dari `dart:ui`.

## Cakupan yang Di-Cover

- Package: `dart:ui` (file `lib/ui/platform_dispatcher.dart`)
- Class: `PlatformDispatcher`, `Locale`, `ViewPadding`, `ViewConstraints`, `Display`, `FlutterView`, `FrameTiming`, `AccessibilityFeatures`, `SystemColor`, `SystemColorPalette`
- Properti: `PlatformDispatcher.instance`, `locale`, `locales`, `platformBrightness`, `textScaleFactor`, `alwaysUse24HourFormat`, `systemFontFamily`, `views`, `implicitView`, `accessibilityFeatures`, `semanticsEnabled`
- Method: `computePlatformResolvedLocale`, `scaleFontSize`, `scheduleFrame`, `scheduleWarmUpFrame`, `setApplicationLocale`, `sendPlatformMessage`
- Callback: `onLocaleChanged`, `onPlatformBrightnessChanged`, `onTextScaleFactorChanged`, `onMetricsChanged`, `onSemanticsEnabledChanged`

## Aturan

1. `PlatformDispatcher.instance` adalah singleton akses ke engine host. Gunakan `WidgetsBinding.instance.platformDispatcher` jika binding sudah diinisialisasi.
2. `locale` mengembalikan locale sistem utama (first locale). Jika `locales` kosong, mengembalikan `Locale.fromSubtags()` (`und`).
3. `locales` adalah daftar locale sistem berurutan menurut prioritas.
4. `platformBrightness` adalah `Brightness.light` atau `Brightness.dark` dari sistem.
5. `textScaleFactor` adalah skala teks sistem. Gunakan `MediaQuery.textScalerOf` di widget tree daripada memanggil langsung untuk reaktifitas.
6. `scaleFontSize(unscaledFontSize)` mengonversi ukuran font sesuai preferensi sistem.
7. `computePlatformResolvedLocale(supportedLocales)` melakukan resolusi locale platform-native secara sinkron.
8. `setApplicationLocale(Locale)` mengatur locale yang digunakan aplikasi di sisi engine.
9. `ViewPadding` menyediakan padding sistem (status bar, navigation bar, keyboard, inset) dalam physical pixels.
10. `views` berisi daftar `FlutterView` yang tersedia. `implicitView` adalah view default untuk platform single-view (mobile).
11. `scheduleFrame()` meminta engine untuk memulai frame baru (onBeginFrame + onDrawFrame).

## Larangan

- Mengakses `PlatformDispatcher.instance` sebelum `runApp()` jika binding belum siap (kecuali kebutuhan startup awal).
- Mengabaikan hasil null dari `locale` atau `platformBrightness` tanpa fallback.
- Memanggil `scaleFontSize` dengan nilai negatif atau non-finite.
- Mengasumsikan `implicitView` tidak null di semua platform (bisa null).

## Contoh Benar

```dart
final dispatcher = PlatformDispatcher.instance;
final locale = dispatcher.locale;
final brightness = dispatcher.platformBrightness;
final textScale = dispatcher.textScaleFactor;

// resolusi locale terhadap daftar yang didukung
final resolved = dispatcher.computePlatformResolvedLocale([
  const Locale('en', 'US'),
  const Locale('id', 'ID'),
]);
```

## Contoh Salah

```dart
// mengakses locale tanpa cek null/empty
final locale = PlatformDispatcher.instance.locale; // bisa Locale('und') jika kosong
```

```dart
// scaleFontSize dengan nilai invalid
dispatcher.scaleFontSize(-1.0); // assert error
```


===== .agents/skills/pola-ui/SKILL.md =====
---
name: pola-ui
description: "Trigger: saat menerapkan pola UI Flutter | Indeks: visualisasi-progres-impian, isolasi-widget-timer, gaya, widget-custom. Prinsip single responsibility dan textTheme + copyWith. Indeks Pola UI Standar Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap pola UI. Jangan menduplikasi isi skill spesifik di sini. Semua pola UI yang tercantum di bawah ini sudah terimplementasi di proyek Flutter dan dapat digunakan sebagai referensi untuk pola serupa di proyek lain. Cakupan yang Di-Cover - Package: `package:flutter` (class `StatelessWidget`, `StatefulWidget`, `Timer`, `Column`, `Row`, `Card`, `LinearProgressIndicator`, `Stack`, `Icon`, `Text`, `Chip`, `ColorScheme`, `ThemeData`) - Class: `ImpianProgresHelper`, `VisualTabunganImpian`, `_TimerCravingView`, `_HeaderPemulihan`, `DateTime`, `FormatUang` - Properti: `spacing`, `padding`, `rasio`, `saldo`, `target`, `mounted` - Method: `ImpianProgresHelper.rasio()`, `ImpianProgresHelper.tercapai("
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Indeks Pola UI Standar

Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap pola UI. Jangan menduplikasi isi skill spesifik di sini. Semua pola UI yang tercantum di bawah ini sudah terimplementasi di proyek Flutter dan dapat digunakan sebagai referensi untuk pola serupa di proyek lain.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `StatelessWidget`, `StatefulWidget`, `Timer`, `Column`, `Row`, `Card`, `LinearProgressIndicator`, `Stack`, `Icon`, `Text`, `Chip`, `ColorScheme`, `ThemeData`)
- Class: `ImpianProgresHelper`, `VisualTabunganImpian`, `_TimerCravingView`, `_HeaderPemulihan`, `DateTime`, `FormatUang`
- Properti: `spacing`, `padding`, `rasio`, `saldo`, `target`, `mounted`
- Method: `ImpianProgresHelper.rasio()`, `ImpianProgresHelper.tercapai()`, `ImpianProgresHelper.sisa()`, `Timer.periodic()`, `Timer.cancel()`, `DateTime.normalize()`

## Aturan

1. Setiap widget UI handle 1 hal saja (single responsibility: timer, progres, empty, error, atau loading).
2. Timer wajib diisolasi ke widget kecil sendiri, bukan di widget halaman penuh.
3. Logika bisnis (hitung rasio, cek tercapai, normalisasi tanggal) wajib di helper/provider, widget hanya render.
4. Wajib menggunakan `textTheme + copyWith` untuk styling konsisten melalui tema.
5. Wajib menggunakan `Column.spacing` untuk jarak konsisten tanpa `SizedBox` berulang.
6. Empty/Error/Loading state wajib dibungkus `SafeArea` + padding tepi layar.
7. Navigasi non-blocking wajib menggunakan `unawaited()` dengan `.catchError()`.
8. Wajib cek `mounted` di callback timer sebelum update state.
9. Wajib panggil `timer.cancel()` di `dispose()` untuk mencegah memory leak.
10. Rasio progres wajib di-clamp ke 0.0–1.0 sebelum dipakai di `LinearProgressIndicator`.

## Larangan

- DILARANG `withOpacity()` → gunakan `withValues(alpha:)` (lihat `gaya` / `gaya`).
- DILARANG timer di widget halaman penuh → isolasi ke widget kecil (lihat `isolasi-widget-timer`).
- DILARANG lupa `cancel()` di `dispose()` untuk timer (lihat `isolasi-widget-timer`).
- DILARANG lupa cek `mounted` di callback timer (lihat `isolasi-widget-timer`).
- DILARANG aset gambar/Lottie untuk visual progres → gunakan `Stack` + `LinearProgressIndicator` + `Icon` (lihat `visualisasi-progres-impian` / `widget-custom`).
- DILARANG rasio progres tanpa clamp → `LinearProgressIndicator` error jika > 1.0 (lihat `visualisasi-progres-impian`).
- DILARANG perbandingan tanggal tanpa normalisasi → hasil bisa salah 1 hari.

## Contoh Benar

```dart
// Timer terisolasi di widget kecil (StatefulWidget terpisah)
class _TimerCravingView extends StatefulWidget {
  const _TimerCravingView({super.key});

  @override
  State<_TimerCravingView> createState() => _TimerCravingViewState();
}

class _TimerCravingViewState extends State<_TimerCravingView> {
  Timer? _timer;
  int _detik = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _detik++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Wajib cancel di dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${_detik ~/ 60}:${_detik % 60}');
  }
}
```

## Contoh Salah

```dart
// DILARANG: Timer di widget halaman penuh (harus diisolasi)
class HalamanPenuh extends StatefulWidget {
  @override
  State<HalamanPenuh> createState() => _HalamanPenuhState();
}

class _HalamanPenuhState extends State<HalamanPenuh> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {}); // Timer di halaman penuh - SALAH!
    });
  }

  @override
  void dispose() {
    // Lupa cancel() - SALAH!
    super.dispose();
  }
}

// DILARANG: Lupa cek mounted di callback timer
Timer.periodic(const Duration(seconds: 1), (_) {
  setState(() {}); // SALAH! Tidak ada cek mounted
});

// DILARANG: withOpacity deprecated
warna.withOpacity(0.2) // SALAH! Gunakan withValues(alpha:)
```


===== .agents/skills/pola-ux/SKILL.md =====
---
name: pola-ux
description: "Trigger: saat menerapkan pola UX Flutter (termasuk dialog konfirmasi ya/tidak dengan showOkCancelAlertDialog) | Indeks: empty-state-daftar, validasi-form-sebelum-penyimpanan, penanganan-async. Indeks Pola UX Standar Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap pola UX, termasuk dialog konfirmasi ya/tidak yang wajib memakai showOkCancelAlertDialog dari adaptive_dialog (OkCancelResult), bukan showDialog + AlertDialog manual. Jangan menduplikasi isi skill spesifik di sini. Semua pola UX yang tercantum di bawah ini sudah terimplementasi di proyek Flutter dan dapat digunakan sebagai referensi untuk pola serupa di proyek lain. Cakupan yang Di-Cover - Package: `package:flutter` (class `Form`, `GlobalKey`, `SafeArea`, `Padding`, `FAB`, `Icon`, `Text`, `FilledButton`, `Scaffold`, `ShowDialog`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`, `ConsumerState`), `package:shared_preferences` (class `SharedPreferences`), `package:adaptive_dialog` (class `showOkCancelAlertDialog`, `OkCancelResult`) - Class: `Form`, `GlobalKey<FormState>`, `AsyncValue`, `SharedPreferences`, `AppToast`, `L` (logging), `Nav` (navigasi) - Properti: `isLoading`, `hasError`,"
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 22 2026 12:25 WIB"
---

# Indeks Pola UX Standar

Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap pola UX. Jangan menduplikasi isi skill spesifik di sini. Semua pola UX yang tercantum di bawah ini sudah terimplementasi di proyek Flutter dan dapat digunakan sebagai referensi untuk pola serupa di proyek lain.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `Form`, `GlobalKey`, `SafeArea`, `Padding`, `FAB`, `Icon`, `Text`, `FilledButton`, `Scaffold`, `ShowDialog`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`, `ConsumerState`), `package:shared_preferences` (class `SharedPreferences`), `package:adaptive_dialog` (class `showOkCancelAlertDialog`, `OkCancelResult`)
- Class: `Form`, `GlobalKey<FormState>`, `AsyncValue`, `SharedPreferences`, `AppToast`, `L` (logging), `Nav` (navigasi)
- Properti: `isLoading`, `hasError`, `requireValue`, `asData?.value`, `isDestructiveAction`, `onRetry`
- Method: `Form.of()`, `GlobalKey.currentState?.validate()`, `ref.watch()`, `ref.refresh()`, `AsyncValue.requireValue()`, `SharedPreferences.setBool()`, `AppToast.sukses()`, `unawaited()`

## Aturan

1. Selalu minta konfirmasi dengan penjelasan konsekuensi sebelum aksi destruktif (hapus, export, reset).
2. Empty state wajib informatif dan memakai komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`): ikon + judul + deskripsi + CTA opsional (`OutlinedButton`, bukan FAB wajib), sudah dibungkus `SafeArea` + padding — lihat `empty-state-daftar`.
3. Navigasi non-blocking wajib menggunakan `unawaited(Nav.to(...).catchError(...))`.
4. Akses data async opsional wajib menggunakan `asData?.value ?? fallback`, bukan `requireValue`.
5. Logging konsisten: log variabel UI dengan `L.i`/`L.w` per aturan logging.
6. Toast perayaan hanya sekali: `AppToast.sukses` + `SharedPreferences` penandaan + `unawaited()`.
7. Validasi form wajib menggunakan `Form` + `GlobalKey<FormState>` + `validate()` dengan validator aturan bisnis, bukan `?? 0` masking.
8. Multiple provider: loading gabungan, error terpisah per provider, `requireValue` terakhir setelah aman.
9. Early return pattern: setiap kondisi (loading, error, empty, incomplete) → early return.
10. Data tidak lengkap → tampilan terpisah + CTA, bukan menampilkan data parsial.
11. Notifikasi sementara (sukses/gagal/peringatan/info) WAJIB memakai `AppToast.sukses/gagal/warning/info` dari `share_global_saya` (import via `core_shared.dart`); DILARANG `ScaffoldMessenger.of(context).showSnackBar` manual.
12. Impor utilitas shared lintas fitur WAJIB memakai barrel `core_shared.dart` (`package:share_global_saya/core_shared.dart`) yang mengekspor `L`, `Nav`, `AppToast`, `ParserUtil`, `FormatTanggal` (dihide bila tidak dipakai), `SharedPrefService`; DILARANG impor individu (`l.dart`, `navigator_helper.dart`, `toast_widget.dart`, `parser_util.dart`, `shared_pref_service.dart`).
13. Loading operasi simpan/hapus WAJIB memakai `EasyLoading.show`/`EasyLoading.dismiss` dari `flutter_easyloading` dengan `maskType: EasyLoadingMaskType.black` agar kunci seluruh input; DILARANG `CircularProgressIndicator` manual di dalam tombol atau `showDialog`; `unawaited(EasyLoading.show(...).catchError(...))` di awal, `unawaited(EasyLoading.dismiss().catchError(...))` di `finally`; tombol simpan tidak perlu state `_isLoading`/`_isSaving` — button label statis.

## Larangan

- DILARANG menyimpan data tanpa validasi form (lihat `validasi-form-sebelum-penyimpanan`).
- DILARANG `requireValue` pada data opsional/async tanpa cek loading/error (lihat `penanganan-async`, `penanganan-error-unawaited`).
- DILARANG toast perayaan tanpa penandaan `SharedPreferences` (lihat `visualisasi-progres-impian`).
- DILARANG empty state tanpa ikon, judul, deskripsi, CTA (lihat `empty-state-daftar`).
- DILARANG konfirmasi destruktif tanpa `isDestructiveAction: true` dan penjelasan konsekuensi (lihat `ekspor-pemulihan-cadangan`).
- DILARANG dialog konfirmasi ya/tidak memakai `showDialog` + `AlertDialog` manual; wajib `showOkCancelAlertDialog` dari `adaptive_dialog` dengan hasil `OkCancelResult`.
- DILARANG notifikasi sementara memakai `ScaffoldMessenger.of(context).showSnackBar` manual; wajib `AppToast`.
- DILARANG impor individu utilitas shared (`l.dart`, `navigator_helper.dart`, `toast_widget.dart`, `parser_util.dart`, `shared_pref_service.dart`); wajib `core_shared.dart`.
- DILARANG loading operasi simpan/hapus memakai `CircularProgressIndicator` manual di dalam tombol atau `showDialog`; wajib `EasyLoading.show`/`dismiss` dengan `maskType: EasyLoadingMaskType.black`.

## Contoh Benar

```dart
// Konfirmasi ya/tidak dengan showOkCancelAlertDialog (adaptive_dialog)
final konfirmasi = await showOkCancelAlertDialog(
  context: context,
  title: 'Hapus Data?',
  message: 'Tindakan ini tidak dapat dibatalkan.',
  okLabel: 'Hapus',
  cancelLabel: 'Batal',
  isDestructiveAction: true,
);
if (konfirmasi != OkCancelResult.ok) return;
// lanjutkan aksi setelah konfirmasi OK

// Validasi form sebelum simpan
final formKey = GlobalKey<FormState>();
if (formKey.currentState?.validate() ?? false) {
  formKey.currentState!.save();
  await simpanData();
}

// Akses data async opsional
final nilai = asyncValue.asData?.value ?? fallbackNilai;

// Navigasi aman dengan catchError
unawaited(Nav.to('/dashboard').catchError((e) => L.e('Navigasi gagal: $e')));

// Early return pattern
if (state.isLoading) return const _LoadingView();
if (state.hasError) return _ErrorRetry(onRetry: () => ref.refresh(provider));
if (state.value?.isEmpty ?? true) return const _EmptyState();
return _TampilkanData(state.requireValue);
```

## Contoh Salah

```dart
// DILARANG: Simpan tanpa validasi form
await simpanData(); // Tidak ada Form + validate()

// DILARANG: requireValue pada data opsional tanpa cek
final nilai = asyncValue.requireValue; // SALAH! Bisa throw jika loading/error

// DILARANG: Navigasi tanpa catchError
unawaited(Nav.to('/dashboard')); // SALAH! Tidak ada error handling

// DILARANG: Toast perayaan tanpa penandaan SharedPreferences
AppToast.sukses('Berhasil!'); // SALAH! Tidak ada penandaan, bisa muncul berulang

// DILARANG: Dialog konfirmasi manual dengan showDialog + AlertDialog
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Konfirmasi'),
    content: const Text('Yakin hapus?'),
    actions: [
      TextButton(onPressed: () => Nav.pop(context), child: const Text('Batal')),
      TextButton(onPressed: () { Nav.pop(context); hapusData(); }, child: const Text('Hapus')),
    ],
  ),
);
```


===== .agents/skills/riset-kompetitor/SKILL.md =====
---
name: riset-kompetitor
description: "Trigger: saat membuat atau memperbarui katalog aplikasi kompetitor proyek | Panduan riset kompetitor portabel lintas proyek: menentukan aplikasi sasaran dari dokumen proyek, format tabel apk_kompetitor.md, status analisa per listing, verifikasi tautan, alur satu run mencakup semua store, dan laporan refrensi_apk.md. Riset Kompetitor Aplikasi Mobile (Lintas Proyek) Mengumpulkan dan mendokumentasikan daftar aplikasi mobile kompetitor untuk proyek Flutter atau proyek mobile apa pun. Skill ini **tidak mengasumsikan** nama aplikasi, domain, kategori fitur, atau model bisnis proyek. Konteks aplikasi sasaran wajib dibaca dari dokumen proyek (`README.md`, `AGENTS.md`, PRD, atau dokumen produk lain) sebelum riset dimulai. Hasil riset disimpan dalam tabel standar di `apk_kompetitor.md`. Analisa lanjutan menghasilkan `refrensi_apk.md` yang memuat rekomendasi fitur, optimasi fitur eksisting, serta pola UI/UX/layout. Nama berkas tersebut adalah **default**; bila proyek memakai nama lain, sesuaikan dengan konvensi proyek d"
metadata:
  kategori: "custom"
  versi: "1.6.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Riset Kompetitor Aplikasi Mobile (Lintas Proyek)

Mengumpulkan dan mendokumentasikan daftar aplikasi mobile kompetitor untuk proyek Flutter atau proyek mobile apa pun. Skill ini **tidak mengasumsikan** nama aplikasi, domain, kategori fitur, atau model bisnis proyek. Konteks aplikasi sasaran wajib dibaca dari dokumen proyek (`README.md`, `AGENTS.md`, PRD, atau dokumen produk lain) sebelum riset dimulai.

Hasil riset disimpan dalam tabel standar di `apk_kompetitor.md`. Analisa lanjutan menghasilkan `refrensi_apk.md` yang memuat rekomendasi fitur, optimasi fitur eksisting, serta pola UI/UX/layout. Nama berkas tersebut adalah **default**; bila proyek memakai nama lain, sesuaikan dengan konvensi proyek dan catat pemetaannya di `README.md` atau dokumen proyek.

## Cakupan yang Di-Cover

- Package: `tidak ada` (dokumentasi non-kode; berlaku untuk proyek Flutter/mobile lintas domain)
- File default: `apk_kompetitor.md` (katalog aplikasi per store) dan `refrensi_apk.md` (laporan analisa)
- Perintah terkait bila tersedia di proyek: `.kilo/commands/cari_apk_kompetitor.md` untuk menambah listing; `.kilo/commands/riset_kompetitor.md` untuk analisa fitur
- File wajib dibaca sebelum riset: `README.md`, `AGENTS.md`, `apk_kompetitor.md` (bila ada), serta dokumen produk/PRD yang menjelaskan aplikasi sasaran
- Kolom tabel: `Nama Aplikasi`, `Ringkasan Singkat`, `Store`, `Link`, `Status Analisa`
- Struktur `refrensi_apk.md`: informasi riset + cara membaca → ringkasan temuan terbesar → kondisi fitur aktual proyek → A. Rekomendasi fitur baru → B. Optimasi fitur eksisting → C. UI/UX & Layout → D. Katalog listing → E. Prioritas gabungan → F. Verifikasi & keterbatasan → G. Sumber
- Store yang didukung: Google Play Store, Apple App Store, F-Droid, GitHub, Samsung Galaxy Store, Uptodown, IzzyOnDroid, Amazon Appstore, APKPure, Aptoide, SlideME, Mi/GetApps, Oppo App Market, Tencent MyApp, Huawei AppGallery
- Toko yang sering memblokir akses langsung (Xiaomi GetApps, Oppo App Market, Vivo App Store, Huawei AppGallery, Baidu Mobile Assistant): hanya sertakan aplikasi bila link halaman aplikasi spesifik dapat diverifikasi
- Kategori relevansi: **ditentukan dari dokumen produk proyek**, bukan dari skill. Contoh kategori umum: fitur inti, alur pengguna, UI/UX, monetisasi, integrasi, aksesibilitas, performa, privasi, dan mode offline

## Aturan

1. Tentukan aplikasi sasaran dan fitur intinya dari `README.md`, `AGENTS.md`, PRD, atau dokumen produk proyek. Jika dokumen tidak tersedia atau saling bertentangan, tanyakan kepada pengguna; **jangan menebak** dari nama repositori.
2. Setiap aplikasi **wajib** memiliki nama, ringkasan singkat (maks 2-3 kalimat), nama store/sumber, link yang valid, dan **kolom `Status Analisa`** (nilai: `Belum Dianalisa` atau `Sudah Dianalisa`).
3. Ringkasan singkat **wajib** menyebutkan fitur utama yang relevan dengan aplikasi sasaran proyek, bukan deskripsi umum dari store. Fitur yang disebut harus berasal dari kategori yang sudah ditentukan pada langkah 1.
4. Format tabel **wajib** mengikuti standar Markdown pipe (`| Kolom 1 | Kolom 2 | ... |`) dengan header dan separator baris kedua (`| --- | --- | ... |`).
5. Aplikasi dari store yang sama **dikelompokkan** secara berurutan. Urutan default: Google Play → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya.
6. Duplikat nama aplikasi di store berbeda **diperbolehkan** (mis. aplikasi sama di Play Store dan App Store) dengan baris terpisah.
7. Link **wajib** mengarah ke halaman resmi store/repositori (bukan pencarian umum), gunakan format `[Buka Aplikasi](url)`, `[Buka Repositori](url)`, `[Unduh APK](url)`, atau `[Cari Aplikasi](url)` sesuai jenis store.
8. Setiap penambahan/perubahan **wajib** di-commit dengan pesan `docs: ...` dan referensi ke skill ini, kecuali pengguna melarang commit.
9. **Wajib** verifikasi link masih aktif sebelum commit (cek manual atau otomatis).
10. **Satu run mencakup semua store.** Mulai dari Google Play Store; riset dikerjakan store demi store dalam satu run dengan urutan: Google Play Store → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya. Setelah seluruh kandidat suatu store terverifikasi independen dan `apk_kompetitor.md` diperbarui, baru lanjut ke store berikutnya. DILARANG melewati store tanpa mencatat hasilnya (termasuk nihil temuan) ke `apk_kompetitor.md` atau laporan.
11. Verifikasi otomatis dengan: `curl -s -o /dev/null -w "%{http_code}" -A "Mozilla/5.0 (X11; Linux x86_64) Chrome/120.0" -L <url>`. HTTP **200** = valid; HTTP **404** = buang entri; HTTP **403** dari APKPure/Aptoide/SlideME = anti-bot (bukan link mati) — verifikasi via websearch/webfetch.
12. Untuk id aplikasi Apple App Store, gunakan lookup `https://itunes.apple.com/lookup?id=<id>`; `resultCount: 0` berarti aplikasi tidak ada dan **tidak boleh** disertakan.
13. Aplikasi Tionghoa/regional tanpa link halaman aplikasi spesifik yang terverifikasi **tidak boleh** disertakan; keberadaan di store saja (dari sumber sekunder) tidak cukup.
14. Periksa duplikat exact berdasarkan `package id` sebelum menambah baris. Dua varian dengan package id berbeda tetap dicatat terpisah bila memang dua aplikasi.
15. Untuk batch besar, tambahkan section `# Tambahan Riset (YYYY-MM-DD)` dengan sub-section `## <Store>`; setiap tabel tetap wajib punya header + separator.
16. Untuk tugas "mencarikan referensi dari seluruh APK di katalog": baca dokumen proyek dan `apk_kompetitor.md` lebih dulu; **lingkup hanya APK yang terdaftar di katalog** — jangan menambah aplikasi baru tanpa perintah eksplisit. Hasil ditulis ke `refrensi_apk.md`.
17. `refrensi_apk.md` wajib memuat: link referensi pada tiap rekomendasi, pengelompokan per fitur (A), optimasi fitur eksisting (B), dan UI/UX/layout (C), penjelasan **tujuan** tiap item, serta **prioritas** (Tinggi/Sedang/Rendah) untuk penyortiran pengguna.
18. Untuk `refrensi_apk.md`: hanya rekomendasikan fitur yang dapat berjalan di mobile. Fitur khusus iOS (Apple Watch, Live Activities, WidgetKit, Wear-only tanpa padanan Android) dicatat sebagai referensi pola saja, bukan rekomendasi. Fitur yang butuh backend/akun ditandai jelas dan ditempatkan pada prioritas rendah; jika proyek bersifat lokal-first, pertahankan prinsip itu.
19. Klasifikasikan status verifikasi listing: **terverifikasi** (halaman/README/mirror terbaca, iTunes `resultCount > 0`, atau curl 200 dengan isi terbaca), **verifikasi ringan** (Galaxy Store 200 dengan judul halaman saja, atau Amazon Appstore tanpa detail), **tidak terverifikasi** (404, 403 tanpa sumber alternatif, halaman kosong, atau listing tidak ditemukan). Listing tidak terverifikasi tidak dijadikan dasar rekomendasi.
20. Uptodown dapat berputar antara HTTP 410 dan 404 untuk URL yang sama — perlakukan sebagai flaky/rotasi; tandai tidak terverifikasi kecuali ada mirror resmi yang menyebut package id sama.
21. Temuan cacat kode yang ditemukan saat riset didokumentasikan di `refrensi_apk.md` dengan prioritas dan path file, **tidak diperbaiki** sebagai bagian dari tugas riset.
22. Sebelum memperbarui `refrensi_apk.md`, periksa `git diff` working tree/staged — jangan menimpa, membangkitkan kembali, atau menggabungkan ulang bagian yang sudah dihapus pengguna; hilangkan tautan ke dokumen yang sudah dihapus.
23. Amazon Appstore dan Samsung Galaxy Store dapat mengembalikan HTTP 200 pada curl dengan user agent Chrome; Galaxy Store tetap diklasifikasi **verifikasi ringan**.
24. Untuk perintah analisa: **hanya boleh menganalisa APK yang `Status Analisa = Belum Dianalisa`**. APK `Sudah Dianalisa` wajib dilewati kecuali pengguna meminta analisa ulang secara eksplisit (kembalikan status ke `Belum Dianalisa` terlebih dahulu). Setelah analisa selesai **per APK**, ubah status baris tersebut menjadi `Sudah Dianalisa`.
25. Listing baru dari perintah `cari_apk_kompetitor.md` **wajib** diberi `Status Analisa = Belum Dianalisa`; perintah itu **tidak boleh** menandai `Sudah Dianalisa`.
26. Saat menjalankan analisa, filter dan proses hanya baris `Belum Dianalisa`; jangan memperluas lingkup ke sumber lain. `refrensi_apk.md` tetap memuat katalog lengkap (seksi D) — perbarui hanya bagian yang terdampak, jangan tulis ulang dari nol kecuali diminta.
27. **Section `# Status Analisa Fitur` di akhir file TIDAK DIPERLUKAN** — penandaan status dilakukan per baris tabel via kolom `Status Analisa`.
28. **Aturan portabilitas:** DILARANG menulis nama aplikasi, domain, kategori fitur, atau istilah khas satu proyek ke dalam skill ini. Konvensi khusus proyek (nama berkas, daftar store prioritas, kategori relevansi) disimpan di `README.md`, `AGENTS.md`, command proyek, atau dokumen produk proyek.
29. Jika aplikasi sasaran berubah, katalog lama **tidak boleh** langsung dipakai ulang. Verifikasi ulang relevansi setiap listing atau buat katalog baru sesuai perintah pengguna.
30. Jika pengguna membatasi jumlah APK yang dianalisa (mis. 10), pilih lintas kategori/fitur yang paling relevan, catat alasan pemilihan di `refrensi_apk.md`, dan jangan menandai listing di luar jumlah tersebut sebagai `Sudah Dianalisa`.
31. Catat tanggal pembaruan (mis. `diperbarui: YYYY-MM-DD`) pada `apk_kompetitor.md` dan `refrensi_apk.md` setiap kali berkas diperbarui.

## Steps

1. Baca `README.md`, `AGENTS.md`, dokumen produk/PRD, dan `apk_kompetitor.md`; tentukan aplikasi sasaran, fitur inti, serta kategori relevansi.
2. Periksa katalog yang ada: store yang sudah tercakup, listing `Belum Dianalisa`, dan duplikat.
3. Riset kandidat per store; verifikasi setiap link secara independen (curl/iTunes/webfetch).
4. Perbarui `apk_kompetitor.md` setelah tiap store selesai; beri `Belum Dianalisa` pada listing baru.
5. Untuk analisa, filter hanya listing `Belum Dianalisa`; pilih APK sesuai batas jumlah pengguna; kumpulkan bukti fitur dan tangkapan layar resmi.
6. Tulis/perbarui `refrensi_apk.md` dengan bagian A–G; sertakan link, tujuan, dan prioritas.
7. Ubah status APK yang benar-benar dianalisa menjadi `Sudah Dianalisa`; perbarui dokumentasi/memori proyek bila ada konvensinya.
8. Verifikasi: jumlah status konsisten, tautan aktif, tabel memiliki header, dan tidak ada nama aplikasi proyek yang di-hardcode ke skill.

## Larangan

- DILARANG meng-hardcode nama aplikasi, domain, atau fitur spesifik proyek ke dalam `SKILL.md`.
- DILARANG menganggap katalog dari proyek lain otomatis relevan tanpa verifikasi ulang.
- DILARANG menambah aplikasi tanpa ringkasan fitur yang relevan dengan aplikasi sasaran.
- DILARANG menggunakan format tabel non-standar (daftar bullet, JSON, CSV).
- DILARANG mengubah urutan kolom tabel yang sudah ditetapkan.
- DILARANG menghapus aplikasi yang sudah tercatat kecuali benar-benar tidak lagi tersedia di store resmi.
- DILARANG menyalin deskripsi store tanpa disesuaikan dengan konteks proyek.
- DILARANG menambah kolom baru selain `Status Analisa` tanpa memperbarui skill dan seluruh baris tabel.
- DILARANG mempercayai link hasil subagen tanpa verifikasi independen.
- DILARANG menyertakan aplikasi hanya dari sumber agregator tanpa link halaman resmi yang terverifikasi.
- DILARANG menganggap HTTP 403 dari APKPure/Aptoide/SlideME sebagai link mati.
- DILARANG menyertakan link HTTP 404 atau id App Store dengan `resultCount: 0`.
- DILARANG menambah tabel tanpa header/separator.
- DILARANG melewati store dari urutan riset dalam satu run tanpa mencatat hasilnya (termasuk nihil temuan).
- DILARANG merekomendasikan fitur non-mobile sebagai rekomendasi utama.
- DILARANG menganggap Galaxy Store HTTP 200 + judul halaman sebagai verifikasi penuh.
- DILARANG memperluas lingkup di luar katalog tanpa perintah eksplisit.
- DILARANG menimpa bagian `refrensi_apk.md` yang sudah dihapus pengguna.
- DILARANG memperbaiki kode sebagai bagian dari tugas riset.
- DILARANG memindai ulang link APK yang cacat atau tidak dapat ditemukan; tandai sebagai tidak terverifikasi atau tidak disertakan.
- DILARANG menandai `Sudah Dianalisa` sebelum analisa dijalankan dan didokumentasikan.
- DILARANG menandai listing baru dari `cari_apk_kompetitor.md` sebagai `Sudah Dianalisa`.
- DILARANG membuat section `# Status Analisa Fitur` di akhir file.
- DILARANG menebak aplikasi sasaran ketika dokumen proyek tidak tersedia; tanyakan kepada pengguna.

## Contoh Benar

Katalog generik untuk proyek apa pun (nama aplikasi dan fitur mengikuti dokumen proyek):

```markdown
| Nama Aplikasi | Ringkasan Singkat                                                                                      | Store             | Link                                                                           | Status Analisa  |
| ------------- | ------------------------------------------------------------------------------------------------------ | ----------------- | ------------------------------------------------------------------------------ | --------------- |
| Aplikasi A    | Menyediakan fitur inti yang relevan dengan aplikasi sasaran, termasuk alur utama dan pengaturan lokal. | Google Play Store | [Buka Aplikasi](https://play.google.com/store/apps/details?id=com.contoh.appa) | Belum Dianalisa |
| Aplikasi B    | Menawarkan fitur pembanding pada kategori yang sama dengan pendekatan UI yang berbeda.                 | F-Droid           | [Buka Aplikasi](https://f-droid.org/packages/com.contoh.appb/)                 | Belum Dianalisa |
```

Item referensi generik:

```markdown
#### A1. Fitur Pembanding yang Relevan

- **Temuan:** Aplikasi kompetitor menyediakan fitur yang belum tercatat pada dokumen produk proyek.
- **Tujuan fitur:** menjelaskan manfaat fitur bagi pengguna aplikasi sasaran.
- **Referensi:** [Aplikasi A](https://play.google.com/store/apps/details?id=com.contoh.appa)
- **Saran:** sesuaikan fitur dengan arsitektur dan batasan platform proyek.
- **Prioritas:** Sedang.
```

## Contoh Salah

```markdown
# DILARANG: skill mengunci satu aplikasi/domain tertentu

# Riset Kompetitor Aplikasi NamaAplikasiTertentu

Skill ini hanya untuk aplikasi NamaAplikasiTertentu dengan fitur X, Y, dan Z.
```

```markdown
# DILARANG: katalog tanpa status analisa

| Nama Aplikasi | Ringkasan Singkat | Store             | Link                                                                  |
| ------------- | ----------------- | ----------------- | --------------------------------------------------------------------- |
| Aplikasi A    | Aplikasi sejenis. | Google Play Store | [Buka](https://play.google.com/store/apps/details?id=com.contoh.appa) |
```

```markdown
# DILARANG: menandai Sudah Dianalisa tanpa analisa

| Aplikasi A | ... | Google Play Store | [Buka](https://play.google.com/store/apps/details?id=com.contoh.appa) | Sudah Dianalisa |
```


===== .agents/skills/spacing/SKILL.md =====
---
name: spacing
description: "Trigger: saat mengatur jarak antar elemen UI | Panduan spacing pada Row/Column, SizedBox hanya khusus, padding tepi layar tanggung jawab parent, nilai spacing mengikuti skala standar optimasi_ui.md. Panduan Spacing (Jarak Antar Elemen) Skill ini mendokumentasikan aturan pengaturan jarak antar elemen UI berdasarkan `optimasi_ui.md` dan implementasi nyata di proyek Flutter. Tujuannya adalah menjaga konsistensi jarak antar elemen dan menghindari penggunaan `SizedBox` berulang untuk jarak standar. Cakupan yang Di-Cover - Package: `package:flutter` (class `Row`, `Column`, `Wrap`, `SizedBox`, `Padding`, `EdgeInsets`, `Card`, `Scaffold`, `SafeArea`) - Class: `Row`, `Column`, `Wrap`, `SizedBox`, `Padding`, `EdgeInsets`, `Card`, `Scaffold`, `SafeArea` - Properti: `Row.spacing`, `Column.spacing`, `Wrap.spacing`, `Wrap.runSpacing`, `SizedBox.height`, `SizedBox.width`, `Padding.padding` - Method: `EdgeInsets.all()` Aturan 1. Wajib menggunakan properti `spacing` pada `Row` dan `Column` untuk jarak seragam antar anak. 2. D"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Panduan Spacing (Jarak Antar Elemen)

Skill ini mendokumentasikan aturan pengaturan jarak antar elemen UI berdasarkan `optimasi_ui.md` dan implementasi nyata di proyek Flutter. Tujuannya adalah menjaga konsistensi jarak antar elemen dan menghindari penggunaan `SizedBox` berulang untuk jarak standar.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `Row`, `Column`, `Wrap`, `SizedBox`, `Padding`, `EdgeInsets`, `Card`, `Scaffold`, `SafeArea`)
- Class: `Row`, `Column`, `Wrap`, `SizedBox`, `Padding`, `EdgeInsets`, `Card`, `Scaffold`, `SafeArea`
- Properti: `Row.spacing`, `Column.spacing`, `Wrap.spacing`, `Wrap.runSpacing`, `SizedBox.height`, `SizedBox.width`, `Padding.padding`
- Method: `EdgeInsets.all()`

## Aturan

1. Wajib menggunakan properti `spacing` pada `Row` dan `Column` untuk jarak seragam antar anak.
2. DILARANG menggunakan `SizedBox` berulang hanya untuk jarak standar antar anak di `Row`/`Column`.
3. `SizedBox` hanya boleh digunakan untuk kebutuhan jarak khusus yang tidak bisa ditangani `spacing`.
4. Padding tepi layar adalah tanggung jawab container halaman/parent, bukan widget reusable.
5. Widget reusable boleh punya padding internal untuk desain komponennya (mis. `Card` padding isi), tetapi dilarang mengambil alih tanggung jawab padding tepi layar.
6. DILARANG padding ganda (parent sudah padding, anak juga padding tepi).
7. Nilai padding wajib mengikuti `optimasi_ui.md`.
8. Jarak antar elemen wajib serasi, proporsional, dan konsisten per `optimasi_ui.md`.

## Larangan

- DILARANG `SizedBox` berulang untuk jarak standar di `Row`/`Column`.
- DILARANG widget reusable mengandung padding tepi layar.
- DILARANG padding ganda (parent + anak keduanya padding tepi).
- DILARANG nilai spacing acak tanpa acuan `optimasi_ui.md`.

## Contoh Benar

```dart
// BENAR: Column dengan spacing property
Column(
  spacing: 16, // Jarak seragam 16 antar semua anak
  children: [
    Text('Judul'),
    Text('Deskripsi'),
    Text('Lainnya'),
  ],
)

// BENAR: Row dengan spacing property
Row(
  spacing: 12,
  children: [
    Icon(Icons.star),
    Text('Rating'),
    Text('4.5'),
  ],
)

// BENAR: SizedBox hanya untuk jarak khusus (sebelum FAB)
Column(
  spacing: 8,
  children: [
    Text('Label'),
    Text('Nilai'),
    const SizedBox(height: 24), // Jarak khusus besar sebelum tombol
    FilledButton(onPressed: ..., child: Text('Aksi')),
  ],
)

// BENAR: Wrap dengan spacing + runSpacing
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: chips.map((c) => FilterChip(...)).toList(),
)

// BENAR: Jarak seragam 4px antar anak di Column subtitle
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 4,
  children: [
    NamaPaketWidget(idPaket: pelanggan.idPaket),
    Text('Pembayaran: ${status.label}'),
    Text('Status: ...'),
    Text('Berakhir: ...'),
  ],
)

// BENAR: Halaman bertanggung jawab padding tepi layar
Scaffold(
  body: SafeArea(
    child: Padding(
      padding: EdgeInsets.all(16), // Mengikuti optimasi_ui.md
      child: ListView(
        children: [
          RingkasanWidget(),     // Widget reusable - HANYA padding internal
          StatistikWidget(),     // Widget reusable - HANYA padding internal
          DaftarWidget(),        // Widget reusable
        ],
      ),
    ),
  ),
)

// Widget Reusable: Card dengan padding internal (bukan tepi layar)
class RingkasanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16), // Padding INTERNAL komponen
        child: Column(...),
      ),
    );
  }
}
```

## Contoh Salah

```dart
// DILARANG: SizedBox berulang di Column
Column(
  children: [
    Text('Judul'),
    SizedBox(height: 16),
    Text('Deskripsi'),
    SizedBox(height: 16),
    Text('Lainnya'),
  ],
)

// DILARANG: Widget reusable punya padding tepi layar
class _ImpianItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding( // SALAH! Ini padding tepi layar, bukan internal
      padding: EdgeInsets.all(16),
      child: Card(...),
    );
  }
}

// DILARANG: Padding ganda (parent 16 + anak 16 = 32 total)
Scaffold(
  body: Padding(
    padding: EdgeInsets.all(16),
    child: ListView(children: [
      Padding(
        padding: EdgeInsets.all(16),
        child: _ImpianItem(...), // DOUBLE PADDING!
      ),
    ]),
  ),
)
```


===== .agents/skills/sqlite/SKILL.md =====
---
name: sqlite
description: "Trigger: saat menambahkan atau memperbaiki dukungan SQLite (sqflite) di Flutter Web | Panduan `sqflite_common_ffi_web`: tambah paket via `flutter pub add`, setup `dart run sqflite_common_ffi_web:setup` (`web/sqlite3.wasm` + `web/sqflite_sw.js` di samping `index.html`), set `databaseFactoryFfiWeb` di `main()` untuk `kIsWeb` sebelum database pertama dibuka, path database di web hanya nama (IndexedDB), dan batasan resmi (singleInstance, origin:port, shared/basic worker). Dukungan SQLite di Flutter Web `sqflite` tidak berjalan di web. SQLite di web berjalan lewat `sqflite_common_ffi_web` (SQLite dikompilasi ke WASM; penyimpanan IndexedDB; pada saat panduan ini dibuat paket tersebut masih _experimental_). Aturan 1. Pada target Web, gunakan `sqflite_common_ffi_web` — bukan `sqflite` (Android/iOS) dan bukan `sqflite_common_ffi` (desktop/VM test). 2. Tambah paket WAJIB lewat `flutter pub add sqflite_common_ffi_web`; dilarang edit `pubspec.yaml` manual (kecuali kasus `path:`/`git:`). 3. Setup binari WAJIB: `dart run s"
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Wed Nov 18 2026 08:04 WIB"
---

# Dukungan SQLite di Flutter Web

`sqflite` tidak berjalan di web. SQLite di web berjalan lewat `sqflite_common_ffi_web` (SQLite dikompilasi ke WASM; penyimpanan IndexedDB; pada saat panduan ini dibuat paket tersebut masih _experimental_).

## Aturan

1. Pada target Web, gunakan `sqflite_common_ffi_web` — bukan `sqflite` (Android/iOS) dan bukan `sqflite_common_ffi` (desktop/VM test).
2. Tambah paket WAJIB lewat `flutter pub add sqflite_common_ffi_web`; dilarang edit `pubspec.yaml` manual (kecuali kasus `path:`/`git:`).
3. Setup binari WAJIB: `dart run sqflite_common_ffi_web:setup` dari folder proyek (yang memiliki `web/`) — membuat `web/sqlite3.wasm` dan `web/sqflite_sw.js`; keduanya harus berada di samping `index.html` (masukkan ke source control atau jalankan setup di CI/build).
4. Set factory sekali di `main()`, sebelum database pertama dibuka:

   ```dart
   if (kIsWeb) {
     databaseFactory = databaseFactoryFfiWeb;
   }
   ```

   Factory di luar Web melempar `UnsupportedError` — wajib dijaga `kIsWeb`.

5. Pada Web, path database hanyalah nama (`getDatabasesPath()` mengembalikan `/`); `app.db`, `./app.db`, `/app.db` mengarah ke database yang sama (IndexedDB). Jangan memakai `getApplicationDocumentsDirectory()` untuk Web.
6. Penjaga platform di inisialisasi database: bila Web memang didukung, JANGAN melempar `UnsupportedError` pada `kIsWeb`; buka database dengan factory yang sama (setelah diset di `main()`).
7. Batasan resmi (experimental): satu koneksi per database — `OpenDatabaseOptions(singleInstance: false)` untuk DB persisten → `ArgumentError`; shared worker tidak tersedia di Android Chrome → basic worker (tidak cross-tab safe); IndexedDB terikat origin termasuk port (gunakan `--web-port <port>` tetap saat debugging); lebih lambat dari native.
8. Import factory dari paket yang tepat: `databaseFactoryFfiWeb` dari `package:sqflite_common_ffi_web/sqflite_ffi_web.dart`; `databaseFactory` dari `package:sqflite/sqflite.dart` (atau `package:sqflite_common/sqlite_api.dart`). Jangan hanya meng-import `sqflite_ffi_web.dart` — `Database`/`OpenDatabaseOptions` tidak diekspor dari sana.
9. Verifikasi: `dart format` + `dart analyze` bersih; `flutter test` tidak terpengaruh (`kIsWeb == false` di VM test); konfirmasi runtime lewat `flutter run -d chrome` (port tetap); JANGAN mengklaim dukungan Web sebelum diverifikasi runtime.
10. Web tidak punya akses file — import/ekspor database gunakan `databaseFactory.writeDatabaseBytes()` / `readDatabaseBytes()`.

## Contoh Benar

```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // Factory wajib diset sebelum database pertama dibuka.
    databaseFactory = databaseFactoryFfiWeb;
  }
  runApp(const AplikasiSaya());
}
```

```dart
Future<Database> _initDB() async {
  if (kIsWeb) {
    // Di Web, path hanya nama; database tersimpan di IndexedDB.
    return await openDatabase(
      'app.db',
      version: versiDatabase,
      onCreate: createTables,
      onUpgrade: _onUpgrade,
    );
  }
  // ... jalur lain (Android/iOS/desktop/VM test) seperti biasa
}
```

## Contoh Salah

```dart
// Salah: Web didukung tapi kIsWeb tetap dilempar UnsupportedError
if (kIsWeb) {
  throw UnsupportedError('Database lokal tidak didukung pada Flutter Web.');
}

// Salah: factory belum diset di main() sebelum DB dibuka di Web
// → console: "An error occurred while initializing the web worker"
//   (sqflite_sw.js tidak ditemukan / belum disetup)

// Salah: debugging dengan port berbeda tiap run → database IndexedDB "hilang"
// (localhost:8080 ≠ localhost:8081); gunakan --web-port tetap

// Salah: singleInstance: false pada database persisten → ArgumentError
```


===== .agents/skills/struktur-class-ui/SKILL.md =====
---
name: struktur-class-ui
description: "Trigger: saat membuat widget custom reusable | Panduan struktur class UI reusable: StatelessWidget, parameter final, const constructor, build pure, semua method widget di bawah build, dispose di bawah initState, method helper non-widget di paling bawah kelas; DILARANG method helper di atas build. Rujuk skill gaya/spacing/aturan-riverpod. Struktur Class UI Reusable Panduan struktur class widget UI reusable yang konsisten, pure, dan aman tema. Aturan 1. Widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state. 2. Semua parameter WAJIB `final` dan constructor WAJIB `const` bila memungkinkan. 3. Method `build` WAJIB pure (tidak memanggil side-effect, tidak membaca provider langsung). 4. Warna WAJIB dari `ColorScheme`/tema, bukan hardcode (kecuali status semantic). 5. Gunakan `Column.spacing`/`Row.spacing` untuk jarak seragam, bukan `SizedBox` berulang. 6. Widget WAJIB aman untuk light/dark mode."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 22 2026 14:00 WIB"
---

# Struktur Class UI Reusable

Panduan struktur class widget UI reusable yang konsisten, pure, dan aman tema.

## Aturan

1. Widget reusable WAJIB `StatelessWidget` bila tidak memerlukan state.
2. Semua parameter WAJIB `final` dan constructor WAJIB `const` bila memungkinkan.
3. Method `build` WAJIB pure (tidak memanggil side-effect, tidak membaca provider langsung) dan WAJIB berada di atas seluruh method helper widget (yang mengembalikan `Widget`). Method helper privat aksi (nama diawali `_`, mengembalikan `void`) WAJIB di atas `build`; method helper non-widget pengembali nilai (`Color`, `String`, `int`, `bool`) WAJIB di paling bawah kelas. Hierarki dari atas ke bawah: helper privat aksi → `build` → helper widget → helper non-widget pengembali nilai.
5. Jarak seragam mengikuti skill `spacing` (Column.spacing/Row.spacing).
6. Widget WAJIB aman untuk light/dark mode.
7. Method helper privat (nama diawali `_`, termasuk aksi non-widget seperti `_editXxx`, `_salinXxx`, `_tambahXxx`, `_muatUlang`) WAJIB ditempatkan di atas method `build`; method helper widget yang mengembalikan `Widget` (mis. `_buildXxx`, `_buildError`) tetap di bawah `build`. DILARANG menempatkan method helper privat di bawah `build` atau mencampurnya dengan helper widget di bawah `build`.
8. Method helper non-widget yang mengembalikan nilai non-widget (mis. `Color`, `String`, `int`, `bool`) WAJIB ditempatkan di paling bawah kelas, setelah seluruh method helper widget dan method `build`; DILARANG mencampur method non-widget di antara method widget.

```dart
class KartuInfo extends StatelessWidget {
  const KartuInfo({
    super.key,
    required this.judul,
    required this.deskripsi,
  });

  final String judul;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      color: cs.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(judul, style: Theme.of(context).textTheme.titleMedium),
            Text(deskripsi, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
```

## Contoh Salah

```dart
class KartuInfo extends StatelessWidget {
  KartuInfo({required this.judul, required this.deskripsi});
  String judul;
  String deskripsi;

  @override
  Widget build(BuildContext context) {
    // side-effect + warna hardcode
    print('build');
    return Container(color: Colors.blue, child: Text(judul));
  }
}
```


===== .agents/skills/struktur-folder-lib/SKILL.md =====
---
name: struktur-folder-lib
description: Trigger: saat menata atau membuat struktur folder lib/ Flutter | Panduan feature-first + core/ untuk proyek Flutter: sub-folder lapisan di dalam folder fitur (screens/, notifier/, provider/, widgets/ bila dibutuhkan), pembeda state Riverpod yang bisa diubah (notifier/ + nama_notifier.dart) vs provider read-only (provider/ + nama_provider.dart), main.dart/app.dart/home.dart (shell) tetap di akar, dan berkas hasil generate (*.g.dart) tidak dipindah/diedit manual (build_runner). Larangan: jangan membuat folder core/ kosong; desain blueprint harus dieksekusi beserta build_runner, bukan sekadar rename. Workflow: pindahkan sumber → build_runner → perbarui impor → dart format, dart analyze, flutter test. Referensi: hasil_diskusi/diskusi_4.md, lib/main.dart, lib/app.dart, lib/home.dart, lib/fitur/. Struktur Folder `lib/` Flutter Menata `lib/` dengan pola feature-first + `lib/core/` lintas-fitur. Akar `lib/` menyimpan `main.dart`, `app.dart`, dan shell utama (mis. `home.dart`); kode per fitur berada di `lib/fitur/<nam
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Sat Nov 21 2026 16:54 WIB"
---

# Struktur Folder `lib/` Flutter

Menata `lib/` dengan pola feature-first + `lib/core/` lintas-fitur. Akar `lib/` menyimpan `main.dart`, `app.dart`, dan shell utama (mis. `home.dart`); kode per fitur berada di `lib/fitur/<nama_fitur>/` dengan sub-folder lapisan.

Status referensi: konvensi `notifier/` vs `provider/` berasal dari hasil diskusi (belum ada di commit mana pun). Blueprint target belum dieksekusi (lihat `hasil_diskusi/diskusi_4.md`); contoh yang ditandai "target" mengikuti blueprint tersebut.

## Cakupan yang Di-Cover

- Package: `package:flutter_riverpod`, `package:riverpod_annotation`, `package:riverpod_generator`, `package:build_runner`
- Class: `TemaNotifier` (contoh; `@Riverpod(keepAlive: true)` dengan `_$TemaNotifier`), layar `<Nama>Screen`, widget shell (`MyHomePage`)
- Layout folder: `lib/fitur/<nama_fitur>/{screens,notifier,provider,widgets}/`, `lib/core/`
- File generate: `*.g.dart` (mis. `tema_notifier.g.dart`)
- Commit rujukan struktur: `c30a4ec` (struktur file utama + navigasi tab), `f0f437d` (migrasi tema ke Riverpod)

## Aturan

1. Akar `lib/` hanya berisi `main.dart` (entry), `app.dart` (root widget), dan shell utama (mis. `home.dart`). Jangan pindahkan mereka ke dalam fitur tanpa keputusan eksplisit.
2. Satu folder per fitur di `lib/fitur/<nama_fitur>/`; nama folder fitur memakai `snake_case` bahasa Indonesia (mis. `pengaturan`).
3. Di dalam folder fitur, gunakan sub-folder lapisan:
   - `screens/` — layar; nama berkas `<nama>_screen.dart`, class `<Nama>Screen`.
   - `notifier/` — state Riverpod yang **bisa diubah** (memiliki method mutasi); nama berkas `<nama>_notifier.dart`, class `<Nama>Notifier`.
   - `provider/` — provider yang **hanya membaca nilai** (tanpa method mutasi); nama berkas `<nama>_provider.dart`.
   - `widgets/` — widget privat/lokal fitur, dibuat hanya saat dibutuhkan.
   - `model/` — **enum, state, model data, dan class domain** yang berkaitan dengan fitur tersebut (mis. `ModeBerhenti`, `StatusBerhenti`, `BiodataModel`).
4. Pembeda `notifier/` vs `provider/` wajib berdasarkan kemampuan mengubah state, bukan pretensi nama: bila class memiliki method yang mengubah/persisten state, tempatkan di `notifier/`.
5. **Setiap enum, state, model data, dan class domain yang berkaitan dengan sebuah fitur WAJIB diletakkan di sub-folder `model/` di dalam folder fitur tersebut** (mis. `lib/fitur/berhenti_merokok/model/mode_berhenti.dart`).
6. `lib/core/` untuk hal lintas-fitur (utilitas, konstanta, widget bersama); hanya dibuat saat ada isi nyata — dilarang folder kosong.
7. Berkas `*.g.dart` hasil generate tidak diedit, disalin, atau dipindah manual; pindahkan berkas sumber lalu jalankan `dart run build_runner build --delete-conflicting-outputs`.
8. `part`/`part of` diarahkan ke berkas `.g.dart` dengan nama yang sama dengan sumbernya (mis. `part 'tema_notifier.g.dart';`).
9. Impor memakai path package (`package:<nama_aplikasi>/...`), bukan path relatif.
10. Nama berkas `snake_case`, class `PascalCase`, konstanta `SCREAMING_SNAKE_CASE` (lihat skill `penamaan-konvensi`); tabel/kolom/field database `snake_case`.
11. Provider hasil generate dinamai dari nama class minus akhiran `Notifier` (mis. `TemaNotifier` → `temaProvider`); merename berkas tidak mengubah nama provider, hanya jalur impor dan `part` yang berubah.
12. Berkas yang dipindah/rename dengan header `// path:` WAJIB memperbarui header tersebut seiring pemindahan (menunjuk lokasi baru); `grep` path lama WAJIB bersih sebelum tugas dinyatakan selesai (termasuk berkas yang dipindah oleh `git mv`).

## Steps

1. Pindahkan/rename berkas sumber (mis. `tema_provider.dart` → `notifier/tema_notifier.dart`); sesuaikan `part` ke `<sumber>.g.dart` dengan nama berkas baru.
2. Hapus `*.g.dart` lama yang tertinggal; jalankan `dart run build_runner build --delete-conflicting-outputs`.
3. Perbarui semua impor pemakai ke lokasi baru.
4. Perbarui header `// path:` (bila ada) ke lokasi baru; `grep` path lama wajib bersih.
5. Verifikasi `dart format`, `dart analyze`, `flutter test`.

## Larangan

- DILARANG membuat `lib/core/` tanpa isi nyata.
- DILARANG menempatkan state yang bisa diubah di `provider/` atau provider read-only di `notifier/`.
- DILARANG memindah, menyalin, atau mengedit berkas `*.g.dart` secara manual.
- DILARANG merename berkas tanpa memperbarui `part` dan seluruh impor — impor patah lebih berbahaya daripada struktur belum rapi.
- DILARANG memindahkan `main.dart`/`app.dart`/shell utama ke dalam folder fitur tanpa keputusan eksplisit pengguna.
- DILARANG mencampur lapisan (mis. layar di `notifier/`, provider di `screens/`).
- DILARANG mengganti pola folder fitur per fitur (mis. flat semua) tanpa kesepakatan — blueprint adalah default proyek.
- DILARANG meletakkan berkas test flat di `test/` tanpa mengikuti struktur `lib/fitur/<fitur>/...`; test WAJIB di `test/fitur/<fitur>/...` (mirror `lib/`).

## Contoh Benar

Blueprint target (belum dieksekusi; lihat `hasil_diskusi/diskusi_4.md`):

```text
lib/
├── main.dart                              # entry; ProviderScope + runApp(MyApp)
├── app.dart                               # root; ConsumerWidget; MaterialApp + tema
├── home.dart                              # shell; NavigationBar + IndexedStack
└── fitur/
    └── pengaturan/
        ├── screens/
        │   └── pengaturan_screen.dart     # layar pengaturan (konten tab)
        ├── notifier/
        │   ├── tema_notifier.dart         # TemaNotifier (@Riverpod)
        │   └── tema_notifier.g.dart       # hasil build_runner
        ├── provider/
        │   └── tema_provider.dart         # provider read-only (jika ada)
        └── model/
            └── tema_model.dart            # enum, state, model (ThemeMode, dll.)
```

```dart
// lib/fitur/pengaturan/notifier/tema_notifier.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tema_notifier.g.dart';

@Riverpod(keepAlive: true)
class TemaNotifier extends _$TemaNotifier {
  @override
  Future<ThemeMode> build() async => ThemeMode.system;

  Future<void> ubah(ThemeMode mode) async {
    state = AsyncValue.data(mode);
  }
}
```

```dart
// lib/app.dart — impor memakai path package ke lokasi baru
import 'package:spektra/fitur/pengaturan/notifier/tema_notifier.dart';
```

## Contoh Salah

```text
// DILARANG: state yang bisa diubah disimpan di folder provider/
lib/fitur/pengaturan/provider/tema_provider.dart   // salah: TemaNotifier punya ubah()
```

```dart
// DILARANG: menyalin berkas hasil generate ke lokasi baru daripada generate ulang
// cp tema_provider.g.dart tema_notifier.g.dart   // salah: part of menunjuk sumber lama
```

```dart
// DILARANG: impor relatif setelah memindahkan berkas
import '../notifier/tema_notifier.dart';           // salah: pakai package:spektra/...
```

```text
// DILARANG: folder core kosong sebagai "persiapan"
lib/core/                                        // salah: buat saat ada isi nyata
```


===== .agents/skills/supabase/SKILL.md =====
---
name: supabase
description: Trigger: saat mengintegrasikan Supabase (PostgREST) di Flutter — panduan singleton SupabaseKlien idempotent (StateError bila belum init), OperasiSupabase CRUD generik (ambil/tambah/ubah/hapus/tambahBatch) dengan filter match, order, limit/range, logging L dengan $e $s, rethrow, dan penandaan kapan init di main(). Berguna untuk proyek yang memakai Supabase sebagai backend.
---

# Skill: supabase

# Integrasi Supabase (PostgREST) di Flutter

Panduan pola integrasi Supabase pada proyek Flutter: singleton klien idempotent, operasi CRUD generik, dan penempatan inisialisasi di `main()`.

## Cakupan yang Di-Cover

- Package: `supabase_flutter` (`Supabase`, `SupabaseClient`, `Supabase.initialize`), `flutter_riverpod` (`Provider`), `share_global_saya` (`L`)
- Class: `SupabaseKlien`, `OperasiSupabase`
- Method: `inisialisasi(...)`, `client` (getter), `ambil`, `tambah`, `ubah`, `hapus`, `tambahBatch`

## Aturan

1. Klien Supabase **WAJIB** berupa singleton dengan konstruktor privat (`_internal`) dan instance statis (`static final ... instance`).
2. Getter `client` **WAJIB** melempar `StateError` bila `inisialisasi()` belum dipanggil; jangan mengembalikan `null` atau membuat klien diam-diam.
3. `inisialisasi(...)` **WAJIB** idempoten: pemanggilan kedua dilewati dengan log peringatan (`L.w`), bukan melempar error.
4. Validasi input **WAJIB** sebelum init: `url` tidak boleh kosong; minimal salah satu dari `publishableKey`/`anonKey` harus diisi; lempar `ArgumentError` bila tidak.
5. Inisialisasi **WAJIB** dipanggil sekali di `main()` sebelum `runApp`, dengan konfigurasi dari environment (`String.fromEnvironment`), bukan hardcode.
6. Operasi CRUD generik **WAJIB** memakai `L.i`/`L.w`/`L.e` dengan nilai aktual dan `rethrow` pada `catch (e, s)` dengan `$e $s`.
7. Query `ambil` **WAJIB** mendukung filter (`match`), pengurutan (`order`), dan paginasi (`limit`/`range`); `range` dihitung `offset..offset+limit-1` bila `limit` ada, atau `offset..offset+999` bila tidak.
8. `tambahBatch` **WAJIB** membatalkan operasi bila daftar kosong (log `L.w`) sebelum menyentuh jaringan.
9. Operasi **WAJIB** memakai `Map<String, Object>.from(filter)` saat memanggil `.match(...)` untuk keamanan tipe.
10. Penyediaan instance **WAJIB** lewat `Provider<OperasiSupabase>` (Riverpod) agar mudah di-override pada test.
11. Nama tabel/kolom **WAJIB** memakai konstanta skema (`XxxSkema`) bila tersedia, bukan string literal (lihat skill `konstanta-skema-tabel`).

## Contoh Benar

```dart
class SupabaseKlien {
  SupabaseKlien._internal();
  static final SupabaseKlien instance = SupabaseKlien._internal();

  bool _sudahDiinisialisasi = false;

  SupabaseClient get client {
    if (!_sudahDiinisialisasi) {
      throw StateError(
        'SupabaseKlien belum diinisialisasi. '
        'Panggil SupabaseKlien.instance.inisialisasi() di main() terlebih dahulu.',
      );
    }
    return Supabase.instance.client;
  }

  Future<void> inisialisasi({
    required String url,
    String? publishableKey,
    String? anonKey,
  }) async {
    if (_sudahDiinisialisasi) {
      L.w('SupabaseKlien sudah diinisialisasi; pemanggilan dilewati.');
      return;
    }
    final pk = publishableKey?.trim();
    final ak = anonKey?.trim();
    if (url.trim().isEmpty) {
      throw ArgumentError('url Supabase tidak boleh kosong.');
    }
    if ((pk == null || pk.isEmpty) && (ak == null || ak.isEmpty)) {
      throw ArgumentError(
        'publishableKey atau anonKey Supabase tidak boleh kosong.',
      );
    }
    L.i('Memulai inisialisasi Supabase (url: $url).');
    try {
      await Supabase.initialize(url: url, publishableKey: pk, anonKey: ak);
      _sudahDiinisialisasi = true;
      L.i('Supabase berhasil diinisialisasi.');
    } catch (e, s) {
      L.e('Gagal inisialisasi Supabase: $e $s');
      rethrow;
    }
  }

  bool get sudahDiinisialisasi => _sudahDiinisialisasi;
}
```

```dart
class OperasiSupabase {
  Future<List<Map<String, dynamic>>> ambil(
    String tabel, {
    String select = '*',
    Map<String, dynamic>? filter,
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  }) async {
    L.i('Memulai ambil data dari Supabase tabel: $tabel');
    try {
      final client = SupabaseKlien.instance.client;
      dynamic query = client.from(tabel).select(select);
      if (filter != null && filter.isNotEmpty) {
        query = query.match(Map<String, Object>.from(filter));
      }
      if (orderBy != null && orderBy.trim().isNotEmpty) {
        query = query.order(orderBy, ascending: ascending);
      }
      if (limit != null) query = query.limit(limit);
      if (offset != null) {
        final to = (limit != null) ? offset + limit - 1 : offset + 999;
        query = query.range(offset, to);
      }
      final hasil = await query;
      final list = (hasil as List).cast<Map<String, dynamic>>();
      L.i('Berhasil mengambil ${list.length} data dari Supabase tabel: $tabel');
      return list;
    } catch (e, s) {
      L.e('Gagal ambil data dari Supabase tabel: $tabel Error: $e $s');
      rethrow;
    }
  }

  Future<void> tambahBatch(
    String tabel,
    List<Map<String, dynamic>> daftarData,
  ) async {
    if (daftarData.isEmpty) {
      L.w('Daftar data batch kosong, operasi dibatalkan: $tabel');
      return;
    }
    L.i('Memulai tambahBatch ke Supabase tabel: $tabel total: ${daftarData.length}');
    try {
      final client = SupabaseKlien.instance.client;
      await client.from(tabel).insert(daftarData);
      L.i('Berhasil tambahBatch ke Supabase tabel: $tabel');
    } catch (e, s) {
      L.e('Gagal tambahBatch ke Supabase tabel: $tabel Error: $e $s');
      rethrow;
    }
  }
}

final operasiSupabaseProvider = Provider<OperasiSupabase>((ref) {
  return OperasiSupabase();
});
```

```dart
// main.dart
await SupabaseKlien.instance.inisialisasi(
  url: const String.fromEnvironment('SUPABASE_URL'),
  publishableKey: const String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY'),
);
```

## Contoh Salah

```dart
// DILARANG: getter client mengembalikan null diam-diam
SupabaseClient? get client => _sudahDiinisialisasi ? Supabase.instance.client : null;
```

```dart
// DILARANG: init tanpa validasi / hardcode URL
await Supabase.initialize(url: 'https://xxx.supabase.co', anonKey: 'anon');
```

```dart
// DILARANG: catch tanpa $s / tanpa rethrow
try {
  await client.from(tabel).select();
} catch (e) {
  L.e('Gagal: $e');
}
```

```dart
// DILARANG: tambahBatch tanpa guard kosong
Future<void> tambahBatch(String tabel, List<Map<String, dynamic>> data) async {
  final client = SupabaseKlien.instance.client;
  await client.from(tabel).insert(data); // data kosong tetap dikirim
}
```


===== .agents/skills/text-form-field-validasi/SKILL.md =====
---
name: text-form-field-validasi
description: "Trigger: saat membuat input teks dengan validasi | Panduan TextFormField, TextEditingController, Form, GlobalKey, dan validasi sebelum penyimpanan. TextFormField dan Validasi Form Menggunakan `TextFormField` dengan `TextEditingController`, `Form`, `GlobalKey<FormState>`, dan validasi input sebelum menyimpan data. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/material/text_form_field.dart`, `lib/src/material/form.dart`) - Class: `TextFormField`, `TextEditingController`, `Form`, `GlobalKey<FormState>`, `FormFieldState`, `InputDecoration`, `TextInputType`, `TextInputAction`, `FocusNode` - Properti: `TextFormField.controller`, `TextFormField.validator`, `TextFormField.decoration`, `TextFormField.keyboardType`, `TextFormField.textInputAction`, `TextFormField.obscureText`, `TextFormField.maxLines`, `TextFormField.minLines`, `TextFormField.enabled`, `TextFormField.readOnly`, `Form.key`, `Form.autovalidateMode`, `Form.onChanged`, `FormFieldState.value`, `FormFieldState.validate`, `FormFieldState.r"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Sun Nov 22 2026 18:00 WIB"
---

# TextFormField dan Validasi Form

Menggunakan `TextFormField` dengan `TextEditingController`, `Form`, `GlobalKey<FormState>`, dan validasi input sebelum menyimpan data.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/material/text_form_field.dart`, `lib/src/material/form.dart`)
- Class: `TextFormField`, `TextEditingController`, `Form`, `GlobalKey<FormState>`, `FormFieldState`, `InputDecoration`, `TextInputType`, `TextInputAction`, `FocusNode`
- Properti: `TextFormField.controller`, `TextFormField.validator`, `TextFormField.decoration`, `TextFormField.keyboardType`, `TextFormField.textInputAction`, `TextFormField.obscureText`, `TextFormField.maxLines`, `TextFormField.minLines`, `TextFormField.enabled`, `TextFormField.readOnly`, `Form.key`, `Form.autovalidateMode`, `Form.onChanged`, `FormFieldState.value`, `FormFieldState.validate`, `FormFieldState.reset`
- Method: `TextEditingController.text`, `TextEditingController.clear`, `TextEditingController.dispose`, `FocusNode.requestFocus`, `FocusNode.unfocus`, `GlobalKey.currentState?.validate()`, `GlobalKey.currentState?.save()`, `GlobalKey.currentState?.reset()`
- Enum: `AutovalidateMode.disabled`, `AutovalidateMode.onUserInteraction`, `AutovalidateMode.onUnfocus`, `AutovalidateMode.always`

## Aturan

1. Setiap `TextFormField` yang perlu nilainya disimpan harus memiliki `TextEditingController`.
2. `TextEditingController` harus di-`dispose()` di `State.dispose()` untuk mencegah memory leak.
3. `validator` pada `TextFormField` mengembalikan `String?`; null berarti valid, string berisi pesan error.
4. `Form` dengan `GlobalKey<FormState>` untuk memvalidasi seluruh field sekaligus sebelum penyimpanan.
5. Panggil `formKey.currentState?.validate()` sebelum menyimpan; jika false, jangan lanjutkan penyimpanan.
6. Jangan gunakan `?? 0` atau nilai default untuk menyembunyikan input yang tidak valid; validasi harus gagal dan memberikan feedback.
7. `autovalidateMode = AutovalidateMode.onUserInteraction` untuk validasi real-time saat user mengetik; `disabled` untuk validasi hanya saat tombol simpan ditekan; `onUserInteractionIfError` (dipakai default `InputTeks`) memvalidasi saat user berinteraksi jika sebelumnya sudah error.
8. `keyboardType = TextInputType.number` untuk input angka; gabungkan dengan `inputFormatters` (FilteringTextInputFormatter.digitsOnly) untuk mencegah input non-angka.
9. `obscureText = true` untuk input sandi; sertakan `suffixIcon` untuk toggle tampilan sandi.
10. `FocusNode` untuk pindah fokus antar field (mis. `nextFocus` atau manual `requestFocus`).
11. `controller.addListener(() => setState(() {}))` jika perlu merespon perubahan teks secara real-time.
12. `enabled = false` untuk field non-aktif; `readOnly = true` jika field hanya bisa dibaca tapi masih bisa difokus/dicopy.

## Larangan

- `TextEditingController` tanpa dispose (memory leak).
- Menyimpan data tanpa memanggil `validate()` terlebih dahulu.
- Menggunakan `?? 0` atau `int.tryParse(...) ?? 0` untuk menangani input invalid tanpa feedback ke user.
- `validator` yang selalu mengembalikan null (validasi tidak berfungsi).
- `TextFormField` tanpa `controller` jika nilainya perlu diakses secara terprogram.

## Contoh Benar

```dart
class _FormBiodataState extends State<FormBiodata> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jumlahRokokController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahRokokController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState?.validate() != true) {
      return; // validasi gagal, jangan lanjutkan
    }
    // lanjutkan penyimpanan
    final nama = _namaController.text;
    final jumlah = int.tryParse(_jumlahRokokController.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          TextFormField(
            controller: _namaController,
            decoration: const InputDecoration(labelText: 'Nama'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _jumlahRokokController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Jumlah Rokok per Hari'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Jumlah tidak boleh kosong';
              }
              final angka = int.tryParse(value);
              if (angka == null || angka < 0) {
                return 'Masukkan angka valid';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _simpan,
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
```

## Contoh Salah

```dart
// menyimpan tanpa validasi + masking invalid input dengan ?? 0
void _simpan() {
  final jumlah = int.tryParse(_controller.text) ?? 0; // DILARANG: menyembunyikan input invalid
  repo.simpan(jumlah); // tersimpan meski input tidak valid
}
```

```dart
// controller tidak di-dispose
@override
void dispose() {
  super.dispose();
  // _controller.dispose() hilang -> memory leak
}
```

## `InputTeks` (share_global_saya)

`InputTeks` (`lib/src/widget/input/input_teks.dart`) adalah pembungkus terstandar `TextFormField` untuk proyek yang bergantung pada `share_global_saya`. Pakai widget ini bila ingin satu gaya field; untuk kebutuhan di luar cakupannya (lihat catatan) tetap gunakan `TextFormField` mentah.

API utama:

- `controller` (wajib), `label`, `wajib` (default `true`), `validator` opsional (default `'$label wajib diisi'` — cacat bila `label` null: pesan "null wajib diisi"; sediakan `validator` sendiri bila `label` null).
- `autovalidateMode` (default `AutovalidateMode.onUserInteractionIfError`), `textInputAction` (default `next`), `focusNode`/`nextFocusNode` (auto-advance fokus pada `onFieldSubmitted`; `done` → unfocus), `enabled`, `onSubmitted`, `maxLength`.
- `minLines`/`maxLines` (default 1/1), `maxHeight`/`minHeight` (membungkus `ConstrainedBox`), `isDense`, `expands`, `contentPadding`, `textCapitalization`, `autofocus`.
- `prefixIcon`/`suffixIcon` (`IconButton` + `onSuffixIconPressed`), `suffixIconColor`, `suffixText`/`suffixStyle`, `hintText`/`hintStyle`, `helperText`/`helperStyle`, `style`.
- Warna: `borderColor`, `focusedBorderColor` (default `colorScheme.primary`, width 2), `iconColor`, `cursorColor`, `labelColor`, `filled`/`fillColor`.
- Border radius 8; `onTapOutside` → `FocusScope.unfocus()`.

Catatan: TIDAK mengekspos `keyboardType`, `obscureText`, `inputFormatters`, `readOnly` — untuk input sandi/angka murni gunakan `TextFormField` mentah (atau perluasan widget, di luar cakupan skill ini).


===== .agents/skills/theme-data-color-schema/SKILL.md =====
---
name: theme-data-color-schema
description: "Trigger: saat mengonfigurasi tema aplikasi | Panduan ThemeData, ColorScheme, textTheme, useMaterial3 untuk konsistensi visual. ThemeData, ColorScheme, dan Typografi Tema Mengonfigurasi `ThemeData` dan `ColorScheme` agar warna, tipografi, dan visual konsisten di seluruh aplikasi, dengan dukungan light/dark mode. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/material/theme_data.dart`, `lib/src/material/color_scheme.dart`) - Class: `ThemeData`, `ColorScheme`, `TextTheme`, `TextStyle`, `ButtonStyle`, `InputDecorationTheme`, `DividerThemeData` - Enum: `Brightness.light`, `Brightness.dark` - Properti: `useMaterial3`, `brightness`, `colorScheme`, `textTheme`, `primaryColor`, `primaryColorLight`, `primaryColorDark`, `accentColor`, `scaffoldBackgroundColor`, `cardTheme`, `elevatedButtonTheme`, `outlinedButtonTheme`, `textButtonTheme`, `inputDecorationTheme`, `dividerTheme`, `appBarTheme`, `bottomNavigationBarTheme`, `dialogTheme`, `popupMenuTheme`, `checkboxTheme`, `radioTheme`, `switchTheme`, `sli"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# ThemeData, ColorScheme, dan Typografi Tema

Mengonfigurasi `ThemeData` dan `ColorScheme` agar warna, tipografi, dan visual konsisten di seluruh aplikasi, dengan dukungan light/dark mode.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/material/theme_data.dart`, `lib/src/material/color_scheme.dart`)
- Class: `ThemeData`, `ColorScheme`, `TextTheme`, `TextStyle`, `ButtonStyle`, `InputDecorationTheme`, `DividerThemeData`
- Enum: `Brightness.light`, `Brightness.dark`
- Properti: `useMaterial3`, `brightness`, `colorScheme`, `textTheme`, `primaryColor`, `primaryColorLight`, `primaryColorDark`, `accentColor`, `scaffoldBackgroundColor`, `cardTheme`, `elevatedButtonTheme`, `outlinedButtonTheme`, `textButtonTheme`, `inputDecorationTheme`, `dividerTheme`, `appBarTheme`, `bottomNavigationBarTheme`, `dialogTheme`, `popupMenuTheme`, `checkboxTheme`, `radioTheme`, `switchTheme`, `sliderTheme`, `progressIndicatorTheme`, `tabBarTheme`, `tooltipTheme`, `snackBarTheme`, `bottomSheetTheme`
- Method: `ColorScheme.fromSeed`, `ColorScheme.light`, `ColorScheme.dark`, `TextTheme.apply`, `TextStyle.copyWith`, `ThemeData.copyWith`, `ThemeData.light`, `ThemeData.dark`

## Aturan

1. Gunakan `useMaterial3: true` untuk tema modern dengan `ColorScheme` sebagai sumber kebenaran warna.
2. `ColorScheme.fromSeed(seedColor)` menghasilkan skema warna lengkap (primary, secondary, tertiary, surface, background, error, onPrimary, onSecondary, onSurface, onBackground, onError, outline, inversePrimary, scrim) dari satu warna seed.
3. `ColorScheme.light` / `ColorScheme.dark` untuk skema warna bawaan sesuai brightness.
4. `colorScheme.primary` digunakan untuk elemen interaktif utama (tombol, app bar, progress indicator).
5. `colorScheme.onPrimary` untuk teks/ikon di atas warna primary agar kontras.
6. `colorScheme.surface` untuk latar kertas/kartu, `colorScheme.onSurface` untuk teks di atas surface.
7. `colorScheme.error` untuk pesan error dan validasi form, `colorScheme.onError` untuk teks di atas error.
8. `textTheme.bodyLarge/bodyMedium/bodySmall` untuk teks tubuh, `titleLarge/titleMedium/titleSmall` untuk judul, `displayLarge` untuk judul besar layar.
9. Gunakan `textTheme.titleLarge?.copyWith(...)` untuk menurunkan gaya teks dari tema, jangan hardcode ukuran/warna.
10. `scaffoldBackgroundColor` harus sama dengan `colorScheme.surface` atau `colorScheme.background` untuk konsistensi.
11. `cardTheme.color` default diambil dari `colorScheme.surfaceContainerHigh` (M3) atau `colorScheme.surface` (M2).
12. `dividerTheme.color` diambil dari `colorScheme.outline` atau `colorScheme.outlineVariant`.
13. Jika `useMaterial3: false`, warna diturunkan dari `primaryColor` / `accentColor` (M2 legacy), tidak dari `ColorScheme`.

## Larangan

- Hardcode warna (mis. `Colors.blue`, `Color(0xFF...)`) di widget tanpa melalui `Theme.of(context).colorScheme`.
- Menggunakan `primaryColor` untuk latar layar utama (gunakan `scaffoldBackgroundColor` atau `colorScheme.surface`).
- `colorScheme` dengan brightness yang tidak sesuai (`darkTheme` harus `brightness: Brightness.dark`).
- Mengabaikan `onPrimary` / `onSurface` untuk kontras teks pada warna latar.

## Contoh Benar

```dart
final skemaWarna = ColorScheme.fromSeed(
  seedColor: const Color(0xFF2E7D32), // hijau untuk tema berhenti merokok
  brightness: Brightness.light,
);

final tema = ThemeData(
  useMaterial3: true,
  colorScheme: skemaWarna,
  scaffoldBackgroundColor: skemaWarna.surface,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: skemaWarna.primary,
      foregroundColor: skemaWarna.onPrimary,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: skemaWarna.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: skemaWarna.outline),
    ),
  ),
);
```

## Contoh Salah

```dart
// hardcode warna tanpa melalui tema
Container(color: Colors.green); // DILARANG

// textStyle hardcode tanpa copyWith dari tema
Text('Judul', style: const TextStyle(fontSize: 20, color: Colors.black)); // DILARANG
```

```dart
// darkTheme dengan brightness light
darkTheme: ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.light),
  brightness: Brightness.light, // salah untuk dark theme
);
```


===== .agents/skills/tipografi/SKILL.md =====
---
name: tipografi
description: "Trigger: saat mengatur tipografi | Panduan: Theme.of(context).textTheme utama, copyWith untuk kustomisasi, DILARANG TextStyle(fontSize:...) manual tanpa textTheme, paket `google_fonts` wajib, hierarki label/sub-label/nilai, bold terarah, FontFeature.tabularFigures() untuk angka/timer, FittedBox/Flexible secukupnya. Panduan Tipografi Skill ini mendokumentasikan aturan tipografi berdasarkan `optimasi_ui.md` dan implementasi nyata di proyek Flutter. Cakupan yang Di-Cover - Package: `package:flutter` (class `ThemeData`, `TextTheme`, `TextStyle`, `FontFeature`, `TextOverflow`, `FittedBox`, `Flexible`, `Expanded`) - Package: `google_fonts` (`GoogleFonts.<namaFont>`, `GoogleFonts.interTextTheme`) - Class: `ThemeData`, `TextTheme`, `TextStyle`, `FontFeature`, `FittedBox`, `Flexible`, `Expanded` - Properti: `ThemeData.textTheme`, `TextStyle.fontSize`, `TextStyle.fontWeight`, `TextStyle.color`, `TextStyle.fontFeatures`, `TextOverflow.ellipsis` - Method: `Theme.of(context)`, `TextStyle.copyWith()` Aturan 1. Wajib menggunakan `Theme.of(context).textTheme` sebagai referensi uta"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Sun Nov 22 2026 12:45 WIB"
---

# Panduan Tipografi

Skill ini mendokumentasikan aturan tipografi berdasarkan `optimasi_ui.md` dan implementasi nyata di proyek Flutter.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `ThemeData`, `TextTheme`, `TextStyle`, `FontFeature`, `TextOverflow`, `FittedBox`, `Flexible`, `Expanded`)
- Package: `google_fonts` (`GoogleFonts.<namaFont>`, `GoogleFonts.interTextTheme`)
- Class: `ThemeData`, `TextTheme`, `TextStyle`, `FontFeature`, `FittedBox`, `Flexible`, `Expanded`
- Properti: `ThemeData.textTheme`, `TextStyle.fontSize`, `TextStyle.fontWeight`, `TextStyle.color`, `TextStyle.fontFeatures`, `TextOverflow.ellipsis`
- Method: `Theme.of(context)`, `TextStyle.copyWith()`

## Aturan

1. Wajib menggunakan `Theme.of(context).textTheme` sebagai referensi utama gaya teks.
2. Wajib menggunakan `copyWith()` untuk menyesuaikan (bold, warna, ukuran) dari style dasar tema.
3. DILARANG menentukan `fontSize`, `fontWeight`, `fontFamily` manual tanpa acuan `textTheme` (kecuali hardcode diperlukan khusus).
4. Setiap tingkat teks wajib memiliki perbedaan minimal 1 properti gaya (ukuran, ketebalan, warna).
5. DILARANG dua tingkat informasi berbeda menggunakan gaya identik.
6. Wajib gunakan bold untuk judul halaman, informasi utama, nilai penting, elemen butuh penekanan.
7. DILARANG bold pada seluruh teks.
8. Wajib menggunakan `FontFeature.tabularFigures()` untuk timer, jam, dan angka monetary agar lebar digit sama.
9. Wajib antisipasi teks panjang yang bisa overflow dengan `FittedBox` atau `Flexible` hanya pada bagian yang benar-benar butuh.
10. Wajib menggunakan paket `google_fonts` untuk seluruh `TextTheme`/gaya teks (mis. `GoogleFonts.interTextTheme(...)` atau `GoogleFonts.<namaFont>(...)`); DILARANG menambahkan/menggunakan font sebagai aset manual (`assets/fonts/*.ttf`/`.otf`) di `pubspec.yaml`, kecuali proyek sudah mewajibkan font tertentu dengan persetujuan pengguna.

## Larangan

- DILARANG `TextStyle(fontSize: ..., fontWeight: ...)` manual tanpa `textTheme`.
- DILARANG hierarki visual dengan gaya identik untuk tingkat berbeda.
- DILARANG bold sembarangan tanpa hierarki jelas.
- DILARANG `FittedBox`/`Flexible` di seluruh teks tanpa alasan.
- DILARANG menambahkan font sebagai aset manual (`assets/fonts/`); seluruh font wajib lewat paket `google_fonts`.

## Contoh Benar

```dart
final textTheme = Theme.of(context).textTheme;

// BENAR: Berbasis textTheme + copyWith
Text(
  'Judul Halaman',
  style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
)
Text(
  'Deskripsi',
  style: textTheme.bodyMedium?.copyWith(color: textTheme.bodyMedium?.color?.withValues(alpha: 0.7)),
)
Text(
  'Nilai Utama',
  style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
)

// Hierarki visual: Label → Sub-Label → Nilai
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: 4,
  children: [
    Text('Total Pengeluaran', style: textTheme.bodySmall),
    Text('Pengeluaran bulan ini', style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary)),
    Text('Rp500.000', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
  ],
)

// Bold terarah
Text('Hari ke-30', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)), // Nilai penting
Text('Smoke-free', style: textTheme.bodyMedium), // Label biasa

// Tabular figures untuk timer/angka
Text('$menit:$detik', style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold, fontFeatures: const [FontFeature.tabularFigures()]))

// BENAR: textTheme dari google_fonts
theme: ThemeData(
  textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
),
```

## Contoh Salah

```dart
// DILARANG: Manual TextStyle tanpa textTheme
Text('Judul', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
Text('Nilai', style: TextStyle(fontSize: 18, color: Colors.blue))

// DILARANG: Hierarki dengan gaya identik
final style = textTheme.bodyMedium;
Text('Label', style: style)
Text('Sub-Label', style: style)
Text('Nilai', style: style)

// DILARANG: Semua bold
Text('Label', style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold))
Text('Nilai', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))

// DILARANG: FittedBox di semua teks tanpa alasan
FittedBox(child: Text(semuaTeks))
```

```yaml
# pubspec.yaml — DILARANG: font aset manual
flutter:
  fonts:
    - family: Inter
      fonts: [{ asset: assets/fonts/Inter-Regular.ttf }]
```


===== .agents/skills/type-promotion-null-safety/SKILL.md =====
---
name: type-promotion-null-safety
description: "Trigger: saat mengakses field nullable objek model | Panduan type promotion: salin field nullable ke variabel lokal sebelum null-check agar promotion berlaku. Operator `!` DILARANG — gunakan type promotion via variabel lokal universal."
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Sun Nov 22 2026 17:00 WIB"
---

# Type Promotion untuk Null Safety pada Field Objek

Field nullable dari objek model wajib disalin terlebih dahulu ke variabel lokal sebelum digunakan dalam kondisi null-check, agar type promotion berlaku. **Operator `!` (null assertion) DILARANG digunakan untuk memaksakan nilai nullable menjadi non-null; wajib gunakan type promotion via variabel lokal.**

## Aturan

1. Field nullable dari objek model (misalnya `BiodataModel`) wajib disalin terlebih dahulu ke variabel lokal sebelum digunakan dalam kondisi null-check.
2. Setelah penyalinan, gunakan variabel lokal tersebut dalam percabangan `== null` dan pemanggilan fungsi, bukan akses properti objek dengan operator `!`.
3. **Operator `!` DILARANG digunakan pada semua ekspresi nullable** (field model, property widget seperti `widget.pelanggan`, return value fungsi, Map access, dll.). Wajib gunakan type promotion via variabel lokal: `final x = nullableValue; if (x == null) return; // gunakan x di sini`.
4. Pola ini berlaku universal: model, widget, fungsi, koleksi, dan semua konteks nullable.

## Larangan

- Jangan menggunakan `biodata.tanggalLahir!` atau `biodata.tanggalMulaiMerokok!` ketika nilai tersebut dapat disalin ke variabel lokal.
- Jangan mengakses properti nullable secara langsung dengan operator `!` apabila type promotion dapat digunakan.
- Jangan menggunakan `widget.pelanggan!.nama` — gunakan `final pelanggan = widget.pelanggan; if (pelanggan == null) return; pelanggan.nama`.
- Jangan menggunakan `map[key]!` — gunakan `entries`/`putIfAbsent`/`??` (rule 36).
- Jangan mengurutkan import secara sembarangan; ikuti urutan alfabetis.

## Contoh Benar

```dart
// Variabel lokal + early return (type promotion aktif)
final pelanggan = widget.pelanggan;
if (pelanggan == null) return;
_namaController.text = pelanggan.nama; // pelanggan sudah non-null di sini

// Variabel lokal + if != null block
final tanggalLahir = biodata?.tanggalLahir;
final tanggalMulaiMerokok = biodata?.tanggalMulaiMerokok;

_buildItem(
  'Tanggal lahir',
  tanggalLahir == null
      ? 'Belum dipilih'
      : FormatTanggal.formatDasar(tanggalLahir), // tanggalLahir dipromosikan non-null
);

// Map access pakai entries/putIfAbsent (lihat rule 36)
final entry = grouped.entries.elementAt(index);
final value = entry.value; // entry non-null karena dari entries
```

## Contoh Salah

```dart
// DILARANG: operator ! untuk memaksakan non-null
_buildItem(
  'Tanggal lahir',
  biodata.tanggalLahir == null
      ? 'Belum dipilih'
      : FormatTanggal.formatDasar(biodata.tanggalLahir!),
);

// DILARANG: widget property pakai !
_namaController.text = widget.pelanggan!.nama;

// DILARANG: Map access pakai !
final value = map[key]!;
```

## Rujukan

- Rule 27 di `.agents/rules/code.md` (type promotion field model)
- Rule 36 di `.agents/rules/code.md` (Map access tanpa !)
- Rule 49 di `.agents/rules/code.md` (larangan operator ! universal)
- Skill `penanganan-data-null` (indeks penanganan data null)
```


===== .agents/skills/validasi-form-sebelum-penyimpanan/SKILL.md =====
---
name: validasi-form-sebelum-penyimpanan
description: "Trigger: saat memvalidasi form sebelum simpan | Panduan Form + GlobalKey + validate(); jangan masking input tidak valid dengan ?? 0. Validasi Form Sebelum Penyimpanan Form wajib menggunakan `Form` + `GlobalKey<FormState>` + `validate()` sebelum simpan. Jangan masking input tidak valid dengan `?? 0`. Aturan 1. Apabila field menggunakan `TextFormField` atau widget yang menyediakan `validator`, pastikan mekanisme validasinya benar-benar dijalankan sebelum penyimpanan. 2. Jika menggunakan mekanisme `Form`, bungkus field terkait dengan `Form` dan sediakan `GlobalKey<FormState>` atau mekanisme akses form yang sesuai. 3. Panggil `validate()` sebelum menjalankan penyimpanan ke database atau repository. 4. Apabila validasi gagal, hentikan proses penyimpanan. 5. Validasi format angka tidak sama dengan validasi aturan bisnis. 6. Validasi harus mencakup batas nilai sesuai kebutuhan, misalnya nilai wajib lebih besar dari nol. 7. Jangan menganggap `TextInputType.number` atau input formatter sudah menjamin nilai memenuhi at"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Validasi Form Sebelum Penyimpanan

Form wajib menggunakan `Form` + `GlobalKey<FormState>` + `validate()` sebelum simpan. Jangan masking input tidak valid dengan `?? 0`.

## Aturan

1. Apabila field menggunakan `TextFormField` atau widget yang menyediakan `validator`, pastikan mekanisme validasinya benar-benar dijalankan sebelum penyimpanan.
2. Jika menggunakan mekanisme `Form`, bungkus field terkait dengan `Form` dan sediakan `GlobalKey<FormState>` atau mekanisme akses form yang sesuai.
3. Panggil `validate()` sebelum menjalankan penyimpanan ke database atau repository.
4. Apabila validasi gagal, hentikan proses penyimpanan.
5. Validasi format angka tidak sama dengan validasi aturan bisnis.
6. Validasi harus mencakup batas nilai sesuai kebutuhan, misalnya nilai wajib lebih besar dari nol.
7. Jangan menganggap `TextInputType.number` atau input formatter sudah menjamin nilai memenuhi aturan bisnis.
8. Jangan menggunakan nilai pengganti `0` ketika parsing gagal apabila hal tersebut menyembunyikan input yang tidak valid.

## Larangan

- Jangan menyimpan data sebelum memastikan validasi dijalankan dan lulus.
- Jangan mengganti input yang tidak valid dengan nilai default (`0`) tanpa memberi tahu pengguna.
- Jangan mengandalkan tipe keyboard (`TextInputType.number`) sebagai satu-satunya validasi.

## Contoh Benar

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: TextFormField(
    controller: _penurunanController,
    keyboardType: TextInputType.number,
    validator: (value) {
      final n = int.tryParse(value ?? '');
      if (n == null || n <= 0) return 'Wajib bilangan bulat positif';
      return null;
    },
  ),
)

Future<void> _simpan() async {
  if (!(_formKey.currentState?.validate() ?? false)) return;
  // lanjutkan penyimpanan
}
```

## Contoh Salah

```dart
// Tidak ada Form/validate; parsing gagal diganti 0.
penurunanPerMinggu: int.tryParse(_penurunanPerMingguController.text.trim()) ?? 0,
// Menyimpan langsung tanpa validasi.
await ref.read(biodataProvider.notifier).simpan(model);
```

## Rujukan

- Rujuk juga skill `penanganan-data-null` (indeks penanganan data null).


===== .agents/skills/validasi-json-katalog-ketat/SKILL.md =====
---
name: validasi-json-katalog-ketat
description: "Trigger: saat memuat atau memvalidasi data JSON katalog lokal | Panduan validasi ketat katalog JSON: field enum lewat `values.firstWhere(..., orElse: () => throw ...)`, array bertipe string dicek per elemen, objek bersarang dicek `is! Map<String, dynamic>` lalu didelegasikan ke `fromJson` bersarang, exception khusus per domain dengan pesan memuat `id` entri dan nama field, string kosong dianggap `null`, `toJson` kondisional (field `null` tidak ditulis), getter `hasIsi` minimal satu field terisi. Hindari cast langsung, `byName` tanpa konteks, dan fallback diam-diam. Sumber pola: commit `base_coc` `71a69f0` dan `149fe81`. Validasi Ketat JSON Katalog Katalog JSON lokal (aset bundel) adalah data yang dikirim bersama aplikasi; satu entri cacat tidak boleh dimuat diam-diam. Validasi wajib gagal total dengan exception khusus per domain, dan seluruh pesan error wajib memuat `id` entri serta nama field agar katalog cacat mudah ditemukan. Cakupan yang Di-Cover - Package: `dart:core` (`firstWhere`, `orElse`), `package:f"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Tue Nov 17 2026 11:52 WIB"
---

# Validasi Ketat JSON Katalog

Katalog JSON lokal (aset bundel) adalah data yang dikirim bersama aplikasi; satu entri cacat tidak boleh dimuat diam-diam. Validasi wajib gagal total dengan exception khusus per domain, dan seluruh pesan error wajib memuat `id` entri serta nama field agar katalog cacat mudah ditemukan.

## Cakupan yang Di-Cover

- Package: `dart:core` (`firstWhere`, `orElse`), `package:freezed_annotation` (model `@freezed` dengan `fromJson` custom)
- Class: exception khusus per domain (mis. `KatalogGagalException implements Exception` dengan field `pesan`)
- File terkait: `katalog_exception.dart`, `base_layout.dart`, `panduan_base.dart` (pola dari `base_coc`)
- Model: field enum, field array (`List<String>`), field objek bersarang, field opsional string, `toJson` kondisional

## Aturan

1. JSON katalog yang tidak valid wajib menggagalkan pemuatan katalog secara keseluruhan lewat exception khusus per domain (mis. `KatalogGagalException`), bukan dilewati, diganti nilai default, atau di-fallback diam-diam.
2. Field enum wajib diparse dengan `TelEnum.values.firstWhere((e) => e.name == nilai, orElse: () => throw KatalogGagalException(...))` — bukan `switch` manual, bukan `byName` telanjang, bukan `safeParseEnum` dengan fallback default (katalog ≠ database; nilai tak dikenal = katalog cacat).
3. Field array wajib dicek `is! List` → throw; setiap elemen wajib dicek tipenya (mis. `is! String` → throw); nilai tak dikenali → throw dengan pesan memuat nilai salah dan `id` entri.
4. Field objek bersarang wajib dicek `is! Map<String, dynamic>` → throw; delegasikan isinya ke `fromJson` milik model bersarang (validasi berlapis, bukan parse inline).
5. Field string opsional yang kosong dianggap `null` (`nilai.isEmpty ? null : nilai`); field opsional `null` tidak ditulis saat serialisasi (`toJson` kondisional: `if (kekuatan != null) 'kekuatan': kekuatan`).
6. Objek yang seluruh fieldnya opsional wajib menyediakan getter `hasIsi` (`true` bila minimal satu field terisi) agar pemanggil bisa menyembunyikan section kosong.
7. Pesan exception wajib memuat `id` entri dan nama field (mis. `'Field "tags" pada id "$id" harus berupa array.'`) agar sumber cacat langsung teridentifikasi.
8. `fromJson` custom pada model `@freezed` boleh dipakai selama aturan 1–7 dipatuhi; berkas hasil generate tidak diedit manual (lihat skill `model-state-freezed-abstract`).
9. Nilai boolean/angka/array `null` pada field opsional dianggap "tidak ada" (bukan error); eksplisit dibedakan dari tipe yang salah (error).

## Steps

1. Definisikan exception khusus domain (class `implements Exception`, field `pesan`, `toString()` yang jelas) sebelum menulis model.
2. Tulis `fromJson` per model: cek tipe tiap field sebelum dipakai; kumpulkan nilai lewat fungsi pembaca lokal (mis. `String? baca(String kunci)`).
3. Pastikan setiap cabang invalid melempar exception khusus dengan pesan memuat `id` entri dan nama field.
4. Tulis `toJson` kondisional (hanya field terisi) dan getter `hasIsi` bila seluruh field opsional.
5. Tambahkan test: field absen → nilai default/kosong; tipe salah → `throwsA(isA<KatalogGagalException>())`; nilai tak dikenal → `throwsA(isA<KatalogGagalException>())`; `toJson` objek kosong → `{}` bila relevan.
6. Jalankan `dart format`, `dart analyze`, dan `flutter test`.

## Larangan

- DILARANG cast langsung seperti `json['tags'] as List`/`as String?` tanpa cek tipe dan tanpa pesan error memuat `id`.
- DILARANG `enum.values.byName`/`firstWhere` tanpa `orElse` yang melempar exception khusus.
- DILARANG fallback diam-diam (`?? []`, `?? const {}`, `?? ''`) untuk nilai katalog yang cacat; gagal total lebih aman daripada menampilkan base salah.
- DILARANG melewati elemen array yang tidak dikenali tanpa melempar error (kecuali ada aturan eksplisit dengan `id` yang dicatat).
- DILARANG pesan exception tanpa `id` entri atau nama field.
- DILARANG memvalidasi ulang data katalog di lapisan widget/layar; validasi terjadi satu kali di model.
- DILARANG memakai `ParserUtil.safeParseEnum` dengan fallback default untuk katalog (itu pola database, bukan katalog).

## Contoh Benar

Model bersarang `PanduanBase` (opsional, string kosong = `null`, validasi ketat):

```dart
/// Panduan singkat per base: kekuatan, kelemahan, dan saran penempatan trap.
@freezed
abstract class PanduanBase with _$PanduanBase {
  const PanduanBase._();

  const factory PanduanBase({
    String? kekuatan,
    String? kelemahan,
    String? saranTrap,
  }) = _PanduanBase;

  factory PanduanBase.fromJson(Map<String, dynamic> json) {
    String? baca(String kunci) {
      final nilai = json[kunci];
      if (nilai == null) {
        return null;
      }
      if (nilai is! String) {
        throw KatalogGagalException('Field "panduan.$kunci" tidak valid.');
      }
      return nilai.isEmpty ? null : nilai;
    }

    return PanduanBase(
      kekuatan: baca('kekuatan'),
      kelemahan: baca('kelemahan'),
      saranTrap: baca('saranTrap'),
    );
  }

  bool get hasIsi => kekuatan != null || kelemahan != null || saranTrap != null;

  Map<String, dynamic> toJson() {
    return {
      if (kekuatan != null) 'kekuatan': kekuatan,
      if (kelemahan != null) 'kelemahan': kelemahan,
      if (saranTrap != null) 'saranTrap': saranTrap,
    };
  }
}
```

Enum tunggal dari JSON dengan `firstWhere`/`orElse` (di dalam `BaseLayout.fromJson`):

```dart
final tagsRaw = json['tags'];
final tags = <TagStrategi>[];
if (tagsRaw != null) {
  if (tagsRaw is! List) {
    throw KatalogGagalException(
      'Field "tags" pada id "$id" harus berupa array.',
    );
  }
  for (final t in tagsRaw) {
    if (t is! String) {
      throw KatalogGagalException('Nilai tag pada id "$id" tidak valid.');
    }
    tags.add(
      TagStrategi.values.firstWhere(
        (e) => e.name == t,
        orElse: () => throw KatalogGagalException(
          'Nilai tag "$t" pada id "$id" tidak dikenali.',
        ),
      ),
    );
  }
}
```

Field boolean opsional dengan validasi tipe ketat (pola dari commit `c6be80a` di `base_coc`, field `pilihanEditor`):

```dart
bool pilihanEditor = false;
final pilihanRaw = json['pilihanEditor'];
if (pilihanRaw != null) {
  if (pilihanRaw is! bool) {
    throw KatalogGagalException(
      'Field "pilihanEditor" pada id "$id" harus berupa boolean.',
    );
  }
  pilihanEditor = pilihanRaw;
}
```

`toJson` kondisional untuk field boolean (hanya ditulis bila `true`):

```dart
if (pilihanEditor) 'pilihanEditor': pilihanEditor,
```

Objek bersarang pada model induk (validasi tipe dulu, lalu delegasi):

```dart
PanduanBase? panduan;
final panduanRaw = json['panduan'];
if (panduanRaw != null) {
  if (panduanRaw is! Map<String, dynamic>) {
    throw KatalogGagalException(
      'Field "panduan" pada id "$id" harus berupa objek.',
    );
  }
  panduan = PanduanBase.fromJson(panduanRaw);
}
```

## Contoh Salah

```dart
// DILARANG: cast langsung; exception tanpa konteks id; fallback diam-diam
final tags = (json['tags'] as List?)?.cast<String>()
    .map(TagStrategi.values.byName) // byName tanpa orElse → ArgumentError telanjang
    .toList() ?? const []; // katalog cacat dianggap "tidak ada tag"

// DILARANG: safeParseEnum dengan fallback default untuk katalog
final tag = ParserUtil.safeParseEnum(TagStrategi.values, t) ?? TagStrategi.cwl;

// DILARANG: field non-string lolos diam-diam ke UI
final kekuatan = json['kekuatan']?.toString(); // int 42 → "42"
```

```dart
// DILARANG: pesan exception tanpa id entri / nama field
throw KatalogGagalException('tags tidak valid');

// DILARANG: validasi ulang di widget (dua sumber kebenaran)
if (base.tags.isNotEmpty) { /* parsing ulang string di UI */ }
```


===== .agents/skills/validasi-platform-izin/SKILL.md =====
---
name: validasi-platform-izin
description: "Trigger: saat fitur memerlukan platform atau izin | Panduan: cek dukungan platform sebelum API, minta izin sesuai kebijakan OS, periksa hasil izin sebelum mengaktifkan fitur. Validasi Dukungan Platform dan Izin Runtime Periksa dukungan platform sebelum menggunakan API, minta izin sesuai kebijakan OS, periksa hasil izin sebelum mengaktifkan fitur. Aturan 1. Sebelum menggunakan API package, periksa dukungan platform berdasarkan versi package yang terpasang. Jangan mengasumsikan API yang sama tersedia di semua platform. 2. Jangan menampilkan kontrol fitur yang tidak didukung platform (misalnya pengingat terjadwal pada Web/Linux). 3. Permintaan izin harus mengikuti kebijakan sistem operasi dan dilakukan pada konteks yang tepat (setelah interaksi pengguna, bukan saat aplikasi pertama dibuka). 4. Periksa hasil izin sebelum menyatakan fitur berhasil diaktifkan. Jangan menyimpan status aktif jika izin sistem belum tersedia. 5. Pisahkan inisialisasi layanan dari permintaan izin pengguna. Inisialisasi boleh dilakukan s"
metadata:
  kategori: "custom"
  versi: "1.1.0"
  diperbarui: "Thu Nov 19 2026 02:56 WIB"
---

# Validasi Dukungan Platform dan Izin Runtime

Periksa dukungan platform sebelum menggunakan API, minta izin sesuai kebijakan OS, periksa hasil izin sebelum mengaktifkan fitur.

## Aturan

1. Sebelum menggunakan API package, periksa dukungan platform berdasarkan versi package yang terpasang. Jangan mengasumsikan API yang sama tersedia di semua platform.
2. Jangan menampilkan kontrol fitur yang tidak didukung platform (misalnya pengingat terjadwal pada Web/Linux).
3. Permintaan izin harus mengikuti kebijakan sistem operasi dan dilakukan pada konteks yang tepat (setelah interaksi pengguna, bukan saat aplikasi pertama dibuka).
4. Periksa hasil izin sebelum menyatakan fitur berhasil diaktifkan. Jangan menyimpan status aktif jika izin sistem belum tersedia.
5. Pisahkan inisialisasi layanan dari permintaan izin pengguna. Inisialisasi boleh dilakukan saat startup, tetapi izin diminta sesuai kebutuhan fitur.
6. Tangani error platform yang tidak didukung (mis. `UnsupportedError`) secara eksplisit, bukan hanya `Exception`.
7. Layanan Firebase (unggah/unduh/sinkronisasi, termasuk di callback refresh/auto-sync dan jalur tanpa interaksi pengguna) WAJIB di-guard `kIsWeb` bila Firebase Web tidak dikonfigurasi (aplikasi berjalan offline), atau Firebase Web diinisialisasi eksplisit (mis. `firebase_options.dart` + `index.html`); pemanggilan tanpa guard DILARANG — melempar `[core/not-initialized] Firebase has not been correctly initialized`.

## Larangan

- Jangan meminta izin saat aplikasi pertama dibuka tanpa konteks fitur.
- Jangan menyimpan status aktif tanpa memeriksa hasil izin.
- Jangan mengasumsikan API notifikasi terjadwal tersedia di Web/Linux/Windows.
- Jangan memanggil layanan Firebase (unggah/unduh/sinkronisasi, termasuk di callback refresh dan auto-sync) di Web tanpa guard `kIsWeb` — mode offline melempar `[core/not-initialized]`; akses Firestore di Web wajib `Firebase.initializeApp` eksplisit + konfigurasi Web.

## Contoh Benar

```dart
if (kIsWeb) {
  // Jangan tampilkan pengingat terjadwal
} else if (defaultTargetPlatform == TargetPlatform.android) {
  final izin = await mintaIzinAndroid();
  if (!izin) return;
}

// Guard akses layanan Firebase di mode offline
if (kIsWeb) {
  // lewati unggah/unduh — Firebase Web tidak dikonfigurasi
} else {
  await layananUnggahData.unggah(...);
}
```

## Contoh Salah

```dart
// Meminta izin saat aplikasi pertama dibuka tanpa konteks fitur.
await plugin.requestNotificationsPermission();
// Menyimpan status aktif tanpa memeriksa hasil izin.
await setAktif(true);
```


===== .agents/skills/visualisasi-progres-impian/SKILL.md =====
---
name: visualisasi-progres-impian
description: "Trigger: saat memvisualisasikan progres impian atau perayaan | Panduan ImpianProgresHelper, guard divisi nol, SharedPreferences penandaan sekali, AppToast, saldo aktual via MetrikBerhentiHelper, clamp 0-1, VisualTabunganImpian. Visualisasi Progres Impian dan Perayaan Pencapaian Helper murni untuk rasio/sisa/tercapai, guard divisi nol, SharedPreferences penandaan perayaan, AppToast, saldo aktual (fallback estimasi baseline dari biodata) via `MetrikBerhentiHelper`, widget bawaan, clamp rasio. Cakupan yang Di-Cover - Package: `package:flutter` (class `LinearProgressIndicator`, `Stack`, `FractionallySizedBox`, `Container`, `Icon`, `Text`, `ListTile`, `ListView`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:share_global_saya` (class `SharedPrefService`, `AppToast`) - Class: `ImpianProgresHelper`, `VisualTabunganImpian`, `SharedPrefService`, `AppToast`, `LinearProgressIndicator` - Method: `ImpianProgresHelper.rasio()`, `ImpianProgresHelper.tercapai()`, `ImpianProgresHelper.sis"
metadata:
  kategori: "custom"
  versi: "1.2.0"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Visualisasi Progres Impian dan Perayaan Pencapaian

Helper murni untuk rasio/sisa/tercapai, guard divisi nol, SharedPreferences penandaan perayaan, AppToast, saldo aktual (fallback estimasi baseline dari biodata) via `MetrikBerhentiHelper`, widget bawaan, clamp rasio.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `LinearProgressIndicator`, `Stack`, `FractionallySizedBox`, `Container`, `Icon`, `Text`, `ListTile`, `ListView`), `package:flutter_riverpod` (class `AsyncValue`, `ref`, `ConsumerWidget`), `package:share_global_saya` (class `SharedPrefService`, `AppToast`)
- Class: `ImpianProgresHelper`, `VisualTabunganImpian`, `SharedPrefService`, `AppToast`, `LinearProgressIndicator`
- Method: `ImpianProgresHelper.rasio()`, `ImpianProgresHelper.tercapai()`, `ImpianProgresHelper.sisa()`, `SharedPrefService.getStringList()`, `SharedPrefService.setStringList()`, `AppToast.sukses()`, `unawaited()`

## Aturan

1. Perhitungan progres (rasio, sisa, tercapai) diekstrak ke helper murni (class static, private constructor, no BuildContext/provider).
2. Helper wajib guard divisi nol (target <= 0 → return 0.0/false).
3. Penandaan impian diraikan (perayaan sekali) disimpan di `SharedPrefService` (`impian_diraikan`), bukan variabel memori (wajib `SharedPrefService.init()` di `main()` sebelum dipakai).
4. Impian baru tercapai → `AppToast.sukses` perayaan, penandaan via `unawaited()` non-blocking.
5. Layar progres impian wajib watch `biodataProvider` untuk saldo, bukan `totalJumlah` dari `ImpianState`. Saldo wajib: metrik **aktual** (`MetrikBerhentiHelper.hitungUangDihematAktual`) bila ada catatan konsumsi, **fallback estimasi baseline** (`hitungUangDihematEstimasi`) bila belum ada — mis. `final saldo = pakaiAktual ? uangDihematAktual : uangDihematEstimasi;` dengan `pakaiAktual = MetrikBerhentiHelper.hitungJumlahHariTercatat(konsumsiList) > 0`. Saat saldo fallback estimasi, beri label "estimasi" di UI.
6. Widget visual (`VisualTabunganImpian`) pakai komponen bawaan (Stack, LinearProgressIndicator, Icon), no aset baru.
7. Rasio clamp 0.0–1.0 sebelum ke `LinearProgressIndicator`.

## Larangan

- Jangan hitung rasio/sisa/tercapai inline di layar dengan formula berbeda.
- Jangan pakai `totalJumlah` `ImpianState` sebagai saldo; pakai metrik aktual (fallback estimasi) via `MetrikBerhentiHelper`.
- Jangan toast perayaan berulang untuk impian sama (pakai SharedPreferences penandaan).
- Jangan tambah aset gambar/Lottie untuk visual progres.

## Contoh Benar

```dart
// Helper murni tanpa BuildContext/provider
class ImpianProgresHelper {
  const ImpianProgresHelper._();
  static double rasio(double saldo, double target) {
    if (target <= 0) return 0.0; // Guard divisi nol
    return (saldo / target).clamp(0.0, 1.0);
  }
  static bool tercapai(double saldo, double target) {
    if (target <= 0) return false;
    return saldo >= target;
  }
}

// Layar progres: saldo aktual (fallback estimasi), bukan totalJumlah
class ImpianScreenBenar extends ConsumerWidget {
  @override Widget build(BuildContext context, WidgetRef ref) {
    final impianState = ref.watch(impianProvider).requireValue;
    final biodataAsync = ref.watch(biodataProvider);
    final biodata = biodataAsync.asData?.value;
    final konsumsiList = ref.watch(konsumsiRokokProvider).asData?.value.listKonsumsi ?? const [];
    final pakaiAktual = biodata != null && MetrikBerhentiHelper.hitungJumlahHariTercatat(konsumsiList) > 0;
    final saldo = biodata == null
        ? 0.0
        : pakaiAktual
            ? MetrikBerhentiHelper.hitungUangDihematAktual(biodata, konsumsiList)
            : MetrikBerhentiHelper.hitungUangDihematEstimasi(biodata);

    return ListView.builder(itemCount: impianState.list.length, itemBuilder: (_, i) {
      final item = impianState.list[i];
      final rasio = ImpianProgresHelper.rasio(saldo, item.jumlah);
      final tercapai = ImpianProgresHelper.tercapai(saldo, item.jumlah);

      if (tercapai) {
        unawaited(_tandaiDanRaiikan(context, item.id, item.nama));
      }

      return ListTile(
        title: Text(item.nama),
        subtitle: LinearProgressIndicator(value: rasio),
        trailing: tercapai ? const Icon(Icons.celebration, color: Colors.amber) : null,
      );
    });
  }

  Future<void> _tandaiDanRaiikan(BuildContext context, String id, String nama) async {
    // SharedPrefService.init() wajib di main() sebelum dipakai
    final daftar = await SharedPrefService.getStringList('impian_diraikan') ?? <String>[];
    if (!daftar.contains(id)) {
      daftar.add(id);
      await SharedPrefService.setStringList('impian_diraikan', daftar);
      AppToast.sukses(context, 'Selamat! Impian "$nama" telah tercapai!');
    }
  }
}
```

## Contoh Salah

```dart
// DILARANG: Hitung inline di layar dengan formula berbeda
final rasio = uangDihemat <= 0 || item.jumlah <= 0 ? 0 : (uangDihemat / item.jumlah).clamp(0.0, 1.0);

// DILARANG: Pakai totalJumlah sebagai saldo (bukan uangDihemat)
final rasio2 = impianState.totalJumlah <= 0 ? 0 : (impianState.totalJumlah / item.jumlah).clamp(0.0, 1.0);

// DILARANG: Helper tanpa guard divisi nol
class ImpianProgresHelperSalah {
  static double rasio(double saldo, double target) => saldo / target;
}

// DILARANG: Toast berulang tanpa penandaan SharedPreferences
AppToast.sukses(context, 'Tercapai!'); // Muncul setiap build
```


===== .agents/skills/widget-custom/SKILL.md =====
---
name: widget-custom
description: "Trigger: saat membuat widget custom reusable | Indeks: visualisasi-progres-impian, isolasi-widget-timer, empty-state-daftar. Wajib StatelessWidget, pure, aman tema (ColorScheme), Column.spacing. Indeks Widget Custom Reusable Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap widget custom. Jangan menduplikasi isi skill spesifik di sini. Widget custom yang dicantumkan di bawah ini adalah komponen reusable yang sudah teruji di proyek Flutter. Cakupan yang Di-Cover - Package: `package:flutter` (class `StatelessWidget`, `Card`, `Column`, `Row`, `Stack`, `FractionallySizedBox`, `SizedBox`, `Padding`, `SafeArea`, `CircularProgressIndicator`, `FilledButton`, `Icon`, `Text`, `Chip`, `LinearProgressIndicator`) - Class: `VisualTabunganImpian`, `EmptyStateView`, `TimerCravingView` (dan `Napas478View`, `Napas90DetikView`, `BoxBreathingView`, `Grounding54321View`, `UrgeSurfingView`, `DistraksiView`), `_HeaderPemulihan`, `ImpianProgresHelper` - Properti: `rasio`, `saldo`, `target`, `sp"
metadata:
  kategori: "custom"
  versi: "1.1.2"
  diperbarui: "Wed Nov 18 2026 02:35 WIB"
---

# Indeks Widget Custom Reusable

Skill ini berfungsi sebagai indeks/ringkasan yang merujuk ke skill spesifik untuk setiap widget custom. Jangan menduplikasi isi skill spesifik di sini. Widget custom yang dicantumkan di bawah ini adalah komponen reusable yang sudah teruji di proyek Flutter.

## Cakupan yang Di-Cover

- Package: `package:flutter` (class `StatelessWidget`, `Card`, `Column`, `Row`, `Stack`, `FractionallySizedBox`, `SizedBox`, `Padding`, `SafeArea`, `CircularProgressIndicator`, `FilledButton`, `Icon`, `Text`, `Chip`, `LinearProgressIndicator`)
- Class: `VisualTabunganImpian`, `EmptyStateView`, `TimerCravingView` (dan `Napas478View`, `Napas90DetikView`, `BoxBreathingView`, `Grounding54321View`, `UrgeSurfingView`, `DistraksiView`), `_HeaderPemulihan`, `ImpianProgresHelper`
- Properti: `rasio`, `saldo`, `target`, `spacing`, `padding`, `onRetry`
- Method: `ImpianProgresHelper.rasio()`, `ImpianProgresHelper.tercapai()`, `ImpianProgresHelper.sisa()`, `ref.refresh()`

## Aturan

1. Setiap widget custom wajib `StatelessWidget` (tidak butuh state internal kecuali timer yang diisolasi ke widget terpisah).
2. Widget custom harus pure — logika bisnis (hitung rasio, cek tercapai) dilakukan di helper/provider, bukan di widget.
3. Wajib menggunakan `Theme.of(context).colorScheme` untuk warna UI, bukan hardcode (kecuali status semantic yang harus sama di light/dark).
4. Wajib menggunakan `Column.spacing` atau `Row.spacing` untuk jarak antar anak, bukan `SizedBox` berulang.
5. Widget reusable dilarang mengambil tanggung jawab padding tepi layar (kecuali empty/error/loading yang dipakai langsung di `Scaffold.body`).
6. Timer wajib diisolasi ke widget kecil sendiri, dengan `cancel()` di `dispose()` dan cek `mounted` di callback.
7. Tidak boleh menggunakan aset gambar/Lottie untuk visual progres — gunakan `Stack` + `LinearProgressIndicator`/`FractionallySizedBox` + `Icon` bawaan Flutter.
8. Rasio progres wajib di-clamp ke rentang 0.0–1.0 sebelum digunakan di `FractionallySizedBox`/`LinearProgressIndicator`.

## Larangan

- DILARANG timer di widget halaman penuh → isolasi ke widget kecil (lihat `isolasi-widget-timer`).
- DILARANG aset gambar/Lottie untuk progress visual → gunakan `Stack` + `LinearProgressIndicator` + `Icon` (lihat `visualisasi-progres-impian`).
- DILARANG widget reusable ambil tanggung jawab padding tepi layar (kecuali empty/error/loading yang dipakai langsung di `Scaffold.body`) (lihat `spacing`).
- DILARANG logika bisnis (hitung rasio, cek tercapai) di widget → gunakan helper murni (lihat `visualisasi-progres-impian`, `ekstraksi-perhitungan-turunan`).
- DILARANG `LinearProgressIndicator` langsung tanpa custom visual jika kebutuhan visual spesifik.
- DILARANG rasio progres tanpa clamp → `LinearProgressIndicator` error jika > 1.0.

## Contoh Benar

```dart
// Widget custom reusable: StatelessWidget, pure, pakai ColorScheme, pakai spacing
class VisualTabunganImpian extends StatelessWidget {
  const VisualTabunganImpian({
    required this.rasio,
    required this.saldo,
    required this.target,
    super.key,
  });

  final double rasio; // 0.0 - 1.0 (sudah di-clamp oleh helper)
  final double saldo;
  final double target;

  @override
  Widget build(BuildContext context) {
    final bool sudahTercapai = rasio >= 1.0;

    final Color warnaProgres = sudahTercapai
        ? const Color(0xFF4CAF50) // Hardcode diperbolehkan: status sukses
        : Theme.of(context).colorScheme.primary;

    final Color warnaBackground = warnaProgres.withValues(alpha: 0.2);

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
          child: Stack(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: warnaBackground,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              FractionallySizedBox(
                widthFactor: rasio,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: warnaProgres,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sudahTercapai
                  ? 'Target tercapai! 🎉'
                  : 'Terkumpul: ${FormatUang.formatRupiah(saldo)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: sudahTercapai
                    ? const Color(0xFF4CAF50)
                    : Theme.of(context).colorScheme.onSurfaceVariant,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
            if (!sudahTercapai)
              Text(
                'Sisa: ${FormatUang.formatRupiah(ImpianProgresHelper.sisa(saldo, target))}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
```

## Contoh Salah

```dart
// DILARANG: Logika hitung rasio di widget (harus di helper)
class VisualTabunganImpian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rasio = saldo / target; // LOGIKA DI WIDGET - SALAH!
    // ...
  }
}

// DILARANG: LinearProgressIndicator langsung (kurang custom)
LinearProgressIndicator(
  value: rasio,
  backgroundColor: warna.withOpacity(0.2),
)

// DILARANG: Pakai aset Lottie/gambar
Lottie.asset('assets/progress.json')

// DILARANG: withOpacity deprecated
color: warna.withOpacity(0.2)

// DILARANG: Tidak clamp rasio (crash jika > 1.0)
FractionallySizedBox(widthFactor: rasioTanpaClamp)
```


===== .agents/skills/widget-lifecycle-state/SKILL.md =====
---
name: widget-lifecycle-state
description: "Trigger: saat mengelola lifecycle widget | Panduan Widget/State lifecycle: mounted, initState, build, didUpdateWidget, dispose, setState, dependOnInheritedWidgetOfExactType. Lifecycle Widget dan State (Flutter Framework) Mengelola siklus hidup widget dan state agar tidak ada memory leak, setState setelah dispose, atau akses context yang tidak monted. Cakupan yang Di-Cover - Package: `package:flutter` (file `lib/src/widgets/framework.dart`) - Class: `Widget`, `StatelessWidget`, `StatefulWidget`, `State<T>`, `Element`, `BuildContext`, `ComponentElement`, `StatefulElement`, `StatelessElement` - Method siklus: `initState`, `didChangeDependencies`, `build`, `didUpdateWidget`, `deactivate`, `dispose`, `reassemble`, `activate` - Properti: `mounted`, `context`, `widget`, `state`, `dirty` - Fungsi: `setState`, `dependOnInheritedWidgetOfExactType`, `findAncestorWidgetOfExactType`, `findAncestorStateOfType` Aturan 1. `setState` hanya boleh dipanggil ketika `mounted == true`. Cek `mounted` sebelum `setState` di callback "
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Lifecycle Widget dan State (Flutter Framework)

Mengelola siklus hidup widget dan state agar tidak ada memory leak, setState setelah dispose, atau akses context yang tidak monted.

## Cakupan yang Di-Cover

- Package: `package:flutter` (file `lib/src/widgets/framework.dart`)
- Class: `Widget`, `StatelessWidget`, `StatefulWidget`, `State<T>`, `Element`, `BuildContext`, `ComponentElement`, `StatefulElement`, `StatelessElement`
- Method siklus: `initState`, `didChangeDependencies`, `build`, `didUpdateWidget`, `deactivate`, `dispose`, `reassemble`, `activate`
- Properti: `mounted`, `context`, `widget`, `state`, `dirty`
- Fungsi: `setState`, `dependOnInheritedWidgetOfExactType`, `findAncestorWidgetOfExactType`, `findAncestorStateOfType`

## Aturan

1. `setState` hanya boleh dipanggil ketika `mounted == true`. Cek `mounted` sebelum `setState` di callback async/timer.
2. Jangan lakukan operasi async (await) di dalam `setState(() { ... })`. Eksekusi async di luar, lalu panggil `setState` hanya untuk assign nilai.
3. `initState` dipanggil sekali. Gunakan untuk inisialisasi satu kali yang membutuhkan `context` atau `widget`.
4. `didChangeDependencies` dipanggil setelah `initState` dan setiap kali dependensi `InheritedWidget` berubah. Gunakan untuk inisialisasi yang bergantung pada `Theme.of`, `MediaQuery.of`, dll.
5. `didUpdateWidget(oldWidget)` dipanggil ketika konfigurasi widget berubah tetapi `State` tetap sama. Gunakan untuk mulai animasi atau subscribe ulang.
6. `dispose` dipanggil sekali saat widget dilepas dari tree. Lepaskan controller, stream subscription, timer di sini.
7. Jangan cache `BuildContext` di luar eksekusi sinkron satu fungsi. Context bisa invalid setelah unmount.
8. `build` tidak boleh memiliki side effect. Hanya return widget tree.
9. `dependOnInheritedWidgetOfExactType` jangan dipanggil di constructor atau `initState`. Gunakan di `build` atau `didChangeDependencies`.
10. Field state widget (mis. `TextEditingController`, enum) yang dapat diinisialisasi langsung DILARANG dideklarasikan `late`; gunakan inisialisasi langsung (`final x = ...` atau `T _x = default`) dan hapus penugasan di `initState`.

## Larangan

- `setState` setelah `dispose` (cek `mounted` dulu).
- Membandingkan `context` yang disimpan di variabel class setelah frame selesai.
- Memanggil `dependOnInheritedWidgetOfExactType` di `initState` atau constructor.
- Menahan referensi `State` atau `Element` setelah `dispose` (memory leak).
- `async` callback langsung di dalam `setState`.

## Contoh Benar

```dart
class _HalamanBerhentiState extends State<HalamanBerhenti> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = stream.listen((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(HalamanBerhenti oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      // konfigurasi berubah, inisialisasi ulang jika perlu
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context); // aman di build
    return Scaffold(...);
  }
}
```

## Contoh Benar (inisialisasi langsung, tanpa `late`)

```dart
class _FormKategoriPageState extends ConsumerState<FormKategoriPage> {
  TipeKategori _tipe = TipeKategori.pemasukan;
  final TextEditingController _namaController = TextEditingController();
  final _namaFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // penugasan awal tetap boleh dilakukan di initState bila bergantung widget
    if (widget.kategori != null) {
      _tipe = widget.kategori!.tipe;
      _namaController.text = widget.kategori!.nama;
    }
  }
}
```

## Contoh Salah

```dart
// setState setelah await tanpa cek mounted
setState(() {
  _data = await repo.fetch(); // ERROR: async di setState
});
```

```dart
// dependOnInheritedWidgetOfExactType di initState
@override
void initState() {
  super.initState();
  final warna = Theme.of(context).colorScheme.primary; // BISA error, konteks belum siap
}
```


===== .agents/skills/zona-waktu-perangkat-pengingat/SKILL.md =====
---
name: zona-waktu-perangkat-pengingat
description: "Trigger: saat menjadwalkan pengingat berbasis zona waktu | Panduan flutter_timezone untuk deteksi zona lokal, inisialisasi tz database, fallback Asia/Jakarta, handle error tiap tahap. Zona Waktu Perangkat untuk Pengingat Harian Pengingat harian wajib ikuti zona waktu lokal perangkat, bukan Asia/Jakarta permanen. Deteksi via flutter_timezone, fallback Asia/Jakarta. Cakupan yang Di-Cover - Package: `package:timezone` as `tz` (class `tz`, `TZDateTime`, `Location`), `package:flutter_timezone` (class `FlutterTimezone`) - Class: `tz`, `TZDateTime`, `Location`, `FlutterTimezone` - Method: `tz.initializeTimeZones()`, `tz.getLocation()`, `tz.setLocalLocation()`, `FlutterTimezone.getLocalTimezone()`, `L.i()`, `L.w()`, `L.e()` - Properti: `Location.identifier`, `Location.name` Aturan 1. Pengingat harian wajib mengikuti zona waktu lokal perangkat, bukan `Asia/Jakarta` permanen. 2. Inisialisasi database zona waktu via `tz.initializeTimeZones()` sebelum pencarian/penetapan lokasi. 3. Gunakan `FlutterTimezone.getLocalTimezo"
metadata:
  kategori: "custom"
  versi: "1.0.1"
  diperbarui: "Sun Nov 15 2026 02:10 WIB"
---

# Zona Waktu Perangkat untuk Pengingat Harian

Pengingat harian wajib ikuti zona waktu lokal perangkat, bukan Asia/Jakarta permanen. Deteksi via flutter_timezone, fallback Asia/Jakarta.

## Cakupan yang Di-Cover

- Package: `package:timezone` as `tz` (class `tz`, `TZDateTime`, `Location`), `package:flutter_timezone` (class `FlutterTimezone`)
- Class: `tz`, `TZDateTime`, `Location`, `FlutterTimezone`
- Method: `tz.initializeTimeZones()`, `tz.getLocation()`, `tz.setLocalLocation()`, `FlutterTimezone.getLocalTimezone()`, `L.i()`, `L.w()`, `L.e()`
- Properti: `Location.identifier`, `Location.name`

## Aturan

1. Pengingat harian wajib mengikuti zona waktu lokal perangkat, bukan `Asia/Jakarta` permanen.
2. Inisialisasi database zona waktu via `tz.initializeTimeZones()` sebelum pencarian/penetapan lokasi.
3. Gunakan `FlutterTimezone.getLocalTimezone()` untuk dapatkan zona perangkat.
4. Gunakan properti `identifier` dari `TimezoneInfo` untuk `tz.getLocation(identifier)`.
5. Setelah lokasi ditemukan, set `tz.setLocalLocation(...)` sebelum buat/jadwalkan `TZDateTime`.
6. Jangan gunakan singkatan WIB/WITA/WIT sebagai identifier tanpa validasi. Utamakan identifier dari package.
7. `Asia/Jakarta` hanya fallback jika deteksi/pencarian gagal.
8. Handle error setiap tahap: inisialisasi DB, deteksi perangkat, pencarian lokasi, set lokasi, fallback.
9. Log identifier yang terdeteksi. Fallback → log warning/error.
10. Pastikan zona waktu berhasil diset sebelum lanjut penjadwalan.
11. Fallback Asia/Jakarta gagal → handle sebagai kegagalan inisialisasi.
12. Gunakan exception handling sesuai API package, jangan catch Exception terlalu luas.

## Larangan

- Jangan set `Asia/Jakarta` permanen tanpa deteksi perangkat.
- Jangan inisialisasi database zona waktu (`tz.initializeTimeZones()`) diabaikan.
- Jangan abaikan error deteksi/pencarian/set lokasi.
- Jangan gunakan singkatan WIB/WITA/WIT sebagai identifier tanpa validasi.
- Jangan abaikan hasil null dari `locale` atau `platformBrightness` tanpa fallback.

## Contoh Benar

```dart
Future<void> setupZonaWaktu() async {
  try {
    // Inisialisasi database zona waktu
    tz.initializeTimeZones();

    // Deteksi zona waktu perangkat
    final deviceTz = await FlutterTimezone.getLocalTimezone();
    L.i('deviceTimezone=${deviceTz.identifier}');

    // Gunakan identifier dari TimezoneInfo
    final location = tz.getLocation(deviceTz.identifier);

    // Set lokasi sebelum penjadwalan
    tz.setLocalLocation(location);
    L.i('timezoneSet=${location.name}');
  } catch (e, s) {
    // Fallback ke Asia/Jakarta dengan logging
    L.w('fallbackToAsiaJakarta: $e');
    try {
      final fallback = tz.getLocation('Asia/Jakarta');
      tz.setLocalLocation(fallback);
    } catch (e2, s2) {
      L.e('fallbackFailed: $e2 $s2');
      rethrow;
    }
  }
}
```

## Contoh Salah

```dart
// DILARANG: Set Asia/Jakarta permanen tanpa deteksi perangkat
tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));

// DILARANG: Tidak inisialisasi database zona waktu
// DILARANG: Tidak handle error deteksi/pencarian/set lokasi

// DILARANG: Gunakan singkatan WIB tanpa validasi
tz.setLocalLocation(tz.getLocation('WIB')); // Tidak valid identifier
```

