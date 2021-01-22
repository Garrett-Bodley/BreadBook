class Step < ApplicationRecord
  belongs_to :bake
  validates :action, presence: true
  validates :time, presence: true
end
