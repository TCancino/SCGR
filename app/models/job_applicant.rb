class JobApplicant < ApplicationRecord
    validates :degree, presence: true
    validates :phone, presence: true
end
