## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-14 (WIB)
- Topik: Penegasan bahwa skill diperlakukan sebagai aturan yang mengikat pada `aturan_skill.md` dan `AGENTS.md`

## Catatan Sesi

- Awal sesi: baca `MEMORI.md` (Diperbarui: Sat Nov 14 2026 20:43 WIB, sesi 54) dan `AGENTS.md`; muat skill `memori-check`.
- Catch-up sync awal: seluruh `memori/sesi/sesi_1.md`–`sesi_55.md` berstatus `Sudah Sinkron` (hanya `sesi_56.md` yang `Belum Sinkron`, yaitu sesi aktif ini); tidak ada berkas sesi sebelumnya yang perlu disinkronkan ke `MEMORI.md`.
- Pengguna mengucapkan salam "hai"; belum terdapat tugas spesifik (kode, dokumen, atau konfigurasi) yang diminta.
- Permintaan pengguna: menegaskan bahwa **skill juga diperlakukan sebagai aturan** yang harus diperhatikan, agar agen AI tidak menganggap skill sebagai referensi opsional.
- Muat skill `aturan-pembuatan-skill` sebagai rujukan isi aturan skill sebelum mengubah berkas aturan.
- Temuan struktur: `AGENTS.md` bukan hasil salin-tempel identik dari `.agents/rules/global/*.md` — blok tiap berkas mengalami reformat markdown (alignment tabel, indentasi list, pemisah ` | ` pada §8 versi lama) dan `alur_git_commit.md` belum pernah digabung ke `AGENTS.md`. Karena itu perubahan diterapkan pada berkas sumber lalu dicerminkan manual pada blok `AGENTS.md` agar gaya lokal blok tetap terjaga.
- Perubahan pada `.agents/rules/global/aturan_skill.md`:
  - §1 Cakupan: menambah paragraf tegas **Skill adalah aturan** — setiap `SKILL.md` di `.agents/skills/` wajib diperlakukan sebagai aturan yang mengikat, setara dengan `.agents/rules/`, bukan referensi/dokumentasi pasif/saran opsional.
  - §6 Pelanggaran Aturan: menambah butir bahwa pelanggaran terhadap **isi** skill (mengabaikan `## Aturan`, melanggar `## Larangan`, tidak memuat skill yang trigger-nya terpenuhi) diperlakukan sama dengan pelanggaran aturan.
  - §11 Checklist: menambah butir verifikasi pemenuhan skill sebagai aturan.
  - Bagian baru §12 "Skill sebagai Aturan yang Mengikat" (7 butir): status mengikat, kewajiban memuat skill sebelum mengubah kode/dokumen, larangan mengabaikan, rujukan silsilah ke berkas aturan, pelaporan benturan aturan ke pengguna, pembaruan skill tetap tunduk pada §4/§5/§7/§8/§9/§11, dan kewajiban keterlacakan di `SKILLS_INDEX.md`.
- Penomoran §12 dipilih (bukan menyisipkan di tengah) agar tidak merusak rujukan silang §8/§11 yang dipakai skill dan dokumen lain.
- Cerminan perubahan diterapkan pada blok `aturan_skill.md` di `AGENTS.md`; verifikasi `diff` (tanpa memperhatikan baris kosong) menunjukkan sisa perbedaan hanya berupa formatting lama yang sudah ada sebelumnya, bukan perbedaan isi baru.
- Perubahan `aturan_skill.md` dan `AGENTS.md` sudah masuk commit `c113f30` (2026-11-14 16:16 UTC, pesan "a") — commit dibuat oleh tooling/pengguna di luar sesi ini, bukan oleh agent; commit tersebut juga memuat reformat markdown blok `format_hasil_diskusi.md` di `AGENTS.md` yang sudah ada di working tree sebelum sesi ini. `MEMORI.md`, `memori/riwayat_perubahan.md`, dan `memori/sesi/sesi_56.md` belum di-commit.
- Belum diubah (di luar cakupan permintaan): `alur_git_commit.md` belum digabung ke `AGENTS.md`, dan skill `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` belum memuat butir "skill = aturan" pada daftar `## Aturan`-nya.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `.agents/rules/global/aturan_skill.md` | Diubah | Paragraf "Skill adalah aturan" pada §1, butir pelanggaran isi skill pada §6, butir checklist §11, dan bagian baru §12. |
| `AGENTS.md` | Diubah | Cerminan perubahan `aturan_skill.md` pada blok `aturan_skill.md` (738 baris). |
| `memori/sesi/sesi_56.md` | Diubah | Catatan sesi aktif. |
| `MEMORI.md` | Diubah | Sinkronisasi akhir sesi. |
| `memori/riwayat_perubahan.md` | Diubah | Entri riwayat perubahan. |

## Sinkronisasi ke MEMORI.md

- Header `MEMORI.md`: `Diperbarui: Sat Nov 14 2026 20:43 WIB (sesi 54)` → `Sat Nov 14 2026 23:16 WIB (sesi 56)`.
- `## Struktur Direktori`: jumlah baris `AGENTS.md` 712 → 738.
- `## Status Kerja`: menambah dua butir — (1) penguatan aturan skill menjadi aturan yang mengikat (isi §1/§6/§11 + bagian baru §12 `aturan_skill.md`, dicerminkan di `AGENTS.md`), (2) temuan `alur_git_commit.md` belum digabung ke `AGENTS.md` (di luar cakupan, menunggu persetujuan pengguna).
- `## Konvensi & Sumber Kebenaran`: menambah butir **Skill = aturan** yang merujuk `aturan_skill.md` §12.
- `## Catatan untuk Model Selanjutnya`: menambah butir perlakuan skill sebagai aturan yang mengikat.
- `memori/riwayat_perubahan.md`: menambah entri terbaru (Sat Nov 14 2026 23:16) sebagai entri teratas.