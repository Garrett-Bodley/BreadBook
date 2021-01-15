class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.time :time
      t.string :action
      t.text :notes
      t.belongs_to :bake
      t.timestamps
    end
  end
end
