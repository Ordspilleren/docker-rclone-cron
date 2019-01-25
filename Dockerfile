FROM alpine:latest

RUN apk add --update --no-cache ca-certificates openssh-client

ENV RCLONE_VERSION=current
ENV ARCH=amd64
ADD https://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip /
RUN unzip rclone-${RCLONE_VERSION}-linux-${ARCH}.zip && mv rclone-*-linux-${ARCH}/rclone /bin/rclone && chmod +x /bin/rclone

RUN mkdir -p /var/spool/cron/crontabs

RUN adduser -S rclone

ENV RCLONE_CMD=""
ENV BACKUP_CRON="0 03 * * 1"

VOLUME /data

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
