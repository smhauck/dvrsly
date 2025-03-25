class Pages < ActiveRecord::Migration[8.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
