class AnimateursInheritFromContributeurs < ActiveRecord::Migration
  def change
    add_column :contributeurs, :type, :string
  end
end
