## Status

- Status Sinkron: Belum Sinkron
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
- Belum diubah (di luar cakupan permintaan): `alur_git_commit.md` belum digabung ke `AGENTS.md`, dan skill `.agents/skills/custom/aturan-pembuatan-skill/SKILL.md` belum memuat butir "skill = aturan" pada daftar `## Aturan`-nya.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| --- | --- | --- |
| `.agents/rules/global/aturan_skill.md` | Diubah | Paragraf "Skill adalah aturan" pada §1, butir pelanggaran isi skill pada §6, butir checklist §11, dan bagian baru §12. |
| `AGENTS.md` | Diubah | Cerminan perubahan `aturan_skill.md` pada blok `aturan_skill.md` (baris ±724 → ±751). |
| `memori/sesi/sesi_56.md` | Diubah | Catatan sesi aktif. |
| `MEMORI.md` | Diubah | Sinkronisasi akhir sesi. |
| `memori/riwayat_perubahan.md` | Diubah | Entri riwayat perubahan. |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan (sesi masih berlangsung).