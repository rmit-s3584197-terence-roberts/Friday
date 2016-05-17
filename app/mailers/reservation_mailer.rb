class ReservationMailer < ApplicationMailer
  default from: 'fridayadmin@gmail.com'

  def reservation_request(@host)
    mail(to: @host.email, subject:'Friday reservation request')
  end

  def reservation_accepted(@guest)
    mail(to: @guest.email, subject:'Your reservation request has been accepted!')
  end

  def reservation_rejected(@guest)
    mail(to: @guest.email, subject:'Unfortunately your reservation was not accepted')

  end
end
