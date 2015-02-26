class CreateActualites < ActiveRecord::Migration
  def change
    create_table :actualites do |t|
      t.string :titre
      t.text :contenu
      t.belongs_to :animateur

      t.timestamps null: false
    end
  end
end
