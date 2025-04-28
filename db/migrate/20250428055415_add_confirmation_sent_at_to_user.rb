class AddConfirmationSentAtToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :confirmation_sent_at, :datetime
  end
end
