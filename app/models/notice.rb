class Notice < ActiveRecord::Base
  validates_presence_of :title
  has_one :notice_content, :foreign_key => :id, :dependent => :destroy
  accepts_nested_attributes_for :notice_content, :allow_destroy => true
end
