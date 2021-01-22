class Bake < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :steps
  validates :weight, presence: true
  validates :recipe, presence: true
  validates :date, presence: true

  def name
    "#{self.recipe.name} - #{self.date.strftime("%b %d, %Y")}"
  end
  
end
