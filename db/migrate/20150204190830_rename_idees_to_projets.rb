class RenameIdeesToProjets < ActiveRecord::Migration
  def change
    rename_table :idees, :projets
  end
end
