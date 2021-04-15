class FaqContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :faq, :foreign_key => :id, inverse_of: :faq_content
end
