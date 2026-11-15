# Sesi 159 — Perbarui aturan/skill toast AppToast

## Status
- Status Sinkron: Sudah Sinkron
- Tanggal: 2026-11-15 (UTC ~20:20; 2026-11-16 WIB)
- Command: interaksi langsung (tanpa command)
- Topik: Standarisasi feedback sementara memakai `AppToast` dari `share_global_saya`, bukan `SnackBar`/`ScaffoldMessenger`

## Catatan Sesi
- Pengguna: tidak ingin `Scaffold`/snackbar untuk feedback sementara; ingin toast dari `share_global_saya`.
- Pengguna: perubahan aturan/skill lebih dulu (bukan kode).
- Pengguna: jika isinya tidak panjang, masukkan ke file aturan yang sudah ada (bukan file aturan baru).
- Pengguna: terkait `SKILLS_INDEX.md` — saat sederetan perubahan status Skill Indusrry tidak sengaja ter-stage, pengguna memilih `Biarkan staged`; `git diff HEAD` tetap memuat hanya perubahan status scaffold, tetapi index memuat perubahan massal (`MM`). Tidak ada `git restore`/`reset` dijalankan.
- Keputusan penerapan:
  1. Perbarui `.agents/rules/global/kelompok_skill_wajib.md` dengan kelompok baru: feedback sementara wajib `AppToast` dari `share_global_saya` bila dependency tersedia; bila belum, tambahkan dependency (path/git) atau tanyakan pengguna sebelum memakai `SnackBar`/`ScaffoldMessenger`/`Fluttertoast` langsung.
  2. Perbarui skill `.agents/skills/custom/scaffold-struktur-layar/SKILL.md`: `Aturan 4` diganti dari `ScaffoldMessenger.showSnackBar` menjadi `AppToast` (dengan rujukan); cakupan class memakai `AppToast` (bukan `SnackBar`); method terkait dihapus; larangan ditambah; versi dinaikkan 1.0.1 → 1.1.0; `SKILLS_INDEX.md` entri scaffold diperbarui.
  3. Tidak membuat file aturan baru; tidak membuat skill dedicated baru; `theme-data-color-schema` tidak diubah (`snackBarTheme` tetap properti opsional, bukan endorsement).
- Commit terkait untuk isi skill: `b79563fc39b0bf79b45c13aac258e148b0f8cf9b` (2026-10-14; `lib/src/widget/toast_widget.dart` — `AppToast` `sukses`/`gagal`/`info`/`warning`, memakai `Fluttertoast` `FToast`, logging `L`).
- Sesi paralel `kerjakan_task` menabrak `sesi_159.md` lebih dulu (membuatnya sebagai catatan kerjakan_task), lalu memindahkan catatan tersebut ke `sesi_160.md`; berkas ini (`sesi_159.md`) tetap memuat catatan sesi AppToast. Tidak ada berkas `Sudah Sinkron` lama yang diubah.
- `MEMORI.md` header sudah dimutakhirkan paralel ke `sesi 160`; entri sesi 159 ditambahkan tanpa menimpa header/sesi 160. `memori/riwayat_perubahan.md` ditambah entri sesi 159.

## Berkas Terdampak
| Lokasi File | Status Perubahan | Deskripsi |
|-------------|------------------|-----------|
| memori/sesi/sesi_159.md | Dibuat/Diubah | Berkas sesi ini; tetap memuat sesi AppToast setelah tabrakan penomoran paralel |
| .agents/rules/global/kelompok_skill_wajib.md | Diubah | Kelompok wajib feedback sementara via AppToast |
| .agents/skills/custom/scaffold-struktur-layar/SKILL.md | Diubah | Aturan 4 + cakupan/larangan AppToast; v1.1.0 |
| SKILLS_INDEX.md | Diubah (working tree) / `MM` index | Status scaffold-struktur-layar; index memuat perubahan massal yang dibiarkan atas keputusan pengguna |
| MEMORI.md | Diubah | Entri sesi 159 ditambahkan; header tetap sesi 160 |
| memori/riwayat_perubahan.md | Diubah | Entri sesi 159 ditambahkan |

## Sinkronisasi ke MEMORI.md
- Entri sesi 159 ditambahkan di `## Status Kerja` tanpa menimpa entri/header sesi 160 (sinkronisasi paralel).
- Entri `memori/riwayat_perubahan.md` sesi 159 ditambahkan.
- Berkas sesi ini ditandai `Sudah Sinkron`; index `SKILLS_INDEX.md` dibiarkan atas keputusan pengguna (`Biarkan staged`).
