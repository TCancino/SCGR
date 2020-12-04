class Post < ApplicationRecord
  has_many :postulations
  has_many :post_states, inverse_of: :post, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :post_states, reject_if: :all_blank, allow_destroy: true
end
