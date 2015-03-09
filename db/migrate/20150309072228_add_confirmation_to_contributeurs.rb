class AddConfirmationToContributeurs < ActiveRecord::Migration
  def up
    add_column :contributeurs, :confirmation_token, :string
    add_column :contributeurs, :confirmed_at, :datetime
    add_column :contributeurs, :confirmation_sent_at, :datetime
    # add_column :contributeurs, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :contributeurs, :confirmation_token, unique: true
  end
  def down
    remove_columns :contributeurs, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :contributeurs, :unconfirmed_email # Only if using reconfirmable
  end
end
