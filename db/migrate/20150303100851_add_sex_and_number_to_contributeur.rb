class AddSexAndNumberToContributeur < ActiveRecord::Migration
  def change
    add_column :contributeurs, :sexe, :string
    add_column :contributeurs, :telephone, :string
  end
end
