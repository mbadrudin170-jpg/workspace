---
name: observabilitas-aplikasi
description: Gunakan saat menambah, meninjau, memperbaiki, atau menganalisis log, pencatatan nilai variabel, pelacakan pemanggilan fungsi, metrik, performa, error, dan kesehatan aplikasi Flutter/Dart.
---

# Observabilitas Aplikasi Flutter dan Dart

## Tujuan dan prinsip utama

Bangun sistem agar pengembang dapat mengetahui apa yang terjadi di aplikasi saat berjalan: fungsi apa yang dipanggil, fungsi apa yang benar-benar mulai bekerja, kapan fungsi selesai atau gagal, jalur mana yang tidak dijalankan, nilai variabel apa yang berubah, dan bagian mana yang bermasalah atau lambat.

Observabilitas mencakup tiga pilar:

1. **Log:** catatan peristiwa, pemanggilan fungsi, nilai, keputusan, hasil, dan kegagalan.
2. **Metrik:** angka terukur untuk jumlah panggilan, keberhasilan, kegagalan, durasi, penggunaan sumber daya, dan tren.
3. **Pelacakan alur:** urutan hubungan pemanggil dan fungsi yang dipanggil, termasuk durasi setiap tahap.

Jangan membatasi informasi diagnostik secara membabi buta. Atur tingkat detail, penyimpanan, privasi, dan biaya instrumentasi. Saat investigasi membutuhkan detail penuh, aktifkan TRACE untuk alur yang ditargetkan. Jangan menghilangkan bukti tanpa menandai data yang dilewati atau tidak tersedia.

Aturan proyek, aturan workspace, instruksi pengguna, dan kebijakan privasi tetap berlaku.

## 1. Pemeriksaan wajib sebelum bekerja

1. Baca memori proyek dan seluruh aturan yang berlaku sebelum memeriksa atau mengubah kode. Ikuti `MEMORI.md`, `.agents/rules/global/`, aturan proyek, skill `memori-check`, dan skill lain yang relevan. Untuk workspace multi-repo, periksa submodule pada SHA yang dipatok parent repo.
2. Periksa logger dan sistem telemetry yang sudah digunakan, termasuk versi package pada `pubspec.yaml` dan `pubspec.lock`, konfigurasi level, keluaran console/file, pelaporan crash, metrik, pelacakan alur, dan penanganan error global.
3. Ikuti sistem yang sudah ada. Jangan menambahkan logger, package, wrapper, atau backend duplikat tanpa alasan yang terbukti.
4. Baca kode dari titik pemanggilan hingga hasil digunakan. Jangan menyimpulkan akar masalah hanya dari satu pesan log.
5. Pastikan platform, versi OS, mode debug/profile/release, izin, dan batasan runtime yang relevan.
6. Jika hanya diminta analisis, jangan mengubah file. Jangan menjalankan build lokal jika aturan proyek melarangnya. Jangan commit atau mengganti branch tanpa izin.
7. Verifikasi dokumentasi resmi sesuai versi SDK, package, dan platform sebelum merekomendasikan API instrumentasi.

## 2. Pelacakan siklus hidup fungsi — wajib

Tujuan bagian ini adalah membuat pengembang dapat menjawab: **fungsi mana yang dipanggil, mulai berjalan, selesai, gagal, dibatalkan, dilewati, masih menunggu, atau belum pernah teramati?** Terapkan pada seluruh fungsi yang termasuk dalam ruang lingkup pengguna.

### 2.1 Peristiwa fungsi yang harus dibedakan

Gunakan nama peristiwa yang konsisten. Contoh nama berikut bersifat konseptual dan harus disesuaikan dengan logger proyek.

