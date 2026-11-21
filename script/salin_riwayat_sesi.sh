#!/usr/bin/env bash
# Menyalin seluruh isi file riwayat sesi (memori/sesi/) ke satu file tujuan.
#
# Penggunaan:
#   ./script/salin_riwayat_sesi.sh [file-tujuan]
#
# Jika file-tujuan tidak diberikan, default ke <root-repo>/hasil_riwayat_sesi.txt.
#
# Variabel lingkungan opsional:
#   SESI_DIR  - folder sumber (default: <root-repo>/memori/sesi)

set -euo pipefail

# Root repositori = parent folder script ini.
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SRC_DIR="${SESI_DIR:-$ROOT_DIR/memori/sesi}"
DEST="${1:-$ROOT_DIR/hasil_riwayat_sesi.txt}"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Folder sumber tidak ditemukan: $SRC_DIR" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"

# Kosongkan file tujuan terlebih dahulu.
: > "$DEST"

# Gabungkan isi seluruh file sesi_*.md (urut nama/nomer) ke file tujuan.
# Urutkan berdasarkan nomor sesi (sesi_1.md, sesi_2.md, ...)
while IFS= read -r -d '' f; do
  cat "$f" >> "$DEST"
  printf '\n---\n\n' >> "$DEST"
done < <(find "$SRC_DIR" -maxdepth 1 -type f -name 'sesi_*.md' -print0 | sort -z -V)

echo "Selesai: isi seluruh file di ${SRC_DIR} disalin ke ${DEST}"