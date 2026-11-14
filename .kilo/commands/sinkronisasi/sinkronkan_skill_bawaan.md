---
description: Menyalin skill terdaftar dari `.agents/skills/<nama>/` ke `.agents/skills/bawaan/<nama>/`, lalu menghapus salinan di root skill, hanya untuk skill yang tercatat pada konfigurasi.
---

# Sinkronkan Skill Bawaan

## Tujuan

Menyeragamkan penempatan skill bawaan: memindahkan skill yang terdaftar pada konfigurasi dari root `.agents/skills/` ke subfolder `bawaan/`.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Sumber daftar: `.config/dart_skills/skills_config.json` dan `skills-lock.json` di root proyek.
3. Gunakan bahasa Indonesia baku pada laporan.

## Cakupan

- Hanya skill yang terdaftar di kedua berkas konfigurasi tersebut.

## Parameter

- `$ARGUMENTS` (opsional): nama skill tertentu yang ingin disinkronkan.
- Jika `$ARGUMENTS` kosong: proses seluruh skill terdaftar.

## Alur Kerja

1. **Analyze** — baca kedua berkas konfigurasi dan bandingkan dengan isi `.agents/skills/` serta `.agents/skills/bawaan/`.
2. **Plan** — susun daftar skill yang akan disalin dan dihapus; tampilkan ringkasannya.
3. **Execute** — salin (timpa) isi folder skill ke `bawaan/`, lalu hapus folder skill tersebut dari root `.agents/skills/`.
4. **Review** — verifikasi isi `bawaan/` sesuai sumber dan root tidak lagi memuat skill terdaftar; pastikan `custom/` dan `bawaan/` tidak tersalin ke dalam `bawaan/`.
5. Bila berkas konfigurasi tidak ditemukan: **STOP** dan laporkan.

## Format Laporan

| Skill | Sumber | Tujuan | Status |
| --- | --- | --- | --- |
| `<nama>` | `.agents/skills/<nama>/` | `.agents/skills/bawaan/<nama>/` | Disalin + root dihapus |

## Larangan

- DILARANG menyalin folder `bawaan/` atau `custom/` ke dalam `bawaan/`.
- DILARANG menyentuh skill yang tidak terdaftar pada kedua berkas konfigurasi.
- DILARANG menghapus skill di `bawaan/` yang tidak terdaftar.
- DILARANG mengubah `SKILL.md` atau isi skill.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila seluruh skill terdaftar berada di `bawaan/` dan salinan root sudah dihapus.
- STOP bila berkas konfigurasi tidak ditemukan atau daftar skill tidak dapat dibaca.
