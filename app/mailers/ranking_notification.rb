class RankingNotificationMailer < ActionMailer::Base
  def notification(recipients)
    @beers = Beer.all.sort_by { |beer| -beer.points }

    mail(
      :subject => "Time for a Beer Run!",
      :to => recipients,
      :content_type => "text/html"
    )
  end
end
