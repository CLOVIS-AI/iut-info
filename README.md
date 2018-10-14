# iut-info

Les cours en IUT Informatique de Bordeaux.

Les PDFs sont disponibles [ici sur le serveur JMPI](ftp://clovis.online/cours). Vous pouvez aussi les télécharger.

## Signaler une erreur

Si vous pensez être capable de régler l'erreur vous-même, allez-voir la section suivante.

Créez une nouvelle issue: [ici](https://gitlab.com/clovis-ai/iut-info/issues/new)

Donnez-lui un nom descritif.

S'il s'agit d'une erreur dans un document, donnez le nom du fichier & du chapitre, pas juste la page !

## Régler une erreur

Si vous voulez résoudre l'erreur vous-même:
 1. créez un 'fork' (= copie sur votre compte pour avoir les droits): au centre de la [page d'accueil du projet](https://gitlab.com/clovis-ai/iut-info)
 1. créez une nouvelle branche (soit en ligne de commande soit dans `Repository / Branches / New`)
 1. faites vos modifications dans cette branche, commit + push
 1. créez une merge request de cette branche vers la branche master du projet d'origine
 1. attendez que la modification soit vérifiée, et lisez vos mails (si jamais il y a un problème)

## Make

Targets existantes:
 - `help` : Affiche la liste des targets

Pour que les templates fonctionnent, utilisez:
`$ git submodule init`
`$ git submodule update`
`$ ./latex/build dep`
cela affiche la liste des dépendances, comme ça vous pouvez savoir si vous avez
tout installé.