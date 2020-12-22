class PostulationMailer < ApplicationMailer
  default from: 'SCGR@mail.com'

  def postulation_state_message(user_mail, state)
    @name = user_mail.first_name || '-'
    @state = state || '-'
    mail(
      to: user_mail.email,
      subject: 'Estado de su postulación'
    )
  end
end
