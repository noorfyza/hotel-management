json.extract! checkin, :id, :checkindate, :checkoutdate, :room_id, :customer_id, :amount_to_be_paid, :created_at, :updated_at
json.url checkin_url(checkin, format: :json)
