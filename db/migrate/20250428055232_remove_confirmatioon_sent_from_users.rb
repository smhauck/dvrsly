class RemoveConfirmatioonSentFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :confirmatioon_sent, :datetime
  end
end
