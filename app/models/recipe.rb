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

  scope :order_by_recent, -> {order(created_at: :desc)}
  scope :liked, -> {joins(:likes)}
  scope :most_used, -> {joins(:bakes).group(:id).order('COUNT(bakes.recipe_id) DESC').limit(30)}
  scope :most_discussed, -> {joins(:comments).group(:id).order('COUNT(comments.commentable_id) DESC').limit(30)}
  # scope :order_by_likes, -> {select('*').joins(:likes).group('recipes.id, likes.id').order('COUNT(likes.id) DESC')}
  scope :order_by_likes, -> {joins(:likes).group(:id).order('COUNT(likes.id) DESC')}

end
