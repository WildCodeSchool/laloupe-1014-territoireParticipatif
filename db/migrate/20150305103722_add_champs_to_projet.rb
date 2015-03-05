class AddChampsToProjet < ActiveRecord::Migration
  def change
    add_column :projets, :status, :string
    add_column :projets, :besoin, :string
    add_column :projets, :localisation, :string
    add_column :projets, :demarrage, :date
  end
end
