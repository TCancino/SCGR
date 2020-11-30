class AddPostStateToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :post_state, null: false, foreign_key: true
  end
end
