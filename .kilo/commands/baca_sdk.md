---
description: Membaca source SDK dan pub-cache melalui MCP server Dart agar kode yang dikerjakan sesuai dengan API versi yang benar-benar terpasang.
agent: code
---

# Baca SDK

## Tujuan

Membaca source SDK dan pub-cache terkait menggunakan MCP server Dart agar kode yang dikerjakan sesuai dengan API yang benar-benar tersedia pada versi terpasang.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Gunakan bahasa Indonesia baku pada seluruh laporan.
3. Jangan mengubah kode pada tahap pembacaan SDK.

## Cakupan

- Source Flutter SDK dan Dart SDK yang terpasang.
- Source paket pada pub-cache yang berkaitan dengan pekerjaan saat ini.

## Parameter

- `$ARGUMENTS`: nama paket, class, API, atau berkas yang perlu diperiksa source-nya.
- Jika `$ARGUMENTS` kosong atau tidak jelas: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Alur Kerja

1. **Analyze** — identifikasi API, class, method, atau paket yang perlu diverifikasi dan versinya dari `pubspec.yaml`/`pubspec.lock`.
2. **Plan** — tentukan berkas atau bagian source yang akan dibaca; jangan membaca seluruh SDK.
3. **Execute** — baca source melalui MCP server Dart atau tool `read` pada lokasi yang terverifikasi.
4. **Review** — sesuaikan kode yang dikerjakan dengan signature dan perilaku API pada source tersebut.
5. Bila source tidak dapat diakses: **STOP** dan laporkan keterbatasannya; jangan menyajikan dugaan sebagai fakta.

## Format Laporan

| Objek | Sumber yang dibaca | Temuan (signature/perilaku) | Dampak ke kode |
| --- | --- | --- | --- |
| `<class/API>` | `<path source>` | `<ringkasan>` | `<penyesuaian>` |

## Larangan

- DILARANG mengarang API, parameter, atau perilaku yang tidak terdapat pada source yang dibaca.
- DILARANG mengabaikan versi SDK/paket proyek dan memakai dokumentasi versi lain.
- DILARANG mengubah kode atau konfigurasi tanpa perintah pengguna.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila setiap API yang relevan sudah diverifikasi terhadap source dan laporan disampaikan.
- STOP bila source tidak ditemukan/tidak dapat dibaca; sebutkan objek yang belum terverifikasi.
