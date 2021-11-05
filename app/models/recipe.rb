class Recipe < ApplicationRecord
  belongs_to :user
  
  has_many :bakes
  has_many :bakers_percentages, dependent: :destroy
  has_many :ingredients, through: :bakers_percentages
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  accepts_nested_attributes_for :bakers_percentages
  validates :name, presence: true, uniqueness: true

  scope :liked, -> { joins(:likes) }
  scope :most_discussed, lambda { |limit = Recipe.count|
    joins(:comments).group(:id).order('COUNT(comments.commentable_id) DESC').limit(limit)
  }
  scope :most_liked, lambda { |limit = Recipe.count|
    joins(:likes).group(:id).order('COUNT(likes.id) DESC').limit(limit)
  }
  scope :most_recent, ->(limit = Recipe.count) { order(created_at: :desc).limit(limit) }
  scope :most_used, lambda { |limit = Recipe.count|
    joins(:bakes).group(:id).order('COUNT(bakes.recipe_id) DESC').limit(limit)
  }
  scope :owned_by, ->(user) { where(user: user).order(created_at: :desc) }
  scope :random, ->(limit = Recipe.count) { order('RANDOM()').limit(limit) }
end
