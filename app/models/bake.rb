class Bake < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :steps

  def name
    "#{self.recipe.name} - #{self.date.strftime("%b %d, %Y")}"
  end
  
end
