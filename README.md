<h1 align="center">Welcome to BreadBook🍞</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.1.0-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT License" src="https://img.shields.io/badge/License-MIT License-yellow.svg" />
  </a>
</p>

> As an avid sourdough baker, I created BreadBook in hopes of providing an online community where bakers could log their own baking process and share their various techniques, ingredients, and recipes with one another. Both ingredients and recipes are public, with users able to like, comment, and bookmark those they find interesting. Further discussion is possible in the Forum, where users can post about one of their recent bakes or comment on the posts of others.

## Technologies

BreadBook was built using
* Ruby 2.6.1
* Rails 6.1.1
* Bulma 0.9.2
* SQlite3 1.4

## Features

* Makes use of polymorphic relationships to allow users to like, comment on, and bookmark a variety of objects.
* Includes Kaminari pagination for posts, recipes, and ingredients for an easy and intuitive user interface.
* Deploys custom scope methods to sort database entries, letting users find the most popular recipes or ingredients.
* Incorporates Omniauth to allow users to create an account and login via GitHub.

## Install

```sh
bundle install
rails db:migrate
```

## Usage

```sh
rails start
```

## Author

👤 **Garrett Bodley**

* Blog: garrett-bodley.medium.com
* Github: [@Garrett-Bodley](https://github.com/Garrett-Bodley)
* LinkedIn: [@Garrett Bodley](https://linkedin.com/in/Garrett Bodley)

## Show your support

Give a ⭐️ if this project helped you!