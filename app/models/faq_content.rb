class FaqContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :faq, :foreign_key => :id, :autosave=>true
end
