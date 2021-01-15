class CreateBakersPercentages < ActiveRecord::Migration[6.1]
  def change
    create_table :bakers_percentages do |t|
      t.decimal :percent
      t.belongs_to :ingredient
      t.belongs_to :recipe
      t.timestamps
    end
  end
end
