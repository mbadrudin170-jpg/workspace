---
name: empty-state-daftar
description: "Trigger: saat membuat empty state daftar atau non-daftar | Panduan komponen bersama EmptyStateView (ikon, judul, deskripsi, CTA opsional), CTA kontekstual, SafeArea + padding, warna ColorScheme; DILARANG `Center(child: Text(...))` atau empty state custom per layar. Empty State pada Daftar dan Layar Non-Daftar Ketika data kosong (daftar maupun tampilan non-daftar), gunakan komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`) dengan CTA kontekstual; jangan membuat implementasi empty state per layar. Aturan 1. Empty state wajib memakai komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`): `ikon`, `judul`, `deskripsi`, dan CTA opsional (`ctaLabel` + `onCta`). 2. `ctaLabel` dan `onCta` wajib diisi berpasangan atau keduanya `null` (widget sudah menegakkan lewat `assert`); CTA yang tersedia dirender sebagai `OutlinedButton`. 3. `EmptyStateView` bersifat pure (tidak membaca provider); teks dan aksi disediakan pemanggil. 4. `EmptyStateView` sudah membungkus `SafeArea` + `Padding(all: 16)` + `Center` + `Column(mainAxisS"
metadata:
  kategori: "custom"
  versi: "1.1.1"
  diperbarui: "Sun Nov 22 2026 12:45 WIB"
---

# Empty State pada Daftar dan Layar Non-Daftar

Ketika data kosong (daftar maupun tampilan non-daftar), gunakan komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`) dengan CTA kontekstual; jangan membuat implementasi empty state per layar.

## Aturan

1. Empty state wajib memakai komponen bersama `EmptyStateView` (`lib/shared/widget/empty_state_view.dart`): `ikon`, `judul`, `deskripsi`, dan CTA opsional (`ctaLabel` + `onCta`).
2. `ctaLabel` dan `onCta` wajib diisi berpasangan atau keduanya `null` (widget sudah menegakkan lewat `assert`); CTA yang tersedia dirender sebagai `OutlinedButton`.
3. `EmptyStateView` bersifat pure (tidak membaca provider); teks dan aksi disediakan pemanggil.
4. `EmptyStateView` sudah membungkus `SafeArea` + `Padding(all: 16)` + `Center` + `Column(mainAxisSize: MainAxisSize.min, spacing: 8)`; warna ikon dan deskripsi dari `colorScheme.onSurfaceVariant`, judul dari `textTheme.titleMedium` tebal. Jangan membungkus ulang dengan `SafeArea`/`Padding` ganda di layar.
5. Sertakan CTA kontekstual (mis. "Tambah Impian", "Beralih ke catatan") yang mengarah ke aksi/form yang relevan; CTA boleh `null` bila layar memang tidak punya aksi (mis. read-only).
6. Terapkan pada semua kondisi "belum ada data" — daftar maupun layar non-daftar (kalender, pelacakan toxin, pemulihan kesehatan) — agar pola tampilan konsisten.
7. Hapus komponen empty state custom per layar setelah migrasi ke `EmptyStateView` (jangan biarkan dua pola hidup berdampingan).

## Larangan

- Jangan menampilkan layar kosong tanpa informasi.
- Jangan membuat widget empty state custom per layar yang menduplikasi `EmptyStateView`.
- Jangan mengisi hanya salah satu dari `ctaLabel`/`onCta`.
- Jangan membungkus `EmptyStateView` dengan `SafeArea`/`Padding` lain.
- Jangan hardcode warna pada empty state; gunakan `ColorScheme`/`TextTheme`.

## Contoh Benar

```dart
import 'package:berhenti_merokok/shared/widget/empty_state_view.dart';

// Di layar daftar:
if (impianState.listImpian.isEmpty) {
  return EmptyStateView(
    ikon: CupertinoIcons.flag,
    judul: 'Belum ada impian',
    deskripsi: 'Catat impian yang ingin kamu capai dengan uang yang dihemat.',
    ctaLabel: 'Tambah Impian',
    onCta: () => unawaited(
      Nav.to(context, const FormImpian()).catchError((Object e, StackTrace s) {
        L.e('Gagal navigasi ke Form Impian: $e $s');
        return null;
      }),
    ),
  );
}

// Di layar non-daftar (tanpa CTA):
if (!adaData) {
  return const EmptyStateView(
    ikon: CupertinoIcons.heart,
    judul: 'Belum ada data pemulihan',
    deskripsi: 'Data kesehatan akan muncul setelah Anda berhenti merokok.',
  );
}
```

## Contoh Salah

```dart
// Widget empty state custom per layar (duplikasi):
class _EmptyDiaryCraving extends StatelessWidget { ... }

// Hanya satu dari ctaLabel/onCta diisi:
EmptyStateView(ikon: Icons.add, judul: '...', deskripsi: '...', ctaLabel: 'Tambah'); // assert gagal

// Membungkus ganda:
SafeArea(child: Padding(padding: EdgeInsets.all(16), child: EmptyStateView(...)));

// Layar kosong tanpa informasi sama sekali:
if (list.isEmpty) return const Scaffold(body: SizedBox.shrink());
```