| Peristiwa/status | Makna | Bukti yang diperlukan |
|---|---|---|
| `function.call_requested` | Pemanggil akan memanggil fungsi atau mengirim pekerjaan ke dispatcher | Log di sisi pemanggil tepat sebelum pemanggilan/penjadwalan |
| `function.started` | Eksekusi benar-benar memasuki badan fungsi | Log pada awal badan fungsi |
| `function.completed` | Fungsi keluar secara normal dan menghasilkan nilai/hasil | Log pada seluruh jalur keluar normal, termasuk `return` lebih awal |
| `function.failed` | Fungsi keluar karena exception/error | Exception dan stack trace pada batas penanganan yang tepat |
| `function.cancelled` | Operasi dibatalkan secara eksplisit | Sumber, alasan, dan waktu pembatalan |
| `function.skipped` | Keputusan program memang melewati pemanggilan | Cabang/aturan yang menyebabkan fungsi tidak dipanggil dan alasannya |
| `function.scheduled` | Pekerjaan dimasukkan ke timer, antrean, isolate, atau scheduler | ID pekerjaan, pemicu, dan target eksekusi |
| `function.pending` | Fungsi/pekerjaan sudah dimulai atau dijadwalkan tetapi belum ada hasil akhir | ID yang sama, waktu mulai, serta status terakhir |

Jangan menyamakan `call_requested` dengan `started`. Pemanggilan dapat gagal sebelum masuk ke badan fungsi, pekerjaan dapat tertunda di antrean, atau callback tidak pernah dieksekusi.

### 2.2 Identitas dan hubungan pemanggilan

Setiap pemanggilan harus dapat dibedakan, terutama saat fungsi dipanggil berkali-kali, bersamaan, atau secara rekursif. Gunakan field bila relevan:

- `function`: nama fungsi/metode yang stabil.
- `class` dan `file`: pemilik serta lokasi fungsi.
- `caller`: fungsi pemanggil langsung jika diketahui.
- `invocationId`: ID unik untuk satu kejadian pemanggilan.
- `parentInvocationId` atau `traceId`: menghubungkan fungsi anak ke fungsi induk.
- `trigger`: tombol UI, route, lifecycle, timer, stream, callback, event, atau pemicu lain.
- `arguments`: parameter aman yang diterima.
- `startedAt`, `completedAt`, `durationMs`: waktu dan durasi.
- `status`, `returnValue` atau ringkasan hasil, `exception`, `stackTrace`.
- `attempt` atau `iteration`: nomor percobaan/iterasi jika berulang.

Jangan menggabungkan beberapa pemanggilan fungsi yang sama ke satu catatan. Satu `invocationId` harus menghubungkan peristiwa mulai dan hasil akhir dari pemanggilan yang sama.

### 2.3 Semua jalur keluar harus terpantau

1. Catat `function.started` setelah fungsi benar-benar masuk.
2. Catat `function.completed` untuk setiap jalur `return`, termasuk `return` dini di tengah fungsi. Sertakan alasan/cabang yang menghasilkan return tersebut.
3. Catat `function.failed` jika exception keluar dari fungsi. Jangan menelan exception hanya demi membuat log selesai.
4. Catat pembatalan secara terpisah dari kegagalan biasa jika kontrak operasi mendukung cancellation.
5. Gunakan satu mekanisme pencatatan akhir yang sesuai, seperti pembungkus fungsi atau struktur `try/catch/finally`, agar tidak ada jalur keluar yang terlupakan. Jangan mengubah perilaku fungsi hanya demi menyederhanakan log.
6. Untuk fungsi yang tidak mencapai status akhir, tandai sebagai `pending` atau `unknown` setelah batas waktu pemantauan yang ditetapkan; jangan langsung menyebutnya gagal.

### 2.4 Fungsi yang tidak dipanggil atau tidak berjalan

Ketiadaan `function.started` **tidak otomatis membuktikan fungsi tidak pernah dipanggil**. Kesimpulan hanya boleh dibuat bila cakupan instrumentasi dan periode pengamatan lengkap.

Gunakan kategori berikut:

