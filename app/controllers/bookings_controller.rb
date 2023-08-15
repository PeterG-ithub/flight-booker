class BookingsController < ApplicationController
  def new
    @num_tickets = params[:bookings][:num_tickets].to_i
    @flight_id = params[:bookings][:flight_id]
  end
end
