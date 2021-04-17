class Board < ActiveRecord::Base
  is_impressionable
  validates_presence_of :title
  belongs_to :user, :autosave=>true
  has_one :board_content, :foreign_key => :id, :dependent => :destroy, inverse_of: :board
  accepts_nested_attributes_for :board_content, :allow_destroy => true, :update_only => true

  def board_content
    super || build_contact_content
  end
end
