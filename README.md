<div align="center">
    <h1>Happy</h1>
</div>

<div align="center">

[![Ruby](https://img.shields.io/badge/language-ruby-red)](https://img.shields.io/badge/language-ruby-red)
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

</div>

API which manages the logic as well as the users of the game "Guardians of Âmos"

## Technology 

* Ruby and Ruby on Rails
* DB in sqlite3 on development and mysql2 for production
* Rspec for test application
* Deploy with heroku [view deployment](https://happy-amos.herokuapp.com/users)
* Github action for continuous integration

## How to install this project

in order to install the project start by cloning the repository

```shell
git clone https://github.com/les-gardiens-d-amos/happy.git

cd happy
```

then it will be necessary to install all the dependencies

```
bundle install
```

once the dependencies are installed,  you will have to create the local database

```
rails db:create
```

then you will have to play the necessary migration

```
rails db:migrate
```

You will then need to insert some fake data with the following command

```
rails db:seed
```

and finally you can start server of this project

```
rails s
```

## How to contribute

To contribute to the happy API project please follow the instructions in CONTRIBUTING.md

<h2>Contributor</h2>

- the amos guardian team 😉
