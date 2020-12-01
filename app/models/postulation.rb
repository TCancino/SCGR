class Postulation < ApplicationRecord
    has_and_belongs_to_many :documents
    belongs_to :post
    belongs_to :postulation_state
    belongs_to :user
end
