#!/usr/bin/env bash
set -euo pipefail

# Gabungkan seluruh isi berkas di .agents/skills ke skill_lengkap.md
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SUMBER="$ROOT/.agents/skills"
KELUARAN="$ROOT/skill_lengkap.md"

: > "$KELUARAN"

while IFS= read -r -d '' berkas; do
  printf '\n===== %s =====\n' "${berkas#"$ROOT"/}" >> "$KELUARAN"
  cat "$berkas" >> "$KELUARAN"
  printf '\n' >> "$KELUARAN"
done < <(find "$SUMBER" -type f -print0 | sort -z)

echo "Selesai: $KELUARAN"