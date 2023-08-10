class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_datetime
      t.time :duration
      t.timestamps
    end
    add_reference :flights, :departure_airport, foreign_key: {to_table: :airports}
    add_reference :flights, :arrival_airport, foreign_key: {to_table: :airports}
  end
end
