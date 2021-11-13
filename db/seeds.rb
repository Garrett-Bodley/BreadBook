# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_dev_sandbox
  puts 'Seeding dev sandbox'
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
      r = Recipe.last
      r.ingredients << i
    end
  end
end

def seed_bakers_percentages
  puts 'Seeding bakers percentages'
  BakersPercentage.all.each { |bp| bp.update(percent: rand(100)) }
end

def seed_bakes(num)
  puts 'Seeding bakes'
  User.all.each do |u|
    num.times do 
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
  # seed_dev_sandbox
  seed_users(10)
  seed_ingredients(50)
  seed_recipes(25)
  seed_bakers_percentages
  seed_bakes(25)
  seed_likes(50)
  seed_posts(50)
  seed_comments(25)
end

seed_app
