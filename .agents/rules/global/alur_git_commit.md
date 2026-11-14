# Aturan Alur Git & Commit (Global)

File ini menyimpan standar alur Git & commit yang berlaku lintas proyek. Aturan di sini tidak bergantung pada kebutuhan bisnis satu proyek dan dapat digunakan kembali pada berbagai proyek.

## Format Commit (Conventional Commits)

Commit message wajib mengikuti Conventional Commits dengan format:

```
<type>(<scope>): <deskripsi singkat>

<body opsional>

<footer opsional>
```

**Tipe yang diizinkan:**

- `feat` — penambahan fitur baru.
- `fix` — perbaikan bug.
- `docs` — perubahan dokumentasi.
- `chore` — tugas pemeliharaan (dependensi, konfigurasi, tooling).
- `refactor` — perubahan kode tanpa mengubah perilaku.
- `test` — penambahan/perbaikan tes.
- `perf` — peningkatan performa.
- `build` — perubahan sistem build atau dependensi eksternal.
- `ci` — perubahan konfigurasi CI/CD.
- `style` — perubahan format (whitespace, titik koma) tanpa logika.
- `revert` — pembatalan commit sebelumnya.

**Aturan wajib:**

1. Tipe wajib salah satu dari daftar di atas; gunakan tipe yang paling sesuai.
2. `scope` opsional, ditulis dalam tanda kurung setelah tipe (mis. `feat(galeri): ...`).
3. Deskripsi singkat wajib berbahasa Indonesia baku, imperatif, huruf kecil di awal, tanpa titik di akhir.
4. Body opsional menjelaskan "mengapa" dan "apa", bukan "bagaimana".
5. Footer opsional memuat referensi issue/PR (mis. `Closes #123`) atau breaking change (`BREAKING CHANGE: ...`).
6. Satu commit = satu perubahan logis; jangan gabungkan perubahan tidak terkait dalam satu commit.

**Larangan:**

- DILARANG commit message tanpa tipe Conventional Commits.
- DILARANG menggabungkan beberapa fitur/fix tidak terkait dalam satu commit.
- DILARANG deskripsi kosong atau generik (mis. "update", "fix bug").

## Strategi Branching (Trunk-based)

**Aturan wajib:**

1. `main` selalu dalam kondisi deployable (build/test lulus, tidak ada kode setengah jadi).
2. Pengembangan fitur/perbaikan dilakukan pada short-lived branch, lalu digabungkan ke `main` via Pull Request.
3. Branch hidup singkat (disarankan ≤ 1–2 hari kerja); hindari branch panjang.
4. Sinkronkan branch dengan `main` secara berkala (rebase/merge) untuk meminimalkan konflik.
5. Jangan commit langsung ke `main` untuk perubahan fitur/perbaikan; gunakan branch + PR.

## Penamaan Branch

**Aturan wajib:**

1. Branch wajib memakai prefix sesuai tipe commit: `feat/`, `fix/`, `docs/`, `chore/`, `refactor/`, `test/`, `perf/`, `build/`, `ci/`, `style/`.
2. Nama setelah prefix wajib kebab-case, singkat, dan menjelaskan satu topik (mis. `feat/filter-town-hall`, `fix/crash-saat-login`).
3. Satu branch = satu topik; jangan campur beberapa topik dalam satu branch.
4. Gunakan nama yang konsisten dengan deskripsi PR.

**Larangan:**

- DILARANG branch tanpa prefix tipe.
- DILARANG nama branch dengan spasi, huruf besar, atau karakter khusus selain `-` dan `/`.
- DILARANG branch panjang yang memuat beberapa topik tidak terkait.

## Merge (Squash Merge)

**Aturan wajib:**

1. Merge PR ke `main` menggunakan Squash merge: satu commit per PR.
2. Commit message hasil squash diambil dari judul PR (dan deskripsi bila perlu), mengikuti Conventional Commits.
3. Sebelum merge, pastikan CI/lint/test lulus dan review disetujui (bila ada reviewer).
4. Hapus branch sumber setelah merge untuk menjaga kebersihan.

**Larangan:**

- DILARANG merge commit atau rebase and merge kecuali disepakati lain dalam proyek.
- DILARANG merge PR yang belum lulus CI atau belum direview (bila review wajib).

## Rilis (Semver + Changelog)

**Aturan wajib:**

1. Versi rilis mengikuti Semantic Versioning: `vMAJOR.MINOR.PATCH` (mis. `v1.2.3`).
   - MAJOR: perubahan tidak kompatibel (breaking change).
   - MINOR: penambahan fitur kompatibel.
   - PATCH: perbaikan bug kompatibel.
2. Tag dibuat pada commit di `main` yang siap rilis.
3. Changelog disusun dari Conventional Commits (otomatis via tooling atau manual), dikelompokkan per versi.
4. Breaking change wajib ditandai dengan `BREAKING CHANGE:` di footer commit atau `!` setelah tipe (mis. `feat!: ...`).

**Larangan:**

- DILARANG menaikkan MAJOR/MINOR/PATCH tanpa dasar Conventional Commits.
- DILARANG membuat tag pada branch selain `main` (kecuali hotfix yang langsung digabung ke `main`).

## Pertanyaan Terbuka (Belum Diputuskan)

Bagian berikut belum diputuskan dan akan dilengkapi pada diskusi lanjutan:

- Apakah commit langsung ke `main` diperbolehkan untuk `docs`/`chore` kecil, atau semua perubahan wajib PR?
- Apakah ada template PR standar (deskripsi, checklist, referensi issue) yang wajib dipakai?
- Berapa minimal reviewer yang diperlukan sebelum merge, dan apakah auto-merge diizinkan?
- Siapa yang membuat tag rilis dan kapan rilis dilakukan (per fitur, per sprint, atau manual)?
- Format changelog (Keep a Changelog, Conventional Changelog, atau custom) dan apakah wajib di-commit?
- Apakah aturan ini berlaku juga untuk submodule (`base_coc`, `share_global_saya`) atau hanya repo root?

## Sumber Evaluasi

- Rujukan hasil diskusi: `hasil_diskusi/diskusi_2.md` (K-1 s.d. K-6).
- Aturan global lain: `.agents/rules/global/aturan_global.md` (indeks aturan global).
- Commit rujukan: belum ada (aturan ini dibuat dari hasil diskusi, belum diimplementasikan ke kode).