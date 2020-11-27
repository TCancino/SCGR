class CreatePostulationStates < ActiveRecord::Migration[6.0]
  def change
    create_table :postulation_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
