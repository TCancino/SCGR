class Postulation < ApplicationRecord
  has_and_belongs_to_many :documents
  belongs_to :post
  belongs_to :postulation_state
  belongs_to :user

  def postulation_state_message(user_mail, state)
    PostulationMailer.postulation_state_message(user_mail, state).deliver_now
  end
end
