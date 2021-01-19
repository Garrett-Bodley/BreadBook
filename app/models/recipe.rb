class Recipe < ApplicationRecord
  has_many :bakes
  has_many :bakers_percentages
  has_many :ingredients, through: :bakers_percentages
  has_many :bookmarks, as: :bookmarkable
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :bakers_percentages
end
