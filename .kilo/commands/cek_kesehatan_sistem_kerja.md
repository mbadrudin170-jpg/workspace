---
description: Mengaudit kesehatan sistem kerja proyek (struktur folder, .agents/rules/global/kelompok_skill_wajib.md, frontmatter skill, command, memori sesi, repositori, hasil diskusi, dan kelengkapan `instructions`) lalu melaporkan temuan GALAT/PERINGATAN di sesi; read-only kecuali penambahan berkas yang belum terdaftar ke `instructions`.
---

# Cek Kesehatan Sistem Kerja

## Tujuan

Command ini mengaudit kesehatan sistem kerja proyek (aset pendukung agen AI: aturan, skill, command, memori, hasil diskusi, repositori, dan kelengkapan `instructions`) untuk memastikan kondisi konsisten dan tidak rusak. Command ini **read-only dengan satu pengecualian**: bila ada berkas wajib (`.agents/rules/**/*.md`, `AGENTS.md`, `.agents/rules/global/kelompok_skill_wajib.md`) yang belum terdaftar di `instructions` pada `.kilo/kilo.jsonc`, berkas tersebut **ditambahkan otomatis** oleh command ini. Laporan temuan disampaikan hanya di sesi.

## Ketentuan Umum

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `MEMORI.md` untuk konteks proyek dan konvensi memori.
3. Muat skill yang relevan sebelum audit: `skill` dengan nama `aturan-pembuatan-skill`, `aturan-pembuatan-commands`, dan `bug-runtime` (sebagai referensi format pelaporan/penanganan temuan bila relevan). Muat juga skill `memori-check` bila diperlukan untuk konteks alur sesi.
4. Gunakan bahasa Indonesia baku untuk seluruh laporan.
5. Jangan menggunakan terminal untuk membaca isi berkas; gunakan tool `read`, `glob`, dan `grep` sesuai kebutuhan.
6. Audit bersifat portabel: sesuaikan pemeriksaan dengan struktur aktual proyek yang sedang diaudit, bukan dengan asumsi nama proyek tertentu.

## Parameter

- `$ARGUMENTS` (opsional): aset atau path yang ingin diperiksa (mis. `skill`, `command`, `memori`).
- Jika `$ARGUMENTS` kosong: periksa kedelapan aset audit.
- Jika `$ARGUMENTS` tidak dikenali: **STOP** dan tanyakan kepada pengguna dengan tool `question`.

## Cakupan Audit (Tujuh Aset)

Periksa aset berikut secara berurutan. Jika suatu aset tidak relevan atau berkasnya tidak ada, laporkan sebagai temuan (GALAT atau PERINGATAN) sesuai kriteria, bukan mengarang hasil.

1. **Struktur folder dan berkas wajib** — keberadaan dan keterbacaan folder/berkas kunci yang dirujuk proyek (mis. `AGENTS.md`, `MEMORI.md`, `.agents/rules/global/kelompok_skill_wajib.md`, `.agents/rules/`, `.agents/skills/`, `.kilo/commands/`, `memori/sesi/`, `hasil_diskusi/` bila digunakan). Catat yang hilang atau tidak sesuai harapan.
2. **Konsistensi `.agents/rules/global/kelompok_skill_wajib.md`** — setiap entri indeks menunjuk `SKILL.md` yang ada; setiap folder skill yang seharusnya terindeks memiliki entri; path, trigger, dan status diperbarui konsisten dengan isi aktual.
3. **Metadata frontmatter skill** — setiap `SKILL.md` memiliki frontmatter YAML dengan field wajib (`name`, `description`, `metadata.kategori`, `metadata.versi`, `metadata.diperbarui`), `description` diawali segmen trigger-only `Trigger:` sesuai aturan, dan `name` sesuai nama folder.
4. **Validasi command** — berkas command `.md` di `.kilo/commands/**` memiliki nama aman (huruf kecil, angka, garis bawah, `.md`), frontmatter `description` bila diwajibkan konvensi proyek, tidak memuat tautan markdown keliru (mis. URL palsu untuk berkas lokal), dan tidak merujuk target yang sudah tidak ada.
5. **Kesehatan memori sesi** — berkas `memori/sesi/sesi_N.md` yang berstatus `Belum Sinkron` (di luar sesi aktif bila dapat diidentifikasi), ketidakkonsistenan penomoran/penamaan, atau status sinkronisasi yang tidak jelas; periksa juga keselarasan tanggal/status pada `MEMORI.md` bila relevan.
6. **Kesehatan repositori** — kondisi yang teramati dari `git status`/struktur (submodule, pointer submodule yang tidak sinkron, berkas ter-ignore yang seharusnya diabaikan, atau anomali `.gitignore` vs working tree) **tanpa** menjalankan operasi yang mengubah state git.
7. **Penomoran `hasil_diskusi/`** — berkas `diskusi_N.md` mengikuti penomoran yang konsisten (nomor tertinggi, gap, duplikasi nama), dan pencatatan daftar/nomor tertinggi di `MEMORI.md` selaras dengan isi folder aktual.
8. **Kelengkapan `instructions`** — setiap berkas `.agents/rules/**/*.md` (rekursif), `AGENTS.md` di root, dan `.agents/rules/global/kelompok_skill_wajib.md` wajib terdaftar di `instructions` pada `.kilo/kilo.jsonc`. Bila ada yang belum terdaftar, **tambahkan otomatis** sebagai entri baru (satu baris per berkas, path relatif root) dan catat sebagai temuan `GALAT` yang sudah diperbaiki; bila `.kilo/kilo.jsonc` tidak ada, tidak dapat dibaca, atau gagal tervalidasi setelah ditulis, laporkan sebagai `GALAT` tanpa memakai jalur lain. Lihat aturan `.agents/rules/global/instructions_lengkap.md`.

