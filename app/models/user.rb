class User < ApplicationRecord
  validates :name, presence: :true, uniqueness: true
  validates :password, presence: :true
  has_secure_password
  has_many :bakes
  has_many :comments
  has_many :bookmarks
  has_many :posts
  has_many :ingredients, through: :bookmarks, source: :bookmarkable, source_type: 'Ingredient'
  has_many :recipes, through: :bookmarks, source: :bookmarkable, source_type: 'Recipe'
  has_many :saved_comments, through: :bookmarks, source: :bookmarkable, source_type: 'Comment', class_name: "Comment"
  has_many :saved_posts, through: :bookmarks, source: :bookmarkable, source_type: 'Post', class_name: "Post"
  has_many :likes

end
