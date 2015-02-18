class AddCategorieToProjets < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nom
    end
    add_column :projets, :categorie_id, :integer
    add_index :projets, :categorie_id
  end
end
