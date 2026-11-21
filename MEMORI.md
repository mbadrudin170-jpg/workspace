# MEMORI

Diperbarui: 2026-11-20 (sesi 177)

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
- Command Kilo baru (draft poin di `prompt/commands/`, ditimpa ke `.kilo/commands/`): `analisa_kesehatan_kode.md` dan `kerjakan_task.md` (sesi 173, disetujui pengguna).
- Analisa kesehatan kode (sesi 174, 2026-11-20): commit Dart baru `admin_wifi` (`dd0faae`, `06a9eb2`, `bbf0fd1`, `e6fd72d`) dan `share_global_saya` (`705dbdf`) patuh Flutter 3.47.9 / Dart 3.13.7 dan skill terkait; tidak ada ketidaksesuaian baru; Task 1–13 (`catatan.md`/`task.md`) sekarang `selesai` dalam kode. Root tidak ada commit Dart baru. `base_coc` nonaktif (dikomentari `.gitmodules`).
- Tujuan informasi yang ditambahkan ke memori: agar setiap model AI dapat mengetahui tentang pengguna (preferensi, konteks, konvensi, keputusan) tanpa pengguna harus menjelaskan ulang; informasi yang dicatat wajib cukup jelas dan tahan lama (durable). (sesi 108)
- Sesi 172: Mengerjakan 11 task (Kelompok 1-3) pada task.md — perbaikan header path (SQLite, main.dart), logging (hapus narasi/banner separator), migrasi SQLite onUpgrade (blok if oldVersion < N per versi), warna tema (ColorScheme/withValues), spacing (Column.spacing), AppToast ganti SnackBar, konfirmasi simpan (showOkCancelAlertDialog + EasyLoading), enum label getter (MenuPoin), EmptyStateView komponen bersama. Menambahkan EmptyStateView ke share_global_saya; dependency share_global_saya diubah ke path lokal.

- Sesi 175: Memindahkan seluruh logika `DompetOperasi` ke `DompetNotifier` (pola `dompetNotifierGlobal`); `dompet_operasi.dart` dihapus, konsumen diperbarui. Verifikasi `dart analyze`: No issues found. (sesi 175)

- Sesi 176: Build APK release `admin_wifi` via GitHub Actions workflow (`gh workflow run build-apk.yml`) berhasil (run 44803688312, 8m20s). Artefak `app-release-apk` (`admin_wifi-dev-arm64-v8a-release.apk`, ~26.0 MB) diunduh dan diverifikasi di `/tmp/apk/`. Perbaikan CI: checkout `share_global_saya` + symlink path dependency, `.env` dummy untuk analisis, hapus konfigurasi Firebase (tidak dipakai), perbaiki nama file APK output Flutter 3.47. (sesi 176)

## Sumber Kebenaran Lain

- Indeks skill: `.agents/rules/kelompok_skill_wajib_non_code.md` (dan `skills-lock.json`).
- Aturan: `.agents/rules/`.
- Riwayat perubahan: `memori/riwayat_perubahan.md`.
- Jejak sesi: `memori/sesi/sesi_N.md`.