## Alur Kerja

1. **Inventarisasi**: kumpulkan daftar berkas/folder yang relevan untuk kedelapan aset menggunakan `glob`/`grep`/`read` seperlunya.
2. **Pemeriksaan per aset**: jalankan pemeriksaan 1–7 di atas; untuk setiap temuan catat: aset, tingkat (`GALAT` atau `PERINGATAN`), path/objek terdampak, bukti singkat, dan saran perbaikan.
3. **Klasifikasi tingkat**:
   - `GALAT`: ketidaksesuaian yang melanggar aturan/konsistensi dan berpotensi menyebabkan perilaku salah atau data tidak dapat dipercaya (mis. frontmatter wajib hilang, entri indeks menunjuk berkas tidak ada, tautan/rujukan target tidak ada, status sinkron sesi tertinggal).
   - `PERINGATAN`: potensi masalah, inkonsistensi minor, atau hal yang perlu konfirmasi pengguna (mis. variasi gaya yang belum diatur aturan, berkas opsional tidak ada, anomali yang butuh keputusan).
4. **Laporan**: sampaikan hasil audit di sesi dengan format pada bagian "Format Laporan". Jangan menulis temuan ke `task.md` dan jangan membuat berkas laporan.

## Format Laporan

Sampaikan laporan yang memuat:

1. **Ringkasan** — jumlah temuan per tingkat (`GALAT`, `PERINGATAN`) dan cakupan yang diperiksa.
2. **Tabel temuan** (atau daftar terstruktur) dengan kolom: No, Aset, Tingkat, Path/Objek, Temuan, Saran.
3. **Catatan keterbatasan** — bila ada berkas yang tidak dapat dibaca atau pemeriksaan tidak dapat diselesaikan, sebutkan secara eksplisit.

Contoh baris temuan:

| No | Aset | Tingkat | Path/Objek | Temuan | Saran |
| --- | --- | --- | --- | --- | --- |
| 1 | .agents/rules/global/kelompok_skill_wajib.md | GALAT | `.agents/rules/global/kelompok_skill_wajib.md` | Entri menunjuk `SKILL.md` yang tidak ada | Hapus entri atau buat/restore skill, lalu sinkronkan indeks |

## Larangan

- DILARANG membuat, mengubah, atau menghapus berkas apa pun selama audit (read-only).
- DILARANG mengubah `task.md`, `MEMORI.md`, `memori/riwayat_perubahan.md`, berkas skill, command, aturan, atau kode sumber.
- DILARANG mengubah `hasil_diskusi/` atau arsip apa pun.
- DILARANG menjalankan operasi git yang mengubah state (commit, push, checkout, reset, stash, add, restore yang menulis, dsb.).
- DILARANG commit/push.
- DILARANG mengarang temuan; setiap temuan wajib didukung bukti dari berkas atau hasil pemeriksaan aktual.

Audit selesai ketika laporan tujuh aset telah disampaikan di sesi beserta ringkasan dan catatan keterbatasan (bila ada).

## Kriteria Selesai / STOP

- **Selesai** bila ketujuh aset (atau aset yang diminta) diperiksa dan laporan temuan disampaikan di sesi.
- **STOP** bila berkas kunci tidak dapat dibaca; laporkan sebagai keterbatasan, jangan mengarang hasil.
