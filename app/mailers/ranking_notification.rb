class RankingNotificationMailer < ActionMailer::Base
  default :from => ENV["FROM_EMAIL_ADDRESS"]

  def notification(recipients)
    @beers = Beer.all.sort_by { |beer| -beer.points }

    mail(
      :subject => "Time for a Beer Run!",
      :to => recipients,
      :content_type => "text/html"
    )
  end
end
