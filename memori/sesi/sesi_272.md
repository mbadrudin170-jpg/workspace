# Sesi 272

## Status

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-26 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: Menjawab pertanyaan terminal: mengapa `easd` tidak ditemukan.

## Catatan Sesi

- Pengguna melampirkan keluaran terminal: `easd` menghasilkan `bash: eas: command not found` (alias `easd` memanggil `eas`).
- Ditemukan alias `easd='eas build --platform android --profile development'` di `~/.bash_aliases` dan `workspace/script/bash_aliases.sh`.
- Pemeriksaan `command -v eas` menunjukkan `eas` (Expo Application Services CLI) belum terpasang di lingkungan ini.
- Penyebab ganda: (1) alias belum termuat di shell aktif (shell non-interaktif/tidak source), (2) CLI `eas` belum terpasang.
- Solusi diberikan: `source ~/.bash_aliases` lalu pasang `eas-cli` (`npm install -g eas-cli`) atau jalankan via `npx eas-cli build --platform android --profile development`.

- Pengguna melampirkan log `getConnectedDevices` yang menghasilkan `jumlahPerangkat: 0` setelah ping sweep 254 host.
- Diagnosis: `InetAddress.isReachable(200)` (ICMP) sering gagal di Android tanpa root, sehingga neighbor cache tidak terisi; `ip neigh` pun kosong. Kemungkinan lain: AP/client isolation di router, atau pembatasan akses ARP.
- Diagnosis lanjutan: bahkan perangkat pengguna tidak muncul karena kode melewati IP sendiri dan gateway hanya masuk jika ada komunikasi; pada Android modern akses ARP sering dibatasi, sehingga cache ARP kosong.
- Ditambahkan logging mentah (`rawCount`, `rawSample`) pada output `ip neigh` dan `/proc/net/arp` untuk memastikan apakah data memang kosong atau hanya tidak ter-parse.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
|---|---|---|
| `admin-wifi/modules/my-module/android/src/main/java/expo/modules/mymodule/MyModule.kt` | Diubah | Tambah fallback TCP connect (port 80/443/53/22), baca `/proc/net/arp`, logging jumlah host yang merespons |
| `memori/sesi/sesi_272.md` | Dibuat | Berkas sesi aktif (Belum Sinkron) |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan (perubahan kode native; belum diverifikasi build Android).
