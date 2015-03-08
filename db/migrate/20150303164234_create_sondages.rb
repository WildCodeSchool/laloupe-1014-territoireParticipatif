class CreateSondages < ActiveRecord::Migration
  def change
    create_table :sondages do |t|

      t.timestamps null: false
      t.string :profession
      t.string :equipement
      t.string :usage_fixe
      t.string :usage_portable
      t.string :usage_tablette
      t.string :usage_smartphone
      t.string :service
      t.text :commentaire_service
      t.string :competences
      t.string :formation
      t.string :prestataire
      t.text :commentaire_prestataire
      t.belongs_to :contributeur
    end
  end
end
