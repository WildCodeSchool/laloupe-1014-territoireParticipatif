class AddSubscribedToContributeur < ActiveRecord::Migration
  def change
    add_column :contributeurs, :newsletter, :boolean, default: false
  end
end
