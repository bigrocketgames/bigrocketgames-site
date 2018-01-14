class ContactController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    binding.pry
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_base(@contact).deliver_later
      flash[:success] = "You have successfully submitted your contact request."
      redirect_to new_contact_path
    else
      flash[:error] = "Error creating new contact."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :body)
  end

end