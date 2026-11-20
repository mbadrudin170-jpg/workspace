#!/usr/bin/env bash
# Menyalin seluruh isi file yang ada di folder tool-output Kilo ke satu file tujuan.
#
# Penggunaan:
#   ./scripts/salin_tool_output.sh <file-tujuan>
#
# Variabel lingkungan opsional:
#   TOOL_OUTPUT_DIR  - folder sumber (default: ~/.local/share/kilo/tool-output)

set -euo pipefail

SRC_DIR="${TOOL_OUTPUT_DIR:-${HOME}/.local/share/kilo/tool-output}"
DEST="${1:-}"

if [[ -z "$DEST" ]]; then
  echo "Penggunaan: $0 <file-tujuan>" >&2
  exit 1
fi

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Folder sumber tidak ditemukan: $SRC_DIR" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"

# Kosongkan file tujuan terlebih dahulu.
: > "$DEST"

# Gabungkan isi seluruh file (urut nama) ke file tujuan.
while IFS= read -r -d '' f; do
  cat "$f" >> "$DEST"
  printf '\n' >> "$DEST"
done < <(find "$SRC_DIR" -maxdepth 1 -type f -print0 | sort -z)

echo "Selesai: isi seluruh file di ${SRC_DIR} disalin ke ${DEST}"
