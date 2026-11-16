diperbarui : Mon Nov 16 2026 12:55 WIB
file : [riset_kompetitor](../../.kilo/commands/riset_kompetitor.md)

1. Baca `README.md`, `AGENTS.md`, `apk_kompetitor.md`, dan skill `riset-kompetitor` sebelum riset.
2. `$ARGUMENTS` opsional: nama aplikasi atau store yang diprioritaskan; kosong → ambil maksimal 10 listing `Belum Dianalisa` sesuai urutan katalog.
3. Analisis hanya listing `Belum Dianalisa`; maksimal 10 per run.
4. Per listing analisis: fitur mobile, optimalisasi fitur yang sudah ada, pola UI/UX/layout; tandai `Sudah Dianalisa` setelah analisa.
5. Perbarui `refrensi_apk.md`: sertakan link referensi, kelompokkan per fitur dan UI/UX, jelaskan tujuan, susun berdasarkan prioritas.
6. Larangan: jangan analisis listing `Sudah Dianalisa` tanpa perintah pengguna; jangan rekomendasikan fitur web/desktop; jangan mengarang link/fitur/temuan; jangan ubah kode Dart atau berkas selain `apk_kompetitor.md` dan `refrensi_apk.md`; jangan commit/push.
7. STOP bila dokumen proyek tidak tersedia, katalog kosong, atau seluruh listing sudah dianalisis.
8. Format laporan: tabel (Listing, Store, Link, Fitur/UI/UX ditemukan, Prioritas) + jumlah listing yang dianalisis dan berkas yang diperbarui.
9. tambah satu section untuk list contoh :
    - A1 tambah kopi = perioritas = ringkasan singkat
