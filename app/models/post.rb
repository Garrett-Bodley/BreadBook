class Post < ApplicationRecord
  belongs_to :user
  belongs_to :bake
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :bookmarks, as: :bookmarkable
end
