class Document < ApplicationRecord
    has_and_belongs_to_many :postulations
end
