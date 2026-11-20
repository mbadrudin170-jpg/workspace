# Sesi 135

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-20 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: Lanjutan refactor `_ItemPelangganAktif` — hapus branch jatuh tempo; jatuh tempo pakai Card yang sama

## Catatan Sesi

- Merujuk sesi 134: widget privat `_ItemPelangganAktif` yang dibuat di sesi 134 memiliki branch `jatuhTempo` (ListTile sederhana). Pengguna meminta branch tersebut dihapus; item jatuh tempo cukup memakai Card yang sama dengan item utama.
- Perubahan: hapus parameter `jatuhTempo` dan branch ListTile dari `_ItemPelangganAktif`; widget kini hanya Card. `_buildSliverListJatuhTempo` kini menerima `PaketState paketState` dan mengambil paket per item, sehingga item jatuh tempo tampil lengkap seperti item utama.
- Call site di `_buildBody` diperbarui untuk meneruskan `paketState`.
- Verifikasi: `dart analyze` No issues found; `dart format` 0 changed.

## Berkas Terdampak

| Lokasi File                                                                | Status Perubahan | Deskripsi                                                                                                    |
| -------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------ |
| `memori/sesi/sesi_135.md`                                                  | Dibuat           | Berkas sesi aktif                                                                                            |
| `admin_wifi/lib/fitur/pelanggan_aktif/screens/pelanggan_aktif_screen.dart` | Diubah           | Hapus branch jatuh tempo; jatuh tempo pakai Card yang sama; `_buildSliverListJatuhTempo` terima `PaketState` |

## Sinkronisasi ke MEMORI.md

Tidak ada fakta durable yang dipromosikan (refactor episodic di submodule). `MEMORI.md` tidak diubah.
