class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :bakers_percentages
  has_many :recipes, through: :bakers_percentages
end
