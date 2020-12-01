class DropUserTypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_types
  end
end
