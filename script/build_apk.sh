#!/bin/bash

# ============================================================
# SCRIPT: build_apk.sh
# TANGGUNG JAWAB: Memicu workflow build APK di GitHub Actions,
#                 memantau sampai selesai, lalu mengunduh APK-nya
# Repository: mbadrudin170-jpg/base_coc
# ============================================================

set -euo pipefail

REPO="mbadrudin170-jpg/admin_wifi"
WORKFLOW_FILE="build-apk.yml"
REF="main"
ARTIFACT="app-release-apk"   # samakan dengan 'name' di step upload-artifact

# Pastikan output masuk ke folder repo admin_wifi, bukan cwd pemanggil
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../admin_wifi" && pwd)"
OUTPUT_DIR="$PROJECT_DIR/apk"

latest_run_id() {
  gh run list --repo "$REPO" --workflow "$WORKFLOW_FILE" --limit 1 \
    --json databaseId --jq '.[0].databaseId // 0'
}

PREV_ID="$(latest_run_id)"

echo "Memicu workflow '$WORKFLOW_FILE' pada $REPO (ref: $REF)..."
gh workflow run "$WORKFLOW_FILE" --repo "$REPO" --ref "$REF"

# Tunggu sampai run baru muncul (ID-nya berbeda dari sebelumnya)
RUN_ID="$PREV_ID"
for _ in {1..15}; do
  RUN_ID="$(latest_run_id)"
  if [ "$RUN_ID" != "$PREV_ID" ]; then break; fi
  sleep 2
done

if [ "$RUN_ID" = "$PREV_ID" ]; then
  echo "Run baru tidak ditemukan. Cek manual: gh run list --repo $REPO" >&2
  exit 1
fi

echo "Run ID: $RUN_ID"
# Jeda agar metadata run tersedia di API sebelum watch
sleep 5
gh run watch "$RUN_ID" --repo "$REPO" --exit-status

mkdir -p "$OUTPUT_DIR"
# Hapus APK lama agar gh run download tidak gagal karena "file exists"
rm -f "$OUTPUT_DIR"/*.apk
echo "Mengunduh artefak '$ARTIFACT' ke $OUTPUT_DIR/..."
gh run download "$RUN_ID" --repo "$REPO" -n "$ARTIFACT" -D "$OUTPUT_DIR"

# Hapus artefak dari GitHub setelah berhasil diunduh (hemat storage)
ARTIFACT_ID="$(gh api "repos/$REPO/actions/runs/$RUN_ID/artifacts" --jq '.artifacts[] | select(.name=="'"$ARTIFACT"'") | .id' | head -n1)"
if [ -n "$ARTIFACT_ID" ]; then
  gh api -X DELETE "repos/$REPO/actions/artifacts/$ARTIFACT_ID" >/dev/null
  echo "Artefak dihapus dari GitHub (id: $ARTIFACT_ID)."
fi

echo "Selesai. APK ada di folder $OUTPUT_DIR/"
