#!/bin/bash

DATE=$(date +%Y-%m-%d-%H%M)
BACKUP="/home/shared/gitea-backup-$DATE.tar.gz"

echo "Creating backup at: $BACKUP"

tar -czf "$BACKUP" \
    gitea \
    postgres \
    ssl \
    .env \
    docker-compose.yml

echo "Backup completed."
