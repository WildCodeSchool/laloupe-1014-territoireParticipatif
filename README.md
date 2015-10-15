# Territoire Participatif

[![Code Climate](https://codeclimate.com/github/WildCodeSchool/territoire_participatif/badges/gpa.svg)](https://codeclimate.com/github/WildCodeSchool/territoire_participatif)
[![security](https://hakiri.io/github/WildCodeSchool/territoire_participatif/master.svg)](https://hakiri.io/github/WildCodeSchool/territoire_participatif/master)

_Application participative développée pour sourcer [les projets Percherons](https://www.percheparticipatif.fr/)
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
* Start the server with : `rails server` -> <localhost:3000>

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

## License

MIT - Copyright 2015 Innov'Educ  
See  [LICENSE](LICENSE.md)
