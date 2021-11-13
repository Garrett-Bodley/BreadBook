class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, allow_nil: true
  has_secure_password
  has_many :bakes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :recipes
  has_many :ingredients
  has_many :saved_ingredients, {
    through: :bookmarks,
    source: :bookmarkable,
    source_type: 'Ingredient',
    class_name: 'Ingredient',
    dependent: :destroy
  }
  has_many :saved_recipes, {
    through: :bookmarks,
    source: :bookmarkable,
    source_type: 'Recipe',
    class_name: 'Recipe',
    dependent: :destroy
  }
  has_many :saved_posts, {
    through: :bookmarks,
    source: :bookmarkable,
    source_type: 'Post',
    class_name: 'Post',
    dependent: :destroy
  }
  has_many :likes

  scope :random, ->(limit = User.count) { order('RANDOM()').limit(limit) }

  def bookmarked?(object)
    bookmarks.where(bookmarkable_id: object.id, bookmarkable_type: object.class.name).exists?
  end

  def find_bookmark_by_object(object)
    bookmarks.find_by(bookmarkable_id: object.id, bookmarkable_type: object.class.name)
  end

  def liked?(object)
    likes.where(likeable_id: object.id, likeable_type: object.class.name).exists?
  end

  def find_like_by_object(object)
    likes.find_by(likeable_id: object.id, likeable_type: object.class.name)
  end
end
