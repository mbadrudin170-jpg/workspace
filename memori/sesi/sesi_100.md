# Sesi 100

- Tugas: Perbaiki `admin_wifi/lib/widget/transaksi_list_widgets.dart:25-26` penggunaan operator `!` pada `grouped[date]!.add(t)`; kodifikasi aturan ke `.agents/rules/code.md` dan skill `pencarian-koleksi-null-safe`; tambah contoh kode benar; perbarui deskripsi skill.
- Perubahan:
  - `admin_wifi/lib/widget/transaksi_list_widgets.dart`: ganti `if (grouped[date] == null) { grouped[date] = []; } grouped[date]!.add(t);` dengan `grouped.putIfAbsent(date, () => []).add(t);`.
  - `.agents/rules/code.md` aturan 36: tambahkan alternatif `putIfAbsent` saat menambah ke koleksi di dalam Map beserta contoh.
  - `.agents/skills/pencarian-koleksi-null-safe/SKILL.md`: tambah aturan 14-15 (putIfAbsent), contoh benar/salah, larangan `map[key]!.add(x)`, perbarui description dan tanggal diperbarui.
- Status: Selesai.
