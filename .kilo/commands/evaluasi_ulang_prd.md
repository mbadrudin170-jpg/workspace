---
description: Mengevaluasi ulang PRD yang ditentukan agar tidak ada kendala saat diimplementasikan, lalu memperbarui statusnya menjadi final.
---

# Evaluasi Ulang PRD

## Tujuan

Menganalisis ulang PRD yang ditentukan agar tidak menimbulkan kendala saat diimplementasikan, lalu menetapkan status dokumen menjadi final.

## Ketentuan Umum

1. Baca `AGENTS.md` dan `.agents/skills/custom/format-prd/SKILL.md`; patuhi keduanya.
2. Gunakan bahasa Indonesia baku.

## Cakupan

- Berkas PRD di folder `prd/` yang disebut pengguna.

## Parameter

- `$ARGUMENTS`: path atau nama berkas PRD (mis. `prd/prd_contoh.md`).
- Jika `$ARGUMENTS` kosong atau berkas tidak ditemukan: **STOP** dan minta pengguna memilih PRD dengan tool `question`.

## Alur Kerja

1. **Analyze** — baca PRD dan periksa konsistensi setiap bagian terhadap `.agents/skills/custom/format-prd/SKILL.md`.
2. **Plan** — identifikasi potensi kendala implementasi (file terdampak, dependensi, alur, kriteria).
3. **Execute** — perbaiki PRD seperlunya; jangan mengubah maksud fitur.
4. **Review** — pastikan seluruh bagian wajib terisi dan tidak ada informasi yang dikarang; perbarui status dokumen menjadi `Final`.
5. Bila ditemukan pertentangan dengan PRD lain: **STOP** dan laporkan sebelum mengubah status.

## Format Laporan

| Bagian PRD | Temuan      | Perbaikan     |
| ---------- | ----------- | ------------- |
| `<bagian>` | `<kendala>` | `<perubahan>` |

Sertakan status akhir dokumen.

## Larangan

- DILARANG mengubah kode Dart atau berkas selain PRD target.
- DILARANG mengubah maksud, cakupan, atau keputusan fitur.
- DILARANG menetapkan `Final` bila masih ada bagian wajib yang kosong atau ambigu.
- DILARANG commit/push.

## Kriteria Selesai / STOP

- Selesai bila PRD konsisten dengan `.agents/skills/custom/format-prd/SKILL.md` dan status dokumen `Final`.
- STOP bila PRD tidak ditemukan, terdapat konflik dengan PRD lain, atau informasi penting tidak tersedia.
