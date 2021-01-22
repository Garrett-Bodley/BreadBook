class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable
  has_many :bookmarks, as: :bookmarkable
  validats :content, presence: true
end
