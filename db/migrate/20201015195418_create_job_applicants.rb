class CreateJobApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applicants do |t|
      t.bigint :phone
      t.string :specialization
      t.string :work_experience
      t.string :other
      t.string :degree

      t.timestamps
    end
  end
end
