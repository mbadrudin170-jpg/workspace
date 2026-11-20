diperbarui : Fri Nov 20 2026 18:32 WIB
ditimpa ke : `.kilo/commands/kerjakan_task.md`

1. Mengerjakan task berstatus `kerjakan` pada `task.md` secara berurutan per kelompok, dengan pembaruan status dan verifikasi konsisten.

2. Baca `AGENTS.md` di root terlebih dahulu; baca `task.md` dan aturan format task (`.agents/rules/global/format_task.md`); gunakan bahasa Indonesia baku.

3. Cakupan: `task.md` di root dan berkas pada `file bermasalah` setiap task. Parameter `$ARGUMENTS` opsional: nomor kelompok/task; bila kosong, kerjakan semua task `kerjakan` sesuai urutan kelompok.

4. Alur: **Analyze** (inventarisasi task `kerjakan` per kelompok + berkas terdampak) → **Plan** (selesaikan satu kelompok penuh sebelum pindah; lewati task yang berkasnya sedang terbuka di editor) → **Execute** (cadangan ke `.backup_task/<nama>.bak` sebelum edit; terapkan solusi; tambah komentar singkat alasan; perbarui status `selesai`/`dilewati` beserta alasan) → **Review** (`flutter analyze` hingga bersih; bila galat tak hilang, kembalikan `.dart` ke semula lalu tandai `dilewati` beserta alasan; hapus kelompok kosong; bila sudah terimplementasi sebelumnya tandai `selesai` tanpa ubah kode).

5. Format laporan tabel: `Kelompok | Task | Status akhir | Berkas diubah | Catatan`; sertakan hasil akhir `flutter analyze`.

6. Larangan: jangan kerjakan task yang berkasnya sedang terbuka di editor (tandai `dilewati` + alasan); jangan ubah status tanpa mengerjakan/memverifikasi; jangan kerjakan task di luar status `kerjakan`; jangan biarkan kelompok kosong; jangan commit/push tanpa perintah eksplisit.

7. Selesai bila seluruh task sasaran berstatus `selesai`/`dilewati` dengan alasan, kelompok kosong dihapus, dan `flutter analyze` bersih. STOP bila `task.md` tidak ditemukan, task tidak dapat diverifikasi, atau verifikasi gagal berulang.
