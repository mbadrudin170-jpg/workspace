---
name: install-rg
description: Trigger: saat perlu memasang atau memverifikasi ripgrep (rg) di lingkungan Linux/WSL/Cloud Shell — deteksi ketersediaan, pembaruan indeks paket, pemasangan via apt-get, verifikasi `rg --version`, dan fallback bila apt/sudo tidak tersedia. Skill: install-rg Memasang dan Memverifikasi ripgrep (rg) Panduan pemasangan ripgrep (`rg`) pada lingkungan Linux (Debian/Ubuntu, WSL, Cloud Shell) secara aman: deteksi ketersediaan, konfirmasi pengguna, pemasangan via apt-get, dan verifikasi hasil. Cakupan yang Di-Cover - Tool: ripgrep (`rg`) - Lingkungan: Linux Debian/Ubuntu, WSL, Cloud Shell - Perintah: `command -v rg`, `apt-get update`, `apt-get install -y ripgrep`, `rg --version` Aturan 1. Sebelum memasang, periksa ketersediaan `rg` melalui `command -v rg` atau `rg --version`; bila sudah ada, jangan pasang ulang. 2. Pastikan `apt-get` tersedia (distro Debian/Ubuntu) sebelum memakainya; bila tidak, laporkan dan hentikan (jangan paksa). 3. Minta konfirmasi pengguna sebelum menjalankan `apt-get update`/`apt-get install` ka
---

# Skill: install-rg

# Memasang dan Memverifikasi ripgrep (rg)

Panduan pemasangan ripgrep (`rg`) pada lingkungan Linux (Debian/Ubuntu, WSL, Cloud Shell) secara aman: deteksi ketersediaan, konfirmasi pengguna, pemasangan via apt-get, dan verifikasi hasil.

## Cakupan yang Di-Cover

- Tool: ripgrep (`rg`)
- Lingkungan: Linux Debian/Ubuntu, WSL, Cloud Shell
- Perintah: `command -v rg`, `apt-get update`, `apt-get install -y ripgrep`, `rg --version`

## Aturan

1. Sebelum memasang, periksa ketersediaan `rg` melalui `command -v rg` atau `rg --version`; bila sudah ada, jangan pasang ulang.
2. Pastikan `apt-get` tersedia (distro Debian/Ubuntu) sebelum memakainya; bila tidak, laporkan dan hentikan (jangan paksa).
3. Minta konfirmasi pengguna sebelum menjalankan `apt-get update`/`apt-get install` karena aksi ini mengubah state sistem.
4. Jalankan `sudo apt-get update` terlebih dahulu, lalu `sudo apt-get install -y ripgrep`.
5. Setelah pemasangan, verifikasi dengan `rg --version`; kegagalan wajib dilaporkan dan tidak dianggap berhasil.
6. Bila izin sudo tidak tersedia, tawarkan alternatif (perintah manual) alih-alih berhenti diam-diam.
7. Jangan asumsikan path `rg`; gunakan `command -v rg`.

## Steps

1. Cek `command -v rg`; jika ada, tampilkan versi dan berhenti.
2. Cek `command -v apt-get`; jika tidak ada, laporkan distro tidak didukung dan hentikan.
3. Minta konfirmasi pengguna sebelum menjalankan apt-get update/install.
4. Jalankan `sudo apt-get update && sudo apt-get install -y ripgrep`.
5. Verifikasi `rg --version`.
6. Laporkan hasil (berhasil/gagal beserta versi).

## Larangan

- DILARANG mengasumsikan `rg` sudah terpasang tanpa verifikasi.
- DILARANG menjalankan `apt-get install` tanpa konfirmasi pengguna.
- DILARANG mengabaikan kegagalan verifikasi.
- DILARANG memaksa pemasangan pada distro non-Debian tanpa fallback.

## Contoh Benar

```bash
if command -v rg >/dev/null 2>&1; then
  rg --version
else
  sudo apt-get update && sudo apt-get install -y ripgrep && rg --version
fi
```

## Contoh Salah

```bash
# SALAH: asumsi rg ada tanpa cek
rg --version

# SALAH: install tanpa konfirmasi/verifikasi
sudo apt-get install -y ripgrep
```
