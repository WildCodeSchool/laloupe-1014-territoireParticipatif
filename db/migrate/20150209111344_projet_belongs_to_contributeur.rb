class ProjetBelongsToContributeur < ActiveRecord::Migration
  def change
    add_column :projets, :contributeur_id, :integer
    add_index :projets, :contributeur_id
  end
end
