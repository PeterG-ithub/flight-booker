class FlightsController < ApplicationController
  def index
    @flight = Flight.all
    @departure_airports = Flight.all.map { |f| [f.departure_airport.code] }
    @arrival_airports = Flight.all.map { |f| [f.arrival_airport.code] }
  end
end
