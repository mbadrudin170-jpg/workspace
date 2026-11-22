# Sesi 100

- Tugas 1: Perbaiki `admin_wifi/lib/widget/transaksi_list_widgets.dart:25-26` penggunaan operator `!` pada `grouped[date]!.add(t)`; kodifikasi aturan ke `.agents/rules/code.md` dan skill `pencarian-koleksi-null-safe`; tambah contoh kode benar; perbarui deskripsi skill.
- Perubahan Tugas 1:
  - `admin_wifi/lib/widget/transaksi_list_widgets.dart`: ganti `if (grouped[date] == null) { grouped[date] = []; } grouped[date]!.add(t);` dengan `grouped.putIfAbsent(date, () => []).add(t);`.
  - `.agents/rules/code.md` aturan 36: tambahkan alternatif `putIfAbsent` saat menambah ke koleksi di dalam Map beserta contoh.
  - `.agents/skills/pencarian-koleksi-null-safe/SKILL.md`: tambah aturan 14-15 (putIfAbsent), contoh benar/salah, larangan `map[key]!.add(x)`, perbarui description dan tanggal diperbarui.

- Tugas 2: Ubah `AlertDialog` manual di `admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart:69` agar sesuai aturan (dialog konfirmasi ya/tidak wajib `showOkCancelAlertDialog` dari `adaptive_dialog`).
- Perubahan Tugas 2:
  - Tambah import `package:adaptive_dialog/adaptive_dialog.dart`.
  - `_tampilkanDialogHapusSemua` dan `_showDialogHapusSatu` dikonversi ke `showOkCancelAlertDialog` (OkCancelResult.ok), menghapus `showDialog` + `AlertDialog` manual.
- Tugas 3: Satukan `_hapusSemuaDompet()` ke dalam `_tampilkanDialogHapusSemua()` di `admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart` (hapus method terpisah, inline logika hapus + `_loadDompet()` setelah konfirmasi).
- Tugas 4: Satukan `_hapusSatuDompet()` ke dalam `_showDialogHapusSatu()` di `admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart`.
- Tugas 5: Hapus method `_loadDompet()` di `admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart`; inline pemanggilan `muatUlang()` + refresh ringkasan di call site.
- Tugas 6: Kodifikasi aturan dialog konfirmasi (showOkCancelAlertDialog) ke `.agents/rules/code.md` aturan 30 (contoh benar) dan skill `pola-ux` (deskripsi, contoh benar/salah, larangan); perbarui tanggal.
- Tugas 7: Tambahkan tombol "Coba Lagi" pada state error DompetPage (`admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart`) dengan `ref.refresh(dompetProvider)`, mengikuti pola transaksi_screen.
- Tugas 8: Pisahkan tampilan error DompetPage ke widget privat `_TampilanErrorDompet` (StatelessWidget dengan onRetry).
- Tugas 9: Ubah `_TampilanErrorDompet` (widget privat) menjadi method privat `_buildTampilanError` di `admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart`.
- Tugas 10: Audit/perbaikan `admin_wifi/lib/fitur/dompet/screens/dompet_screen.dart` sesuai skill dimuat: empty state → EmptyStateView, tipografi DompetCard via textTheme, hapus `late` field `_dompetOperasi` (inline ref.read), retry button pada RingkasanKeuangan error, impor core_shared, dart format.
- Tugas 11: Kodifikasi aturan EmptyStateView (empty-state-daftar) dan tipografi (textTheme) ke `.agents/rules/code.md` (aturan 37-38) beserta contoh benar; perbarui deskripsi dan tanggal skill terkait.
- Status: Selesai.
