# Gitea Self-Hosted Setup

This repository contains a self-hosted Docker setup for Gitea, an open-source Git hosting platform.

## Setup

1. Clone this repository to your server.
2. Run `docker-compose up -d` to start Gitea.
3. Access Gitea at `http://<your-server-ip>:2200`.

## Backups

Run `backup.sh` to create backups of your Gitea and PostgreSQL data.

## SSL

SSL is configured with a self-signed certificate for encrypted connections.
