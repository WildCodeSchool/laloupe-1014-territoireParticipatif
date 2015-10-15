# Territoire Participatif

_Application participative développée pour sourcer les projets Percherons
dans le cadre du programme européen LEADER_

## Disclaimer

This application was custom made and was not intended to be open sourced in the first place.
Adapt it and use it at your own risk.

## Running the project locally

* Install ruby version: `2.2.0`
* Install dependencies: `bundle install`
* Copy `dotenv` into `.env` and edit the last with your credentials
* Database schema creation: `rake db:migrate`
* Database initialization with the content of `db/seeds.rb`: `rake db:seed`

## Running tests

Guard take care of re-running the tests when a file is saved.  
Start guard in a dedicated console with: `guard start`

## Running in production

This application is deployable as is on Heroku or any plateform with a similar 
deployment process. It has been running successfully on [Scalingo](https://scalingo.com/) and Heroku.

Requirements:

* Postgresql database
* Amazon S3 account, to host images
* Sendgrid account, to send transaction emails

## Licence

MIT - Copyright 2015 Innov'Educ
See LICENSE.md
