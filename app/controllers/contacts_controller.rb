class ContactsController < ApplicationController
  before_action :set_contact, only: [:show]

  #empty method to display index page
  def index
  end

  #empty method to display show page
  def show
  end

  #set up instance varibale for new model
  def new
    @contact = Contact.new
  end

  # create new instance of contact
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        ContactMailer.contact_email(@contact.email, @contact.name, @contact.telephone, @contact.message).deliver_now
      else
        format.html { render :new }
      end
    end
  end

  private
    # assign variable to specific contact id
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # these fields must be returned and not empty for an instance of model to be created
    def contact_params
      params.require(:contact).permit(:name, :email, :telephone, :message)
    end
end