- **Tidak dipanggil (`not_called`):** bukti alur menunjukkan tidak ada jalur pemanggilan pada periode/skenario yang diperiksa. Sebutkan cakupan dan pemicunya.
- **Dilewati (`skipped`):** ada keputusan eksplisit seperti kondisi `false`, permission ditolak, cache hit, fitur nonaktif, atau validasi gagal sebelum pemanggilan.
- **Dijadwalkan tetapi belum berjalan (`scheduled_not_started`):** pekerjaan masuk antrean/timer tetapi belum masuk ke badan fungsi.
- **Belum selesai (`pending`):** fungsi sudah mulai tetapi belum ditemukan hasil akhir dalam batas pengamatan.
- **Tidak teramati (`not_observed`):** log tidak cukup atau instrumentasi tidak lengkap untuk menyimpulkan fungsi dipanggil atau tidak.
- **Tidak dapat dijangkau secara statis (`statically_unreferenced`):** tidak ditemukan referensi/pemanggil statis dalam cakupan pencarian; ini bukan bukti mutlak bahwa fungsi tidak pernah berjalan karena callback, refleksi, generator, routing, dependency injection, atau pemanggilan native dapat bersifat dinamis.

Untuk membuktikan fungsi tidak berjalan, kombinasikan pemeriksaan call site/route/registrasi callback, log di sisi pemanggil, log pada awal fungsi, hasil profiler, dan pengujian/coverage yang sesuai. Nyatakan batas bukti. Jangan menulis "fungsi tidak dipanggil" hanya karena log fungsi tidak muncul.

### 2.5 Jenis fungsi dan pemicu khusus

Periksa bentuk pemanggilan berikut sesuai proyek:

- Fungsi sinkron dan metode instance/static.
- `async`/`Future`, termasuk fungsi fire-and-forget.
- `Stream` dan callback yang dipanggil berulang.
- Timer, periodic task, debounce, throttle, retry, dan antrean.
- Event handler, tombol UI, route/navigation, lifecycle widget/aplikasi.
- Provider/notifier/state management dan listener.
- Konstruktor, factory, extension, serta fungsi yang dipanggil melalui dependency injection.
- `MethodChannel`/`EventChannel` dan panggilan native Android/iOS.
- Isolate atau pekerjaan paralel.

Untuk callback, catat apakah callback **didaftarkan**, **dipicu**, dan **dijalankan** sebagai tiga keadaan berbeda. Untuk stream, bedakan subscription dibuat, event diterima, handler berjalan, stream selesai, dan subscription dibatalkan. Untuk timer, bedakan timer dibuat, tick terjadi, callback mulai, dan timer dibatalkan.

Untuk fungsi fire-and-forget, pastikan error Future tetap diamati. Catat penjadwalan, awal eksekusi, dan penyelesaian; jangan biarkan kegagalan asynchronous hilang tanpa log.

### 2.6 Ringkasan pemanggilan fungsi

Untuk setiap fitur atau skenario, hasilkan ringkasan yang dapat menjawab:

| Fungsi | Dipanggil | Mulai | Selesai | Gagal | Dilewati | Pending/tidak teramati |
|---|---:|---:|---:|---:|---:|---:|
| `loadData()` | jumlah | jumlah | jumlah | jumlah | jumlah | jumlah |

Angka harus berasal dari event yang benar-benar tercatat, bukan perkiraan. Jika satu fungsi dipanggil 10 kali, jangan hanya menulis status umum "berjalan"; tunjukkan jumlah invocation dan hasil masing-masing atau ringkasannya.

Sediakan laporan per fungsi dengan lokasi file/baris, pemicu, caller, jumlah pemanggilan, jumlah sukses/gagal/dilewati, invocation yang masih tertunda, durasi min/median/max atau percentile bila datanya cukup, serta bukti yang belum tersedia.

## 3. Kebijakan pencatatan variabel

Saat pengguna meminta logging menyeluruh atau menambahkan instrumentasi pada ruang lingkup fungsi/fitur, setiap variabel dalam cakupan wajib memiliki representasi log.

