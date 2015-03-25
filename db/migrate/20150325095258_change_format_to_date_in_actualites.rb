class ChangeFormatToDateInActualites < ActiveRecord::Migration
  def up
    remove_column :actualites, :date
    add_column :actualites, :date, :date
  end
  def down
    remove_column :actualites, :date
    add_column :actualites, :date, :string
  end
end
