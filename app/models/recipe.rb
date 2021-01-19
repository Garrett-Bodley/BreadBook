class Recipe < ApplicationRecord
  belongs_to :user
  has_many :bakes
  has_many :bakers_percentages, dependent: :destroy
  has_many :ingredients, through: :bakers_percentages
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  accepts_nested_attributes_for :bakers_percentages
end
