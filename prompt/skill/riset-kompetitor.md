diperbarui : Mon Nov 16 2026 12:52 WIB
file : [riset-kompetitor](../../.agents/skills/custom/riset-kompetitor/SKILL.md)

1. Tentukan aplikasi sasaran dan fitur intinya dari `README.md`, `AGENTS.md`, PRD, atau dokumen produk proyek; jangan menebak dari nama repositori.
2. Katalog default `apk_kompetitor.md` (kolom: Nama Aplikasi, Ringkasan Singkat, Store, Link, Status Analisa); analisa lanjutan ditulis ke `refrensi_apk.md` (bagian A–G).
3. Setiap listing wajib memuat nama, ringkasan 2–3 kalimat yang menyebut fitur relevan dengan aplikasi sasaran, nama store/sumber, link resmi, dan `Status Analisa` (`Belum Dianalisa`/`Sudah Dianalisa`).
4. Link wajib mengarah ke halaman resmi store/repositori (format `[Buka Aplikasi](url)` dsb.) dan diverifikasi aktif; HTTP 404 → buang entri; HTTP 403 pada APKPure/Aptoide/SlideME = anti-bot, bukan link mati.
5. Satu run mencakup semua store dengan urutan Google Play → F-Droid → GitHub → Apple App Store → Samsung Galaxy Store → Mi/GetApps → Oppo App Market → store lainnya; catat hasil tiap store termasuk nihil temuan.
6. Duplikat diperiksa berdasarkan package id; aplikasi yang sama di store berbeda dicatat sebagai baris terpisah.
7. Batch besar: tambahkan section `# Tambahan Riset (YYYY-MM-DD)` dengan sub-section `## <Store>`; setiap tabel tetap wajib header + separator.
8. Analisa hanya listing `Belum Dianalisa`; setelah analisa selesai per APK ubah status menjadi `Sudah Dianalisa`; listing baru dari `cari_apk_kompetitor.md` wajib `Belum Dianalisa`.
9. `refrensi_apk.md` memuat rekomendasi fitur mobile, tujuan, prioritas (Tinggi/Sedang/Rendah), dan link; fitur non-mobile hanya referensi pola; fitur yang butuh backend/akun ditandai dan prioritas rendah.
10. Klasifikasikan verifikasi listing: terverifikasi / verifikasi ringan / tidak terverifikasi; listing tidak terverifikasi tidak dijadikan dasar rekomendasi.
11. Temuan cacat kode saat riset dicatat di `refrensi_apk.md` dengan prioritas dan path file, tidak diperbaiki sebagai bagian tugas riset.
12. Jika aplikasi sasaran berubah, verifikasi ulang relevansi setiap listing atau buat katalog baru sesuai perintah pengguna.
13. Link APK yang cacat atau tidak dapat ditemukan tidak perlu dipindai ulang; tandai sebagai tidak terverifikasi atau tidak disertakan.
14. Catat tanggal pembaruan (mis. `diperbarui: YYYY-MM-DD`) pada `apk_kompetitor.md` dan `refrensi_apk.md` setiap kali berkas diperbarui.
