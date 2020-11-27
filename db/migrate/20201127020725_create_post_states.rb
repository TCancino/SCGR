class CreatePostStates < ActiveRecord::Migration[6.0]
  def change
    create_table :post_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
