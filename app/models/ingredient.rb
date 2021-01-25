class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :bakers_percentages, dependent: :destroy
  has_many :recipes, through: :bakers_percentages
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  scope :order_by_likes, -> {joins(:likes).group(:likeable_id).order('COUNT(likes.likeable_id) DESC')}
  scope :most_used, ->{joins(:bakers_percentages).group('bakers_percentages.ingredient_id').order('COUNT(bakers_percentages.ingredient_id) DESC').limit(30)}
  scope :most_discussed, -> {joins(:comments).group('comments.commentable_id').order('COUNT(comments.commentable_id) DESC').limit(30)} 
end