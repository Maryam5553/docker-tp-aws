#!/bin/bash
# Arrête les conteneurs et volumes Docker
docker compose down -v

# Supprime les images Docker du TP
docker rmi docker-tp-aws-python-app:latest
docker rmi localstack/localstack:latest

# Supprime le cache lié à l'image Python
docker builder prune -f --filter "label=docker-tp-aws"

# Pour libérer de l'espace, on peut supprimer TOUS les
# conteneurs arrêtés, images et volumes Docker non utilisés.
# ATTENTION si vous avez d'autres projets Docker cela les supprimera aussi !
# docker system prune -a --volumes