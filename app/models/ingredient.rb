class Ingredient < ApplicationRecord
  has_many :bakers_percentages
  has_many :recipes, through: :bakers_percentages
  has_many :bookmarks, as: :bookmarkable
  has_many :comments, as: :commentable
end
