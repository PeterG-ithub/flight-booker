class BookingsController < ApplicationController
  def new
    @num_tickets = params[:bookings][:num_tickets]
    @flight_id = params[:bookings][:flight_id]
  end
end
