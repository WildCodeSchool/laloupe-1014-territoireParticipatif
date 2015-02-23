class AddNomToContributeurs < ActiveRecord::Migration
  def change
    add_column :contributeurs, :pseudo, :string
    add_column :contributeurs, :nom, :string
    add_column :contributeurs, :prenom, :string
    add_column :contributeurs, :annee_naissance, :integer
    add_column :contributeurs, :commune, :string
    add_column :contributeurs, :status, :string
  end
end
