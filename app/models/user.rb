class User < ApplicationRecord
  validates :name, presence: :true, uniqueness: true
  validates :password, presence: :true
  has_secure_password
  has_many :bakes
  has_many :comments
  has_many :bookmarks
  has_many :posts
  has_many :recipes
  has_many :ingredients
  has_many :saved_ingredients, through: :bookmarks, source: :bookmarkable, source_type: 'Ingredient', class_name: "Ingredient"
  has_many :saved_recipes, through: :bookmarks, source: :bookmarkable, source_type: 'Recipe', class_name: "Recipe"
  has_many :saved_comments, through: :bookmarks, source: :bookmarkable, source_type: 'Comment', class_name: "Comment"
  has_many :saved_posts, through: :bookmarks, source: :bookmarkable, source_type: 'Post', class_name: "Post"
  has_many :likes

  def bookmarked?(object)
    self.bookmarks.where(bookmarkable_id: object.id, bookmarkable_type: object.class.name).exists?
  end

  def find_bookmark_by_object(object)
    self.bookmarks.find_by(bookmarkable_id: object.id, bookmarkable_type: object.class.name)
  end

  def liked?(object)
    self.likes.where(likeable_id: object.id, likeable_type: object.class.name).exists?
  end

  def find_like_by_object(object)
    self.likes.find_by(likeable_id: object.id, likeable_type: object.class.name)
  end

end
