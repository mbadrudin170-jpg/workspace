diperbarui : Fri Nov 20 2026 04:38 WIB
file : [install-rg](../../.agents/skills/non-code/install-rg/SKILL.md)

1. Deteksi ketersediaan `rg` via `command -v rg`/`rg --version`; bila sudah ada, jangan pasang ulang.

2. Pastikan `apt-get` tersedia (Debian/Ubuntu); bila tidak, laporkan dan hentikan.

3. Minta konfirmasi pengguna sebelum menjalankan apt-get update/install (aksi state-changing).

4. Jalankan `sudo apt-get update && sudo apt-get install -y ripgrep`.

5. Verifikasi dengan `rg --version`; kegagalan wajib dilaporkan.

6. Bila sudo tidak tersedia, tawarkan alternatif (perintah manual) alih-alih berhenti diam-diam.

7. Jangan asumsikan path `rg`; gunakan `command -v rg`.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- Alias shell sumber: `install_rg="sudo apt-get update && sudo apt-get install -y ripgrep"` pada `script/bash_aliases.sh`.
- Permintaan eksplisit pengguna: sesi ini.
