# docker-tp-aws

#### Installation

- Suivre les indications de la documentation pour installer Docker Desktop selon votre OS : https://docs.docker.com/get-started/get-docker/

- Vérifier l'installation de Docker en exécutant la commande suivante sur un terminal `docker --version` (*résultat attendu du type : `Docker version 28.4.0`*)

- Cloner ce répertoire github :
```
git clone https://github.com/Maryam5553/docker-tp-aws.git
cd docker-localstack
```

- Démarrer l'environnement Docker (cela va télécharger l'image LocalStack) :
```
docker compose up -d --build
```

- Se positionner dans le conteneur Python :
```
docker exec -it python-app bash
```

- Cela ouvre un terminal. Dedans, vous pouvez tester le code situé dans app/. Tester en exécutant :

```
python testS3.py
```

Si vous voyez le résultat suivant, c'est que votre configuration fonctionne !
```
> bucket "test-bucket" créé sur S3
> fichier "testS3.txt" uploadé dans le bucket "test-bucket"
> La configuration localstack fonctionne !
```

Pour la suite du TP, il vous suffit d'écrire votre code dans des fichiers Python créés dans le répertoire app/ :

```
docker-tp-aws/
├── app/
│   ├── requirements.txt
│   ├── testS3.py
│   ├── testS3.txt
│   ├── exo1.py
│   ├── exo2.py
│   └── ...
├── Dockerfile
└── docker-compose.yml
```


#### Nettoyage

À la fin du TP, vous pouvez arrêter les conteneurs et supprimer les images Docker avec le script prévu à cet effet :
```
./cleanup.sh
```
