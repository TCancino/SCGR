class PostulationMailer < ApplicationMailer
  default from: 'SCGR@mail.com'

  def postulation_state_message(user_mail)
    @name = user_mail.first_name
    mail(
      to: user_mail.email,
      subject: 'Estado de su postulación'
    )
  end
end
