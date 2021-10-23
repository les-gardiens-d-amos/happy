<div align="center">
    <h1>Happy</h1>
</div>

<div align="center">

[![Ruby](https://img.shields.io/badge/language-ruby-red)](https://img.shields.io/badge/language-ruby-red)
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![Maintainability](https://api.codeclimate.com/v1/badges/3ea1be9590db6a6c603a/maintainability)](https://codeclimate.com/github/les-gardiens-d-amos/happy/maintainability)

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

There are two ways to initialize this project, the first is the easiest, you just have to type the following command and the migie will do the rest. If this command does not work you will have to type all the installation commands indicated after

```shell
sh init.sh
```


then it will be necessary to install all the dependencies

```shell
bundle install
```

once the dependencies are installed,  you will have to create the local database

```sh
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
