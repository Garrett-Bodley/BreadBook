class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user
      t.bigint  :bookmarkable_id
      t.string  :bookmarkable_type
      t.timestamps
    end
  end
end
