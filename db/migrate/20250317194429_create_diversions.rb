class CreateDiversions < ActiveRecord::Migration[8.0]
  def change
    create_table :diversions do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
