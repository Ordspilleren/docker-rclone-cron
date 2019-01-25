#!bin/sh

echo "Setup backup cron job with cron expression: ${BACKUP_CRON} and Rclone command: ${RCLONE_CMD}"
echo "${BACKUP_CRON} /bin/rclone ${RCLONE_CMD}" > /var/spool/cron/crontabs/rclone
chmod 0600 /var/spool/cron/crontabs/rclone

crond -d 8 -f
