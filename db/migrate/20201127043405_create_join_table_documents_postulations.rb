class CreateJoinTableDocumentsPostulations < ActiveRecord::Migration[6.0]
  def change
    create_join_table :documents, :postulations do |t|
      # t.index [:document_id, :postulation_id]
      # t.index [:postulation_id, :document_id]
    end
  end
end
