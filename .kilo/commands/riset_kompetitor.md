---
description: Meriset maksimal 10 aplikasi kompetitor yang belum dianalisis pada `apk_kompetitor.md`, lalu memperbarui `refrensi_apk.md` dengan referensi fitur, UI, UX, dan layout.
agent: code
---

# Riset Kompetitor

## Tujuan

Menganalisis aplikasi kompetitor yang belum dianalisis untuk menemukan referensi fitur, optimalisasi fitur, serta pola UI/UX/layout, lalu memperbarui `refrensi_apk.md`.

## Ketentuan Umum

1. Baca `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan skill `riset-kompetitor` sebelum riset.
2. Gunakan bahasa Indonesia baku.
3. Command ini tidak mengubah kode Dart.

## Cakupan

- `apk_kompetitor.md` (sumber listing) dan `refrensi_apk.md` (keluaran).

## Parameter

- `$ARGUMENTS` (opsional): nama aplikasi atau store yang ingin diprioritaskan.
- Jika `$ARGUMENTS` kosong: ambil maksimal 10 listing berstatus `Belum Dianalisa` sesuai urutan katalog.

## Alur Kerja

1. **Analyze** — tentukan aplikasi sasaran dari dokumen proyek; pilih maksimal 10 listing `Belum Dianalisa`.
2. **Plan** — kelompokkan target riset per listing; verifikasi setiap tautan aplikasi.
3. **Execute** — untuk setiap listing, analisis fitur (hanya yang berjalan di mobile), optimalisasi fitur yang sudah ada, serta pola UI/UX/layout; tandai `Sudah Dianalisa` pada `apk_kompetitor.md`.
4. **Review** — perbarui `refrensi_apk.md`: sertakan link referensi, kelompokkan per fitur dan UI/UX, jelaskan tujuan, dan susun berdasarkan prioritas. Tambahkan section contoh dengan format: `A1 <fitur> — prioritas: <Tinggi/Sedang/Rendah> — ringkasan singkat: <1 kalimat>` (contoh: `A1 Tambah Kopi — prioritas: Sedang — ringkasan singkat: fitur pencatatan konsumsi kopi harian dengan pengingat`).
5. Bila listing kurang dari permintaan atau store tidak dapat diakses: laporkan keterbatasannya, jangan mengarang data.

## Format Laporan

| Listing | Store | Link | Fitur/UI/UX ditemukan | Prioritas |
| --- | --- | --- | --- | --- |
| `<nama>` | `<store>` | `<url>` | `<ringkasan>` | Tinggi/Sedang/Rendah |

Sertakan jumlah listing yang dianalisis dan berkas yang diperbarui.

## Larangan

- DILARANG menganalisis listing berstatus `Sudah Dianalisa` tanpa perintah pengguna.
- DILARANG merekomendasikan fitur yang hanya berjalan di web/desktop.
- DILARANG mengarang link, fitur, atau temuan.
- DILARANG mengubah kode Dart atau berkas selain `apk_kompetitor.md` dan `refrensi_apk.md`.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila maksimal 10 listing dianalisis, status katalog diperbarui, dan `refrensi_apk.md` diperbarui dengan link serta prioritas.
- STOP bila dokumen proyek tidak tersedia, katalog kosong, atau seluruh listing sudah dianalisis.
