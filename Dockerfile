# image python à utiliser (version slim, plus légère)
FROM python:3.11-slim

# installation des bibliotèques python
COPY app/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# répertoire de travail pour le code
WORKDIR /app

# ajout d'un label à l'image Docker, cela servira à la filtrer plus tard
LABEL docker-tp-aws="true"
