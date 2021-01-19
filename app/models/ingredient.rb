class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :bakers_percentages, dependent: :destroy
  has_many :recipes, through: :bakers_percentages
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :name, presence: true
end
