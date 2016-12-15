class Report < ActiveRecord::Base
  validates_presence_of :order_id,:report_category_id,:related_action_id
  belongs_to :order
  belongs_to :report_category
  belongs_to :related_action
  has_many :gene, :through  => :reports_gene
end
