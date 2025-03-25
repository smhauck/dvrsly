class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.boolean :is_deleted, default: false, null: false
      t.boolean :is_moderated, default: false, null: false
      t.datetime :deleted_at
      t.datetime :moderated_at
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.belongs_to :parent_comment, foreign_key: { to_table: :comments }


      t.timestamps
    end
  end
end