Cakupan meliputi:
- Semua parameter fungsi dan callback.
- Semua variabel lokal (`var`, `final`, `const`), nullable maupun non-nullable.
- Nilai antara, hasil transformasi, parsing, query, pemetaan, dan perhitungan.
- Nilai sebelum dan sesudah perubahan variabel mutable.
- Variabel loop/iterasi, accumulator, indeks, dan kondisi cabang ketika TRACE aktif.
- Nilai sebelum dan sesudah `await`, hasil Future, callback, stream event, serta nilai return.
- State/field yang dibaca atau diubah oleh alur.

Aturan:
1. Catat nilai saat tersedia, saat berubah, dan saat keluar dari fungsi. Jangan hanya mencatat hasil akhir jika perubahan antara dapat menjelaskan bug.
2. Catat nilai yang menentukan percabangan, hasil kondisi, dan cabang yang dipilih.
3. Jangan mengevaluasi ekspresi dua kali hanya untuk logging. Simpan snapshot dari nilai yang sudah dihitung.
4. Untuk objek/collection, gunakan snapshot terstruktur dan aman; jangan hanya mencetak `Instance of ...` atau memanggil getter yang memiliki efek samping.
5. Untuk data besar, catat tipe, ukuran, jumlah item, bagian yang direkam, dan status `truncated`. Jangan mengklaim snapshot lengkap jika dipotong.
6. Variabel yang tidak tersedia tetap muncul dengan status seperti `null`, `unavailable`, `uninitialized`, `redacted`, atau `truncated` beserta alasan.
7. Variabel sensitif tetap dicatat nama dan statusnya, tetapi nilainya harus disamarkan. Jangan mencatat password, token, API key, secret `.env`, cookie, kredensial, atau data pribadi mentah.
8. Terapkan ke semua fungsi pada ruang lingkup yang diminta. Laporkan secara jujur variabel atau jalur yang belum terinstrumentasi.

Gunakan TRACE untuk nilai setiap langkah dan iterasi, DEBUG untuk snapshot batas operasi/perubahan state, dan INFO untuk ringkasan. Ringkasan tidak menggantikan pencatatan variabel yang diminta.

## 4. Cakupan pemantauan kesehatan aplikasi

Evaluasi area yang relevan dan sebutkan sumber serta batas pengukurannya.

| Area | Sinyal yang diperiksa |
|---|---|
| Startup/lifecycle | Tahap inisialisasi, fungsi yang berjalan, durasi, resume/pause, crash |
| UI/rendering | Durasi frame UI/raster, jank, rebuild/layout/paint mahal |
| CPU/isolate | Fungsi mahal, pekerjaan blocking, antrean komputasi |
| Memori/resource | Heap, native/external memory, tren alokasi, indikasi kebocoran, resource yang tidak dilepas |
| Database | Query, durasi, jumlah baris, transaksi commit/rollback, migrasi, error |
| Jaringan | Ketersediaan, latency, timeout, error rate, retry, packet loss bila benar diukur |
| API/backend | Durasi request, status, error, sinkronisasi, konflik |
| State management | Transisi state, nilai state, asal event, state usang, error notifier/provider |
| Background task | Jadwal, antrean, pemanggilan callback, durasi, retry, status akhir |
| Plugin/native | Status permission, input/output platform channel, durasi, exception native |
| Keandalan fitur | Rasio sukses/gagal/timeout, fallback, jumlah operasi selesai |

Bedakan kesehatan saat aplikasi berjalan dari kualitas kode statis. Log tidak membuktikan seluruh kualitas kode; gabungkan dengan analisis statis, pengujian, coverage, dan review kode.

## 5. Level log dan struktur peristiwa

Gunakan level yang didukung logger proyek:

| Level | Penggunaan |
|---|---|
| `TRACE` | Setiap pemanggilan, nilai variabel per langkah, iterasi, dan detail investigasi. |
| `DEBUG` | Snapshot parameter, perubahan state, keputusan, dan hasil antara. |
| `INFO` | Ringkasan pemanggilan dan penyelesaian operasi penting. |
| `WARNING` | Kondisi tidak ideal yang ditangani, fallback, atau pekerjaan dilewati karena alasan yang diketahui. |
| `ERROR` | Fungsi/operasi gagal; sertakan exception dan stack trace pada batas penanganan yang tepat. |
| `FATAL` | Kegagalan kritis jika logger proyek mendukungnya. |

