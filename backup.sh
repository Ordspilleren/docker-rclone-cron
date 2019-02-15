#!/bin/sh
set -e -o pipefail

CACHE_DIR="/cache"

B2_CONNECTIONS=50

restic backup \
	--cache-dir $CACHE_DIR \
	--verbose \
	--tag $BACKUP_TAG \
	--option b2.connections=$B2_CONNECTIONS \
	$BACKUP_EXCLUDES \
	$BACKUP_PATHS

restic forget \
	--cache-dir $CACHE_DIR \
	--verbose \
	--tag $BACKUP_TAG \
    --option b2.connections=$B2_CONNECTIONS \
	--group-by "paths,tags" \
	--keep-last $KEEP_LAST \
    --prune

echo "Backup & cleaning is done."