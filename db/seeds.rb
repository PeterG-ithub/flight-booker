# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'csv'
# contents = CSV.open('db/airport_data/airports.csv', headers: true)
# contents.each_with_index do |row, idx|
#   code = row[0]
#   Airport.create(code: code)
#   break if idx > 50
# end
future_time = Time.now + 60 * 60 * 24 * 7
past_time = Time.now - 60 * 60 * 24 * 7
Airport.ids.each do |id|
  3.times do
    random_arrival_id = (Airport.ids - [id]).sample
    random_date = rand(past_time..future_time)
    random_hour = [*1..24].sample
    # puts "ID: #{id}, RANDOM_ID: #{random_arrival_id} "
    flight = Flight.create(departure_airport_id: id, arrival_airport_id: random_arrival_id,
                  departure_datetime: random_date, duration: random_hour)
    p flight.errors.messages
  end
end
# Flight.create(departure_airport_id: 1, arrival_airport_id: 2)