Gunakan field terstruktur yang relevan: `event`, `function`, `class`, `file`, `caller`, `trigger`, `invocationId`, `parentInvocationId`, `traceId`, `arguments`, `variables`, `status`, `reason`, `returnValue`, `durationMs`, `exception`, dan `stackTrace`.

Contoh konseptual; sesuaikan dengan API logger proyek:

```dart
logger.trace('function.started', data: {
  'function': 'loadDevices',
  'caller': 'refreshDevices',
  'invocationId': invocationId,
  'arguments': {
    'subnet': subnet,
    'timeoutMs': timeout.inMilliseconds,
  },
});

logger.debug('function.completed', data: {
  'function': 'loadDevices',
  'invocationId': invocationId,
  'status': 'success',
  'resultCount': devices.length,
  'durationMs': stopwatch.elapsedMilliseconds,
});
```

Contoh di atas bersifat ilustratif, bukan jaminan API logger tertentu. Jangan menyalinnya sebelum memeriksa package dan versi proyek.

Untuk volume tinggi, gunakan tingkat detail yang tepat, ringkasan, buffering, sampling, atau agregasi secara transparan. Saat pengguna meminta semua pemanggilan/nilai dalam sesi debugging, jangan membuang event tersebut diam-diam. Catat jumlah event yang dihasilkan, disimpan, disampling, atau dilewati.

## 6. Metrik dan pelacakan alur

- **Counter:** total pemanggilan fungsi, selesai, gagal, dilewati, dibatalkan, dan retry.
- **Gauge:** pekerjaan yang sedang berjalan, antrean, subscription aktif, dan resource aktif bila sumbernya tersedia.
- **Histogram:** durasi fungsi, query, startup, request, dan operasi agar p50/p95/p99 dapat dinilai.
- **Trace/span:** hubungan caller-callee dan tahapan operasi yang sama melalui ID korelasi. Ukur durasi setiap tahap.

Hindari label metrik dengan cardinality tinggi seperti ID bebas atau alamat perangkat unik. Simpan rincian individual pada log/trace yang aman. Jangan membuat span untuk setiap fungsi kecil tanpa manfaat; prioritaskan fungsi batas operasi dan fungsi yang penting bagi diagnosis.

## 7. Instrumentasi Flutter/Dart

- Gunakan Flutter/Dart DevTools untuk memeriksa performa, CPU, memori, timeline, jaringan, dan aktivitas widget sesuai dukungan platform.
- Gunakan Performance view untuk frame lambat/jank dan CPU profiler untuk fungsi yang menghabiskan waktu.
- Gunakan Memory view untuk memeriksa tren heap, alokasi, snapshot, dan instance yang tidak dilepas. Satu lonjakan alokasi belum membuktikan kebocoran memori.
- Gunakan timeline tracing (`dart:developer`) bila sesuai SDK dan kebutuhan; verifikasi API terhadap versi proyek.
- Pantau pembuatan dan pelepasan controller, subscription, stream, timer, socket, isolate, dan resource native.
- Untuk state management, catat event, fungsi pemicu, transisi state, nilai yang berubah, dan hasil notifier/provider.
- Untuk platform channel, catat nama metode, pemanggilan, argumen aman, hasil, durasi, permission, dan error native.
- Profiler CPU dapat menunjukkan fungsi yang aktif/sibuk dalam sampel; jangan menganggapnya otomatis sebagai hitungan lengkap setiap pemanggilan fungsi.

## 8. Instrumentasi jaringan dan pemindaian perangkat lokal

Pisahkan tahapan agar target dan hasil tidak tercampur:

