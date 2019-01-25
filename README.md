# docker-restic-cron

## Example docker run

`docker run -d --name='restic-backup' --net='host' -e TZ='Europe/Copenhagen' -e 'B2_ACCOUNT_ID'='' -e 'B2_ACCOUNT_KEY'='' -e 'RESTIC_REPOSITORY'='b2:yourbucket' -e 'RESTIC_CMD'='backup /data/SomeDir --exclude SomeOtherDir' -e 'RESTIC_PASSWORD'='' -e 'XDG_CACHE_HOME'='/tmp' -v '/mnt/user':'/data':'ro' --tmpfs /tmp ordspilleren/restic-cron`
