# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

g = User.create(name: "Garrett", password: "password")

ingredients = [
  Ingredient.create(name: "Water", user: g),
  Ingredient.create(name: "Salt", user: g),
  Ingredient.create(name: "Bread Flour", user: g),
  Ingredient.create(name: "Starter", user: g),
  Ingredient.create(name: "Whole Wheat Flour", user: g)
]

loaf = Recipe.create(name: "Basic Loaf", user: g)

ingredients.each do |i|
  loaf.ingredients << i
end

50.times {User.new(name:Faker::Internet.unique.username, password:"password").save(validate: false)}

100.times {Ingredient.new(name:Faker::Food.ingredient, description:Faker::Food.description, user:User.order(Arel.sql('RANDOM()')).first).save(validate: false)}

Faker::UniqueGenerator.clear 

50.times do 
  recipe = Recipe.new(name: Faker::Food.dish, description: Faker::Food.description, user: User.order(Arel.sql('RANDOM()')).first).save(validate: false)
  Ingredient.order(Arel.sql('RANDOM()')).limit(3).each {|i| Recipe.last.ingredients << i}
end

100.times do
  User.all.each {|u| u.bakes.new(recipe:Recipe.order(Arel.sql('RANDOM()')).first, date: Faker::Date.backward).save(validate: false)}
end

100.times do
  user = User.order(Arel.sql('RANDOM()')).first
  Post.new(title: Faker::Hipster.unique.sentence, content: Faker::Hipster.unique.paragraph, bake: user.bakes.order(Arel.sql('RANDOM()')).first, user: user).save(validate: false)
end

200.times do
  Comment.new(content:Faker::Hipster.paragraph, user: User.order(Arel.sql('RANDOM()')).first, commentable:Post.order(Arel.sql('RANDOM()')).first).save(validate: false)
end

User.all.each {|u| u.bookmarks.create(bookmarkable:Recipe.order(Arel.sql('RANDOM()')).first)}
User.all.each {|u| u.bookmarks.create(bookmarkable:Ingredient.order(Arel.sql('RANDOM()')).first)}