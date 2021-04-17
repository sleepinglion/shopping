class Admin::AdminHomeController < Admin::AdminController
  def index
    @contact_count = Contact.where(:enable => true).count
  end
end
