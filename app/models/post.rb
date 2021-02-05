class Post < ApplicationRecord
  belongs_to :user
  belongs_to :bake
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :bookmarks, as: :bookmarkable
  
  validates :title, presence: true

  scope :order_by_likes, -> {joins(:likes).group(:likeable_id).order('COUNT(likes.likeable_id) DESC')}
  scope :most_discussed, -> {joins(:comments).group(:commentable_id).order('COUNT(comments.commentable_id) DESC').limit(30) }

  def name
    self.title
  end

  def name_appended
    unless self.name.length <= 35
      return "#{self.name[0...35]}..."
    end
    self.name
  end
  
end
