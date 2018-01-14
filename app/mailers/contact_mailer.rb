class ContactMailer < ApplicationMailer

  def contact_base(contact)
    @contact = contact
    mail(to: "support@bigrocketgames.com", from: @contact.email, subject: @contact.subject)
  end

end
