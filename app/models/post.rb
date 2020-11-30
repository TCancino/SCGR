class Post < ApplicationRecord
    has_many :postulations
    belongs_to :post_state
end
