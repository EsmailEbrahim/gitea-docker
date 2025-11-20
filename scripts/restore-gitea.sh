#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: restore-gitea.sh <backup-file.tar.gz>"
    exit 1
fi

BACKUP="$1"

echo "Stopping containers..."
docker compose down

echo "Restoring backup..."
tar -xzf "$BACKUP"

echo "Starting service..."
docker compose up -d

echo "Restore complete!"
