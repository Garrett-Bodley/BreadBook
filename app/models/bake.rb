class Bake < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :steps
end
