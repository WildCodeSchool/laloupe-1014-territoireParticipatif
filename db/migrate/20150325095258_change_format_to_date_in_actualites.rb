class ChangeFormatToDateInActualites < ActiveRecord::Migration
  def change
    change_column :actualites, :date, :date
  end
end
