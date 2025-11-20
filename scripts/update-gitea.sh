#!/bin/bash

GREEN="\e[32m"; YELLOW="\e[33m"; RED="\e[31m"; NC="\e[0m"

echo -e "${YELLOW}Updating Gitea safely...${NC}"

docker compose pull gitea || exit 1
docker compose down
docker compose up -d

echo -e "${GREEN}Gitea updated!${NC}"
