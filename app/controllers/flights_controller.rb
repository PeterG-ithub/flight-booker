class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.select(:departure_airport_id).distinct.map { |f| [f.departure_airport.code] }
    @arrival_airports = Flight.select(:arrival_airport_id).distinct.map { |f| [f.arrival_airport.code] }
    @flight_dates = Flight.order('departure_datetime').map { |f| [f.departure_datetime.strftime("%m/%d/%Y")] }

    dep_air = Airport.find_by(code: params[:departure_airport])
    arr_air = Airport.find_by(code: params[:arrival_airport])
    #arr_air = Airport.find_by(code: params[:arrival_airport])
    if dep_air.nil? && arr_air.nil?
      @flights = Flight.order(:departure_datetime).limit(50)
    elsif arr_air.nil?
      @flights = Flight.where(departure_airport: dep_air.id)
    elsif dep_air.nil?
      @flights = Flight.where(arrival_airport: arr_air.id)
    else
      @flights = Flight.where(departure_airport: dep_air.id, arrival_airport: arr_air.id)
    end
  end
end
