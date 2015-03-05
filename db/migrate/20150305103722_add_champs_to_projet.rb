class AddChampsToProjet < ActiveRecord::Migration
  def change
    add_column :projets, :statut, :string
    add_column :projets, :besoin, :text
    add_column :projets, :localisation, :string
    add_column :projets, :demarrage, :date
  end
end
