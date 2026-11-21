#!/usr/bin/env bash
# Menyalin seluruh isi file yang ada di folder tool-output Kilo ke satu file tujuan.
#
# Penggunaan:
#   ./script/salin_tool_output.sh [file-tujuan]
#
# Jika file-tujuan tidak diberikan, default ke <root-repo>/hasil_output.txt.
#
# Variabel lingkungan opsional:
#   TOOL_OUTPUT_DIR  - folder sumber (default: ~/.local/share/kilo/tool-output)

set -euo pipefail

SRC_DIR="${TOOL_OUTPUT_DIR:-${HOME}/.local/share/kilo/tool-output}"

# Root repositori = parent folder script ini.
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${1:-$ROOT_DIR/hasil_output.txt}"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Folder sumber tidak ditemukan: $SRC_DIR" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"

# Kosongkan file tujuan terlebih dahulu.
: > "$DEST"

# (Opsional) Letakkan docs/perintah_analisa.md paling atas, bila ada.
ANALISA_FILE="$ROOT_DIR/docs/perintah_analisa.md"
if [[ -f "$ANALISA_FILE" ]]; then
  cat "$ANALISA_FILE" >> "$DEST"
  printf '\n\n' >> "$DEST"
fi

# Gabungkan isi seluruh file (urut nama) ke file tujuan.
while IFS= read -r -d '' f; do
  cat "$f" >> "$DEST"
  printf '\n' >> "$DEST"
done < <(find "$SRC_DIR" -maxdepth 1 -type f -print0 | sort -z)

echo "Selesai: isi seluruh file di ${SRC_DIR} disalin ke ${DEST}"

# Hapus folder sumber setelah sukses mensalin
rm -rf "$SRC_DIR"
