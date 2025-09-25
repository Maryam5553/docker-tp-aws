#!/bin/bash
# Arrête les conteneurs et volumes Docker
docker compose down -v

# Supprime les images Docker du TP
docker rmi docker-localstack-python-app:latest
docker rmi localstack/localstack:latest

# Supprime le cache lié à l'image Python
docker builder prune -f --filter "label=docker-tp-aws"
