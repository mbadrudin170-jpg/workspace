diperbarui : Fri Nov 20 2026 16:05 WIB
ditimpa ke : `.agents/skills/non-code/perbaikan-test-notifikasi/SKILL.md`

1. Saat memperbaiki test notifikasi, baca log aktual jumlah jadwal notifikasi dari kode produksi.
2. Cocokkan jumlah dengan kontrak domain (mis. `notifikasiPelangganAktif`), bukan asumsi test.
3. Setelah setup yang memanggil mock yang sama, panggil `clearInteractions(mock)` sebelum verifikasi.
4. Verifikasi perilaku tahap yang diuji saja.
5. Verifikasi ID/hash notifikasi spesifik, bukan total call global.
6. Jalankan test terkait terlebih dahulu, baru seluruh test.