1. `scan.started`: interface, subnet/prefix, jumlah target, dan konfigurasi probe aman.
2. `host.probe.started/completed`: target IP, metode, nomor sampel, nilai variabel, respons, durasi, timeout/error.
3. `mac_lookup.completed`: MAC tersedia/tidak, sumber, dan alasan.
4. `hostname_lookup.completed`: metode reverse DNS, mDNS, SSDP/UPnP, NetBIOS, atau data router; hasil dan sumber terpisah.
5. `vendor_lookup.completed`: sumber OUI, prefix cocok, atau alasan tidak ditemukan.
6. `latency.completed`: target yang diuji, metode, jumlah sampel, statistik yang benar-benar dihitung, loss/timeout, dan durasi.
7. `device_result.mapped`: pastikan probe, identitas, dan latency dipetakan ke objek dengan key/target sama.
8. `scan.completed`: jumlah target, host ditemukan, identitas berhasil, kegagalan tiap tahap, dan durasi total.

Catat setiap fungsi pada alur scan serta status pemanggilannya: fungsi yang dipanggil, yang mulai, selesai, gagal, dilewati karena kondisi/permission, atau belum teramati. Pastikan latency gateway tidak dianggap sebagai latency semua perangkat.

## 9. Penanganan async, exception, dan pembatalan

1. Ukur durasi dengan `Stopwatch` atau trace yang sesuai.
2. Untuk `Future`, catat penjadwalan/pemanggilan, awal badan fungsi, hasil `await`, dan penyelesaian akhir.
3. Untuk fire-and-forget, pastikan Future tetap memiliki penanganan error. Jangan membiarkan exception asinkron hilang.
4. Untuk `Stream`, bedakan subscription dibuat, event diterima, handler mulai/selesai, stream selesai, dan subscription dibatalkan.
5. Untuk timer/antrean, bedakan pekerjaan dijadwalkan, mulai, ditunda, dibatalkan, dan selesai.
6. Catat exception beserta stack trace pada batas penanganan yang tepat. Jangan menelan exception atau mencatat exception sama berulang kali di setiap lapisan.
7. Bedakan gagal, timeout, cancellation, `null`, data kosong, tidak didukung, dan permission ditolak.
8. Fungsi tanpa status akhir harus dilaporkan sebagai tertunda/tidak diketahui sampai ada bukti yang cukup.

## 10. Privasi dan biaya instrumentasi

Jangan mencatat nilai mentah rahasia atau data pribadi. Tetap tampilkan keberadaan variabel sensitif sebagai `redacted`, sertakan tipe/status dan alasan penyamaran.

Sebelum instrumentasi intensif, pertimbangkan overhead CPU, memori, I/O, jaringan, ukuran penyimpanan, retensi, dan pengaruhnya terhadap timing. Ukur dampaknya. Jangan menghapus informasi yang diminta secara diam-diam; jelaskan sampling, truncation, dan batas pengumpulan.

## 11. Analisis log dan pelacakan fungsi

Saat menerima log runtime atau diminta mencari fungsi yang tidak berjalan:

1. Urutkan event berdasarkan waktu, `traceId`, `parentInvocationId`, dan `invocationId`.
2. Susun rantai caller → callee untuk alur yang diperiksa.
3. Cocokkan `call_requested`, `scheduled`, `started`, dan status akhir. Cari pemanggilan yang tidak pernah mencapai badan fungsi atau tidak memiliki hasil akhir.
4. Periksa cabang kondisi, route, listener, callback registration, timer, subscription, permission, dan fitur yang dapat mencegah pemanggilan.
5. Bandingkan dengan call site dan kode aktual. Pisahkan fakta log dari kesimpulan statis.
6. Laporkan fungsi yang selesai, gagal, dilewati, tertunda, tidak teramati, dan tidak ditemukan referensi statis secara terpisah.
7. Jangan menyimpulkan `not_called` dari tidak adanya log jika instrumentasi tidak lengkap.
8. Identifikasi variabel dan peristiwa fungsi yang belum tercatat, lalu sarankan titik instrumentasi yang dapat membuktikan hipotesis.

