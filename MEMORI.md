# MEMORI

Diperbarui: 2026-11-19 (sesi 133)

## Konteks Proyek

- Root `workspace` adalah repositori induk (bukan aplikasi Flutter); berisi aturan, skill, konfigurasi Kilo, snippet, skrip, dan submodule (`share_global_saya`, `admin_wifi` — URL `https://github.com/mbadrudin170-jpg/admin_wifi.git`).
- `lib/main.dart` berada di submodule, bukan root.
- Aturan dibaca dari `.agents/rules/`; skill dari `.agents/skills/code/` dan `.agents/skills/non-code/` (`skills.paths` di `.kilo/kilo.jsonc`).
- Berkas sesi `memori/sesi/sesi_N.md` diarsipkan permanen; tidak boleh dihapus (skill `memori-check`).

## Konvensi dan Aturan

- Seluruh respons, dokumen, dan komentar kode memakai bahasa Indonesia baku.
- Sebelum perintah yang mengubah state repositori (commit, hapus berkas, workflow build), periksa prasyarat (identitas Git, akses jaringan, kompatibilitas versi) dan laporkan; aksi destruktif wajib konfirmasi eksplisit pengguna (sesi 113).
- Setiap skill wajib memiliki berkas poin di `prompt/skill/<nama>.md` dengan nama sama seperti nama skill.
- Berkas `prompt/` hanya memuat poin ringkas + header `diperbarui :` dan `file :`/`ditimpa ke :`; isi final di `.agents/`, `.kilo/`.
- Verifikasi sebelum laporan: `dart format`, `dart analyze`, `flutter test` bila relevan.
- `MEMORI.md` hanya memuat ringkasan durable (jangka panjang); kronologi/detail sesi ada di `memori/sesi/` dan `memori/riwayat_perubahan.md`.

## Status

- Status proyek dan detail perubahan episodic dirujuk ke `memori/sesi/` dan `memori/riwayat_perubahan.md`; `MEMORI.md` tidak memuat riwayat sesi.

## Catatan Teknis

- `admin_wifi` bergantung pada `share_global_saya` via path dependency (`path: ../share_global_saya`) + `flutter_riverpod` (overlay root app).
- Impor material wajib `package:material_ui/material_ui.dart`; `package:flutter/material.dart` deprecated.
- SQLite di web didukung via `sqflite_common_ffi_web`; path database di web hanya nama (IndexedDB).
- Logging wajib memakai `L` dari `share_global_saya`; wrapper log manual per proyek dilarang.
- Overlay log debug wajib membungkus root app dengan `PengelolaOverlayLogDebug` + `L.init(container)`; root `Overlay` manual wajib dibungkus `Localizations` di atas `Directionality`.
- Tujuan informasi yang ditambahkan ke memori: agar setiap model AI dapat mengetahui tentang pengguna (preferensi, konteks, konvensi, keputusan) tanpa pengguna harus menjelaskan ulang; informasi yang dicatat wajib cukup jelas dan tahan lama (durable). (sesi 108)

## Sumber Kebenaran Lain

- Indeks skill: `.agents/rules/kelompok_skill_wajib_non_code.md` (dan `skills-lock.json`).
- Aturan: `.agents/rules/`.
- Riwayat perubahan: `memori/riwayat_perubahan.md`.
- Jejak sesi: `memori/sesi/sesi_N.md`.
