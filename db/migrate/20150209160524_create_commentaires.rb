class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|

      t.timestamps null: false
      t.string :message
      t.belongs_to :contributeur
      t.belongs_to :projet
    end
  end
end
