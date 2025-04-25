class AddConfirmationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :confirmed, :boolean
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmatioon_sent, :datetime
    add_column :users, :confirmed_at, :datetime
  end
end
