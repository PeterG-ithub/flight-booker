class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def booking_confirmation
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Booking created!')
  end
end
