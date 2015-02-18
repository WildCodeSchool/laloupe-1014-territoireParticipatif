class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|

      t.timestamps null: false
      t.belongs_to :projet, index: true
      t.belongs_to :contributeur, index: true
    end
  end
end
