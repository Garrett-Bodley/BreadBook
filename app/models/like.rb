class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}

  def liked_comment?
    self.likeable.class.name == "Comment" ? true : false
  end

  def parent
    if self.liked_comment?
      self.likeable.commentable
    else
      self.likeable
    end
  end

end
