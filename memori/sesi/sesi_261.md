# Sesi 261

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-23 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: Pembaruan skill agar sesuai dengan aturan (permintaan pengguna)

## Catatan Sesi

- Sesi dibuka oleh permintaan pengguna: "kita perbarui skill skill agar sesuai dengan aturan" dan "agar skill skill ini sesuai dengan standart".
- Catch-up sync awal sesi: terdapat banyak berkas `memori/sesi/*.md` ber-status `Belum Sinkron` dari sesi sebelumnya (sesi_45–49, 52, 55, 56, 71, 72, 97, 110, 247, 250, 254, 255, 260, dan lainnya). Isi sebagian besar ambigu (sesi paralel/berisi perubahan nyata, pengguna sebelumnya menjawab "Skip" berkali-kali) → tidak diputuskan sendiri; dilaporkan ke pengguna. Berkas sesi yang sedang aktif di sesi ini tidak ditandai.
- Audit read-only terhadap 70 skill di `.agents/skills/*/SKILL.md` berdasarkan `standar-pembuatan-skill` dilakukan secara otomatis (frontmatter, name, description, em/en dash, panjang body, list). Hasil awal: 69 dari 70 skill memiliki temuan; hanya `perbaikan-test-notifikasi` yang lolos semua pemeriksaan otomatis.
- Perbaikan mekanis otomatis diterapkan pada 68 skill: penghapusan field tambahan di frontmatter (`metadata`, `kategori`, `versi`, `diperbarui`, `model`) sehingga frontmatter hanya memuat `name` dan `description`; penggantian tanda hubung em/en (`—`/`–`) dengan `-`; penambahan baris kosong sebelum daftar (di luar blok kode). Hasil audit ulang: 54 skill masih memiliki temuan, seluruhnya berupa `description` ≥1024 karakter (54 skill), 2 daftar tanpa baris kosong (nested, `memori-check` dan `tipografi`), dan 1 `name` dengan 6 kata (`penjadwalan-frame-dan-pemantauan-performa-flutter`).
- Format deskripsi diubah secara global: "Trigger: " diganti "Gunakan ini saat " pada 69 skill (lalu diperbaiki double "saat").
- Perbaikan satu per satu: skill `penjadwalan-frame-pemantauan-performa-flutter` (rename + description <1024), `aturan-folder-prompt` (description 562), `aturan-pembuatan-commands` (description 261), `aturan-pembuatan-rules` (description 493), `aturan-penamaan` (description 382), `aturan-pubspec` (description 400), `aturan-testing` (description 199), `build-runner-codegen` (description 296), `audit-riwayat-sesi` (description 283), `data-dummy` (description 304), `disiplin-scope-kerja` (description 288), `ekstraksi-perhitungan-turunan` (description 191), `empty-state-daftar` (description 268), `flutter-local-notifications` (description 230), `gaya` (description 219), `material-ui` (description 428), dan `migrasi-skema-sqlite` (description 227) kini lolos pemeriksaan otomatis. `aturan-penggunaan-rg` dan `aturan-riverpod` sudah lolos sebelumnya. Sisa skill dengan `description` ≥1024: 35.
- Catatan: audit ini hanya memeriksa kriteria otomatis standar; isi substansi (kejelasan trigger, contoh, konsistensi dengan aturan) belum diaudit manual.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| `memori/sesi/sesi_261.md` | Dibuat | Berkas sesi aktif (audit + perbaikan mekanis standar skill) |
| `.agents/skills/*/SKILL.md` (68 berkas) | Diubah | Hapus field tambahan frontmatter, ganti em/en dash, perbaiki daftar |
| `.agents/skills/*/SKILL.md` (69 berkas) | Diubah | Format deskripsi "Trigger:" → "Gunakan ini saat" |
| `.agents/skills/penjadwalan-frame-pemantauan-performa-flutter/SKILL.md` | Diubah + rename | Nama 5 kata + description <1024 |
| `.agents/skills/aturan-folder-prompt/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/aturan-pembuatan-commands/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/aturan-pembuatan-rules/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/aturan-penamaan/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/aturan-pubspec/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/aturan-testing/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/build-runner-codegen/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/audit-riwayat-sesi/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/data-dummy/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/disiplin-scope-kerja/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/ekstraksi-perhitungan-turunan/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/empty-state-daftar/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/flutter-local-notifications/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/gaya/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/logging-debug/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/material-ui/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/migrasi-skema-sqlite/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/logging-debug/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/material-app-tema-lokalisasi/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/logging-debug/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/gaya/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/flutter-local-notifications/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/audit-riwayat-sesi/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/data-dummy/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/disiplin-scope-kerja/SKILL.md` | Diubah | Description <1024 |
| `.agents/skills/aturan-penamaan/SKILL.md` | Diubah | Description <1024 |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan
