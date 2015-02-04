# Perchons

_Application participative pour sourcer les projets Percherons dans le cadre du programme européen LEADER_

## Contributions

La branche `master` est protégée : seul Emilien à l'autorisation de pusher sur le `master`. 
Ceci afin de forcer le processus de code review entre les devs du projet.

### Rules

1. Pour que des commits soit fusionnés dans le `master` il faut que les test passent
2. **Une branche** contient des modifications relatives à **une et une seule feature**

### Etapes pour contribuer sur une feature

1. mettre à jour votre master local
    `git checkout master` puis `git pull origin master`
2. créer une branche pour la feature
    `git checkout -b nom_de_la_feature`
3. Réaliser la feature en commençant par écire les tests (surtout `test/models` 
et `test/controllers`), en commitant pour chaque incrément de fonctionnalité
4. pusher votre branche sur le dépot de temps en temps
    `git push origin nom_de_la_feature`
5. Quand la branche est prête à être fusionnée faire une nouvelle Merge request 
depuis la branche `nom_de_la_feature` dans le `master`


## Running the project locally

* Ruby version: `2.2.0`
* Install dependencies: `bundle install`
* Database initialization: `rake db:migrate`

## Running tests

Guard take care of re-running the tests when a file is saved.  
Start guard in a dedicated console with: `guard start`