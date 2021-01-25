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

  scope :order_by_likes, -> {joins(:likes).group(:likeable_id).order('COUNT(likes.likeable_id) DESC')}
  scope :most_used, -> {joins(:bakes).group('bakes.recipe_id').order('COUNT(bakes.recipe_id) DESC').limit(30)}
  scope :most_discussed, -> {joins(:comments).group('comments.commentable_id').order('COUNT(comments.commentable_id) DESC').limit(30)}
end
