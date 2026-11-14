# List Model

- `kilo/kilo-auto/free` — model global Kilo (`model`, `small_model`, `subagent_model`); disebut dua kali pada perintah penambahan (2026-11-14, sesi 40), dicatat satu kali di sini.
- `kilo/particle-ai/particle-1:free` — bekas `agent.code.model` (menggantikan `openrouter/thinkingmachines/inkling-2-small:free` pada 2026-11-14 06:10; kemudian digantikan `kilo/reflection/beam-free` pada sesi 22).
- `kilo/reflection/beam-free` — `agent.code.model` saat ini, `variant` = `max` (per 2026-11-14, sesi 22).
- `openrouter/thinkingmachines/inkling-2-small:free` — model yang digunakan pada sesi yang meminta penambahan dokumen ini (2026-11-14, sesi 39); sebelumnya sempat menjadi `agent.code.model` hingga 2026-11-14 06:10.

## Konfigurasi Kilo (kondisi tercatat)

- Sumber kebenaran: `.kilo/kilo.jsonc` (ter-`.gitignore`, jangan dianggap bagian git tree).
- Model global: `model`, `small_model`, `subagent_model` = `kilo/kilo-auto/free`.
- `agent.code`: `model` = `kilo/reflection/beam-free`, `variant` = `max` (per 2026-11-14, sesi 22; sebelumnya `kilo/particle-ai/particle-1:free`).

## Catatan

- Berkas ini hanya pencatatan; tidak memengaruhi `.kilo/kilo.jsonc`.
- Perubahan model agent pada konfigurasi Kilo hanya dilakukan atas permintaan eksplisit pengguna dengan konfirmasi sebelum eksekusi.
