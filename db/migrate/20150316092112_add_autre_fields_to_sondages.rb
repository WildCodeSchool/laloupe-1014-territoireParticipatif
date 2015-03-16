class AddAutreFieldsToSondages < ActiveRecord::Migration
  def change
    add_column :sondages, :autre_usage_fixe, :string
    add_column :sondages, :autre_usage_portable, :string
    add_column :sondages, :autre_usage_tablette, :string
    add_column :sondages, :autre_usage_smartphone, :string
  end
end
