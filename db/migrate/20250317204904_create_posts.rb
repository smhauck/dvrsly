class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :is_deleted, default: false, null: false
      t.datetime :deleted_at
      t.datetime :moderated_at
      t.boolean :is_moderated, default: false, null: false
      t.references :user, null: false, foreign_key: true
      t.references :diversion, null: true, foreign_key: true
      t.references :blog, null: true, foreign_key: true

      t.timestamps
    end
  end
end
