class ContactController < ApplicationController

  def sendContact
    @contact = Contact.new(params[contact_params])
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :body)
  end

end