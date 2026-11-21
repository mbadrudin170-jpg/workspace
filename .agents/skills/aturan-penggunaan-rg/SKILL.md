---
name: aturan-penggunaan-rg
description: Trigger: saat menggunakan rg (ripgrep) untuk pencarian konten di codebase — gunakan via tool Bash, flag standar, fallback ke Grep bawaan, verifikasi ketersediaan. Aturan Penggunaan rg (ripgrep) Skill ini mengatur cara menggunakan rg untuk pencarian konten (regex) di codebase via tool Bash, bukan instalasi. Cakupan: flag umum, pola regex, filter file, output, fallback, verifikasi ketersediaan. Aturan Penggunaan rg (ripgrep) Mengatur penggunaan rg untuk pencarian konten di codebase melalui tool Bash. Berbeda dengan skill install-rg (pemasangan), skill ini berfokus pada aturan pemakaian rg sebagai tool pencarian harian.
---
name: aturan-penggunaan-rg
description: Trigger: saat menggunakan rg (ripgrep) untuk pencarian konten di codebase — gunakan via tool Bash, flag standar, fallback ke Grep bawaan, verifikasi ketersediaan.
metadata:
  kategori: "custom"
  versi: "1.0.0"
  diperbarui: "Sat Nov 21 2026 17:00 WIB"
---

# Aturan Penggunaan rg (ripgrep)

Skill ini mengatur cara menggunakan `rg` (ripgrep) untuk pencarian konten (regex) di codebase melalui tool `Bash`. Berbeda dengan skill instalasi, skill ini berfokus pada aturan pemakaian harian.

## Cakupan yang Di-Cover

- Tool: `rg` (ripgrep) dipanggil via tool `Bash` Kilo
- Flag standar: `-n`, `-i`, `-t`, `-g`, `-e`, `--glob`, `--no-ignore`
- Fallback: tool `Grep` bawaan Kilo bila `rg` tidak tersedia
- Verifikasi ketersediaan sebelum penggunaan berulang

## Aturan

1. **Gunakan `rg` via tool `Bash` untuk pencarian konten**; tool `Grep` bawaan Kilo hanya sebagai fallback bila `rg` tidak tersedia atau tidak memenuhi kebutuhan.
2. **Format umum**: `rg -n '<pola>' <path>` — flag `-n` untuk nomor baris wajib dipakai agar hasil terlacak.
3. **Case-insensitive**: gunakan flag `-i` bila pencarian tidak peka huruf besar/kecil.
4. **Filter ekstensi**: gunakan `-t <tipe>` (mis. `-t dart`, `-t md`) atau `--glob '*.dart'` untuk membatasi scope.
5. **Multi-pola**: gunakan `-e 'pola1' -e 'pola2'` (logika OR) atau `rg 'pola1|pola2'` untuk alternatif regex.
6. **Hormati `.gitignore`** secara default; gunakan `--no-ignore` hanya bila perlu mencari di folder terabaikan (build, cache, dll.).
7. **Verifikasi ketersediaan** via `command -v rg` sebelum pemakaian berulang (di skrip/command).
8. **Sertakan `workdir` yang tepat** pada pemanggilan `Bash` (root proyek atau subfolder paket).
9. **Jangan pipe ke `head`/`less`** dalam tool — biarkan output penuh; pemotongan ditangani sisi klien.

## Steps

1. Cek `command -v rg` (bila pertama kali di sesi/skrip).
2. Bangun perintah `rg` dengan flag sesuai kebutuhan (`-n`, `-i`, `-t`, `-g`, `-e`).
3. Jalankan via tool `Bash` dengan `workdir` yang benar.
4. Bila `rg` tidak tersedia, gunakan tool `Grep` bawaan Kilo.

## Larangan

- DILARANG mengasumsikan `rg` selalu tersedia tanpa verifikasi.
- DILARANG menggunakan `grep -rn` via `Bash` bila `rg` tersedia (kecuali fallback eksplisit).
- DILARANG memanggil `rg` tanpa flag `-n` (nomor baris hilang → sulit lokasi).
- DILARANG mengabaikan `.gitignore` tanpa alasan (gunakan `--no-ignore` hanya saat perlu).

## Contoh Benar

```json
# Cari class di file Dart
bash: { command: "rg -n 'class\\s+\\w+' lib/", workdir: "base_coc" }

# Cari import package:flutter_riverpod (case-insensitive, filter .dart)
bash: { command: "rg -ni 'package:flutter_riverpod' -t dart lib/", workdir: "." }

# Multi-pola: cari 'Notifier' ATAU 'Provider' di folder fitur
bash: { command: "rg -n -e 'Notifier' -e 'Provider' lib/fitur/", workdir: "." }
```

## Contoh Salah

```bash
# SALAH: grep via Bash saat rg tersedia
bash: { command: "grep -rn 'foo' lib/" }

# SALAH: rg tanpa nomor baris
rg 'class Foo' lib/

# SALAH: pipe ke head di dalam tool
bash: { command: "rg 'foo' lib/ | head -20" }
```