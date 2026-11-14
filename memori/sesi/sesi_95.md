# Sesi 95 — PRD A8 Panduan singkat dan alasan pemilihan layout

## Status

- Status Sinkron: Sudah Sinkron
- Tanggal: Sat Nov 14 2026 21:27 WIB (sesi 95)
- Topik: Membuat PRD untuk item A8 (Panduan singkat dan alasan pemilihan layout) dari `refrensi_apk.md` di proyek `base_coc`, melalui command `diskusi_fitur_baru.md` (parameter awal kosong → pengguna memilih "Lanjutkan diskusi_fitur_baru" dan item A8 via tool `question`).

## Catatan Sesi

- Awal sesi: membaca `MEMORI.md`; catch-up sync memindai `memori/sesi/*.md` ber-status `Belum Sinkron`: hanya `sesi_81.md` (tabrakan penomoran dengan sesi paralel, ambigu) — dibiarkan `Belum Sinkron` dan akan dilaporkan ke pengguna, tidak diputuskan sepihak.
- Kedua command yang dikirim pengguna (`diskusi_fitur_baru` dan `kerjakan`) kosong parameternya; klarifikasi via tool `question` (2026-11-14) → pengguna memilih "Lanjutkan diskusi_fitur_baru (Recommended)" dan item "A8 Panduan singkat per base".
- Sesi ini hanya membuat/memperbarui dokumen PRD; tidak mengubah kode Dart.
- Analisis: item A8 (`refrensi_apk.md` baris 93–99) belum diimplementasikan (tidak ada `panduan`/`tips`/`catatan` di `base_coc/lib`; `prd/` kosong → tidak ada PRD bertumpang tindih). Referensi APK diperiksa via webfetch (clashOFbase & CoC Base Maps 2026, keduanya halaman Play Store terbaca 2026-11-14).
- PRD `prd/prd_panduan_singkat_base.md` disusun (Status Dokumen: Draft; Status Implementasi: Belum Diimplementasikan); item A8 di `refrensi_apk.md` ditandai "PRD sudah dibuat (`prd/prd_panduan_singkat_base.md`, sesi 95); belum diimplementasikan".
- Diskusi dengan pengguna (sesi 95, 2026-11-14/15): struktur field panduan → Objek `PanduanBase` (Recommended); penempatan section → di bawah metadata (Recommended); isi data panduan → seluruh 12 entri contoh di `base_katalog.json` (Recommended); struktur widget → widget terpisah `panduan_base_view.dart` (Recommended). PRD dinyatakan **Final** (Status Dokumen: Final; Status Implementasi tetap `Belum Diimplementasikan`).
- Keputusan final tercatat di PRD: `PanduanBase` (kekuatan/kelemahan/saranTrap, opsional, parsing ketat → `KatalogGagalException`), section "Panduan" di bawah metadata sebelum area preview, tombol "Copy Base" tidak bergeser, `panduan` bukan filter (tidak menyentuh `FilterState`/`FilterProvider`), video strategi di luar cakupan (butuh hosting).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `memori/sesi/sesi_95.md` | Dibuat | Berkas sesi ini |
| `prd/prd_panduan_singkat_base.md` | Dibuat | PRD item A8 (Status Dokumen: Final; Status Implementasi: Belum Diimplementasikan) |
| `refrensi_apk.md` | Diubah | Item A8 ditandai sudah dibuatkan PRD (`prd/prd_panduan_singkat_base.md`, sesi 95) |

## Sinkronisasi ke MEMORI.md

Sinkronisasi akhir sesi dilakukan (2026-11-15, sesi 95): `MEMORI.md` — header `Diperbarui` → `Sun Nov 15 2026 04:35 WIB (sesi 95)`; bullet baru pada `## Status Kerja` mencatat PRD A8 (Final, belum diimplementasikan, keputusan diskusi, penanda item A8 di `refrensi_apk.md`). `memori/riwayat_perubahan.md` — entri baru (paling atas) mencatat PRD A8 dan catch-up `sesi_81.md`. `sesi_81.md` tetap `Belum Sinkron` (tabrakan penomoran, ambigu) — dilaporkan ke pengguna, tidak diputuskan sepihak. Tidak ada berkas sesi `Sudah Sinkron` yang diubah.
