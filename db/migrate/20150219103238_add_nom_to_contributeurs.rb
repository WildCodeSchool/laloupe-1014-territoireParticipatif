class AddNomToContributeurs < ActiveRecord::Migration
  def change
    add_column :contributeurs, :pseudo, :string
    add_column :contributeurs, :nom, :string
    add_column :contributeurs, :prenom, :string
    add_column :contributeurs, :age, :integer
    add_column :contributeurs, :cp, :integer
    add_column :contributeurs, :status, :string
    add_column :contributeurs, :résident, :string
  end
end