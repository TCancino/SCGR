class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :state, :boolean
  end
end
