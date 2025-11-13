# Marie-Eve Bouchard — 2025-11-13

class AddAdminToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :admin, :boolean
  end
end
