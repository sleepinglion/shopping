class ReportCategory < ActiveRecord::Base
  validates_presence_of :title, :sub_title, :color
  has_many :report
end
