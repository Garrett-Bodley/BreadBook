class WelcomeController < ApplicationController

  def home
    @recipes_liked = Recipe.most_liked.limit(10)
    @recipes_used = Recipe.most_used.limit(10)
    @posts = Post.most_discussed.limit(10)
  end

end
