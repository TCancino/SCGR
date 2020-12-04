class PostState < ApplicationRecord
    belongs_to :post, inverse_of: :post_states
end
