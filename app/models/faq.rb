class Faq < ActiveRecord::Base
  validates_presence_of :title
  #translates :title
  belongs_to :faq_category, counter_cache: true
  has_one :faq_content, :foreign_key => :id, :dependent=>:destroy, inverse_of: :faq
  accepts_nested_attributes_for :faq_content, :allow_destroy => true, :update_only => true

  def faq_content
    super || build_faq_content
  end
end
