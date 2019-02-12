#!/bin/sh
set -e -o pipefail

# What to backup, and what to not
#BACKUP_PATHS="/ /boot /home /mnt/media"
#BACKUP_EXCLUDES="--exclude-file /.backup_exclude --exclude-file /mnt/media/.backup_exclude --exclude-file /home/erikw/.backup_exclude"
BACKUP_TAG="restic-docker"

B2_CONNECTIONS=50

restic backup \
	--verbose \
	--tag $BACKUP_TAG \
	--option b2.connections=$B2_CONNECTIONS \
	$BACKUP_EXCLUDES \
	$BACKUP_PATHS

restic forget \
	--verbose \
	--tag $BACKUP_TAG \
    --option b2.connections=$B2_CONNECTIONS \
	--group-by "paths,tags" \
	--keep-last $KEEP_LAST
    --prune

echo "Backup & cleaning is done."