diperbarui : Fri Nov 20 2026 03:02 WIB

file : [penggunaan-tool-bawaan-kilo](../../.agents/skills/non-code/penggunaan-tool-bawaan-kilo/SKILL.md)

# Aturan

1. Wajib gunakan tool bawaan Kilo yang terdaftar di bawah ini bila ada padanan yang setara dengan kebutuhan; shell (`Bash`) hanya dipakai bila tidak ada tool bawaan yang mencukupi.
2. Izin `deny` pada `.kilo/kilo.jsonc` bersifat mutlak; DILARANG diakali lewat interpreter, alias, atau perintah lain.
3. Daftar ini mencakup tool yang tersedia pada build Kilo saat ini. Beberapa tool yang dirujuk aturan proyek (`list`, `todoread`, `lsp`) tidak tersedia sebagai tool terpisah pada build ini; gunakan padanannya (`Read` untuk direktori, `Todowrite` untuk daftar tugas) dan catat ketidaksesuaian bila ditemukan.

4. Saat memeriksa prasyarat berkas, terutama folder hidden (`.github`, `.kilo`, `.agents`), verifikasi dengan Read langsung selain Glob, agar tidak salah menyatakan berkas tidak ada.

5. Saat mendelegasikan pembacaan berkas besar ke subagent, muat skill ini terlebih dahulu dan pastikan subagent melaporkan penanda pemotongan secara eksplisit.

# Daftar Tool

## Tool Berkas

1. `Glob`
   Cocokkan berkas berdasarkan pola. Memungkinkan pencocokan berkas dengan pola glob.
   Contoh: `glob: { pattern: "lib/**/*.dart" }`

2. `Grep`
   Cari isi berkas. Memungkinkan pencarian berbasis regex di dalam berkas.
   Contoh: `grep: { pattern: "class\\s+\\w+", include: "*.dart" }`

3. `Read`
   Baca isi berkas atau direktori. Mendukung offset dan limit untuk pembacaan parsial; membaca direktori akan menampilkan isinya.
   Contoh: `read: { filePath: "lib/main.dart", offset: 1, limit: 50 }`

4. `Edit`
   Penggantian teks tepat pada berkas.
   Contoh: `edit: { filePath: "lib/main.dart", oldString: "foo", newString: "bar" }`

5. `Write`
   Tulis atau timpa isi berkas.
   Contoh: `write: { filePath: "lib/main.dart", content: "..." }`

6. `Bash`
   Jalankan perintah shell dengan pembatasan izin.
   Contoh: `bash: { command: "flutter test", workdir: "base_coc" }`

## Tool Web

7. `Websearch`
   Cari di web. Memungkinkan melakukan pencarian web eksternal.
   Contoh: `websearch: { query: "flutter 3.47 release" }`

8. `Webfetch`
   Ambil URL. Memungkinkan mengambil konten dari URL tertentu.
   Contoh: `webfetch: { url: "https://example.com" }`

## Tool Tugas dan Perencanaan

9. `Todowrite`
   Buat dan perbarui daftar tugas internal.
   Contoh: `todowrite: { todos: [{ content, status, priority }] }`

10. `Task`
    Luncurkan sub-agen. Memungkinkan memulai sub-agen khusus untuk tugas tertentu.
    Contoh: `task: { description, prompt, subagent_type: "explore" }`

11. `Goal`
    Mulai atau lanjutkan sesi goal (tujuan berkelanjutan lintas giliran).
    Contoh: `goal: { action: "start", objective: "..." }`

12. `Goal_report`
    Laporkan sesi goal sebagai selesai atau terblokir.
    Contoh: `goal_report: { status: "complete", reason: "..." }`

13. `Schedule_wakeup`
    Jadwalkan pembangunan sesi pada waktu tertentu.
    Contoh: `schedule_wakeup: { prompt: "...", delay: "5m" }`

14. `Cancel_wakeup`
    Batalkan wakeup yang terjadwal.
    Contoh: `cancel_wakeup: { action: "cancel", id: "..." }`

15. `Cron_create`
    Jadwalkan tugas berulang atau sekali jalan.
    Contoh: `cron_create: { prompt: "...", delay: "10m" }`

16. `Cron_delete`
    Hapus tugas cron yang terjadwal.
    Contoh: `cron_delete: { id: "..." }`

17. `Cron_list`
    Daftar tugas cron yang terjadwal.
    Contoh: `cron_list: {}`

## Tool Sesi dan Memori

18. `Kilo_local_recall`
    Cari atau baca percakapan masa lalu pada proyek ini.
    Contoh: `kilo_local_recall: { mode: "search", query: "..." }`

## Tool Interaksi Pengguna

19. `Question`
    Tanyakan pengguna dengan opsi pilihan.
    Contoh: `question: { questions: [{ question, header, options }] }`

20. `Suggest`
    Sarankan tinjauan kode kepada pengguna.
    Contoh: `suggest: { suggest: "...", actions: [{ label, prompt }] }`

21. `Open_plan`
    Buka berkas rencana di penampil dokumen.
    Contoh: `open_plan: { path: "..." }`

## Tool Orkestrasi dan Sistem

22. `Skill`
    Muat skill. Memungkinkan memuat skill yang telah ditentukan berdasarkan nama.
    Contoh: `skill: { name: "riverpod-pola" }`

23. `Agent_manager`
    Inspeksi, orkestrasi, atau mulai sesi Agent Manager.
    Contoh: `agent_manager: { action: "list" }`

24. `Agent_manager_models`
    Cari model yang tersedia untuk sesi Agent Manager.
    Contoh: `agent_manager_models: { query: "opus" }`

25. `Background_process`
    Jalankan dan kelola proses latar belakang.
    Contoh: `background_process: { action: "monitor", command: "npm run dev" }`

26. `Board_post`
    Kirim pembaruan ke papan bersama sesi task.
    Contoh: `board_post: { to: "...", type: "INFO", body: "..." }`

27. `Board_read`
    Baca papan bersama sesi task.
    Contoh: `board_read: { since: "..." }`

28. `Chart`
    Render grafik (Chart.js v4).
    Contoh: `chart: { title: "...", spec: "{...}" }`
