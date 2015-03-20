class AddImageToProjets < ActiveRecord::Migration
  def change
    add_column :projets, :image, :string
  end
end
