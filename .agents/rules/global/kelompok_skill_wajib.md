# Kelompok Skill Wajib (Global)

## Ringkasan

Berkas ini merangkum kelompok skill yang wajib dirujuk untuk tiap jenis pekerjaan pada proyek milik pengguna. Setiap kelompok menyatakan bahwa semua proyek wajib menggunakan teknologi tertentu beserta daftar skill `.agents/skills/custom/<nama>/SKILL.md` yang harus dimuat bersamaan — Riverpod (semua provider wajib Riverpod), SQLite, Freezed, model/state yang harus punya method dan getter (wajib Freezed), model database (konstanta nama tabel/kolom, bukan string literal manual), provider dengan fungsi CRUD (wajib Notifier), tipe data null/nullable, Testing (termasuk mocktail, bukan mockito, untuk mock repository/service), dan UI (gaya/tema). Setiap nama skill berupa tautan klikable ke berkas `SKILL.md`-nya. Sumber kebenaran daftar skill dan trigger tetap `SKILLS_INDEX.md`.

- semua proyek saya wajib menggunakan riverpod maka gunakan skill:
  - [riverpod-pola](../../skills/custom/riverpod-pola/SKILL.md)
  - [model-state-freezed-abstract](../../skills/custom/model-state-freezed-abstract/SKILL.md)
  - [notifier-crud-database](../../skills/custom/notifier-crud-database/SKILL.md)
  - [penanganan-asyncvalue-berkali](../../skills/custom/penanganan-asyncvalue-berkali/SKILL.md)
  - [penanganan-async-data-kosong](../../skills/custom/penanganan-async-data-kosong/SKILL.md)
- semua proyek saya wajib menggunakan sqlite maka gunakan skill:
  - [migrasi-skema-sqlite](../../skills/custom/migrasi-skema-sqlite/SKILL.md)
  - [penamaan-konstanta-snake-case](../../skills/custom/penamaan-konstanta-snake-case/SKILL.md)
  - [parsing-nullable-int](../../skills/custom/parsing-nullable-int/SKILL.md)
  - [notifier-crud-database](../../skills/custom/notifier-crud-database/SKILL.md)
- semua proyek saya wajib melihat skill berikut bila ada tipe data null/nullable maka gunakan skill:
  - [type-promotion-null-safety](../../skills/custom/type-promotion-null-safety/SKILL.md)
  - [parsing-nullable-int](../../skills/custom/parsing-nullable-int/SKILL.md)
- semua proyek saya wajib menggunakan freezed maka gunakan skill:
  - [model-state-freezed-abstract](../../skills/custom/model-state-freezed-abstract/SKILL.md)
  - [build-runner-codegen](../../skills/custom/build-runner-codegen/SKILL.md)
- semua model dan state yang harus punya method dan getter wajib pakai freezed maka gunakan skill:
  - [model-state-freezed-abstract](../../skills/custom/model-state-freezed-abstract/SKILL.md)
  - [build-runner-codegen](../../skills/custom/build-runner-codegen/SKILL.md)
- semua model database jangan ditulis manual (nama tabel/kolom) wajib pakai konstanta, bukan string literal, maka gunakan skill:
  - [penamaan-konstanta-snake-case](../../skills/custom/penamaan-konstanta-snake-case/SKILL.md)
  - [migrasi-skema-sqlite](../../skills/custom/migrasi-skema-sqlite/SKILL.md)
- semua provider (state) wajib dibuat dengan Riverpod (bukan package `provider`, `InheritedWidget` manual, atau setState murni) maka gunakan skill:
  - [riverpod-pola](../../skills/custom/riverpod-pola/SKILL.md)
- semua provider yang bisa punya fungsi CRUD wajib dijadikan notifier (bukan `Provider` biasa/read-only) maka gunakan skill:
  - [riverpod-pola](../../skills/custom/riverpod-pola/SKILL.md)
  - [notifier-crud-database](../../skills/custom/notifier-crud-database/SKILL.md)
- semua proyek saya wajib menggunakan testing maka gunakan skill:
  - [pola-testing](../../skills/custom/pola-testing/SKILL.md)
  - [build-runner-codegen](../../skills/custom/build-runner-codegen/SKILL.md)
- semua proyek saya wajib menggunakan mocktail (bukan mockito) untuk mock repository/service pada testing (kelas mock manual `class MockX extends Mock implements X {}`, tanpa codegen; Notifier/Provider tetap di-override langsung) maka gunakan skill:
  - [pola-testing](../../skills/custom/pola-testing/SKILL.md)
- semua proyek saya wajib menata ui (gaya/tema) maka gunakan skill:
  - [gaya](../../skills/custom/gaya/SKILL.md)
  - [theme-data-color-schema](../../skills/custom/theme-data-color-schema/SKILL.md)
  - [tipografi](../../skills/custom/tipografi/SKILL.md)
  - [spacing](../../skills/custom/spacing/SKILL.md)
