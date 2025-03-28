class AddLinkToPages < ActiveRecord::Migration[8.0]
  def change
    add_column :pages, :link, :string
  end
end
