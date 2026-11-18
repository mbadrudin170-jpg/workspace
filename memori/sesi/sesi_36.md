# Sesi 36

- Status Sinkron: Belum Sinkron
- Tanggal: 2026-11-18 (Asia/Jakarta)
- Command: interaksi langsung (tanpa command)
- Topik: sapaan pengguna ("hai"); catch-up sync awal sesi (sesi_35); permintaan menambahkan dummy `PelangganAktifModel` di `admin_wifi/lib/fitur/pelanggan_aktif/dummy`

## Catatan Sesi

- Awal sesi: `MEMORI.md` dibaca (seluruh isi); seluruh berkas `.agents/rules/` dibaca (`code.md` 3 aturan, `format_hasil_diskusi.md`, `kelompok_skill_wajib.md`, `lainnya.md`, `overlay_log_debug.md`, `pengelolaan_konflik.md`); skill `memori-check` dimuat.
- Catch-up sync awal sesi: `memori/sesi/*.md` berstatus `Belum Sinkron` hanya `sesi_35.md` (sesi sebelumnya). Isinya nyata dan terverifikasi ter-commit oleh pengguna: submodule `admin_wifi` `f9568a1` ("a", 2026-11-18 02:48:54 UTC; 7 berkas) dan root `2bc4699` ("m", 2026-11-18 03:01:37 UTC; 6 berkas) → disinkronkan:
  - `MEMORI.md` — header → `(sesi 36; catch-up sesi 35)`; Status "Sesi terakhir" → sesi_35; Catatan Teknis — entri sesi 35 ditambahkan.
  - `memori/riwayat_perubahan.md` — entri catch-up sesi_35 ditambahkan di paling atas.
  - `sesi_35.md` — `## Sinkronisasi ke MEMORI.md` diisi; status → `Sudah Sinkron` (ditandai catch-up sesi 36, bukan oleh pembuatnya; preseden dicatat eksplisit).
