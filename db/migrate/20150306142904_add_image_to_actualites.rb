class AddImageToActualites < ActiveRecord::Migration
  def change
    add_column :actualites, :image, :string
  end
end
