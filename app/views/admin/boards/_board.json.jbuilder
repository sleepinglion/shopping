json.extract! board, :id, :title, :enable, :created_at, :updated_at
json.url admin_board_url(board, format: :json)
