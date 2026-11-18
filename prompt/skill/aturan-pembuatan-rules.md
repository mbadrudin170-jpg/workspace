diperbarui : Wed Nov 18 2026 09:05 WIB
ditimpa ke : `.agents/skills/non-code/aturan-pembuatan-rules/SKILL.md`

# Aturan Pembuatan Rules

1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat digunakan di semua repo.
2. Izin `deny` dan pembatasan platform harus ditulis secara generik (tanpa menyebut path repo tertentu) agar portabel.
3. Yang terdaftar di `instructions` hanya berkas `AGENTS.md`; berkas rules tidak didaftarkan satu per satu di `instructions`.
4. Berkas `AGENTS.md` wajib menyertakan perintah membaca seluruh berkas di folder `.agents/rules/` dan mematuhi seluruh aturan yang ada di sana.
5. Setiap rules hanya memuat informasi/panduan ringkas; detail teknis wajib ditambahkan ke skill yang sudah ada, atau dibuatkan skill baru bila belum ada yang relevan.
6. Berkas aturan khusus kode (contoh: `.agents/rules/code.md`) hanya boleh diubah berdasarkan commit dan kode yang secara eksplisit ditambahkan pengguna.
7. Setiap aturan pada berkas aturan khusus kode wajib menyertakan skill terkaitnya; dilarang menambahkan aturan baru tanpa skill terkait.

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/custom-rules
- https://kilo.ai/docs/customize/custom-instructions
- https://kilo.ai/docs/customize/agents-md
