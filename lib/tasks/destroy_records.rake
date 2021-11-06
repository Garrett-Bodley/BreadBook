desc 'Destroy all existing records.'
task destroy_all: :environment do
  Bake.destroy_all
  BakersPercentage.destroy_all
  Bookmark.destroy_all
  Comment.destroy_all
  Ingredient.destroy_all
  Like.destroy_all
  Post.destroy_all
  Recipe.destroy_all
  Step.destroy_all
  User.destroy_all
end
