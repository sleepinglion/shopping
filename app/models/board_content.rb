class BoardContent < ActiveRecord::Base
  belongs_to :board, :foreign_key => :id, inverse_of: :board_content
end
