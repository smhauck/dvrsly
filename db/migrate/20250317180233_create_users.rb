class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.text :about, null: true

      t.timestamps
    end
    add_index :users, :email_address, unique: true
    add_index :users, :username, unique: true
  end
end
