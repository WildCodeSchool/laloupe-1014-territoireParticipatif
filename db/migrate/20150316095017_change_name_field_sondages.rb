class ChangeNameFieldSondages < ActiveRecord::Migration
  def change
    rename_column :sondages, :commentaire_prestataire, :commentaire_formation
  end
end
