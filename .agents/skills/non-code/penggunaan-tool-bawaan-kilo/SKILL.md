---
name: penggunaan-tool-bawaan-kilo
description: Trigger: saat memilih atau memakai tool bawaan Kilo (read, edit, glob, grep, bash, webfetch, dll.) | Panduan pemilihan tool bawaan Kilo: pemetaan kebutuhan ke tool yang tepat, contoh pemanggilan, aturan prioritas tool bawaan atas shell, dan izin deny yang mutlak. Penggunaan Tool Bawaan Kilo Panduan memilih dan memakai tool bawaan Kilo sesuai kebutuhan, beserta contoh pemanggilan dan aturan prioritas atas shell. Cakupan yang Di-Cover - Tool bawaan Kilo yang tersedia pada build saat ini: berkas, web, tugas/perencanaan, sesi/memori, interaksi pengguna, orkestrasi/sistem. - Pemetaan kebutuhan ke tool yang tepat. - Aturan prioritas tool bawaan atas shell dan izin `deny` yang mutlak. - Sumber: `prompt/skill/penggunaan-tool-bawaan-kilo.md` (commit `19177b4`); aturan prioritas lama `prioritas_tool_bawaan.md` (commit `c85674e`) sudah dihapus dan isinya diserap oleh skill ini. Aturan 1. Wajib gunakan tool bawaan Kilo bila ada padanan yang setara dengan kebutuhan; shell (`Bash`) hanya dipakai bila tidak ada tool bawaan 
metadata:
  kategori: "custom"
  versi: "1.3.0"
  diperbarui: "Fri Nov 20 2026 03:02 WIB"
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
   - Cari isi berkas (regex) → `Grep`.
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
10. Saat mendelegasikan pembacaan berkas besar ke subagent, muat skill ini terlebih dahulu dan pastikan subagent melaporkan penanda pemotongan (mis. `[... N characters omitted ...]`) secara eksplisit.

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
