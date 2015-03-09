class AddChampsToActualites < ActiveRecord::Migration
  def change
    add_column :actualites, :date, :string
    add_column :actualites, :lieu, :string
    add_column :actualites, :siteweb, :string
  end
end