Format laporan:
- **Ruang lingkup:** fitur, skenario, file/fungsi, dan periode log.
- **Fakta:** peristiwa yang benar-benar tercatat.
- **Peta pemanggilan:** caller, callee, pemicu, dan urutan eksekusi.
- **Ringkasan fungsi:** jumlah dipanggil, mulai, selesai, gagal, dilewati, pending, dan tidak teramati.
- **Fungsi yang diduga tidak berjalan:** alasan dan bukti; beri label belum pasti jika cakupan tidak lengkap.
- **Variabel yang belum tercatat:** nama variabel dan titik eksekusinya.
- **Hipotesis:** penyebab dan tingkat keyakinan.
- **Instrumentasi lanjutan:** lokasi dan event/field yang perlu ditambahkan.
- **Batas verifikasi:** jalur/platform yang belum diamati.

## 12. Prosedur menambah atau memperbaiki instrumentasi

1. Tentukan ruang lingkup fungsi/file/fitur dan pertanyaan yang harus dijawab.
2. Inventarisasi fungsi, caller/callee, pemicu, callback, route, timer, stream, dan pekerjaan asinkron terkait.
3. Inventarisasi seluruh parameter, variabel lokal, nilai antara, state, nilai return, dan status akhir setiap fungsi.
4. Buat peta event untuk `call_requested`, `started`, `completed`, `failed`, `cancelled`, `skipped`, dan `scheduled/pending` sesuai jalur yang memang ada.
5. Beri ID unik pada setiap invocation dan hubungkan fungsi anak dengan fungsi induk.
6. Pastikan semua jalur `return`, exception, dan cancellation menghasilkan status akhir yang benar.
7. Pastikan semua variabel di dalam cakupan tercatat atau memiliki status eksplisit seperti null/unavailable/redacted/truncated.
8. Verifikasi bahwa logging tidak mengubah perilaku, mengevaluasi ulang ekspresi, memanggil getter ber-efek samping, atau menelan error.
9. Tambahkan pengujian untuk jalur sukses, gagal, dilewati, async, cancellation, dan callback bila sesuai.
10. Laporkan cakupan aktual: fungsi yang diinstrumentasi, jumlah invocation yang terukur, variabel yang tercatat, jalur yang belum teramati, dan batas bukti.
11. Jangan mengklaim semua fungsi terpantau jika hanya sebagian fungsi atau jalur yang sudah diinstrumentasi.

## 13. Checklist kualitas

- [ ] Ruang lingkup fungsi dan skenario pengamatan dinyatakan jelas.
- [ ] Pemanggilan dibedakan dari fungsi yang benar-benar mulai berjalan.
- [ ] Jalur normal, `return` dini, exception, dan cancellation memiliki status akhir.
- [ ] Fungsi yang dilewati memiliki alasan dan sumber keputusan.
- [ ] Pekerjaan yang dijadwalkan dibedakan dari pekerjaan yang sudah mulai.
- [ ] Setiap invocation memiliki ID dan dapat ditautkan ke caller/parent bila relevan.
- [ ] Ketiadaan log tidak dianggap bukti `not_called` bila instrumentasi tidak lengkap.
- [ ] Semua parameter, variabel, nilai antara, perubahan, hasil async, dan return dalam cakupan tercatat atau diberi status eksplisit.
- [ ] Ringkasan jumlah pemanggilan/sukses/gagal/dilewati/pending berasal dari event nyata.
- [ ] Logs, metrics, dan traces dipilih sesuai pertanyaan observabilitas.
- [ ] Runtime health dibedakan dari kualitas kode statis.
- [ ] Exception, stack trace, privasi, overhead, dan keterbatasan platform ditangani.
- [ ] API sesuai versi SDK/package aktual; hasil verifikasi tidak dikarang.

## Rujukan resmi Flutter/Dart

Periksa dokumentasi sesuai versi SDK proyek:

- DevTools: https://docs.flutter.dev/tools/devtools
- Performance view: https://docs.flutter.dev/tools/devtools/performance
- CPU profiler: https://docs.flutter.dev/tools/devtools/cpu-profiler
- Memory view: https://docs.flutter.dev/tools/devtools/memory
- UI performance: https://docs.flutter.dev/perf/ui-performance
