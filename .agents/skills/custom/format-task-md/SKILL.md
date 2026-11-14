---
name: format-task-md
description: "Trigger: saat menambahkan atau memperbarui isi file task.md di root | Panduan gaya penulisan format task.md agar setiap orang dan AI yang mengedit task.md menghasilkan isi yang konsisten: pengelompokan task berdasarkan file terdampak, prioritas Tinggi/Rendah, kolom Status/Masalah/Solusi/aturan dilanggar/file bermasalah/prompt, serta catatan kepatuhan terhadap skill yang terpenuhi (skill adalah aturan yang mengikat). Berlaku lintas proyek."
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sun Nov 15 2026 01:43 WIB"
  sumber-terakhir: "commit 2d96c25 (isi format_task.md) + perintah pengguna: konversi penuh menjadi skill (sesi 64)"
---

# Format Penulisan task.md

Mengatur gaya penulisan dan pemformatan isi file `task.md` di root proyek agar setiap orang dan AI yang mengeditnya menghasilkan isi yang selalu konsisten. Setiap task dikelompokkan berdasarkan file-file yang terdampak: misalnya `task A` mengedit file `A, B, dan C` lalu `task B` hanya mengerjakan file `A`, maka keduanya dikelompokkan dalam satu kelompok.

## Cakupan yang Di-Cover

- File: `task.md` di root proyek
- Struktur: `# Kelompok N` → `## file terdampak` → `## Tinggi` / `## Rendah` (prioritas) → `#### Task N`
- Kolom per task (kelompok Tinggi): `Status`, `Masalah`, `Solusi`, `aturan dilanggar`, `file bermasalah`, `prompt`
- Kolom per task (kelompok Rendah): minimal `Status` dan `Masalah`
- Penamaan kelompok dan task: `Kelompok N` dan `Task N` (bilangan bulat positif, mulai dari 1)

## Aturan

1. Setiap penambahan atau perbaruan isi `task.md` **wajib** mengikuti format pada skill ini; dilarang menambah, menghapus, atau mengubah makna kolom tanpa persetujuan pengguna.
2. Setiap task **wajib** dikelompokkan berdasarkan file terdampak: task yang menyentuh file yang sama berada dalam satu kelompok (mis. `task A` mengedit file `A, B, C` dan `task B` hanya file `A` → satu kelompok).
3. Struktur berurutan: `# Kelompok N` → `## file terdampak` (daftar berkas sebagai link markdown, mis. `- (file A)[../FileA.md]`) → prioritas `## Tinggi` atau `## Rendah` → `#### Task N`.
4. Kolom per task (kelompok Tinggi), dalam urutan:
   - `Status` — isi salah satu: `selesai`, `belum`, `setengah`, `kerjakan`.
   - `Masalah` — masalah yang diketahui; bila belum diketahui, tulis secara eksplisit, jangan mengarang.
   - `Solusi` — solusi yang direkomendasikan beserta contohnya.
   - `aturan dilanggar` — nama semua aturan yang dilanggar beserta rujukannya, mis. `(aturan_boilprate)[aturan_boilprate:32]`.
   - `file bermasalah` — semua berkas yang harus diperbaiki, mis. `(aturan_boilprate)[aturan_boilprate:32]`.
   - `prompt` — **hanya diisi oleh pengguna**; AI dilarang mengisi atau mengubah kolom ini.
5. Kolom per task (kelompok Rendah): minimal `Status` dan `Masalah`; kolom lain boleh ditambahkan bila relevan.
6. `Status` wajib diisi salah satu dari empat nilai; `Masalah` wajib diisi atau ditandai eksplisit `belum diketahui`.
7. Skill yang trigger-nya terpenuhi adalah aturan yang mengikat; kepatuhan terhadap skill terkait **wajib** dicatat pada kolom `aturan dilanggar` bila relevan.
8. Isi `Solusi`, `aturan dilanggar`, dan `file bermasalah` harus berbasis fakta proyek; bila data tidak tersedia, tulis eksplisit `belum diketahui` — dilarang mengarang.

