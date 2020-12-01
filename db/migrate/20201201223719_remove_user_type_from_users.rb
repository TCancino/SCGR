class RemoveUserTypeFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :user_type, null: false, foreign_key: true
  end
end
