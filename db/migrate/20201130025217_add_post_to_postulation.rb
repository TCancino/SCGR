class AddPostToPostulation < ActiveRecord::Migration[6.0]
  def change
    add_reference :postulations, :post, null: false, foreign_key: true
  end
end
