class AddUserToPostulation < ActiveRecord::Migration[6.0]
  def change
    add_reference :postulations, :user, null: false, foreign_key: true
  end
end
