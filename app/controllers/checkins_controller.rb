class CheckinsController < ApplicationController
  include RoomsHelper
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]

  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = Checkin.all
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
  end

  # GET /checkins/new
  def new
    @checkin = Checkin.new(customer_id: params[:customer_id])
    @rooms = available_rooms
  end

  # GET /checkins/1/edit
  def edit
  end

  # POST /checkins
  # POST /checkins.json
  def create
    params[:checkindate] = DateTime.now
    @checkin = Checkin.new(checkin_params)

    respond_to do |format|
      if @checkin.save
        format.html { redirect_to customers_path, notice: 'Checkin was successfully created.' }
        @checkin.update(checked_in: true)
        @checkin.room.update(availability: false)

      else
        format.html { render :new }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkins/1
  # PATCH/PUT /checkins/1.json
  def update
    respond_to do |format|
      if @checkin.update(checkin_params)
        format.html { redirect_to @checkin, notice: 'Checkin was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkin }
      else
        format.html { render :edit }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to checkins_url, notice: 'Checkin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkout
    @checkin_record = Checkin.where(customer_id: params[:customer_id], checked_in: true).first
    no_of_days = DateTime.now.to_date.mjd - @checkin_record.checkindate.to_date.mjd
    @amount_to_be_paid = @checkin_record.room.price * no_of_days
  end

  def checkout_complete
    @checkin_record = Checkin.where(customer_id: params[:customer_id], checked_in: true).first
    @checkin_record.update(checked_in: false)
    @checkin_record.room.update(availability: true)
    respond_to do |format|
      format.html { redirect_to customers_path, notice: 'Checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkin_params
      params.require(:checkin).permit(:checkindate, :checkoutdate, :room_id, :customer_id, :amount_to_be_paid, :checked_in)
    end
end
