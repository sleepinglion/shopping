class ReportCategory < ActiveRecord::Base
  validates_presence_of :title, :color
  has_many :report
end
