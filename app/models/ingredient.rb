class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :bakers_percentages, dependent: :destroy
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :recipes, through: :bakers_percentages

  validates :name, presence: true, uniqueness: true

  scope :most_liked, lambda { |limit = Ingredient.count|
    joins(:likes).group(:likeable_id).order('COUNT(likes.likeable_id) DESC').limit(limit)
  }
  scope :most_recent, ->(limit = Ingredient.count) { order(created_at: :desc).limit(limit) }
  scope :most_used, lambda { |limit = Ingredient.count|
    joins(:bakers_percentages)
      .group(:id)
      .order('COUNT(bakers_percentages.ingredient_id) DESC').limit(limit)
  }
  scope :most_discussed, lambda { |limit = Ingredient.count|
    joins(:comments)
      .group('comments.commentable_id')
      .order('COUNT(comments.commentable_id) DESC').limit(limit)
  }
  scope :owned_by, ->(user) { where(user: user).order(created_at: :desc) }
  scope :random, ->(limit = Ingredient.count) { order('RANDOM()').limit(limit) }
end
