class Contact < ActiveRecord::Base
  validates_presence_of :title, :name
  has_one :contact_content, :foreign_key => :id, :dependent=>:destroy, inverse_of: :contact
  accepts_nested_attributes_for :contact_content, :allow_destroy => true

  def contact_content
    super || build_contact_content
  end
end
