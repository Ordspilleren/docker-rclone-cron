FROM alpine:latest

RUN apk add --update --no-cache ca-certificates openssh-client tzdata

ENV RESTIC_VERSION=0.9.4
ENV ARCH=amd64
ADD https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_${RESTIC_VERSION}_linux_${ARCH}.bz2 /
RUN bzip2 -d restic_${RESTIC_VERSION}_linux_${ARCH}.bz2 && mv restic_${RESTIC_VERSION}_linux_${ARCH} /bin/restic && chmod +x /bin/restic

RUN mkdir -p /var/spool/cron/crontabs

RUN adduser -S restic

ENV RESTIC_CMD=""
ENV RESTIC_PASSWORD=""
ENV RESTIC_REPOSITORY=""
ENV BACKUP_CRON="0 03 * * 1"

VOLUME /data

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
