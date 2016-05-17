class ReservationMailer < ActionMailer::Base
  default from: 'fridayadmin@gmail.com'

  def reservation_request_email(host)
    @host = host
    mail(to: @host.email, subject:'Friday reservation request')
  end

  def reservation_accepted_email(guest)
    mail(to: guest.email, subject:'Your reservation request has been accepted!')
  end

  def reservation_rejected_email(guest)
    mail(to: guest.email, subject:'Unfortunately your reservation was not accepted')

  end
end
