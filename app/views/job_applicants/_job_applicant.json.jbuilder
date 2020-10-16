json.extract! job_applicant, :id, :phone, :specialization, :work_experience, :other, :created_at, :updated_at
json.url job_applicant_url(job_applicant, format: :json)
