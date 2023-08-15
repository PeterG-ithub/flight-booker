class AddRefToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :passengers, :booking
  end
end
