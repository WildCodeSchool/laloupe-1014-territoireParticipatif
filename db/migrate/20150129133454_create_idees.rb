class CreateIdees < ActiveRecord::Migration
  def change
    create_table :idees do |t|
      t.string :titre
      t.string :objectif
      t.text :description

      t.timestamps null: false
    end
  end
end
