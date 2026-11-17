description: Riset kompetitor aplikasi mobile dan analisis fitur ke refrensi_apk.md.

# Riset Kompetitor

1. Baca `AGENTS.md` terlebih dahulu dan patuhi aturannya.
2. Baca `instructions` pada `.kilo/kilo.jsonc` dan patuhi aturan yang terdaftar.
3. Baca `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan skill `riset-kompetitor` sebelum riset.
4. `$ARGUMENTS` opsional: nama aplikasi atau store yang diprioritaskan; kosong → ambil maksimal 10 listing `Belum Dianalisa` sesuai urutan katalog.
5. Analisis hanya listing `Belum Dianalisa`; maksimal 10 per run.
6. Per listing analisis: fitur mobile, optimalisasi fitur yang sudah ada, pola UI/UX/layout; tandai `Sudah Dianalisa` setelah analisa.
7. Perbarui `refrensi_apk.md`: sertakan link referensi, kelompokkan per fitur dan UI/UX, jelaskan tujuan, susun berdasarkan prioritas.
8. Larangan: jangan analisis listing `Sudah Dianalisa` tanpa perintah pengguna; jangan rekomendasikan fitur web/desktop; jangan mengarang link/fitur/temuan; jangan ubah kode Dart atau berkas selain `apk_kompetitor.md` dan `refrensi_apk.md`; jangan commit/push.
9. STOP bila dokumen proyek tidak tersedia, katalog kosong, atau seluruh listing sudah dianalisis.
10. Format laporan: tabel (Listing, Store, Link, Fitur/UI/UX ditemukan, Prioritas) + jumlah listing yang dianalisis dan berkas yang diperbarui.
11. Tambahkan section contoh pada `refrensi_apk.md` dengan format: `A1 <fitur> — prioritas: <Tinggi/Sedang/Rendah> — ringkasan singkat: <1 kalimat>` (contoh: `A1 Tambah Kopi — prioritas: Sedang — ringkasan singkat: fitur pencatatan konsumsi kopi harian dengan pengingat`).
12. Baca `fitur_khusus.md` dan cari fitur-fitur yang diinginkan pengguna yang terdaftar di sana, lalu masukkan ke `refrensi_apk.md` ditandai sebagai prioritas.

# Skill Terkait

- riset-kompetitor
- memori-check
