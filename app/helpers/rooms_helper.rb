module RoomsHelper
  def available_rooms
    @available_rooms = Room.where(availability: true)
  end

  def get_price
    price = Room.find(params[:room_id]).price
    # price = Room.find_by(room_type: params[:room_type]).price
    render json: { price: price, success: true }, status: 200
  end
end
