#!/bin/bash

DATE=$(date +%Y-%m-%d-%H%M)

tar -czvf /home/shared/gitea-backup-$DATE.tar.gz \
  /home/shared/gitea-docker/gitea \
  /home/shared/gitea-docker/postgres \
  /home/shared/gitea-docker/ssl
