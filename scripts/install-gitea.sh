#!/bin/bash

# Colors
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
NC="\e[0m"

LOGFILE="install.log"

log() { echo -e "${CYAN}[INFO]${NC} $1" | tee -a $LOGFILE; }
ok()  { echo -e "${GREEN}[OK]${NC} $1" | tee -a $LOGFILE; }
warn(){ echo -e "${YELLOW}[WARN]${NC} $1" | tee -a $LOGFILE; }
err() { echo -e "${RED}[ERR]${NC} $1" | tee -a $LOGFILE; exit 1; }

log "Starting SAFE install..."

cd "$(dirname "$0")/.."

# Ensure .env exists
if [ ! -f .env ]; then
    warn ".env missing — copying from .env.example"
    cp .env.example .env
else
    ok ".env exists — keeping"
fi

# Create data directories
for d in gitea postgres; do
    if [ ! -d "$d" ]; then
        log "Creating directory $d"
        mkdir -p "$d"
    else
        ok "Directory $d exists — keeping"
    fi
done

# Permissions
chown -R esmail:sharedhome .
chmod -R 775 .

log "Bringing containers up..."
docker compose up -d || err "Docker failed."

ok "Gitea installed successfully!"
