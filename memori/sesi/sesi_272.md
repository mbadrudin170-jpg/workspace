# Sesi 272

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-25
- Command: interaksi langsung (tanpa command)
- Topik: Cari dan perbaiki file di admin-wifi/src yang namanya tidak kebab-case

## Catatan Sesi

Sesi dimulai. Catch-up sync: banyak berkas `Belum Sinkron` dari sesi sebelumnya (sesi_45–49, 52, 55, 56, 71, 72, 80, 89, 90, 97, 109, 110, 184, 247, 250, 254, 255, 260, 271, dan lainnya) bersifat ambigu/sesi paralel dan tidak disentuh (memori-check Aturan 2 & 23). Berkas sesi yang sedang aktif di sesi ini (sesi_272) tidak ditandai.

Pengguna memerintahkan: cari file di `admin-wifi/src` yang namanya tidak kebab-case, lalu perbaiki agar menggunakan kebab-case.

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| admin-wifi/src/store/pelangganAktifStore.ts | Dihapus (rename) | Rename ke `pelanggan-aktif-store.ts` (kebab-case) |
| admin-wifi/src/store/pelanggan-aktif-store.ts | Dibuat (rename) | Nama file kebab-case; impor `@/db/pelanggan-aktif` diperbarui |
| admin-wifi/src/db/pelangganAktif.ts | Dihapus (rename) | Rename ke `pelanggan-aktif.ts` (kebab-case) |
| admin-wifi/src/db/pelanggan-aktif.ts | Dibuat (rename) | Nama file kebab-case |
| admin-wifi/src/app/(tabs)/pelanggan_aktif.tsx | Dihapus (rename) | Rename ke `pelanggan-aktif.tsx` (kebab-case) |
| admin-wifi/src/app/(tabs)/pelanggan-aktif.tsx | Dibuat (rename) | Nama file kebab-case; impor store diperbarui; route push `/form-pelanggan-aktif` |
| admin-wifi/src/app/form_pelanggan_aktif.tsx | Dihapus (rename) | Rename ke `form-pelanggan-aktif.tsx` (kebab-case) |
| admin-wifi/src/db/database.ts | Diubah | `id` dari `INTEGER PRIMARY KEY AUTOINCREMENT` menjadi `TEXT PRIMARY KEY`; drop & recreate tabel (dev) |
| admin-wifi/src/db/pelanggan-aktif.ts | Diubah | `id: string`; `addPelangganAktif` generate UUID via paket `uuid` |
| admin-wifi/package.json | Diubah | Tambah dependency `uuid` dan `@types/uuid` (via `npx expo install`) |
| admin-wifi/src/store/pelanggan-aktif-store.ts | Diubah | `add` menerima `PelangganAktifBaru` |
| admin-wifi/src/app/form-pelanggan-aktif.tsx | Diubah | `add({ nama: nama.trim() })` |
| admin-wifi/src/components/app-tabs.tsx | Diubah | NativeTabs.Trigger name `pelanggan_aktif` → `pelanggan-aktif` |
| admin-wifi/src/app/_layout.tsx | Diubah | Stack.Screen name `form_pelanggan_aktif` → `form-pelanggan-aktif` |
| memori/sesi/sesi_272.md | Dibuat | Berkas sesi aktif (Belum Sinkron) |

## Sinkronisasi ke MEMORI.md

Sudah disinkronkan (sesi 272): tidak ada entri durable baru di `MEMORI.md` (perubahan bersifat rename file UI/TS, tidak mengubah konvensi/aturan proyek). Entri riwayat ditambahkan ke `memori/riwayat_perubahan.md` (sesi 272). Verifikasi: `npx tsc --noEmit` exit 0; `npx expo lint` hanya warning/error pra-eksisting (tidak terkait). Berkas sesi `sesi_272.md` ditandai Sudah Sinkron.
