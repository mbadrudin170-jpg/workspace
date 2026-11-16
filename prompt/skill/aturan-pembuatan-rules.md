diperbarui :
di timpa ke : 

# Aturan Pembuatan Rules

1. Setiap aturan wajib bersifat global; referensi ke repo spesifik hanya boleh sebagai contoh/rujukan, dan aturan harus dapat digunakan di semua repo.
2. Izin `deny` dan pembatasan platform harus ditulis secara generik (tanpa menyebut path repo tertentu) agar portabel.
3. Setiap berkas rules wajib didaftarkan pada bagian `instructions` di `.kilo/kilo.jsonc` (proyek) atau `~/.config/kilo/kilo.jsonc` (global).

# Catatan (hanya untuk penulis prompt, bukan untuk skill)

Link referensi ini jangan dimasukkan ke skill.

- https://kilo.ai/docs/customize/custom-rules
- https://kilo.ai/docs/customize/custom-instructions
- https://kilo.ai/docs/customize/agents-md
