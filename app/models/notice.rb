class Notice < ActiveRecord::Base
  is_impressionable
  validates_presence_of :title
  belongs_to :admin
  has_one :notice_content, :foreign_key => :id, :dependent => :destroy, inverse_of: :notice
  accepts_nested_attributes_for :notice_content, :allow_destroy => true, :update_only => true

  def notice_content
    super || build_notice_content
  end
end
