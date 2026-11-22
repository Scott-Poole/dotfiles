#!/usr/bin/env bash
# Interactively remove merge-tool leftovers (*.orig, *_BACKUP_*, *_BASE_*, *_LOCAL_*, *_REMOTE_*) under a directory (default: .).
TARGET_DIR="${1:-.}"

rm -i $(find "$TARGET_DIR" -type f \( \
    -name "*_BACKUP_*" -o \
    -name "*_BASE_*" -o \
    -name "*_LOCAL_*" -o \
    -name "*_REMOTE_*" -o \
    -name "*.orig" \
\))