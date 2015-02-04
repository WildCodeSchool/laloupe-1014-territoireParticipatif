# Perchons

_Application participative pour sourcer les projets Percherons dans le cadre du programme européen LEADER_

## Contributions
La branche `master` est protégée : seul Emilien à l'autorisation de pusher sur le `master`. 
Ceci afin de forcer le processus de code review entre les dev du projets.

1. Pour que des commits soit fusionnés dans le `master` il faut que les test passent
2. **Une branche** contient des modifications relatives à **une et une seule feature**

## Running the project locally

* Ruby version: `2.2.0`
* Install dependencies: `bundle install`
* Database initialization: `rake db:migrate`

## Running tests

Guard take care of re-running the tests when a file is saved.  
Start guard in a dedicated console with: `guard start`