class ContactsController < ApplicationController
  def before_init
    super
    @title = t(:menu_contact)
    @page_itemtype = 'http://schema.org/ContactPage'
  end

  def index
    @controller_name = t(:menu_support)
    @contact = Contact.new
    @contact.build_contact_content

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  def complete
    @controller_name = t(:menu_support)
  end

  # POST /contanct
  # POST /contanct.json
  def create
    @controller_name = t(:menu_support)
    @contact = Contact.new(contact_params)

    if Rails.env.production?
      result=verify_recaptcha(:model => @contact, :message => "Oh! It's error with reCAPTCHA!") && @contact.save
    else
      result=@contact.save
    end

    respond_to do |format|
      if result
        format.html { redirect_to complete_contacts_path }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render :index }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:id, :name, :title, :phone, :enable, contact_content_attributes: [:content])
  end
end
