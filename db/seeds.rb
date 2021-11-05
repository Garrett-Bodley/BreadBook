# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::UniqueGenerator.clear

def seed_dev_sandbox_vals
  puts 'Seeding dev sandbox values'
  u = User.create(name: 'user', password: 'password')

  ingredients = [
    Ingredient.create(name: 'Water', description: Faker::Lorem.sentence, user: u),
    Ingredient.create(name: 'Salt', description: Faker::Lorem.sentence, user: u),
    Ingredient.create(name: 'Bread Flour', description: Faker::Lorem.sentence, user: u),
    Ingredient.create(name: 'Starter', description: Faker::Lorem.sentence, user: u),
    Ingredient.create(name: 'Whole Wheat Flour', description: Faker::Lorem.sentence, user: u)
  ]

  loaf = Recipe.create(name: 'Basic Loaf', user: u)

  ingredients.each do |i|
    loaf.ingredients << i
  end
end

def seed_users(num)
  puts 'Seeding users'
  num.times do
    User.new(
      name: Faker::Internet.unique.username,
      password: 'password'
    ).save(validate: false)
  end
end

def seed_ingredients(num)
  puts 'Seeding ingredients'
  num.times do
    Ingredient.new(
      name: Faker::Food.ingredient,
      description: Faker::Food.description,
      user: User.random(1)[0]
    ).save(validate: false)
  end
end

def seed_recipes(num)
  puts 'Seeding recipes'
  num.times do
    Recipe.new(
      name: Faker::Food.dish,
      description: Faker::Food.description,
      user: User.random(1)[0]
    ).save(validate: false)
    Ingredient.random(4).each do |i|
      Recipe.last.ingredients << i
    end
  end
end

def seed_bakes(num)
  puts 'Seeding bakes'
  num.times do
    User.all.each do |u|
      u.bakes.new(
        recipe: Recipe.random(1)[0],
        date: Faker::Date.backward
      ).save(validate: false)
    end
  end
end

def seed_likes(num)
  puts 'Seeding likes'
  num.times do
    Like.new(
      likeable: Recipe.random(1)[0],
      user: User.random(1)[0]
    ).save(validate: false)
  end
end

def seed_posts(num)
  puts 'Seeding posts'
  num.times do
    user = User.random(1)[0]
    Post.new(
      title: Faker::Hipster.unique.sentence,
      content: Faker::Hipster.unique.paragraph,
      bake: user.bakes.order('RANDOM()').first,
      user: user
    ).save(validate: false)
  end
end

def seed_comments(num)
  puts 'Seeding comments'
  num.times do
    Comment.new(
      content: Faker::Hipster.paragraph,
      user: User.random(1)[0],
      commentable: Post.random(1)[0]
    ).save(validate: false)
  end
end

def seed_bookmarks(num)
  puts 'Seeding bookmarks'
  User.all.each do |u|
    num.times do
      u.bookmarks.create(bookmarkable: Recipe.random(1)[0])
      u.bookmarks.create(bookmarkable: Ingredient.random(1)[0])
    end
  end
end

def seed_app
  seed_dev_sandbox_vals
  seed_users(50)
  seed_ingredients(100)
  seed_recipes(50)
  seed_bakes(100)
  seed_likes(200)
  seed_posts(100)
  seed_comments(100)
  seed_bookmarks(5)
end

seed_app
