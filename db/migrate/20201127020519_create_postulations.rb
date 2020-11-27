class CreatePostulations < ActiveRecord::Migration[6.0]
  def change
    create_table :postulations do |t|

      t.timestamps
    end
  end
end
