json.extract! room, :id, :room_no, :name, :room_type, :facilities, :created_at, :updated_at
json.url room_url(room, format: :json)
