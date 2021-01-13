class Recipe < ApplicationRecord
  belongs_to :user
  has_many :bakes
  has_many :bakers_percentages
  has_many :ingredients, through: :bakers_percentages
end