- Working tree root dan submodule bersih pada verifikasi awal sesi (`git status --short` kosong di keduanya).
- Permintaan pengguna (2026-11-18T03:03:06Z): "admin_wifi/lib/fitur/pelanggan_aktif/model/pelanggan_aktif_model.dart tambahkan dummy nya di admin_wifi/lib/fitur/pelanggan_aktif/dummy".
- Verifikasi: folder `admin_wifi/lib/fitur/pelanggan_aktif/dummy/` sudah ada dan kosong; tidak ada pola dummy lain di proyek (root/`admin_wifi`/`base_coc`). Dibuat `pelanggan_aktif_dummy.dart` — `abstract final class PelangganAktifDummy` dengan `static final List<PelangganAktifModel> dummyList` (5 entri; tanggal relatif `DateTime.now()`; campuran status `lunas`/`belumLunas`; 3 entri `idTransaksi` terisi, 2 kosong). Verifikasi: `dart format` 0 changed; `dart analyze` No issues found.
- Asumsi (tidak ada pola dummy proyek dan tidak ada detail dari pengguna): bentuk dummy = daftar sampel statis, bukan factory/generator; belum dipakai di layar/notifier mana pun (di luar permintaan).
- Permintaan lanjutan pengguna (2026-11-18T03:06:22Z): "setiap id pakai konstanta diatasnya". Diterapkan — seluruh id (`id`, `idPelanggan`, `idPaket`, `idTransaksi`) dipindah ke konstanta `static const` SCREAMING_SNAKE_CASE di atas `dummyList` (ID_PA_001…005, ID_PELANGGAN_001…005, ID_PAKET_BULANAN/MINGGUAN/TAHUNAN, ID_TRANSAKSI_001/003/005); entri dummy merujuk konstanta tersebut. Verifikasi: `dart format` 0 changed; `dart analyze` No issues found.
- Permintaan lanjutan pengguna (2026-11-18T03:08:23Z + klarifikasi 2026-11-18T03:09:04Z): "konstanta nya wajib mengikuti format uuid" — format saja, bukan UUID hasil generate. Diterapkan — nilai konstanta diganti ke format UUID `8-4-4-4-12` (nibble versi `4`, varian `8`): grup `aa…` (ID_PA), `bb…` (ID_PELANGGAN), `cc…` (ID_PAKET), `dd…` (ID_TRANSAKSI), akhiran nomor urut entri. Verifikasi: `dart format` OK (1 changed); `dart analyze` No issues found.
- Permintaan lanjutan pengguna (2026-11-18T03:09:46Z): menempel command `tambah_kode_keskill` dengan potongan kode kosong → ditanyakan (tool question) potongan kode yang dimaksud; pengguna memilih "Dummy PelangganAktifModel". Analisis skill relevan: `pola-testing` (code/) terdekat (§5 Dummy Data, folder `dummy_data/`); pengguna memilih **buat skill baru** + **izinkan meski belum commit** (provenance dicatat).
- Dibuat skill code/ baru `.agents/skills/code/data-dummy/SKILL.md` v1.0.0 (`diperbarui` 10:12 WIB) — frontmatter `name: data-dummy` = folder; Aturan 1–8 (folder `lib/fitur/<fitur>/dummy/`, berkas `<model>_dummy.dart`, `abstract final class <NamaModel>Dummy`, `static final dummyList`, id wajib konstanta SCREAMING_SNAKE_CASE format UUID 8-4-4-4-12, tanggal relatif `DateTime.now()`, dummy dari `lib/` diimpor test mengikuti `pola-testing`); Contoh Benar/Salah; `## Sumber Evaluasi` (permintaan eksplisit pengguna + path kode `admin_wifi/.../pelanggan_aktif_dummy.dart` belum di-commit atas izin pengguna; catatan folder `dummy/` vs `dummy_data/` pola-testing belum diselaraskan).
- `.agents/rules/code.md`: aturan **#4** ditambahkan (data dummy model mengikuti pola `data-dummy`, skill terkait `data-dummy`).
- `.agents/rules/kelompok_skill_wajib.md`: entri `data-dummy` disisipkan sebagai **code #4** (A–Z); entri code #4–#53 digeser → #5–#54 (54 entri total); timestamp `data-dummy` 10:12 WIB.
- Cek command poin 9: nama folder sesuai isi; description memicu pola dummy (pratinjau UI/pengembangan, konstanta id format UUID) ✓. `formatmd` (`npx prettier --write`): ketiga berkas `unchanged`. Skill code/ baru TIDAK memiliki berkas poin di `prompt/skill/` (Aturan 16).

## Berkas Terdampak

| Lokasi File | Status Perubahan | Deskripsi |
| ----------- | ---------------- | --------- |
| `memori/sesi/sesi_35.md` | Diubah | `## Sinkronisasi ke MEMORI.md` diisi; status → Sudah Sinkron (catch-up sesi 36) |
| `MEMORI.md` | Diubah | Header `(sesi 36; catch-up sesi 35)`; Status "Sesi terakhir" → sesi_35; Catatan Teknis sesi 35 ditambah |
| `memori/riwayat_perubahan.md` | Diubah | Entri catch-up sesi_35 ditambahkan |
| `memori/sesi/sesi_36.md` | Dibuat | Berkas sesi aktif |
| `admin_wifi/lib/fitur/pelanggan_aktif/dummy/pelanggan_aktif_dummy.dart` | Dibuat → Diubah | `PelangganAktifDummy.dummyList` — 5 entri dummy; seluruh id memakai konstanta `static const` SCREAMING_SNAKE_CASE berformat UUID 8-4-4-4-12 di atasnya |
| `.agents/skills/code/data-dummy/SKILL.md` | Dibuat | Skill code/ baru `data-dummy` v1.0.0 — pola data dummy (`abstract final class <NamaModel>Dummy`, `dummyList`, id konstanta format UUID, tanggal relatif `DateTime.now()`) |
| `.agents/rules/code.md` | Diubah | Aturan #4 ditambahkan (pola data dummy, skill terkait `data-dummy`) |
| `.agents/rules/kelompok_skill_wajib.md` | Diubah | Entri `data-dummy` disisipkan sebagai code #4 (A–Z); entri code #4–#53 digeser → #5–#54; timestamp `data-dummy` 10:12 WIB |

## Sinkronisasi ke MEMORI.md

Belum disinkronkan.
