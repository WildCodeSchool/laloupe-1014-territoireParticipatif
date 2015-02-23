class AddSignatureToContributeur < ActiveRecord::Migration
  def change
    add_column :contributeurs, :charte, :boolean, default: false
  end
end
