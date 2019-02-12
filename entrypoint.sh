#!/bin/sh

echo "Setup backup cron job with cron expression: ${BACKUP_CRON}"
echo "${BACKUP_CRON} /backup.sh" > /var/spool/cron/crontabs/restic
chmod 0600 /var/spool/cron/crontabs/restic

crond -d 8 -f
