diperbarui : Fri Nov 20 2026 18:30 WIB
ditimpa ke : `.kilo/commands/analisa/analisa_kesehatan_kode.md`

1. Analisis kesehatan kode Dart pada commit terbaru di root dan semua submodul terdaftar di `.gitmodules` terhadap SDK/Flutter dan skill proyek; catat temuan ke `task.md`.

2. Baca `AGENTS.md`, `catatan.md`, dan `task.md` lebih dahulu; muat skill `format-task-md` sebelum menulis `task.md`.

3. Verifikasi versi paket/SDK dari `pubspec.yaml` (root tak punya; submodul masing-masing) ke pub.dev/dokumentasi resmi sebagai sumber kebenaran.

4. Submodul dibaca dari `.gitmodules` (bukan `git submodule status`/`foreach` tanpa path); evaluasi commit Dart dilakukan di dalam submodul, bukan hanya di root.

5. Berkas yang boleh diubah hanya `catatan.md` dan `task.md`; dilarang ubah kode Dart, pointer/gitlink, `.gitmodules`, working tree submodul, commit/push.

6. Alur: **Analyze** (branch aktif root + submodul, pointer vs HEAD, catatan commit terakhir di `catatan.md`) → **Plan** (rentang commit lama→baru, abort commit baru yang muncul) → **Execute** (hanya perubahan Dart, bandingkan SDK/skill, catat ketidaksesuaian) → **Review** (perbarui `catatan.md` per repositori: branch, commit terakhir dievaluasi/belum pernah, tanggal, pointer berbeda).

7. Submodul tidak ter-inisialisasi/direktori tidak ada/bukan repo git: catat `Tidak dievaluasi (<alasan>)` dan lanjut; jangan anggap lolos.

8. Format laporan tabel: `Repositori | Commit | Berkas | Ketidaksesuaian | Aturan/Skill | Status`. Selesai bila semua commit rentang dievaluasi di root+submodul, `task.md` diperbarui bila perlu, dan `catatan.md` mencatat commit terakhir per repositori.
