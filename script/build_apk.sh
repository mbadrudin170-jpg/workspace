#!/bin/bash

# ============================================================
# SCRIPT: build_apk.sh
# TANGGUNG JAWAB: Memicu workflow build APK di GitHub Actions,
#                 memantau sampai selesai, lalu mengunduh APK-nya
# Repository: mbadrudin170-jpg/base_coc
# ============================================================

set -euo pipefail

REPO="mbadrudin170-jpg/base_coc"
WORKFLOW_FILE="build-apk.yml"
REF="main"
ARTIFACT="app-release-apk"   # samakan dengan 'name' di step upload-artifact
OUTPUT_DIR="apk"

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
gh run watch "$RUN_ID" --repo "$REPO" --exit-status

mkdir -p "$OUTPUT_DIR"
echo "Mengunduh artefak '$ARTIFACT' ke $OUTPUT_DIR/..."
gh run download "$RUN_ID" --repo "$REPO" -n "$ARTIFACT" -D "$OUTPUT_DIR"
echo "Selesai. APK ada di folder $OUTPUT_DIR/"
