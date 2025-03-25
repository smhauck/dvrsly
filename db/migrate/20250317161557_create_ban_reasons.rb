class CreateBanReasons < ActiveRecord::Migration[8.0]
  def change
    create_table :ban_reasons do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
