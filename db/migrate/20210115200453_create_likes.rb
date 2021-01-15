class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.bigint  :likeable_id
      t.string  :likeable_type
      t.timestamps
    end
  end
end
