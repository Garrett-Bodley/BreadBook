class BakersPercentage < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def percentify(weight)
    percent * weight / 100
  end
end
