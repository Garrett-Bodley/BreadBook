class User < ApplicationRecord
  validates :name, presence: :true, uniqueness: true
  validates :password, presence: :true
  has_secure_password
  has_many :bakes
  has_many :ingredients
  has_many :recipes
  has_many :bakers_percentages
end
