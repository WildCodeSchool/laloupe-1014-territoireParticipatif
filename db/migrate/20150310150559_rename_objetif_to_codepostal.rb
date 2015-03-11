class RenameObjetifToCodepostal < ActiveRecord::Migration
  def change
    rename_column :projets, :objectif, :codepostal
    add_column :projets, :urlsite, :string
  end
end
