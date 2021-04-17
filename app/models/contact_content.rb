class ContactContent < ActiveRecord::Base
  belongs_to :contact, :foreign_key => :id, inverse_of: :contact_content
end
