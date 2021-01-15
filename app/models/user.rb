class User < ApplicationRecord
  validates :name, presence: :true, uniqueness: true
  validates :password, presence: :true
  has_secure_password
  has_many :bakes
  has_many :comments
  has_many :bookmarks
  has_many :likes
end
