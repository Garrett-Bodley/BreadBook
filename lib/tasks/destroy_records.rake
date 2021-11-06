desc 'Destroy all existing records.'
task destroy_all: :environment do
  puts 'Destroying bakes'
  Bake.destroy_all
  puts 'Destroying bakers percentagesz'
  BakersPercentage.destroy_all
  puts 'Destroying bookmarks'
  Bookmark.destroy_all
  puts 'Destroying comments'
  Comment.destroy_all
  puts 'Destroying ingredient'
  Ingredient.destroy_all
  puts 'Destroying likes'
  Like.destroy_all
  puts 'Destroying posts'
  Post.destroy_all
  puts 'Destroying recipes'
  Recipe.destroy_all
  puts 'Destroying steps'
  Step.destroy_all
  puts 'Destroying users'
  User.destroy_all
end