## Steps

1. Baca `task.md` di root; tentukan task yang akan ditambah/diperbarui.
2. Tentukan file terdampak setiap task; kelompokkan task berdasarkan perpotongan file terdampaknya.
3. Susun kolom per task sesuai aturan 4–6; catat skill terkait yang terpenuhi pada `aturan dilanggar` bila relevan (aturan 7).
4. Verifikasi: struktur `# Kelompok` → `## file terdampak` → prioritas → `#### Task` terjaga; kolom wajib lengkap; `prompt` tidak diisi AI.

## Larangan

- DILARANG mengisi, mengubah, atau menghapus kolom `prompt` — kolom ini hanya diisi oleh pengguna.
- DILARANG memecah task yang file terdampaknya tumpang tindih ke kelompok berbeda.
- DILARANG menghilangkan kolom wajib pada kelompok Tinggi (`Status`, `Masalah`, `Solusi`, `aturan dilanggar`, `file bermasalah`, `prompt`).
- DILARANG mengarang `Masalah`, `Solusi`, `aturan dilanggar`, atau `file bermasalah` — tulis `belum diketahui` bila data tidak tersedia.
- DILARANG menaruh task di luar struktur `# Kelompok` → prioritas → `#### Task`.
- DILARANG mengubah format ini tanpa persetujuan pengguna.

## Contoh Benar

```markdown
# Kelompok 1

## file terdampak

- (file A)[../FileA.md]

## Tinggi

#### Task 1

- Status : kerjakan
- Masalah : File A memuat logika yang tidak sesuai aturan penamaan (penamaan-konvensi).
- Solusi : Ganti identifier menjadi camelCase sesuai skill `penamaan-konvensi`; contoh: `nama_variable` menjadi `namaVariable`.
- aturan dilanggar : (penamaan-konvensi)[penamaan-konvensi]
- file bermasalah : (FileA.md)[../FileA.md]
- prompt : hanya diisi oleh saya

#### Task 2

- Status : belum
- Masalah : Belum diketahui.
- Solusi : Belum diketahui.
- aturan dilanggar : belum diketahui
- file bermasalah : (FileA.md)[../FileA.md]
- prompt : hanya diisi oleh saya
```

## Contoh Salah

```markdown
// DILARANG: task B (hanya file A) dipisah ke kelompok lain padahal task A juga menyentuh file A
# Kelompok 2
## file terdampak
- (file B)[../FileB.md]
#### Task 1 (task B) ... // salah: task B seharusnya bergabung dengan Kelompok 1 (file A yang sama)
```

```markdown
// DILARANG: AI mengisi kolom prompt
#### Task 1
- prompt : kerjakan sekarang juga // salah: prompt hanya diisi oleh pengguna
```

```markdown
// DILARANG: kolom wajib kelompok Tinggi dihilangkan
#### Task 1
- Status : kerjakan
- Masalah : Bug. // salah: Solusi, aturan dilanggar, file bermasalah, prompt tidak boleh dihilangkan
```

```markdown
// DILARANG: aturan dilanggar dikosongkan padahal skill terkait terpenuhi
- aturan dilanggar : // salah: skill terkait wajib dicatat bila relevan
```

## Sumber Evaluasi

- File sumber (dipindahkan ke skill ini): `.agents/rules/global/format_task.md` (dihapus pada konversi penuh, sesi 64)
- Commit rujukan: `2d96c25` (commit yang menambahkan `.agents/rules/global/format_task.md`)
- AGENTS.md: blok `// FILE: .agents/rules/global/format_task.md` beserta catatan penekanan sesi 57 (dibuang pada konversi penuh, sesi 64)
- Rujukan perintah pengguna: sesi 64 (2026-11-15; konversi penuh rule `format_task.md` menjadi skill)
- Skill terkait: `aturan-pembuatan-skill`, `larangan-backup-task`
