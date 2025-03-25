class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :is_deleted, default: false, null: false
      t.boolean :is_moderated, default: false, null: false
      t.datetime :deleted_at
      t.datetime :moderated_at

      t.timestamps
    end
  end
end
