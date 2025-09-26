# docker-tp-aws

Pour notre TP, on voudrait tester des actions sur le cloud AWS avec du code en Python. Le problème, c'est que les requêtes sur AWS engendrent des coûts (ex: génération d'une 1 clé KMS = 1$/mois au pro-rata de l'heure). Alors on va plutôt utiliser LocalStack, qui est un émulateur de service cloud. Cela nous permettra d'exécuter le code Python exactement de la même manière qu'on ferait avec AWS, mais tout fonctionnera en local.

Les installations à faire sont donc LocalStack + la bibliothèque boto3, qui est la bibliothèque AWS en Python.

Pour simplifier ces installations, on utilisera Docker. Suivez les instructions ci-dessous pour installer Docker puis pour démarrer l'environnement Docker. À la fin on devrait pouvoir exécuter le code app/testS3.py, qui exporte un fichier sur AWS S3 (donc ici, sur LocalStack).

(*edit: si vous voulez tenter l'installation de LocalStack manuellement, sans passer par ce tutoriel, alors il faudra changer l'endpoint LocalStack dans votre code testS3.py : "http://localstack:4566" -> "http://localhost:4566"*)


## Installation

- Suivre les indications de la documentation pour installer Docker Desktop selon votre OS : https://docs.docker.com/get-started/get-docker/

- Vérifier l'installation de Docker en exécutant la commande suivante sur un terminal `docker --version` (*résultat attendu du type : `Docker version 28.4.0`*)

- Cloner ce répertoire github (ou alternativement, vous pouvez télécharger l'archive grâce au bouton "Code" en haut à droite -> "Download Zip". Extraire l'archive sous le nom docker-tp-aws et se placer dedans ) :
```
git clone https://github.com/Maryam5553/docker-tp-aws.git
cd docker-tp-aws
```

- Démarrer l'environnement Docker (cela va télécharger l'image LocalStack) :
```
docker compose up -d --build
```

- Se positionner dans le conteneur Python :
```
docker exec -it python-app bash
```

- Cela nous positionne dans un terminal du type `root@82fd15b35c7f:/app# `. Dedans, vous pouvez tester le code situé dans app/. Tester en exécutant :

```
python testS3.py
```

Si vous voyez le résultat suivant, c'est que votre configuration fonctionne ! On peut quitter le terminal avec ctl+d.
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

## Arrêt

À la fin du TP, vous pouvez arrêter les conteneurs et supprimer les images Docker avec le script prévu à cet effet :
```
./cleanup.sh
```
Alternativement, si vous ne pouvez pas lancer le script bash, vous pouvez exécuter ces commandes manuellement :
```
docker compose down -v
docker rmi docker-tp-aws-python-app:latest
docker rmi localstack/localstack:latest
docker builder prune -f --filter "label=docker-tp-aws"
```
## Nettoyage

Si vous voulez libérer plus d'espaces sur le disque, vous pouvez supprimer TOUS les conteneurs arrêtés, images et volumes Docker non utilisés.

ATTENTION si vous avez d'autres projets Docker cela les supprimera aussi ! N'exécuter la commande suivante que si vous n'avez pas d'autres projet Docker en cours et que vous voulez vraiment libérer de la place.
```
docker system prune -a --volumes
```