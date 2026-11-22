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
- Status: Selesai.
