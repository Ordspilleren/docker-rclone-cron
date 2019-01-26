#!bin/sh

echo "Setup backup cron job with cron expression: ${BACKUP_CRON} and Restic command: ${RESTIC_CMD}"
echo "${BACKUP_CRON} /bin/rclone ${RESTIC_CMD}" > /var/spool/cron/crontabs/restic
chmod 0600 /var/spool/cron/crontabs/restic

crond -d 8 -f
