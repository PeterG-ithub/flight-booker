class BookingsController < ApplicationController
  def new
    @num_tickets = params[:bookings][:num_tickets].to_i
    @flight_id = params[:bookings][:flight_id]
    @booking = Booking.new
    @num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(bookings_param)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).booking_confirmation.deliver_now
      end
      redirect_to root_path
    else
      puts @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookings_param
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
