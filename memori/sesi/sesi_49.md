# Sesi 49

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: Kamis, 19 November 2026 (Asia/Jakarta, ±03:43 WIB)
- Command: interaksi langsung (tanpa command)
- Topik: Perbaikan error `[core/not-initialized]` Firebase saat unggah data pelanggan aktif pada mode Web (`admin_wifi`)

## Catatan Sesi

- Awal sesi: membaca `MEMORI.md` (seluruh isi), seluruh berkas `.agents/rules/` (6 berkas), skill `memori-check`; `TZ=Asia/Jakarta date` → 2026-11-19 03:43 WIB.
- Catch-up sync awal sesi: berkas `memori/sesi/*.md` berstatus `Belum Sinkron` milik sesi sebelumnya:
  - `sesi_45.md` — `Berjalan`/`Belum Sinkron`; berisi perubahan nyata; pengguna sebelumnya menjawab "Skip" (tercatat di `sesi_46`/`sesi_47`/`sesi_48`) → tidak disentuh; ambigu, dilaporkan ke pengguna.
  - `sesi_46.md` — `Belum Sinkron`; berisi perubahan nyata; ambigu (sesi paralel) → tidak disentuh; dilaporkan ke pengguna.
  - `sesi_47.md` — `Belum Sinkron`; pekerjaan daftar Agent Manager → tidak disentuh; ambigu, dilaporkan ke pengguna.
  - `sesi_48.md` — `Belum Sinkron` (dibuat sesi paralel, belum bisa diverifikasi) → tidak disentuh; dilaporkan ke pengguna.
  - Tidak ada berkas yatim/kosong yang dapat ditandai sepihak.
- `git status --short` root: memuat perubahan lain yang bukan sesi ini (`code.md`, `kelompok_skill_wajib_non_code.md`, `model-state-freezed-abstract`, `aturan-pubspec`, `disiplin-scope-kerja`, `tambah_kode_keskill.md` terhapus, `admin_wifi` gitlink/`MM sesi_45.md`, `sesi_47.md`, `sesi_48.md` ??, `prompt/...`, `pantau_dan_evaluasi_transkrip.md` ??) — tidak diatribusikan ke sesi ini, tidak disentuh.
- `git -C admin_wifi status --short`: `M lib/fitur/pelanggan_aktif/screens/form_pelanggan_aktif.dart` (berkas tab aktif, perubahan bukan milik sesi ini — dibiarkan).
- Masukan pengguna: tempel transkrip konsol `admin_wifi` saat berjalan di Web (`flutter run -d chrome` diduga). Urutan penting:
  - "Mode Web: Firebase tidak tersedia, unduhan awal dilewati (aplikasi offline)." (splash)
  - Setelah halaman utama & layar pelanggan aktif dimuat: "Memulai pengunggahan data pelanggan aktif ke server." → `[core/not-initialized] Firebase has not been correctly initialized` pada `unggah_data.dart` (`FirebaseFirestore.instance`, baris 29) dipanggil dari `pelanggan_aktif_screen.dart` (baris 96).
- Aturan terkait: `.agents/rules/code.md` Aturan 18 (pemanggilan layanan Firebase WAJIB di-guard `kIsWeb` bila Firebase Web tidak dikonfigurasi; pemanggilan tanpa guard DILARANG); skill terkait `validasi-platform-izin`.
- Pekerjaan sesi: diagnosis selesai; perbaikan kode BELUM dilakukan — pengguna menjawab dengan pertanyaan balik ("apakah firebase di web tidak bisa berjalan") yang sudah dijawab (Firebase Web bisa berjalan bila dikonfigurasi: app web terdaftar di proyek Firebase, `firebase_options.dart` via `flutterfire configure`, `Firebase.initializeApp(options: ...)`, SDK/config Web; proyek saat ini sengaja offline di Web — `main.dart` melewati init saat `kIsWeb`, splash melewati unduhan awal). Keputusan arah perbaikan ditanyakan via tool `question` dua kali; jawaban kedua: **Skip** — tidak ada persetujuan untuk mengubah kode.
- Root cause (terverifikasi dari transkrip konsol + kode):
  - `admin_wifi/lib/main.dart`: init Firebase hanya non-Web (`if (!kIsWeb) { ... Firebase.initializeApp() }`); Web berjalan offline by design.
  - `admin_wifi/lib/splash_screen.dart` (baris ~162–171): blok unduhan awal sudah di-guard `kIsWeb` ("Mode Web: Firebase tidak tersedia, unduhan awal dilewati (aplikasi offline).").
  - `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` baris ~101–111: blok unggah hanya di-guard `koneksiTersedia && forceRefresh` — **tanpa `kIsWeb`**; memanggil `LayananUnggahData()`.
  - `admin_wifi/lib/data/sync/unggah_data.dart` baris 29: konstruktor eager `_firestore = firestore ?? FirebaseFirestore.instance` → melempar `[core/not-initialized]` tepat pada pembuatan instance (sesuai stack trace: `unggah_data.dart 29:52 <fn>` dari `pelanggan_aktif_screen.dart 96:13`).
- Aturan/skill terikat yang relevan: `.agents/rules/code.md` Aturan 18; skill `validasi-platform-izin` Aturan 7 (ditambahkan sesi 47 atas kasus persis ini: `pelanggan_aktif_screen.dart` + `form_kategori.dart`); `validasi-platform-izin` Larangan terkait.
- Call site Firebase lain berpotensi crash serupa di Web (belum di-guard, belum diperbaiki karena di luar keputusan): `halaman/form/form_kategori.dart` (baris ~33, konstruktor di field initializer), `data/services/pengecekan_waktu_sync_services.dart` (baris ~21), `data/services/pengecekan_data_baru.dart` (baris ~16), `data/sync/unduh_data.dart` (baris ~47), `data/operasi/kritik_saran_operasi.dart` (baris ~176), `services/kontrol_aplikasi_service.dart` (baris ~8), `migrasi/migrasi_diarsipkan.dart`, `migrasi/migrasi_timestamp.dart`.
- Catatan non-fatal lain di log (di luar cakupan): izin notifikasi ditolak di Web; mode Web memakai IndexedDB; error `[core/not-initialized]` kedua ("Gagal memuat data") adalah callback yang sama tertangkap oleh `catch` layar.

## Berkas Terdampak

| Lokasi File              | Status Perubahan | Deskripsi                         |
| ------------------------ | ---------------- | --------------------------------- |
| `memori/sesi/sesi_49.md` | Dibuat           | Berkas sesi aktif (Belum Sinkron) |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan.
