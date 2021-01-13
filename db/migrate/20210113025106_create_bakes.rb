class CreateBakes < ActiveRecord::Migration[6.1]
  def change
    create_table :bakes do |t|
      t.date :date
      t.belongs_to :recipe
      t.belongs_to :user
      t.timestamps
    end
  end
end
