class AddPostulationStateToPostulation < ActiveRecord::Migration[6.0]
  def change
    add_reference :postulations, :postulation_state, null: false, foreign_key: true
  end
end
